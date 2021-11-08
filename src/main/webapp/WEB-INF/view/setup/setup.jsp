<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="setup"/>
</jsp:include>
<head>
	<title>X-labeller</title>
	
	<style>
		#setup { width: 100%; height: 100%; background-color:#f5f5f5;}
		#setup .title_wrap .c_wrap { width: 50%; height: 14px; margin-left:44px;   }
		
		#setup .prerequirement_wrap {height: 100px; background-color: #ffffff;}
		#setup .prerequirement_wrap .title_wrap { margin: 38px 32px; height: 24px;   font-size: 20px;font-weight: 500; float:left; background-color: #ffffff; padding-right: 33px; border-right: 1px solid #dedcde}
		#setup .prerequirement_wrap .c_wrap { width: 100px; height: 40px; width: 180px; padding: 30px 42px 30px; }
		#setup .prerequirement_wrap .c_wrap button { width:150px; height:40px; background-color: #4c84ff; color:#ffffff; border-radius: 20px;}
		#setup .prerequirement_wrap .c_wrap button .filter_color { filter : saturate(200%) hue-rotate(145deg) !important;}
		#setup .prerequirement_wrap .c_wrap div{ width:150px; height:38px; font-size:12px; font-weight: 400; background-color: #f5f5f5; color:#555555; border: 1px solid #dedcde; border-radius: 20px; text-align:center; line-height:3;}
		
		#setup .section { width: 100%; position: relative; background-color: #f5f5f5;}
		#setup .title_wrap div {width: 100%; height: 14px;   font-size:12px; font-weight: 300; color: #343434; background-color:#f5f5f5; float:left; padding: 36px 32px 21px;}
		
		#setup .GPU_wrap select { width: 158px; text-align-last: center; font-weight: 300; background-color: #f8f8f8; border-radius: 4px;}
		#setup .swarmjoin_wrap { width: 100%; margin-bottom: 10px; position: relative;}
		
		#setup .h_wrap {height: 44px; width: calc(100% - 65px); border-top: 2px solid #3a3b3d; background-color:#fafafa; border-bottom: 1px solid #dedcde; margin-left:32px; margin-right:32px;}
		#setup .h_wrap div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; display: inline-block; width: 100%; height: 30px; text-align: center;}
		
		#setup .c_wrap { height:100%; width: calc(100% - 65px); background-color: #ffffff; overflow-y: scroll;margin-left:32px; margin-right:32px;}
		#setup .c_wrap .gpu_list { width: 100%; border-bottom: 1px solid #dedcde; height: 50px; }
		#setup .c_wrap .gpu_list div { display: inline-block; width: 100%; line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; text-align: center;}
		#setup .c_wrap .gpu_list input { width:158px; height:28px; border-width :1px; padding:0; text-align: center; border-radius: 3px; font-family: Open_Sans; font-weight: 300; }
		#setup .c_wrap .gpu_list input:focus { border: 1px solid #218aff; background: none; background-color: #ffffff; }
		#setup .c_wrap .gpu_list .password { -webkit-text-security: disc !important; font:small-caption;font-size:16px;}
		
		#setup .btn_wrap { display: flex; display: -webkit-flex; }
		#setup .btn_wrap button { cursor: pointer; width: 54px; height: 28px; text-align: center; background-color: #f8f8f8; font-family: Open_Sans; font-size: 12px; font-weight: 300; font-color: #343434; border: 1px solid #dedcde; }
		
	</style>
