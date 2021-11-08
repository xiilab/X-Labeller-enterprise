"use strict";

    var  gsValidate = function(frm) {

        var  fields = document.querySelectorAll(frm + " " +"[required]");
//        var  fields = $(frm).find("input,textarea,select").filter("[required]");
        	for(var i=0; i<fields.length; i++){
            var  field = fields[i];
            
            var  attrs = field.attributes,
                value = field.value,
                dataset = getDataset(field.attributes);
            
            if (!value){
                alert(dataset["label"] + "을(를) 입력하세요.");
                field.focus();
                return false;
            } else if(attrs.minlength && value.length < attrs.minlength.value){
                alert(dataset["label"] + "을(를) "+attrs.minlength.value+"자 이상 입력하세요.");
                field.focus();
                return false;
            } else if(attrs.maxlength && value.length > attrs.maxlength.value){
                alert(dataset["label"]+ "을(를) "+attrs.maxlength.value+"자 이하 입력하세요.");
                field.focus();
                return false;
            } else if(dataset["text-type"]){
                if(!checkTypeValue(dataset["label"], dataset["text-type"], value)){
                		field.value = "";
                    field.focus();
                    return false;
                } 

	        	} else if(dataset["pw-check"] == "true"){
	        		if(!checkPwValue(value)){
	        			field.value = "";
	        			field.focus();
	        			return false;
	        		} 
	        		
	        	}

        }

        return true;


    };

