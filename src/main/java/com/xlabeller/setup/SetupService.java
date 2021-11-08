package com.xlabeller.setup;

import com.xlabeller.common.module.CmdExector;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.gpuNode.GpuNodeDao;
import com.xlabeller.models.GpuNodeVO;
import com.xlabeller.models.SetupVO;
import com.xlabeller.models.UserVO;
import com.xlabeller.sshSession.SSHCmdExecute;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Service
public class SetupService {
	private String NFS_MOUNT_ROOT_PATH = "/xlabeller";
	private String NFS_MOUNT_WORKSPACE_PATH = "/xlabeller/workspace/";
	
	private String WORKSPACE_PATH = "/usr/local/uploadFile/xlabeller/workspace/";
	private static Logger logger = Logger.getLogger(SetupService.class);
	@Autowired
	private GpuNodeDao gpuNodeDao;
	
	public Object installRequirement(SetupVO setupVO) throws IOException, InterruptedException {
		String updateCmd = "apt-get update";
		cmd(updateCmd);
		String installCmd = "apt-get install -y sshpass";
//		String installCmd = "yum install -y sshpass";
		cmd(installCmd);
		return Output.JsonOutput("200", "설치가 완료되었습니다");
	}
	
	public Object isInstallRequirement() throws IOException, InterruptedException {
		
//		String checkCmd = "yum list sshpass | grep 'Installed Packages'";
		String checkCmd = "apt-get install sshpass | grep 'is already'";
		String result = cmd(checkCmd);
		
//		if(result.indexOf("Installed Packages") != -1) {
		if(result.indexOf("sshpass") != -1) {
			return Output.JsonOutput("200", true);
		}else {
			return Output.JsonOutput("200", false);
		}
		
	}
	
	
	
	public Object deployInstallFile(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().length() <= 0) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		String filePath = httpSession.getServletContext().getRealPath("/resources/install");
		// s.kim 삭제 
		//String installCmd = "sshpass -p '"+gpuNodeVO.getPassword()+"' scp -r -o StrictHostKeyChecking=no "+filePath+" root@"+gpuNodeVO.getAddress()+":~/";
		
		//s.kim 추가
		// sshpass scp 시 port 입력 
		String installCmd = "sshpass -p '"+gpuNodeVO.getPassword()+"' scp -P" + gpuNodeVO.getPort() + " -r -o StrictHostKeyChecking=no "+filePath+" root@"+gpuNodeVO.getAddress()+":~/";
		cmd(installCmd);
		
		cmd(installCmd);
		
		// s.kim 삭제 
		//String chmodCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "chmod 777 -R ~/install");
		
