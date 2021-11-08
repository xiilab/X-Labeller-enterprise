<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<%-- <jsp:include page="/sub"  flush="false" /> --%>

<head>
	<title>차트/채팅 | 웨이코인-가상화폐 커뮤니티</title>
	<script src="<c:url value="/js/sockjs.min.js" />"></script>
	<script src="<c:url value="/js/json2.js" />"></script>
	
	<!-- include calendar css -->
	<link rel="stylesheet" href="<c:url value="/css/jquery-ui.min.css" />">
	<link rel="stylesheet" href="<c:url value="/css/santiago.datepicker.css" />">
	
	
	<!-- include summernote css/js -->
<%-- 	<link rel="stylesheet" href="<c:url value="/css/summernote-by-bootstrap.css" />"> --%>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
	
	<link href="<c:url value="/css/summernote.css" />" rel="stylesheet">
	<script src="<c:url value="/js/summernote.js" />"></script>
	
	<style>
		#chatView .content_box.c_01 { width: 994px;  }
		#chatView .content_box.c_01 .chart_wrap { width: 100%;  height: 400px; }
		#chatView .content_box.c_01 .news_view_btn { width: 100px; background-color: #777;  margin-right: 10px; }
		#chatView .content_box.c_01 .news_list_wrap { width: 240px;  }
		#chatView .content_box.c_01 .news_list_wrap .news_list {  height: 335px; max-height: 335px; overflow-y: auto; padding: 10px; border: 1px #ccc solid;  background: #f9f9f9;  }
		#chatView .content_box.c_01 .news_list_wrap .news_date { text-align: center;  font-size: 15px;  margin-bottom: 10px; }
		#chatView .content_box.c_01 .news_list_wrap .news_title {      background: #fff; border: 1px #ccc solid;  padding: 10px; margin-bottom: 5px;  }
		
		#chatView .content_box.c_02 { width: 994px; margin-top: 14px; }
		#chatView .content_box.c_02 .user_list_btn {     color: #414346; border: solid 1px #e6e7e8; width: 140px; margin-right: 15px; margin-top: 10px; }
		#chatView .content_box.c_02 .user_list_wrap { max-height: 500px; overflow-y: auto; width: 130px; padding: 15px;     border: solid 1px #e6e7e8;}
		#chatView .content_box.c_02 .user_list_wrap .user_list_title { margin-bottom: 10px; font-size: 14px;}
		#chatView .content_box.c_02 .note-editor.note-frame { float: left; border: solid 1px #e6e7e8 !important; border-radius: 0 !important; }  
		
		#chatView .content_box.c_02 .chat_wrap { width: 100%; border: solid 1px #e6e7e8; }
		#chatView .content_box.c_02 .chat_wrap p { margin-bottom: 0; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents{  padding: 20px; max-height: 500px; overflow-y: auto; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .from { font-weight: bold;   text-align: center; }
		
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap  { margin-bottom: 10px; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap .user_name {  margin-right: 12px; font-weight: bold; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap .user_message { position: relative; text-align: right; background-color: #f5f5f5;  padding: 10px;  border-radius: 5px; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap .user_message:after { 	right: 100%; top: 15px; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none; border-right-color: #f5f5f5; border-width: 5px; margin-top: -5px; }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap .user_message.me { background-color: #e5edfb;  }
		#chatView .content_box.c_02 .chat_wrap .chat_contents .message_wrap .user_message.me:after {    border-right: none; left: 100%; border-left-color: #e5edfb;}
		
		#chatView .content_box.c_02 .input_wrap .chat_input { margin-top: 20px; }
		#chatView .content_box.c_02 .input_wrap .chat_input .input_message { width: 855px; }
		#chatView .content_box.c_02 .input_wrap .chat_input .send_message { line-height: 70px; margin-left: 5px; background-color:#777777; }
		
	</style>
</head>


<body>
	<div class="w1280">
		<div class="container" id="chatView">
			<div class="contents">
<!-- 				<div class="content_box c_01"> -->
<!-- 					<div class="c_title">코인시세</div> -->
<!-- 					<div class="c_option_guide"> -->
<!-- 						<div class="option_guide_market fl">거래소</div> -->
<!-- 						<div class="option_guide_currency fl">기준화폐</div> -->
<!-- 						<div class="option_guide_coin fl">암호화폐</div> -->
<!-- 						<div class="option_guide_time fl">차트간격</div> -->
<!-- 						<div class="option_guide_range fl">차트기간</div> -->
<!-- 						<div class="clearfix"></div> -->
<!-- 					</div> -->
<!-- 					<div class="c_option"> -->
<!-- 						<select name="option_market" class="option_market"></select> -->
<!-- 						<select name="option_currency" class="option_currency"></select> -->
<!-- 						<select name="option_coin" class="option_coin"></select> -->
						
<!-- 						<select name="option_time" class="option_time"> -->
<!-- 							<option value="900000">15분</option> -->
<!-- 							<option value="1800000">30분</option> -->
<!-- 							<option value="3600000">1시간</option> -->
<!-- 							<option value="43200000">12시간</option> -->
<!-- 							<option value="86400000">1일</option> -->
<!-- 							<option value="604800000">7일</option> -->
<!-- 						</select> -->
						
<!-- 						<input type="text" id="start_date" name="start_date" class="option_range datepicker ll-skin-santiago" /> -->
<!-- 						<label class="date_dash">~</label> -->
<!-- 						<input type="text" id="end_date" name="end_date" class="option_range datepicker ll-skin-santiago" /> -->
						
<!-- 						<div class="btn news_view_btn fr"></div> -->
<!-- 						<div class="celarfix"></div> -->
<!-- 					</div> -->
<!-- 					<div class="c_cont"> -->
<!-- 						<div class="chart_wrap fl"></div> -->
<!-- 						<div class="news_list_wrap fl hide"> -->
<!-- 							<div class="news_date"></div> -->
<!-- 							<div class="news_list"></div> -->
<!-- 						</div> -->
<!-- 						<div class="clearfix"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="content_box c_02">
					<div class="c_title fl">채팅</div>
					<div class="user_list_btn btn fr"><i class="fas fa-comments"></i> 채팅참가자<span>(0)</span></div>
					<div class="clearfix"></div>
					
					<div class="c_cont">
						<div class="chat_wrap fl">
							<div class="chat_contents " id="chat_message"></div>
						</div>
						<div class="user_list_wrap hide fr">
<!-- 							<div class="user_list_title">채팅 참가자</div> -->
							<div class="user_list"></div>
						</div>
						<div class="clearfix"></div>
						<div class="input_wrap"></div>
					</div>
				</div>
				
				<div clas="clearfix"></div>
			</div>
		</div>
<%-- 		<jsp:include page="/side"  flush="false" /> --%>
	</div>
	
	<jsp:include page="/footer"  flush="false" />		
	
</body>


<script>

	var sock = null;
	var message = {};


	$(function(){

		chatView.init();
		
	});

	var chatView = {
		pt: $("#chatView"),
		init: function(){
			var that = this;
			
			that.pt.find("#start_date").val(moment(moment().valueOf() - 259200000).format("YYYY-MM-DD"));
			that.pt.find("#end_date").val(moment().format("YYYY-MM-DD"));
			
			$("#start_date, #end_date").datepicker().datepicker("widget").wrap("<div class='ll-skin-santiago'/>");
			
			
// 			that.getMarketList();
			

			$.ajax({
			   	url :  baseUrl + "auth/getSession.json",
			   	data : {},
			   	type : "POST",
// 			   	async: false,
			   	success : function(res){
					console.log("=====getSession=====", res);
					if(!res.result){
						that.pt.find(".input_wrap").html("로그인 후 이용가능합니다.");
					} else {
						var html = "";
						html += " <div class='chat_input'> ";
						html += " 	<div id='input_message' class='input_message fl'></div> ";
// 						html += " 	<input type='text' name='input_message' id='input_message' class='input_message fl' /> ";
						html += " 	<div class='send_message fl btn' id='send_message'>입력</div> ";
						html += " 	<div class='clearfix'></div> ";
						html += " </div> ";
						that.pt.find(".input_wrap").append(html);
						
						$.extend($.summernote.plugins, {
						    "brenter": function (context) {
						        this.events = {
						            "summernote.enter": function (we, e) {
						            	if(!e.shiftKey){
							            	that.pt.find("#send_message").click();
							                e.preventDefault();
						            	}
						            }
						        };
						    }
						});
							

						that.pt.find("#input_message").summernote({
				        	height: "60px",
				        	width: "875px",
				        	lang: "ko-KR",
// 				        	disableResizeEditor: true,
				         	toolbar: []
				   		});
// 						$('.note-statusbar').hide();

						
						that.userName = res.result.nickname;
						that.connectChatting();
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});	
			
			
			
			that.listener();
		},
		userList: {},
		userCount: 0,
		connectChatting: function(){
			var that = this;
	    	var room = "main";
	    	 
	    	
	    	
	    	var colorArray = ["#64598a", "#a9b914", "#197901", "#851277", "#4d7320", "#2f0726", "#147934", "#4c6c99", "#c14637", "#c3873a", "#7ebbf9", "#1eb21f", "#ba8af1", "#f730f0", "#a1222b", "#0abe34", "#a71a38", "#5564e7", "#7c0f65", "#887d6b", "#1c994c", "#a172ed", "#518359", "#672f3d", "#8d1868", "#ae5e99", "#a64187", "#ee1a43", "#ec7ca0", "#0a1e0f", "#85b401", "#4a506f", "#d97693", "#d0a7e8", "#8087d9"];
            
	    	chatSock = new SockJS("${pageContext.request.contextPath}/echo-ws?room="+room);
	        chatSock.onopen = function() {
				// 연결됐을때
	        };
	         
	        chatSock.onmessage = function(evt) {
	        	
	        	
	        	var data = JSON.parse(evt.data);
	        	if(typeof that.userList[data.nickname] != "undefined") var nameColor = that.userList[data.nickname];
	        	
	        	
	        	if(data.type == "all"){
	        	// 채팅 주고받을때	
	        	
		        	if(that.userName == data.nickname){
		        	   	var output = ""
				        	+ " <div class='message_wrap fr'> "
				        	+ " 	<div class='user_message me' style='text-align: right'>"+data.message+"</div> "
				        	+ " </div> "
				        	+ " <div class='clearfix'></div> ";
		        	} else {
		        		
		        		
		        	   	var output = ""
				        	+ " <div class='message_wrap fl'> "
				        	+ " 	<div class='user_name fl' style='color:"+nameColor+"; text-align: left'>"+data.nickname+"</div> "
				        	+ " 	<div class='user_message fl' style='text-align: left'>"+data.message+"</div> "
				        	+ " 	<div class='clearfix'></div> "
				        	+ " </div> "
				        	+ " <div class='clearfix'></div> ";
		    
		        	}
		        	
		            that.pt.find("#chat_message").append(output);
		            that.pt.find("#chat_message").scrollTop(99999999);
	        	} else if(data.type == "add"){
	        	// 누구 들어왔을때
	        		var list = JSON.parse(data.message);
					for(var i=0; i<list.length; i++){
						if(typeof that.userList[list[i]] == "undefined") that.userList[list[i]] = colorArray[Math.floor(Math.random()*35)];
						if(list[i] != that.userName) that.pt.find(".user_list_wrap .user_list").append("<div data-name='"+list[i]+"' style='color: "+that.userList[list[i]]+"'>"+list[i]+"</div>");
						that.userCount++;
					}
					that.pt.find(".content_box.c_02 .user_list_btn span").html(" ("+(that.userCount-1)+")");
					
	        	} else if(data.type == "pop"){
	        	// 나갔을때
	        		var list = JSON.parse(data.message);
	        		for(var i=0; i<list.length; i++){
		        		that.pt.find(".user_list_wrap div[data-name='"+list[i]+"']").remove();
		        		delete that.userList[list[i]];
		        		that.userCount--;
					}
	        		that.pt.find(".content_box.c_02 .user_list_btn span").html(" ("+(that.userCount-1)+")");
	        	}
	        };
	         
	        chatSock.onclose = function() {
	            // sock.send("채팅을 종료합니다.");
	        }
	         
	         
	        that.pt.find("#send_message").on("click", function() {
// 	            if( that.pt.find("#input_message").val() != "") {
	                 
	                message={};
	                message.message = that.pt.find("#input_message").summernote("code");
	                message.type = "all";
	                message.to = "all";
	                 
	                if(getByteLength(JSON.stringify(message)) > 990000){
	                	alert("사이즈가 커서 전송할 수 없습니다.");
	                	return;
	                } else {
		                chatSock.send(JSON.stringify(message));
	                }
	              
	                that.pt.find("#chat_message").scrollTop(99999999);
	                that.pt.find("#input_message").summernote("code","");
// 	            }
	        });
	        
	        that.pt.find(".c_02 .user_list_btn").off("click").on("click",function(){
	        	if(that.pt.find(".user_list_wrap").hasClass("hide")){
					that.pt.find(".chat_wrap").css("width", "790px");
					that.pt.find(".user_list_wrap").removeClass("hide");
				} else {
					that.pt.find(".chat_wrap").css("width", "964px");
					that.pt.find(".user_list_wrap").addClass("hide");
				}
	        });
		},
		getDataListByMarket: function(){
			// chart 데이터
			var that = this;

			showLoading(that.pt.find(".c_01 .c_cont"));
			
			that.marketName = that.pt.find(".c_01 .option_market option:selected").val();
			that.coinName = that.pt.find(".c_01 .option_coin option:selected").val();
			
			
	 		var startDate = that.pt.find("#start_date").val() + " 00:00:00",
	 			endDate = that.pt.find("#end_date").val() + " " + moment().format("HH:mm:ss");
	 		
// 	 		that.getNewsListByTypeByDate(moment().format("YYYY-MM-DD"));

			var ajaxData = {
				market_name : that.marketName,
				start_date : startDate,
				end_date : endDate,
				currency1 : that.pt.find(".c_01 .option_currency option:selected").val(),
				currency2 : that.coinName,
			};
			
			$.ajax({
			   	url :  baseUrl + "coin/getDataListByMarket",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====차트 :: getDataListByMarket=====", res);
			   		
			   		if(res.result.code == "200" && res.result.data.length > 0){
				   		that.procChartData(res.result.data);
			   		} else if(res.result.code == "200" && res.result.data.length == 0){
			   			showNodata(that.pt.find(".content_box.c_01 .chart_wrap"));
			   		}
			   		hideLoading(that.pt.find(".c_01 .c_cont"));
	   			 	
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
// 			   		 alert("결과를 불러오는데 실패했습니다.");
// 			   		 location.href = baseUrl + "main";
			   	}
			});
		
		
		},
		getNewsListByTypeByDate: function(date){
			var that = this;

			showLoading(that.pt.find(".c_01 .c_cont .news_wrap"));
			that.pt.find(".c_01 .c_cont .news_list_wrap .news_date").html(date);
			var ajaxData = {
				type : that.coinName,
				created_date : date,
			};
			
			$.ajax({
			   	url :  baseUrl + "news/getNewsListByTypeByDate",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====차트뉴스 :: getNewsListByTypeByDate=====", res);
		   			that.pt.find(".c_01 .news_view_btn").html("관련뉴스 " + res.result.data.length + "건");
		   			
			   		if(res.result.code == "200"){
			   			
			   			that.drawNewsListByTypeByDate(res.result.data);
			   		} 
			   		hideLoading(that.pt.find(".c_01 .c_cont .news_wrap"));
	   			 	
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		
		
		},
		drawNewsListByTypeByDate: function(data){
			var that = this;
			var target = that.pt.find(".news_list_wrap .news_list"), html = "";
			
			$(target).html("");
			for(var i=0; i<data.length; i++){
				html += "<div class='news_title'><a href='"+data[i].link+"' target='_blank'>"+data[i].title+"</a></div>";
			}
			$(target).append(html);
			
			that.pt.find(".c_01 .news_view_btn").off("click").on("click",function(){
				if(that.pt.find(".news_list_wrap").hasClass("hide")){
					that.pt.find(".chart_wrap").removeAttr("style").css("width", "720px").html("").removeAttr("_echarts_instance_");
	 				that.getDataListByMarket();
					that.pt.find(".news_list_wrap").removeClass("hide");
				} else {
					that.pt.find(".chart_wrap").removeAttr("style").css("width", "100%").html("").removeAttr("_echarts_instance_");
	 				that.getDataListByMarket();
					that.pt.find(".news_list_wrap").addClass("hide");
				}
			});
		},
		procChartData: function(data){
			var that = this;
			
			that.pt.find(".chart_wrap").removeAttr("style").html("").removeAttr("_echarts_instance_");
			
			
			var timeInterval = that.pt.find(".c_01 .option_time option:selected").val(),
				sTime = moment(data[0]["timestamp"], tf).valueOf();
			
			
			/* 시간별로 쪼개 */
			var calData = [];
			var i = 0;
			while(i<data.length){
				var diff = sTime - moment(data[i]["timestamp"], tf).valueOf();
				var idx = Math.floor(diff/timeInterval);
				
				if(typeof calData[idx] == "undefined") calData[idx] = [];
				
				calData[idx].push(data[i]);
				i++;
			}
			
			
			/* 그래프 데이터 형식 */
			var chartData = {
					"categoryData" : [],
					"values": []
				};
				
			var j = calData.length - 1;
			var calDataLen = calData.length;
			while(j >= 0){
				if(typeof calData[j] != "undefined"){ 
					var len = calData[j].length;

					var lowest = calData[j][0]["price"], highest = calData[j][0]["price"];
			
					var k = 0;
					while(k < len){
						lowest = calData[j][k]["price"]*1 > lowest ? lowest : calData[j][k]["price"]*1;
						highest = calData[j][k]["price"]*1 < highest ? highest : calData[j][k]["price"]*1;
						k++;
					}
					
					var obj = {
							"timestamp": moment(sTime-(timeInterval * j)).format(tf),
							"open": calData[j][len-1]["price"]*1,
							"close": calData[j][0]["price"]*1,
							"lowest": lowest,
							"highest": highest
					};
					
					chartData.categoryData.push(obj.timestamp);
					chartData.values.push([obj.open, obj.close, obj.lowest, obj.highest]);
				}
				
				j--;
			}
			
			
			chartView.candlestick(that.pt.find(".content_box.c_01 .chart_wrap"), chartData, "chatView");
		},
		getMarketList: function(){
			var that = this;
	 
			var ajaxData = {};
			
			$.ajax({
			   	url :  baseUrl + "coin/getMarketList",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====마켓리스트 :: getMarketList=====", res);
			   		if(res.result.code == "200" && res.result.data.length > 0){
			   			that.drawMarketList(res.result.data);
			   		}
			   		
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   		 alert("결과를 불러오는데 실패했습니다.");
			   	}
			});
		
		},
		marketObj: {},
		drawMarketList: function(data){
			var that = this;
			var html = "";
			// markerList
   			that.pt.find(".c_01 .option_market").html("");
   			for(var i=0; i<data.length; i++){
   				html += " <option value='"+data[i]["code"]+"'>"+WordConvert.MARKET(data[i]["name"])+"</option>";
   				that.marketObj[data[i]["code"]] = data[i]["currency"];
   			}
   			
   			that.pt.find(".c_01 .option_market").append(html);
   			
   			that.drawCurrency1List();
			that.pt.find(".c_01 .option_market").off("change").on("change",function(){
				that.drawCurrency1List();
// 				that.getDataListByMarket();
			});
   		
		},
		drawCurrency1List: function(){
			var that = this;
			var html = "";
   			//currency1
   			that.pt.find(".c_01 .option_currency").html("");
   			var selectedMarket = that.pt.find(".c_01 .option_market option:selected").val();
   			
   			var data = that.marketObj[selectedMarket].split(",");
   			
   			for(var i=0; i<data.length; i++){
   				html += " <option value='"+data[i]+"'>"+data[i]+"</option>";
   			}
   			that.pt.find(".c_01 .option_currency").append(html);
   			
   			that.getCurrency2List();
			that.pt.find(".c_01 .option_currency").off("change").on("change",function(){
	   			that.getCurrency2List();
// 	   			that.getDataListByMarket();
			});
		},
		getCurrency2List: function(){
			var that = this;
	 
			var ajaxData = {
					market_name: that.pt.find(".c_01 .option_market option:selected").val(),
					currency1: that.pt.find(".c_01 .option_currency option:selected").val(),
			};
			
			$.ajax({
			   	url :  baseUrl + "coin/getCurrency2List",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====화폐리스트 :: getCurrency2List=====", res);
			   		if(res.result.code == "200" && res.result.data.length > 0){
			   			that.drawCurrency2List(res.result.data);
			   		}
			   		
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   		 alert("결과를 불러오는데 실패했습니다.");
			   	}
			});
		
		},
		drawCurrency2List: function(data){
			var that = this;
			var html = "";
			
   			//currency1
   			that.pt.find(".c_01 .option_coin").html("");
   			var selectedMarket = that.pt.find(".c_01 .option_market option:selected").val();
   			
   			
   			for(var i=0; i<data.length; i++){
   				html += " <option value='"+data[i]["currency2"]+"'>"+WordConvert.COIN(data[i]["currency2"])+"</option>";
   			}
   			that.pt.find(".c_01 .option_coin").append(html);
   			
   			that.getDataListByMarket();
			that.pt.find(".c_01 .option_coin").on("change",function(){
	   			that.getDataListByMarket();
			});
		},
		listener: function(){
			var that = this;

// 			that.pt.find(".c_01 .option_currency").on("change",function(){
// 				that.getDataListByMarket();
// 			});
			
			that.pt.find(".c_01 .option_time").on("change",function(){
				that.getDataListByMarket();
			});
			
			that.pt.find(".c_01 .option_range").on("change",function(){
				that.getDataListByMarket();
			});

// 			that.pt.find(".c_01 .option_coin").on("change",function(){
// 				that.getDataListByMarket();
// 			});
			
// 			that.pt.find(".c_01 .option_market").on("change",function(){
// 				that.getDataListByMarket();
// 			});
			
		}
	};


</script>