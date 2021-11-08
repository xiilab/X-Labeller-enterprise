#!/usr/bin/env bash

DOCKER_VERSION=18.09.0
OS=$(. /etc/os-release;echo $ID) # OS 종류 알아냄 

usage() {
    echo ""
    echo ""
    echo "Usage:   installer.sh COMMAND"
    echo ""
    echo "COMMAND:"
    echo ""
    echo "master : install master"
    echo "worker : install worker"
    echo "deploy : Xlabeller Deploy, Port Input"
    echo "stop : Xlabeller Stop"
    echo "reset : Xlabeller Reset"
    echo ""
}

function nvidiaDockerInstaller() { # nvidia-docker 설치 
    local GPUUUID=$(nvidia-smi -a | grep UUID | awk '{print substr($4,0,12)}') # GPU UUID 알아냄 
    local VERSION=$(. /etc/os-release;echo $ID$VERSION_ID) # OS 종류와 version 알아냄 

    if [ $OS == "ubuntu" ]; then # OS가 ubuntu 일 경우 nvidia-docker 설치 
        apt install -y jq # json 포맷 데이터를 다루기 위한 패키지 설치 
        docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f # docker volume 설정 
        sudo apt-get purge -y nvidia-docker # 기존 nvidia-docker 제거 
        curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - # nvidia-docker 설치 사전 작업 
        curl -s -L https://nvidia.github.io/nvidia-docker/${VERSION}/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list # nvidia-docker 설치 사전 작업 
        sudo apt-get update # ubuntu 패키지 업데이트 
        sudo apt-get install -y nvidia-docker2 # nvidia-docker 설치 
    else
        yum install -y jq
        curl -s -L https://nvidia.github.io/nvidia-docker/${VERSION}/nvidia-docker.repo | sudo tee /etc/yum.repos.d/nvidia-docker.repo
        yum install -y nvidia-docker2
    fi


    # docker daemon 설정, nvidia-docker 를 default 로 설정하여 docker 명령어가 nvidia-docker 명령어가 되게함 
    if [ ! -e /etc/docker/daemon.json ]
    then
        cat << EOF > /etc/docker/daemon.json
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
    fi

    sudo pkill -SIGHUP dockerd # docker 중지 
	pushd $(mktemp -d)
	cat /etc/docker/daemon.json 2>/dev/null | jq --arg GPUUUID "NVIDIA-GPU=${GPUUUID}" '. + {"default-runtime": "nvidia"} + {"node-generic-resources":[$GPUUUID]}'  > tmp.json # docker daemon 설정 json 파일을 해당 GPU로 설정 
    mv -f tmp.json /etc/docker/daemon.json # docker daemon 설정 완료 
    popd
	systemctl restart docker # docker restart 
}

function ubuntuInstaller() { # docker 설치 
	# docker 설치 사전 작업 
	sudo add-apt-repository \
    	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    	$(lsb_release -cs) \
    	stable"
	sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo apt update -y # ubuntu 패키지 업데이트 
	sudo apt-get install docker-ce docker-ce-cli containerd.io -y # docker 설치 
	systemctl enable docker # docker 사용 가능으로 설정 
	systemctl start docker # docker start
}

function centosInstaller(){
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2 jq
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install -y docker-ce-${DOCKER_VERSION}
	sudo systemctl start docker
}

