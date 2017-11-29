/**
 * trim
 */
String.prototype.trim = function(){
	    return this.replace(/(^\s*)|(\s*$)/gi, "");
};


/**
 * isEmpty
 */
//String.prototype.isEmpty = function(){
//	
//	if(this==null) return true;
//	
//	var str = this.trim();
//	if(str.length == 0){
//		return true;
//	}else{
//		return false;
//	}
//};




/**
 * 공백문자 이거나 null 체크
 */
function isEmpty(param){
	
	if(param==null || param == undefined) return true;
	if(typeof param == "number") return false;
	
	var str = param.trim();
	if(str.length == 0){
		return true;
	}else{
		return false;
	}
}


/**
 * 숫자열을 3자리마다 "," 표 찍기
 */
function formatMoney(strNumber,mode){
	
	if(typeof strNumber == 'number'){
		strNumber = strNumber.toString();				//숫자타입이면 문자로 변환
	}else if(strNumber == null){
		strNumber = '';
	}
	
    var nLength=strNumber.length;
    var i=0;
    var strResult='';
    if(mode=='INSERT'){
        var j=0;
        for(i=nLength-1;i>=0;i--){
            j++;
            strResult=strNumber.substring(i,i+1)+strResult;
            if(j%3==0 && i>0){
                strResult=','+strResult;
            }
        }
    }else if( mode=='DELETE'){
        for(i=nLength-1;i>=0;i--){
            if(strNumber.substring(i,i+1)!=','){
                strResult=strNumber.substring(i,i+1)+strResult;
            }
        }
    }
    return strResult;
}

/**
 * 쿠키 값추가
 */
function addCookie(name, value, url, expiredays){
    var todayDate = new Date();
    if(Number(expiredays)>0){
        todayDate.setDate( eval(todayDate.getDate() + expiredays) );
    }else if(Number(expiredays) == 0){
        todayDate = null;
    }else{
        todayDate.setDate( todayDate.getDate() + 30);
    }
    document.cookie = name + "=" + escape( value ) + 
        (todayDate!=null ? "; expires=" + todayDate.toGMTString() : "") +
        (url!=null ? "; path="+url : " " );
}

/**
 * 쿠키 값 얻기
 */
function getCookie(name){
    var Found = false;
    var start, end;
    var i = 0;
    while(i <= document.cookie.length){
        start = i;
        end = start + name.length;
        if(document.cookie.substring(start, end) == name){
            Found = true;
            break;
        }
        i++;
    }

    if(Found == true){
        start = end + 1;
        end = document.cookie.indexOf(";", start);
        if(end < start){
            end = document.cookie.length;
        }
        return document.cookie.substring(start, end);
    }else{
        return "";
    }
}


/**
 * 알파벳으로만 되어 있는 문자열인지
 */
function isAlpha(xStr){
    return xStr.match(/[^a-z]/gi);
}


/**
 * 문자열에 한글문자가 하나라도 있는지 검사
 */
function strInKrChar(value){
    for (var idx = 0; idx < value.length; idx++) {
        str2 = value.charAt(idx);
        if (( str2 >= 'ㄱ' && str2 <= '힣' )){
            return true;
        }
    }
    return false;
}

/**
 * 문자열이 영문대소 와 숫자 로만 구성됬는지 패턴검사
 */
function strInNumNEn(value){
    if(value==null || value.length < 1) return true;
    var temp = value;
    while(temp.indexOf("\\")>-1){
        temp = temp.substr(temp.indexOf("\\")+1);
    }
    temp = temp.replace("[","");
    temp = temp.replace("]","");
    var format = "[^\._A-Za-z0-9]{1,}";
    
    if(temp.search(format) != -1){
        return true; 
    }else{
        return false;
    }
}

/**
 * 정규식으로 문자열이 숫자로만 구성됬는지 패턴검사
 */
function strInNum(value){
    var format = "^[0-9]";

    if (value.search(format) != -1) {
        return true;
    }
    return false;
}

/**
 * 정규식으로 문자열이 이메일로 유효한지 패턴검사
 */
function isEmail(value){ 
    var format = "^([-.0-9a-zA-Z]+)@([-.0-9a-zA-Z]+).([a-zA-Z]+)$";
    if (value.search(format) != -1) {
        return true;
    }
    return false;
}


/**
 * 정규식으로 문자열이 일반전화번호로 유효한지 패턴검사
 */
function isPhoneNumber(value){ 
    var format = "^[0-9]\{2,3\}-[0-9]\{3,4\}-[0-9]\{4\}$";

    if (value.search(format) != -1) {
        return true;
    }
    return false;
}

/**
 * 정규식으로 문자열이 일반전화번호로 유효한지 패턴검사 (숫자와 - 로만 되어있는지 검사만 하는 약식 검사)
 */
function isPhoneNumberSimple(value){ 
    var format = "^[0-9]+[0-9-]*[0-9]$";

    if (value.search(format) != -1) {
        return true;
    }
    return false;
}

/**
 * 정규식으로 문자열이 헨드폰번호로 유효한지 패턴검사
 */
function isMobileNumber(value){
    var format = "^[0-9]\{3\}-[0-9]\{3,4\}-[0-9]\{4\}$";
    if (value.search(format) != -1) {
        return true;
    }
    return false;
}

/**
 * 전화번호형식으로 ex)025556666 >> 02-555-6666
 */
function toPhoneFormat(pStr){
	return pStr.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, '$1-$2-$3');
}


/**
 * 숫자앞에 원하는 길이만큼 '0' 채우기
 * 
 * @param no	: 숫자
 * @param len	: 전체길이
 * @returns 숫자앞에 '0' 채운 문자열
 */
function fillzero(no, len) {
	no= '000000000000000'+no;
	return no.substring(no.length-len);
}