		//s.kim 추가, makeCmd 메소드에 port 파라미터 추가 
		String chmodCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "chmod 777 -R ~/install", gpuNodeVO.getPort());
		cmd(chmodCmd);
		return Output.JsonOutput("200", "Deploy 완료");
	}
	
	public Object isDeployInstallFile(SetupVO setupVO) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().length() <= 0) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		// s.kim 삭제 
		//String checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "ls ~/install | grep installer.sh");
		
		//s.kim 추가, makeCmd 메소드에 port 파라미터 추가 
		String checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "ls ~/install | grep installer.sh", gpuNodeVO.getPort());
		
		String result = cmd(checkCmd);
		if(result.indexOf("installer.sh") != -1) {
			return Output.JsonOutput("200", true);
		}else {
			return Output.JsonOutput("200", false);
		}
	}
	
	
	public Object isInstallFile(SetupVO setupVO) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().length() <= 0) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		// s.kim 삭제 
		//String checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "systemctl status docker");
		
		//s.kim 추가, makeCmd 메소드에 port 파라미터 추가 
		String checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "systemctl status docker", gpuNodeVO.getPort());
		
		String result = cmd(checkCmd);
		if(result.indexOf("active (running)") == -1) {
			return Output.JsonOutput("200", false);
		}
		
		// s.kim 삭제 
		//checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "docker info");
		
		//s.kim 추가, makeCmd 메소드에 port 파라미터 추가 
		checkCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "docker info", gpuNodeVO.getPort());
		
		result = cmd(checkCmd);
		if(result.indexOf("Default Runtime: nvidia") == -1) {
			return Output.JsonOutput("200", false);
		}
		
		return Output.JsonOutput("200", true);
		
		
	}
	
	

	public Object installFile(SetupVO setupVO) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().equals("")) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		// s.kim 삭제 
		//String installCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "~/install/installer.sh worker");
		
		//s.kim 추가, makeCmd 메소드에 port 파라미터 추가 
		String installCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "~/install/installer.sh worker", gpuNodeVO.getPort());
		
		String result = cmd(installCmd);
		return Output.JsonOutput("200", "Install 완료");
		
	}
	
	
	// s.kim 삭제
	// swarm 삭제로 인해아래 joinSwarm 메소드 사용하지 않음.
	/*
	public Object joinSwarm(SetupVO setupVO) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().equals("")) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setId(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		String leaveCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "docker swarm leave --force");
		
		
		String result = cmd(leaveCmd);
		
		
		
		
		GpuNodeVO masterNodeVO = new GpuNodeVO();
		masterNodeVO.setType("master");
		List<GpuNodeVO> mNodeList = gpuNodeDao.getGpuNodeList(masterNodeVO);
		if(mNodeList.size() <= 0) {
			return Output.JsonOutput("705", "마스터 노드가 존재하지 않습니다");
		}
		if(mNodeList.size() > 1) {
			return Output.JsonOutput("706", "마스터 노드가 두개 이상존재합니다. 설정을 단일 마스터노드로 변경 부탁드립니다.");
		}
		masterNodeVO = mNodeList.get(0);
		
		String getCmd = "docker swarm join-token worker";
		getCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getCmd);
		result = cmd(getCmd);
		
		String joinCmd = result.split("command:")[1].replaceAll("\n", "");
		joinCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), joinCmd);
		result = cmd(joinCmd);
		return Output.JsonOutput("200", "Docker swarm에 연결되었습니다");
	}
	*/
	// s.kim 삭제
	// swarm 삭제로 인해아래 isJoinSwarm 메소드 사용하지 않음.
	/*
	public Object isJoinSwarm(SetupVO setupVO) throws IOException, InterruptedException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().equals("")) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setId(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		String result = null;
		
//		String leaveCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), "docker swarm leave --force");
//		String result = cmd(leaveCmd);
//		
		
		
		GpuNodeVO masterNodeVO = new GpuNodeVO();
		masterNodeVO.setType("master");
		List<GpuNodeVO> mNodeList = gpuNodeDao.getGpuNodeList(masterNodeVO);
		if(mNodeList.size() <= 0) {
			return Output.JsonOutput("705", "마스터 노드가 존재하지 않습니다");
		}
		if(mNodeList.size() > 1) {
			return Output.JsonOutput("706", "마스터 노드가 두개 이상존재합니다. 설정을 단일 마스터노드로 변경 부탁드립니다.");
		}
		masterNodeVO = mNodeList.get(0);
		
		String getNodeListCmd = "docker node ls -q";
		getNodeListCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getNodeListCmd);
		result = cmd(getNodeListCmd);
		String[] nodeArr = result.split("\n");
		for(int i = 0 ; i < nodeArr.length ; i++) {
			String getInspectCmd = "docker node inspect " + nodeArr[i];
			getInspectCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getInspectCmd);
			String inspectResult = cmd(getInspectCmd);
			if(inspectResult.indexOf(gpuNodeVO.getAddress()) != -1) {
				return Output.JsonOutput("200", true);
			}
			
		}
		
		return Output.JsonOutput("200", false);
		
//		String getCmd = "docker swarm join-token worker";
//		getCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getCmd);
//		result = cmd(getCmd);
//		
//		String joinCmd = result.split("command:")[1].replaceAll("\n", "");
//		joinCmd = makeCmd(gpuNodeVO.getAddress(), gpuNodeVO.getAccount(), gpuNodeVO.getPassword(), joinCmd);
//		result = cmd(joinCmd);
//		return Output.JsonOutput("200", "Docker swarm에 연결되었습니다");
	}
	
	*/
	
	
	public Object isJoinNfs(SetupVO setupVO) throws IOException, InterruptedException {
		logger.info("isJoinNfs!!");
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().equals("")) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		String result = null;
		
		GpuNodeVO masterNodeVO = new GpuNodeVO();
		masterNodeVO.setType("master");
		List<GpuNodeVO> mNodeList = gpuNodeDao.getGpuNodeList(masterNodeVO);
		if(mNodeList.size() <= 0) {
			return Output.JsonOutput("705", "마스터 노드가 존재하지 않습니다");
		}
		if(mNodeList.size() > 1) {
			return Output.JsonOutput("706", "마스터 노드가 두개 이상존재합니다. 설정을 단일 마스터노드로 변경 부탁드립니다.");
		}
		masterNodeVO = mNodeList.get(0);
		/*
		String getNodeListCmd = "docker node ls -q";
		getNodeListCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getNodeListCmd);
		result = cmd(getNodeListCmd);
		String[] nodeArr = result.split("\n");
		for(int i = 0 ; i < nodeArr.length ; i++) {
			String getInspectCmd = "docker node inspect " + nodeArr[i];
			getInspectCmd = makeCmd(masterNodeVO.getAddress(), masterNodeVO.getAccount(), masterNodeVO.getPassword(), getInspectCmd);
			String inspectResult = cmd(getInspectCmd);
			if(inspectResult.indexOf(gpuNodeVO.getAddress()) != -1) {
				return Output.JsonOutput("200", true);
			}
			
		}
		*/
		
		// s.kim 추가 2021-01-26 
        // grpc -> ssh
		logger.info("s.kim start!!!");
		String account = gpuNodeVO.getAccount();
		String temp_port = gpuNodeVO.getPort();
		String address = gpuNodeVO.getAddress();
		String password = gpuNodeVO.getPassword();
		
		int port = Integer.parseInt(temp_port);
		SSHCmdExecute sshCmdExcuteSession = new SSHCmdExecute(account, port, address, password);
		boolean is = sshCmdExcuteSession.nfsStatus(masterNodeVO.getAddress());
		logger.info(is);
		if (is) {
			return Output.JsonOutput("200", true);
		}
		return Output.JsonOutput("200", false);
	}
	
	
	
	
	public Object joinNfs(SetupVO setupVO) throws IOException, InterruptedException{
		
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(setupVO.getId() == null || setupVO.getId().equals("")) {
			return Output.JsonOutput("702", "파라메터가 부적합 합니다");
		}
		
		GpuNodeVO gpuNodeVO = new GpuNodeVO();
		gpuNodeVO.setGpu_node_id(setupVO.getId());
		gpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		if(gpuNodeVO == null || gpuNodeVO.getAccount() == null || gpuNodeVO.getAccount().length() <= 0) {
			return Output.JsonOutput("701", "존재 하지 않는 클러스터입니다.");
		}
		
		GpuNodeVO masterNodeVO = new GpuNodeVO();
		masterNodeVO.setType("master");
		List<GpuNodeVO> mNodeList = gpuNodeDao.getGpuNodeList(masterNodeVO);
		if(mNodeList.size() <= 0) {
			return Output.JsonOutput("705", "마스터 노드가 존재하지 않습니다");
		}
		if(mNodeList.size() > 1) {
			return Output.JsonOutput("706", "마스터 노드가 두개 이상존재합니다. 설정을 단일 마스터노드로 변경 부탁드립니다.");
		}
		masterNodeVO = mNodeList.get(0);
		// s.kim 추가  2021-01-26 
        // grpc -> ssh
		//logger.info("s.kim start!!!");
		String account = gpuNodeVO.getAccount();
		String temp_port = gpuNodeVO.getPort();
		String address = gpuNodeVO.getAddress();
		String password = gpuNodeVO.getPassword();
		
		int port = Integer.parseInt(temp_port);
		SSHCmdExecute sshCmdExcuteSession = new SSHCmdExecute(account, port, address, password);
		boolean is = sshCmdExcuteSession.nfsJoin(masterNodeVO.getAddress());
		logger.info(is);
		if (!is) {
			return Output.JsonOutput("200", "NFS 연결에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
		}
		
		return Output.JsonOutput("200", "NFS에 연결되었습니다");
	}
	
	private String makeCmd(String address, String account, String password, String command, String port) {
		// s.kim 삭제 
		//String newCmd = "sshpass -p '"+password+"' ssh -o StrictHostKeyChecking=no "+account+"@"+address+" "+command;
		
		// s.kim 추가 
		// sshpass 접속시 port 추가 
		String newCmd = "sshpass -p '"+password+"' ssh -P" + port + " -o StrictHostKeyChecking=no "+account+"@"+address+" "+command;
		System.out.println(newCmd);
		return newCmd;
	}
	
	
	private String cmd(String command) throws IOException, InterruptedException {
		CmdExector ce = new CmdExector();				
		String[] cmd = {"/bin/bash","-c",command};
		String result = ce.byProcessBuilderRedirect(cmd);
		System.out.println(result);
		return result;
	}
	
	
//	docker swarm init --advertise-addr 192.168.1.19
//	docker swarm leave --force
	
	
	
	
//	public Object installNode(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
//		String filePath = httpSession.getServletContext().getRealPath("/resources/sh");
//		String installCmd = "sshpass -p '"+setupVO.getPassword()+"' scp -r -o StrictHostKeyChecking=no "+filePath+" root@"+setupVO.getAddress()+":~/";
//		
//		System.out.println(filePath);
//		System.out.println(installCmd);
//		
//		
//		cmd(installCmd);
//		
//		String chmodCmd = "sshpass -p '"+setupVO.getPassword()+"' ssh -o StrictHostKeyChecking=no root@"+setupVO.getAddress()+" chmod -r ~/sh";
//		cmd(chmodCmd);
//		
//		String checkCmd = "sshpass -p '"+setupVO.getPassword()+"' ssh -o StrictHostKeyChecking=no root@"+setupVO.getAddress()+" ~/sh/test.sh";
//		String result = cmd(checkCmd);
//		
//		
//		return Output.JsonOutput("200", result);
//	}
	
//	sshpass -p 'P@ssw0rd' scp -o StrictHostKeyChecking=no hello.txt root@135.79.246.99:/root/hello.txt
	
//	public Object sshpass() throws IOException, InterruptedException {
//		CmdExector ce = new CmdExector();
////		String[] cmd = {"/usr/local/uploadFile/test.sh","`sshpass -p 'xiirocks!!' ssh -o StrictHostKeyChecking=no root@192.168.1.62 hostname`"};
//		String[] cmd = {"/usr/local/uploadFile/test.sh","`yum list sshpass | grep 'Installed Packages'`"};
//		String result = ce.byProcessBuilderRedirect(cmd);
//		return Output.JsonOutput("200", result);
//	}
//	
//	public Object ssh() throws IOException, InterruptedException {
//		CmdExector ce = new CmdExector();				
//		String[] cmd = {"yum list sshpass | grep 'Installed Packages' "};
////		String[] cmd = {"/bin/bash","-c","brew"};
//		String result = ce.byProcessBuilderRedirect(cmd);
//		return Output.JsonOutput("200", result);
//	}
	
	
	

//	public Object cmd(SetupVO setupVO) throws IOException, InterruptedException {
//	CmdExector ce = new CmdExector();				
//	
//	String[] cmd = {"/bin/bash","-c",setupVO.getCmd()};
//	String result = ce.byProcessBuilderRedirect(cmd);
//	return Output.JsonOutput("200", result);
//}
	
	
	//sshpass -p 'xiirocks!!' ssh -o StrictHostKeyChecking=no root@192.168.1.62 hostname
	
}


//yum list sshpass %7C grep 'Installed Packages'
//ps -ef %7C grep tomcat

//`sshpass -p 'xiirocks!!' ssh -o StrictHostKeyChecking=no root@192.168.1.62 hostname`