function nfsInstaller() {
    # NFS 디렉토리 생성 
    mkdir -p /xlabeller
    mkdir -p /xlabeller_temp
    if [ $OS == "ubuntu" ]; then
        apt-get install nfs-common nfs-kernel-server portmap rpcbind -y # NFS 관련 패키지 설치 
        grep -q -x -F "/xlabeller *(rw,sync,no_root_squash,insecure)" /etc/exports || echo "/xlabeller *(rw,sync,no_root_squash,insecure)" >> /etc/exports # NFS 설정 
        grep -q -x -F "/xlabeller_temp *(rw,sync,no_root_squash,insecure)" /etc/exports || echo "/xlabeller_temp *(rw,sync,no_root_squash,insecure)" >> /etc/exports # NFS 설정 
	else
	    systemctl start nfs
	    grep -q -x -F "/xlabeller *(rw,sync,no_root_squash,insecure)" /etc/exports || echo "/xlabeller *(rw,sync,no_root_squash,insecure)" >> /etc/exports
	    grep -q -x -F "/xlabeller_temp *(rw,sync,no_root_squash,insecure)" /etc/exports || echo "/xlabeller_temp *(rw,sync,no_root_squash,insecure)" >> /etc/exports
    	systemctl restart nfs
    fi
    # NFS 관련 서비스 재시작 
    /etc/init.d/rpcbind restart
    service nfs-kernel-server restart
}

function masterInstaller() {
    if [ $OS == "ubuntu" ]; then
        ubuntuInstaller # docker 설치 
    else
        centosInstaller
    fi
    nfsInstaller # NFS 설치 및 설정 
    volume_create # docker volume 생성 
    tar -xvzf xlabeller.tar.gz # xlabeller 폴더 압축 해제 
    mv xlabeller / # xlabeller 폴더 NFS 위치로 이동 
}

function workerInstaller(){
  if [ $OS == "ubuntu" ]; then
        ubuntuInstaller # docker 설치 
  else
        centosInstaller
  fi
  nvidiaDockerInstaller # nvidia-docker 설치 
  apt-get install nfs-common nfs-kernel-server portmap rpcbind -y # NFS 필요 패키지 설치 
  sudo /etc/init.d/nfs-kernel-server restart # NFS 재시작 
  sudo systemctl enable rpc-statd # NFS 필요 패키지 사용 가능 상태로 변경 
  sudo systemctl start rpc-statd # NFS 필요 패키지 시작 
  sudo /etc/init.d/rpcbind restart
}

function deploy() {
	# DB Container 시작 
	docker run -itd --env MYSQL_ROOT_PASSWORD='xlabeller!@' --env MYSQL_DATABASE=xlabeller --env MYSQL_USER=xlabeller --env MYSQL_PASSWORD='xlabeller!@' --env TZ=Asia/Seoul --name xlabeller_db --volume xlabeller_db-volume:/var/lib/mysql -p 33066:3306 mariadb:latest --max_allowed_packet=1024M --innodb_log_file_size=4096M --log-bin

	# WEB Container 시작 
	docker run -itd -p $1:8080 --link xlabeller_db --volume xlabeller_nfs-driver:/usr/local/uploadFile/xlabeller --volume xlabeller_nfs-driver-temp:/usr/local/uploadFile/xlabeller_temp --name xlabeller_web xlabeller_web:2.0.0
}

function stop_container(){
	# WEB,DB Container 삭제 
	docker rm -f xlabeller_web
	docker rm -f xlabeller_db
}

function volume_rm(){
	# docker volume 삭제, DB 초기화 됨. 
	docker volume rm $(docker volume ls -q --filter dangling=true)
}

function volume_create(){
	# db, NFS 폴더 docker volume 생성 
	docker volume create xlabeller_db-volume
	docker volume create --driver local --opt type=nfs --opt o=addr=localhost,nolock,rw --opt device=:/xlabeller xlabeller_nfs-driver
	docker volume create --driver local --opt type=nfs --opt o=addr=localhost,nolock,rw --opt device=:/xlabeller_temp xlabeller_nfs-driver-temp
}

function reset(){
	# X-Labeller 초기화 
	stop_container
	volume_rm
	rm -r /xlabeller
	rm -r /xlabeller_temp
}


case $1 in
    -h) usage
    ;;
    --help) usage
    ;;
    master) # Web 서버 설치 
    masterInstaller
    ;;
    worker) # Worker (GPU) 서버 설치 
    workerInstaller
    ;;
    deploy) # X-Labeller 배포 
    deploy $2
    ;;
    stop) # X-Labeller 중지 
    stop_container
    ;;
    reset) # X-Labeller 초기화 
    reset
    ;;
    *) usage
    ;;
esac