//    function checkPwValue(value){
//    	//(?=.*[!@#$%^&*()_+-=[]{};':\"\\\\|,.<>\\/?~`])
//    	//'(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?~`])
//    	//(?=.*[!@#$%^&*()_+\\-=\\[\\]{};:\"\\\\|,.<>\\/?~])
//    	//[A-Za-z[0-9]!@#$%^&*()_+\\-=\[\]{};':\"\\\\|,.<>\/?~`]{8,20}$
//    	//console.log(value);
//    	  	//if(!/^(?=.*[a-zA-Z])(?=.*[\[\{\]\}\)\(~`!@#$%^&*-_=+;:'"?<>,./\|])(?=.*[0-9]).{8,20}$/.test(value)){
//    	  		
////    	  	if(!/^(?=.*[a-zA-Z])(?=.*[\[\{\]\}\)\(~`!@#$%^&*\-_=+;:\'\"?<>,.\/\|])(?=.*[0-9]).{8,20}$/.test(value)){   
////    	        alert('비밀번호는 영문 대소문자, 숫자, 특수문자(~`!@#$%^&*-_=+;:\'\"?<>,./\|\[\]{\}\(\)) 조합 8~20자리 이내로 입력해주세요.');
////    	        return false;
////    	    }  
////	  	if(!/^(?=.*[a-zA-Z])(?=.*[\[\{\]\}\(\)~`!@#$%^*\-_=+;:?,.\/\|])(?=.*[0-9]).{8,20}$/.test(value)){   
////	        alert('비밀번호는 영문 대소문자, 숫자, 특수문자(~`!@#$%^*-_=+;:?,./\|\[\]{\}\(\)) 조합 8~20자리 이내로 입력해주세요.');
////	        return false;
////	    }      	
//	  	if(!/^(?=.*[a-zA-Z])(?=.*[\~\`\!\@\#\$\%\^\*\-\_\=\+\;\:\?\,\.])(?=.*[0-9]).{8,20}$/.test(value)){
//	        alert('비밀번호는 영문 대소문자, 숫자, 특수문자(~`!@#$%^*-_=+;:?,.) 조합 8~20자리 이내로 입력해주세요.');
//	        return false;
//	    }  
//
//         return true;
//
//    }
    
    function checkPwValue(password) {

    	var checkPass = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\*\(\)\{\}\_\-\+\=\[\]\|\\\;\:\,\.\?\/])(?=.*[0-9]).{8,20}$/;
    	var reg = /[<>&"']/gi;
    	if(password.match(reg)){
    		alert('비밀번호는 영문 대소문자, 숫자, 특수문자(~`!@#$%^*-_=+;:?,./\|\[\]{\}\(\)) 조합 8~20자리 이내로 입력해주세요.');
    		return false;    		
    	}
    	
    	if (checkPass.test(password)) {
    		return true;
    	} else {
    		alert('비밀번호는 영문 대소문자, 숫자, 특수문자(~`!@#$%^*-_=+;:?,./\|\[\]{\}\(\)) 조합 8~20자리 이내로 입력해주세요.');
    		return false;
    	}
    }    
    
    
    function checkIdValue(value){
    	
	  	if(!/^(?=.*[a-z])(?=.*[0-9]).{5,15}$/.test(value)){            
	        alert('아이디는 영문 소문자, 숫자 조합 5~15자 이내로 입력해주세요.');
	        return false;
	    }  
    	var reg = /^[a-z|0-9|\*]+$/;
    	var trimTxt = value.replace(/ /gi, "");
    	if(trimTxt != ""){
            if(!reg.test(trimTxt)){
                alert("아이디는 영문 소문자, 숫자 조합 5~15자 이내로 입력해주세요.");
                return false;
            }    		
            return true;
    	}
     return true;

    }    
    
    function checkInput(value, type){
    	switch(type){
    	case "ko-en-num":
    		// 한글, 영문, 숫자만 허용
        	var reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
        	var trimTxt = value.replace(/ /gi, "");
        	if(trimTxt != ""){
                if(!reg.test(trimTxt)){
//                    alert("한글, 영문 대/소문자, 숫자만 입력 가능합니다.");
                    return false;
                }    		
                return true;
        	}
        	break;
    	case "en-num":
    		// 영대소문자, 숫자만 허용
        	var reg = /^[a-z|A-Z|0-9|\*]+$/;
        	var trimTxt = value.replace(/ /gi, "");
        	if(trimTxt != ""){
                if(!reg.test(trimTxt)){
//                    alert("영문 대/소문자, 숫자만 입력 가능합니다.");
                    return false;
                }    	
                return true;
        	}
        	break;    
    	case "en-num2":
    		// 한글, 영소문자, 숫자만 허용
        	var reg = /^[a-z|0-9|\*]+$/;
        	var trimTxt = value.replace(/ /gi, "");
        	if(trimTxt != ""){
                if(!reg.test(trimTxt)){
//                    alert("영문 소문자, 숫자만 입력 가능합니다.");
                    return false;
                }    		
                return true;
        	}
        	break;         	
    	case "num":
    		// 숫자만 허용
        	var reg = /^[0-9|\*]+$/;
        	var trimTxt = value.replace(/ /gi, "");
        	if(trimTxt != ""){
                if(!reg.test(trimTxt)){
//                    alert("숫자만 입력 가능합니다.");
                    return false;
                }    		
                return true;
        	}
        	break;  
        	
		case "en-num-spe":
			// 영문, 숫자, 특수문자만 허용
	    	var reg = /^[a-z|A-Z|0-9|!@#$&%^*+=-|\*]+$/;
	    	var trimTxt = value.replace(/ /gi, "");
	    	if(trimTxt != ""){
	            if(!reg.test(trimTxt)){
//	                alert("영문 대/소문자, 숫자, 특수문자만 입력 가능합니다.");
	                return false;
	            }    		
	            return true;
	    	}
	    	break;          	
    	}

    }
    
    
    function checkTypeValue(name, type, value){
    		switch(type){
                case "email":
                    var  emailReg=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                    
                    if(!emailReg.test(value)){
                        alert("이메일 형식이 올바르지 않습니다.");
                        return false;
                    }
                    
                    if(value.match(/@/g).length > 1){
                        alert("이메일 형식이 올바르지 않습니다.");
                        return false;
                    }
                    
                    break;
                case "ko-en-num":
                    var reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
                    var trimTxt = value.replace(/ /gi, "");
                    // $target.val(trimTxt);
                    
                    if(!reg.test(trimTxt)){
                        alert(name + "은(는) 한글, 영문 대/소문자, 숫자만 가능합니다.");
                        return false;
                    }
                    break;
                case "ko-en":
                    var reg = /^[가-힣a-zA-Z]+$/;
                    var trimTxt = value.replace(/ /gi, "");
                    // $target.val(trimTxt);
                    
                    if(!reg.test(trimTxt)){
                        alert(name + "은(는) 한글, 영문 대/소문자만 가능합니다.");
                        return false;
                    }
                    break;
                case "en-num":
                    var reg = /^[a-zA-Z0-9]+$/;
                    var trimTxt = value.replace(/ /gi, "");
                    // $target.val(trimTxt);
                    
                    if(!reg.test(trimTxt)){
                        alert(name + "은(는) 영문 대/소문자, 숫자만 가능합니다.");
                        return false;
                    }
                    break;
                case "account":
	                	var reg = /^[A-Za-z0-9_-]+$/;
	                	var trimTxt = value.replace(/ /gi, "");
	                	// $target.val(trimTxt);
	                	
	                	if(!reg.test(trimTxt)){
	                		alert("아이디는 영문 대/소문자, 숫자, -(hyphen), _(underbar)만 가능합니다.");
	                		return false;
	                	}
	                	break;
                default:
                    return true;
             }

             return true;

    }
