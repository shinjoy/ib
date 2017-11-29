//document.write("<script src='" + contextRoot + "/js/jquery-1.10.2.js'></script>");
//document.write("<script src='" + contextRoot + "/js/jquery.min.js'></script>");
//document.write("<script src='" + contextRoot + "/js/jquery-ui.js'></script>");
//document.write("<script src='" + contextRoot + "/js/jquery.blockUI.js'></script>");
document.write("<script src='" + contextRoot + "/js/ajaxRequest.js'></script>");
//document.write("<script src='" + contextRoot + "/js/axisj/AXJ.min.js'></script>");

/*
 * common.js
 * 
 * 공통
 * 
 * (*필요 js : jquery, jquery-ui, jquery.blockUI)
 */



//모달 메세지 팝업(전체창)
function alertMsg(msg){
	$.blockUI({
		message : msg + "<br><br><input type='button' value='닫기' onclick='removeMsg();' />",
		css : {
			border : '1px solid #CCCCCC'	//border style.
		}
	});
}

//모달 메세지 닫기(전체창)
function removeMsg(){
	$.unblockUI();
}

//모달 메세지 닫기(전체창)
function removeModalNReload(){
	$.unblockUI();
	location.reload();
}

//세션 아웃에 따른 재 로그인 팝업(모달 blockUI)
function alertLogin(){
	$.blockUI({
		message : "<b>SESSION OUT!!</b><br><iframe src='" + contextPath + "/login/ibLoginUsr.do' width='100%' height='250' border='0' style='border:hidden'></iframe><br><br><input type='button' value='닫기' onclick='removeModalNReload();' />",		
		css : {
			border : '1px solid #CCCCCC'
		}
	});
}

/* ****(참조)***** 특정 엘리먼트 (block, unblock) *********
$("#blocklayer").block({message : "<input type='button' value='모달닫기' onclick='removeModal()' />"})
$("#blocklayer").unblock();
*********************************************************/



/* *** 하단 활용해서 페이지 닫을시 처리 
$(window).on("beforeunload", function(){
    if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
});
*/


//엑셀다운(html table to excel)
function excelDown(htmlStr, fileName, sheetName){	//excelDown(html문자열, 파일명, 시트명)
	
	var sheetNm = '다운로드';
	if(sheetName!=null) sheetNm = sheetName;
	//var excelString = myGrid.getExcelFormat('html');
	
	
	var tableToExcel = (function() {
    	var uri = 'data:application/vnd.ms-excel;base64,'
    	, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    	, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))); }
    	, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }); };
    	
    	return function() {
	    	//if (!table.nodeType) table = document.getElementById(table)
	    	var ctx = {worksheet: sheetNm || 'Worksheet', table: htmlStr};
	    	//window.location.href = uri + base64(format(template, ctx));
	    	
    		var link = document.createElement('a');
			link.download = fileName;
			link.href = uri + base64(format(template, ctx));
			link.click();
	    	
    	};
    })();	
	tableToExcel();
}