</head>
<body>
	<div class="container" id="setup">
		<div class="min_w1440">
			<div class="contents">
				
				<div class="prerequirement_wrap">
					<div class="title_wrap">PreRequirement Installed</div>
					<div class="c_wrap"></div>
				</div>
				
				<div class="GPU_wrap section hide">
					<div class="title_wrap">
						<div>GPUNODE LIST</div>
					</div>
					<div class="h_wrap flex">
						<div>GPU Node Id</div>
						<div>GPU Node Account</div>
						<div>GPU Node Password</div>
						<div>GPU Node Address</div>
						<div>GPU Node Type</div>
						<div>GPU Port</div>
						<div>GPU Node Created date</div>
						<div>DEL/Append</div>
					</div>
					<ul class="c_wrap">
					</ul>
				</div>
				
				<div class="deployment_wrap section hide">
					<div class="title_wrap">
						<div>Deployment LIST</div>
					</div>
					<div class="h_wrap flex">
						<div>GPU Node Id</div>
						<div>GPU Node Account</div>
						<div>GPU Node Password</div>
						<div>GPU Node Address</div>
						<div>GPU Node Type</div>
						<div>GPU Port</div>						
						<div>GPU Node Created date</div>
						<div>Install Status</div>
					</div>
					<ul class="c_wrap">
					</ul>
				</div>
					
				<div class="install_wrap section hide">
					<div class="title_wrap">
						<div>Installment LIST</div>
					</div>
					<div class="h_wrap flex">
						<div>GPU Node Id</div>
						<div>GPU Node Account</div>
						<div>GPU Node Password</div>
						<div>GPU Node Address</div>
						<div>GPU Node Type</div>
						<div>GPU Port</div>
						<div>GPU Node Created date</div>
						<div>Install Status</div>
					</div>
					<ul class="c_wrap">
					</ul>
				</div>
				
				<div class="swarmjoin_wrap hide">
					<div class="title_wrap">
						<div>NFS Join</div>
					</div>
					<div class="h_wrap flex">
						<div>GPU Node Id</div>
						<div>GPU Node Account</div>
						<div>GPU Node Password</div>
						<div>GPU Node Address</div>
						<div>GPU Node Type</div>
						<div>GPU Port</div>
						<div>GPU Node Created date</div>
						<div>Install Status</div>
					</div>
					<ul class="c_wrap">
					</ul>
				</div>
				
			</div>
		</div>
	</div>

</body>
<script>
	$(document).on("sessionLoad", function() {
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			setup.init();
		}
	});

	var setup = {
		pt : $("#setup"),
		init : function(node) {
			var that = this;
			$("#loader").show();
			that.Prerequirement();
		},
		Prerequirement: function(){
			console.log("=====checkPrerequirement=====");
			var that= this;
   			var target=that.pt.find(".prerequirement_wrap .c_wrap");
  			$.ajax({
				url: baseUrl + "setup/isInstallRequirement.json",
				type: "POST",
				success: function(res){
					$("#loader").hide();
			   		if(res.result.code == "200"){			
						if(res.result.data){
							$(target).append("<div>Installed</div>")
							that.getData();							
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else { 
							$(target).append("<button class='install filter_color'>Install</button>")
							that.prerequirement_listener();
						}
					}
			   	},
			   	error : function(err){
					$("#loader").hide();
			   		 console.log("ERROR!!", err);
			   	}
			}); 
  			// test data
// 			var data= [{"id":"John", "account":30, "password": "tadfafa","address":"New York" ,"type":"worker","port":"1","created_data":"-"}, {"id":"Kate", "account":31, "password": "tadfafa","address":"New York" ,"type":"worker","port":"65535","created_data":"-"}]
// 			that.drawGPUlist(data);
// 			that.drawInstallmentList(data);
		},
		getData : function(){
			console.log("=====getData=====");
			var that = this;
			$("#loader").show();
			$.ajax({
				url :  baseUrl + "gpuNode/getGpuNodeList.json",
			   	type : "POST",
			   	processData : false,
			   	contentType: false,
			   	success : function(res){
			   		$("#loader").hide();
			   		console.log("=====getGpuNodeList=====",res);

			   		if(res.result.code == "200"){
						that.drawGPUlist(res.result.data);
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert("데이터를 불러오는데 실패했습니다. 다시 시도해주세요.");
					}
			   	},
			   	error : function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		
		drawGPUlist: function(data){
			console.log("=====drawGPUlist=====")
			var that = this;
			var html ="";
   			that.pt.find(".GPU_wrap").removeClass("hide");
			for(var i= data.length -1; i>=0; i--){
				html+= "<li class= 'gpu_list flex' id="+data[i]["gpu_node_id"]+">"
				html+= "<div>" + data[i]["gpu_node_id"] + "</div>";
				html+= "<div>" + data[i]["account"] + "</div>";
				html+= "<div class='password'>" + data[i]["password"] + "</div>";
				html+= "<div>" + data[i]["address"] + "</div>";
				html+= "<div>" + data[i]["type"] + "</div>";
				if(data[i]["port"]){
					html+= "<div>" + data[i]["port"] + "</div>";		// jh.sa 210125
				} else {
					html+= "<div>-</div>";
				}
				html+= "<div>" + data[i]["created_date"] + "</div>";
				html+= "<div class='btn_wrap'><button class='delete'>Delete</button></div>";
			}
			html+= "<li class= 'gpu_list flex'><div>Node Id</div>";
			html+= "<div><input type='text' name = 'account' placeholder='Node Account'></input></div>";
			html+= "<div><input type='password' name = 'password' placeholder='Node Password'></input></div>";
			html+= "<div><input type='text' name='address' placeholder='Node Address'></input></div>";
			html+= "<div><select name='type'><option value='worker'>worker</option><option value='master'>master</option></select></div>";
			html+= "<div><input type='text' name='gpu_port' placeholder='Valid value : 1 ~ 65535'/></div>";		// jh.sa 210125
			html+= "<div>-</div>";
			html+= "<div class='btn_wrap'><button class='append'>Add</button></div>";
			that.pt.find(".GPU_wrap .c_wrap").append(html);
			that.gpu_wrap_listener();
			if(data.length>0) { that.drawDeploymentList(data); }
		},
		
		checkStatus: function(id,department){
			console.log("=====checkStatus=====")
			var that = this;
 			var url = baseUrl + "setup/"+department+".json";
			let ajaxData = {
				id : id
			}
			console.log(url + "?id:"+ id);
			var target;
			if(department=="isDeployInstallFile"){ target= ".deployment_wrap li[id="+id+"]" }
			else if(department=="isInstallFile"){ target= ".install_wrap li[id="+id+"]" }
			else if(department=="isJoinNfs"){ target= ".swarmjoin_wrap li[id="+id+"]" }		// jh.sa 210129
// 			else if(department=="isJoinSwarm"){ target= ".swarmjoin_wrap li[id="+id+"]" }
			
 			var deferred= $.ajax({
 				url:url,
 				data:ajaxData,
 				type:"POST",
 				success: function(res){
 					if(res.result.code == "200"){
						console.log("data:" + res.result.data);
 						if(res.result.data){ that.pt.find(target+ " div.install").text("Installed"); }
 						else{ 
 							that.pt.find(target+" div.install").addClass("btn_wrap");
 							that.pt.find(target+" div.install").html("<button class='install'>Install</button>")									
 						}
 					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
 				},
 				error: function(err){
 			   		console.log("ERROR!!", err);
 				}
 			})
 			return deferred;
		},
		
		drawDeploymentList: function(data){	
			console.log("=====drawDeploymentList=====")
			var that = this;
			var deArr=[];
   			that.pt.find(".deployment_wrap").removeClass("hide");
			for(var i= data.length -1; i>=0; i--){
				if(data[i]["type"]=="master") { continue; }
				var html="";
				html+= "<li class= 'gpu_list flex' id="+data[i]["gpu_node_id"]+">";
				html+= "<div>" + data[i]["gpu_node_id"] + "</div>";
				html+= "<div>" + data[i]["account"] + "</div>";
				html+= "<div class='password'>" + data[i]["password"] + "</div>";
				html+= "<div>" + data[i]["address"] + "</div>";
				html+= "<div>" + data[i]["type"] + "</div>";
				if(data[i]["port"]){
					html+= "<div>" + data[i]["port"] + "</div>";		// jh.sa 210125
				} else {
					html+= "<div>-</div>";
				}				
				html+= "<div>" + data[i]["created_date"] + "</div>";
				html+= "<div class='install'></div>"
				that.pt.find(".deployment_wrap .c_wrap").append(html);
				deArr.push(that.checkStatus(data[i]["gpu_node_id"],"isDeployInstallFile"));
			}
			Promise.all(deArr).then(function(val){
				var flag = true;
				for(var i=0;i<val.length;i++){
					if(!val[i].result.data) {
						flag = false;
						break;
					}
				}
				if(flag){ that.drawInstallmentList(data); }
				that.deployment_wrap_listener();
			});
			
		},
		drawInstallmentList: function(data){
			console.log("=====drawInstallmentList=====")
			var that = this;
			var deArr=[];
   			that.pt.find(".install_wrap").removeClass("hide");
			for(var i= data.length -1; i>=0; i--){
				if(data[i]["type"]=="master") { continue; }
				var html="";	
				html+= "<li class= 'gpu_list flex' id="+data[i]["gpu_node_id"]+">";
				html+= "<div>" + data[i]["gpu_node_id"] + "</div>";
				html+= "<div>" + data[i]["account"] + "</div>";
				html+= "<div class='password'>" + data[i]["password"] + "</div>";
				html+= "<div>" + data[i]["address"] + "</div>";
				html+= "<div>" + data[i]["type"] + "</div>";
				if(data[i]["port"]){
					html+= "<div>" + data[i]["port"] + "</div>";		// jh.sa 210125
				} else {
					html+= "<div>-</div>";
				}				
				html+= "<div>" + data[i]["created_date"] + "</div>";
				html+= "<div class='install'></div>";
				that.pt.find(".install_wrap .c_wrap").append(html);
				deArr.push(that.checkStatus(data[i]["gpu_node_id"],"isInstallFile"));
			}
			Promise.all(deArr).then(function(val){
				var flag = true;
				for(var i=0;i<val.length;i++){
					if(!val[i].result.data){
						flag=false;
						break;
					}
				}
				if(flag){ that.drawSwarmJoinList(data); }
				that.install_wrap_listener();
			});
		},
		drawSwarmJoinList: function(data){
// 			console.log("=====DockerSwarmJoin=====");
			console.log("=====NFS Join=====");			// jh.sa 210129
			var that = this;
			var deArr=[];
			that.pt.find(".swarmjoin_wrap").removeClass("hide");
			for(var i= data.length -1; i>=0; i--){
				var html="";
				if(data[i]["type"]=="master") { continue; }
				html+= "<li class= 'gpu_list flex' id="+data[i]["gpu_node_id"]+">";
				html+= "<div>" + data[i]["gpu_node_id"] + "</div>";
				html+= "<div>" + data[i]["account"] + "</div>";
				html+= "<div class='password'>" + data[i]["password"] + "</div>";
				html+= "<div>" + data[i]["address"] + "</div>";
				html+= "<div>" + data[i]["type"] + "</div>";
				if(data[i]["port"]){
					html+= "<div>" + data[i]["port"] + "</div>";		// jh.sa 210125
				} else {
					html+= "<div>-</div>";
				}
				html+= "<div>" + data[i]["created_date"] + "</div>";
				html+= "<div class='install'></div>";
				that.pt.find(".swarmjoin_wrap .c_wrap").append(html);
// 				deArr.push(that.checkStatus(data[i]["id"],"isJoinSwarm"));
				deArr.push(that.checkStatus(data[i]["gpu_node_id"],"isJoinNfs"));		// jh.sa 210129
			}
			Promise.all(deArr).then(function(){
				that.swarmjoin_listener();
			});
		},
		prerequirement_listener: function(){
			var that = this;
			that.pt.find(".prerequirement_wrap .install").off("click").on("click",function(e){
				that.needFile("installRequirement");
			});
		},
		
		gpu_wrap_listener : function(){	
			var that = this;
			that.pt.find(".btn_wrap .delete").off("click").on("click", function(e){
				var id =$(this).parents("li")[0].id;
				that.deleteGPUnode(id);
			});
			
			that.pt.find(".btn_wrap .append").off("click").on("click", function(e){
				that.appendGPUnode();
			});
		},
		
		deployment_wrap_listener : function(){
			var that = this;
			that.pt.find(".deployment_wrap .btn_wrap .install").off("click").on("click",function(e){
				var id=$(this).parents("li")[0].id;
				that.needFile("deployInstallFile",id);
			});
		},
		
		install_wrap_listener : function(){
			var that = this;
			that.pt.find(".install_wrap .btn_wrap .install").off("click").on("click",function(e){
				var id=$(this).parents("li")[0].id;
				that.needFile("installFile",id);
			});	
		},
		swarmjoin_listener : function(){
			var that = this;
			that.pt.find(".swarmjoin_wrap .btn_wrap .install").off("click").on("click",function(e){
				var id=$(this).parents("li")[0].id;
// 				that.needFile("joinSwarm",id);
				that.needFile("joinNfs",id);			// jh.sa 210129
			});	
		},
		
		reset: function(){
			location.reload();
		},
		
		deleteGPUnode: function(id){
			console.log("=====deleteGPUnode=====");
			var that = this;
			let ajaxData = {
				id : id
			}
			$("#loader").show();
			$.ajax({
				url: baseUrl + "gpuNode/deleteGpuNode.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					$("#loader").hide();
					console.log("deleteGPUNode success");
					alert("삭제가 완료되었습니다");
					that.reset();
				},
				error : function(err){
					$("#loader").hide();
			   		console.log("ERROR!!", err);
			   	}
			});
		},
		
		appendGPUnode: function(){
			console.log("=====appendGPUnode=====");
			var that = this;
			var address = that.pt.find("input[name=address]").val();
			var account = that.pt.find("input[name=account]").val();
			var password = that.pt.find("input[name=password]").val();
			var type = that.pt.find("select[name=type]").val();
			var port = that.pt.find("input[name=gpu_port]").val();
			if(account ===''){
				alert("계정을 입력해주세요");
				that.pt.find("input[name=account]").focus();
				return;
			}
			if(password === ''){
				alert("비밀번호를 입력해주세요");
				that.pt.find("input[name=password]").focus();
				return;
			}
			if(address === ''){
				alert("주소를 입력해주세요");
				that.pt.find("input[name=address]").focus();
				return;
			}
			var re = /\b(?:\d{1,3}\.){3}\d{1,3}\b/g
			if(address.match(re)==null){
				var msg="유효한 IP 주소가 아닙니다. \n저장 하시겠습니까?";
				if(!confirm(msg)){
					that.pt.find("input[name=address]").focus();
					return;
				}
			}
			
			// jh.sa 210125
			if(port === ''){
				alert("Port를 입력해주세요");
				that.pt.find("input[name=gpu_port]").focus();
				return;
			}

			if(!checkInput(port,"num")){
				alert("1 ~ 65535 사이의 숫자만 입력 가능합니다.");
				that.pt.find("input[name=gpu_port]").focus();
				return;
			} else {
				if(port < 0 || port > 65535){
					alert("1 ~ 65535 사이의 숫자만 입력 가능합니다.");
					return;
				}
			}
			
			let ajaxData = {
				type : type,
				account :  account,
				password : password,
				address :  address,
				port : port,
			}
			$("#loader").show();
			console.log(ajaxData);
			$.ajax({
				url: baseUrl + "gpuNode/insertGpuNode.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
			   		$("#loader").hide();
			   		
			   		console.log("=====addImgtoserver=====", res);
			   		alert(res.result.data);
					//트리초기화
					if(res.result.code == "200"){
						that.reset();
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
				},
				error: function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
				}
			});
		},
		
		needFile: function(department,id){
			console.log("=====installFile=====");
			var that = this;
			$("#loader").show();
			let url = baseUrl + "setup/" + department + ".json";
			console.log(url);
			if(department === "installRequirement"){
				$.ajax({
					url: url,
					type : "POST",
					success : function(res){
				   		$("#loader").hide();
				   		alert(res.result.data);
						if(res.result.code == "200"){
							console.log(res);
							//that.reset();
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} 
					},
					error: function(err){
				   		$("#loader").hide();
				   		 console.log("ERROR!!", err);
					}
				});
				return;
			}
			let ajaxData = {
				id: id,
			}
			$.ajax({
				url: url,
				data : ajaxData,
				type : "POST",
				success : function(res){
			   		$("#loader").hide();
			   		alert(res.result.data);
					if(res.result.code == "200"){
						that.reset();
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
				},
				error: function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
				}
			});
		},
	};
</script>