/* ***** 쿠키관련 ***** */
//쿠기설정
function setCookie(name, value, expiredays){
	var today = new Date();
	today.setDate( today.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
}
//로그인ID저장
function saveLoginId(id)
{
	if(id != ""){
		setCookie("ibissUserId", id, 7);		//userid 쿠키에 id 값을 7일간 저장
		
	}else{
		setCookie("ibissUserId", id, -1);	//userid 쿠키삭제
	}
}




/**
 * 공통코드
 * 
 * @param codeSetNm - 코드그룹명
 * @param language - 로그인사용자의 언어('KOR' or 'ENG')
 * @param code - return code  variable
 * @param name - return value variable
 * @param emptyCode - select 박스용 첫번째 공백값 코드
 * @param emptyName - select 박스용 첫번째 공백값 뷰명
 * @param emptyNameEng - select 박스용 첫번째 공백값 뷰명(영어명)...사용자 프로파일의 language가 'ENG'일때 첫값의 영어표기명
 * @returns 공통코드 object(array) -	[CD(code전달명), NM(name전달명), CODE_SET_NAME(그룹코드), MEANING(그룹코드명), VALUE(코드), MEANING(코드명), DESCRIPTION(코드설명), SORT]
 */
function getCommonCode(codeSetNm, language, code, name, emptyCode, emptyName, emptyNameEng){
	
	var returnObj = null;	//array object
	
	var lang = (language==null||language=='')?'KOR':language;	//언어명을 정하지 않을때 기본 'KOR'
	var codeV = (code==null||code=='')?'CD':code;				//코드명을 정하지 않을때 기본 명
	var nameV = (name==null||name=='')?'NM':name;				//벨류명을 정하지 않을때 기본 명
		
	var emptyObj = null;	//select 박스용 첫번째 공백값
	if(emptyCode != null){
		var emptyJson = '{"';
		emptyJson += (codeV + '":"' + emptyCode + '", "' + nameV + '":"' + ((lang=='ENG')?emptyNameEng:emptyName) + '"}');
		emptyObj= JSON.parse(emptyJson);			
	}
	
	
	var url = contextRoot + "/common/getCommonCode.do";
		
	var paramObj = {
		menuCd : codeSetNm,
		lang : lang,
		code : codeV,
		name : nameV
	};
	//callback function
	var callback = function(result){ //SUCCESS FUNCTION
		var obj = JSON.parse(result);
		
		var cnt = obj.resultVal;	//결과수
		var list = obj.resultList;	//결과데이터JSON
	
		if(cnt>0){
			returnObj = list;
			if(emptyObj != null)
				returnObj.unshift(emptyObj);	//select 박스용 첫번째 공백값 추가
		}
	
	};
	//공통 ajax 호출 (Sync 로)
	commonAjaxForSync("POST", url, paramObj, callback);
	
	return returnObj;
}


//division 임시
function getDivisionList(url, params){
	
	
	var returnObj = null;	//array object
	var url = contextRoot + url ;
	var paramObj = {		
			
		};
	if(params != undefined && typeof params == 'object'){
		paramObj=params;
	}
	
	//callback function
	var callback = function(result){ //SUCCESS FUNCTION
		var obj = JSON.parse(result);
		
		var cnt = obj.resultVal;	//결과수
		var list = obj.resultList;	//결과데이터JSON
	
		if(cnt>0){
			returnObj = list;
		}
	
	};
	//공통 ajax 호출 (Sync 로)
	commonAjaxForSync("POST", url, paramObj, callback);
	
	return returnObj;
}





/**
 * 공통코드 외 다른 테이블의 코드화데이터 (콤보박스용) ... (** 공통코드 함수를 가지고 거의 그대로 만들었다.(사실 파라미터로 합칠 수 도 있는데 한번 보자!!)
 * 
 * @param language - 로그인사용자의 언어('KOR' or 'ENG')
 * @param code - return code  variable
 * @param name - return value variable
 * @param emptyCode - select 박스용 첫번째 공백값 코드
 * @param emptyName - select 박스용 첫번째 공백값 뷰명
 * @param emptyNameEng - select 박스용 첫번째 공백값 뷰명(영어명)...사용자 프로파일의 language가 'ENG'일때 첫값의 영어표기명
 * @param requestMappingValue - 가져올 요청 url ... ex) "/system/getRoleCodeCombo.do"
 * @param params - 파라미터 객체
 * @returns 코드데이터 object(array) -	[CD(code전달명), NM(name전달명), ...(등등 테이블마다 다른값들 함께) ]
 */
function getCodeInfo(language, code, name, emptyCode, emptyName, emptyNameEng, requestMappingValue, params){
	
	var returnObj = null;	//array object
	
	var lang = (language==null||language=='')?'KOR':language;	//언어명을 정하지 않을때 기본 'KOR'
	var codeV = (code==null||code=='')?'CD':code;				//코드명을 정하지 않을때 기본 명
	var nameV = (name==null||name=='')?'NM':name;				//벨류명을 정하지 않을때 기본 명
		
	var emptyObj = null;	//select 박스용 첫번째 공백값
	if(emptyCode != null){
		var emptyJson = '{"';
		emptyJson += (codeV + '":"' + emptyCode + '", "' + nameV + '":"' + ((lang=='ENG')?emptyNameEng:emptyName) + '"}');
		emptyObj= JSON.parse(emptyJson);			
	}
	
	
	var url = contextRoot + requestMappingValue;		// "/system/getRoleCodeCombo.do";
		
	var paramObj = {		
		lang : lang,
		code : codeV,
		name : nameV
	};
	
	if(params != undefined && typeof params == 'object'){
		$.extend(paramObj, params);		//추가 파라미터 객체(params) 를 파라미터(paramObj)에 추가
	}
	
	
	//callback function
	var callback = function(result){ //SUCCESS FUNCTION
		var obj = JSON.parse(result);
		
		var cnt = obj.resultVal;	//결과수
		var list = obj.resultList;	//결과데이터JSON
	
		if(cnt>0){
			returnObj = list;
			if(emptyObj != null)
				returnObj.unshift(emptyObj);	//select 박스용 첫번째 공백값 추가
		}
	
	};
	//공통 ajax 호출 (Sync 로)
	commonAjaxForSync("POST", url, paramObj, callback);
	
	return returnObj;
}



/**
 * select tag creator
 * 
 * @param id			- id명 & name명
 * @param jsonObj		- data
 * @param code			- select 의 값코드문자열
 * @param name			- select 의 보여지는문자열
 * @param selectedVal	- 기본선택 option
 * @param changeFn		- change event handler function
 * @param colorObj		- {value : color, ...}
 * @param sWidth		- width
 * @param classNm		- style class
 * @returns {String}	- select tag string
 */
function createSelectTag(id, jsonObj, code, name, selectedVal, changeFn, colorObj, sWidth, classNm){
	
	//var selTag = '<select name="' + id + '" id="' + id + '" class="' + ((classNm==null)?'AXSelect':classNm) + '" onchange="' + changeFn + '" ';
	var selTag = "<select name='" + id + "' id='" + id + "' class='" + ((classNm==null)?"AXSelect":classNm) + "' onchange='" + changeFn + "' ";
	selTag += "style='background-color:" + (selectedVal==null?"white":colorObj[selectedVal]) + ";width:" + sWidth + "px;'>";
		
	for(var i=0; i<jsonObj.length; i++) {
		selTag += "<option value='" + jsonObj[i][code]  + "' " + (selectedVal==jsonObj[i][code]?"selected":"") + " "; 
		selTag += "style='background-color:" + (colorObj[jsonObj[i][code]]==null?"white":colorObj[jsonObj[i][code]]) + ";width:" + sWidth + "px;'";
		selTag += ">" + jsonObj[i][name] + "</option>";
    }    	
	selTag += "</select>";
	
	return selTag;
}



/**
 * radio tag creator
 * 
 * @param radioName		- radio name명
 * @param jsonObj		- data
 * @param code			- select 의 값코드문자열
 * @param name			- select 의 보여지는문자열
 * @param selectedVal	- 기본선택 option
 * @param gap			- 버튼 간격 px(공백문자 &nbsp; 제외)
 * @param brTagIdx		- <br>테그를 넣으려는 위치 index (라디오 버튼들이 두줄로 표현되는 경우 깨지는 것을 막기위해 추가)
 * @param clickHandlerFn- 클릭 이벤트 핸들러 함수
 * @param direction		- 정렬 방향 ('W'(가로) or 'H'(세로))
 
 * @returns {String}	- radio tag string
 */
function createRadioTag(radioName, jsonObj, code, name, checkedVal, gap, brTagIdx, clickHandlerFn, direction){
	var rdTag = '';
		
	/*for(var i=0; i<jsonObj.length; i++) {
		rdTag += "<label style='padding-left:" + gap + "px;'><input style='padding-right:5px;' type='radio' name='" + groupName + "' value='" + jsonObj[i][code]  + "' " + (checkedVal==jsonObj[i][code]?"checked":"") + " "; 
		rdTag += "/>" + jsonObj[i][name] + "</label>";
    }*/
	
	//간격을 추가로 주기
	var gapStyle = '';
	if(gap!=null && gap!=''){
		gapStyle = "style='padding-left:" + gap + "px;'";		//간격 스타일 넣기
	}
	if(brTagIdx==null || brTagIdx==''){
		brTagIdx = -1;
	}
	
	for(var i=0; i<jsonObj.length; i++) {
		rdTag += "<label " + (i==0||i==brTagIdx+1?'':gapStyle) + "><input type='radio' name='" + radioName + "' value='" + jsonObj[i][code]  + "' " + (checkedVal==jsonObj[i][code]?"checked":"") + " "; 
		
		//클릭 이벤트 핸들러 함수
		if(clickHandlerFn!=undefined && clickHandlerFn!=null && clickHandlerFn!=''){		//index 뒤에 '<br>' 추가
			rdTag += " onclick='" + clickHandlerFn + "'";
		}
		
		rdTag += "/>" + jsonObj[i][name] + "</label>";
		
		if(direction!=null && direction!='' && direction=='H'){
			rdTag += "<br>";
		}else
		//<br>테그 넣는 옵션이 있을시 추가
		if(brTagIdx!=null && brTagIdx!='' && brTagIdx==i ){		//index 뒤에 '<br>' 추가
			rdTag += "<br>";
		}
    }
	
	return rdTag;
}


//--------------------유저 선택 공통 팝업 호출

function userSelectPopCall(paramList){


	if($('#userSelectCheckPopFrm')!=undefined) $('#userSelectCheckPopFrm').remove();
	var url =contextRoot+"/common/selectUserCheckPopup.do";
	var str ='<form method="POST" name="userSelectCheckPopFrm" id="userSelectCheckPopFrm" action="'+url+'" target="userPop">';

	for(var i=0;i<paramList.length;i++){
		var paramObj = paramList[i];
		str +='<input type="hidden" name="'+paramObj.name+'" id="'+paramObj.name+'" value="'+ (paramObj.value.length == 0 ? '' : paramObj.value)+'"> ';
	}

	str +='</form>';

	$(document.body).append(str);


	var option = "left=" + (screen.width > 1400?"550":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=1000, height=800, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
	window.open('','userPop',option);
	//document.userSelectCheckPopFrm.action = url;
	//document.userSelectCheckPopFrm.target = "userPop";
	document.userSelectCheckPopFrm.submit(); // target에 쏜다.
	return false;

}


