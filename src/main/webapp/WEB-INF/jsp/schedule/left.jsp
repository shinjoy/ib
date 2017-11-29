<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일정</title>

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>



<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->



<style>
/* 서브타이틀 */
.SubTitle {
	   font-weight:bold;
	   font-size:13px;
	   padding:30px 12px;
   }
						
.* {
	   font-size:12pt;
   }
			
body {
	font-family:맑은 고딕;
	font-size:10pt;
	margin:0px;
	padding:0px;
	scrollbar-base-color: #C0C0C0;
	scrollbar-base-color: #C0C0C0;
	scrollbar-3dlight-color: #C0C0C0;
	scrollbar-highlight-color: #C0C0C0;
	scrollbar-track-color: #EBEBEB;
	scrollbar-face-color:#c4ccd5;
	scrollbar-arrow-color:#5c87bd;
	scrollbar-shadow-color: #C0C0C0;
	scrollbar-dark-shadow-color: #C0C0C0;
}
.checkArea {
	padding: 5px;
}
   
.checkInput {
	padding: 0px;
}

.divDv{
	padding-left:15px;
}

</style>

</head>
<body>
	<form name="myInfo" id="myInfo" method="post">
	<input type="hidden" name="PerSabun"	id="PerSabun"		value="${userLoginInfo.sabun}"/>
	<input type="hidden" name="GrpCd"		id="GrpCd"			value="${boardVO.grpCd}"/>
	<input type="hidden" name="CateCd"		id="CateCd"/>
	<input type="hidden" name="RegPerSabun"	id="RegPerSabun"	value="${userLoginInfo.sabun}"/>
	<input type="hidden" name="Parent"		id="Parent"/>
	<div class="SubTitle" style="padding: 10px 5px 10px 12px; font-family:맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;!important; background:#f0ffff;">
		<font color=silver style="font-size:11px;">이름 :</font> ${userLoginInfo.name} <font style="font-size:11px;">${userLoginInfo.position}<br/>		
	    <!-- (${userLoginInfo.hqName})<br/> -->
	    <font color=silver>사번 :</font> ${userLoginInfo.sabun}<br/>
		<font color=silver>전화 :</font> ${userLoginInfo.phn1}<br/>
		<font color=silver>메일 :</font> <a href="http://mail.synergynet.co.kr" target="_new">${userLoginInfo.email}</a></font>
		<%-- <c:if test="${vo.fileUpNm != null && vo.fileUpNm ne ''}">
			<a href="javascript:EmployeeCardFileDown('${vo.perSabun}', '${vo.fileSeq}');">
			<img src="<c:url value='/DATA/Employee/Card/${vo.fileUpNm}'/>" style="max-height:150px;width:250px;vertical-align:middle;border:0px;"></a>
		</c:if> --%>
	</div>
	<c:if test="${type eq 'schedule'}">
		<div id="divisionDiv" style="padding-top:15px;"></div>	
	</c:if>
	</form>
</body>
</html>


<script>


var myGrid = new SGrid();					   // instance		new sjs


var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division ="${userLoginInfo.division}";
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	preloadCode: function(){
		
	},
	pageStart: function(){
		var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
    	$("#divisionDiv").empty();
    	for(var i=0;i<divisionList.length;i++){
    		var str="";
    		str='<div id="checkArea_'+divisionList[i].divCode+'" class="divDv"></div>'
    		$("#divisionDiv").append(str+"<br/>");
    		fnObj.getUserList(divisionList[i].divCode,divisionList[i].divName); 
    	}
	},

	
	//------------------------------------------------- SYNERGY :S ----------------------------------------------------
	
	
	getUserList : function(divCode,divName){
		

    	var url = contextRoot + "/work/selectuserList.do";
    	var param = {division : divCode};
    
    	    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		
    		
    		if(list.length>0){
    			var str=' <span class="checkInput"> ';
    			str+='<label><input type="checkbox" name="Per'+divCode+'" id="Per'+divCode+'" onclick="fnObj.SelAll(this.name,\''+divCode+'\');">';
    			str+=' <b>전체 ('+divName+')</b></label><br/>';
    			str+=' </span>';
    			for(var i=0 ; i<list.length ;i++){
    				var ckeckchk="";
    	    		var stylechk="";
    				if(list[i].sabun=="${userLoginInfo.sabun}"){
    					ckeckchk=' checked="checked"';
    					stylechk = ' style="background-color:#FEFFD5;font-weight:bold;"';
            		}
            		str += '<span class="checkInput">';
            		str += '<label><input type="checkbox" name="Per'+divCode+'Ary" id="Per'+divCode+'Ary'+i+'" value="'+list[i].sabun+'" '+ckeckchk+' onclick="fnObj.PerSel('+i+', this.value,\''+divCode+'\');">';
            		str += '<span id="span'+list[i].sabun+'" '+stylechk+'>';
            		
            		str += '<span style="display:inline-block;width:55px;"><font color="black"> '+list[i].usrNm+'</font></span></label>';
            		str += '</span>';
            		
            		str+='</span>';
            		if(i%2 == 1 ){
            			str+="<br/>";
            		}
            	}
    			str+='</li>';
    		}
        	
        
    		$("#checkArea_"+divCode).html(str);
    		
    	};
    	commonAjax("POST", url, param, callback, true, null, null);
	
	},
	
	//직원체크 클릭
	PerSel  :function(idx, PerSabun,divCode) {
		var SearchPerSabun = '', Con = '';
	
		Con = parent.mainFrame.ScheduleCal;
		Con.action = "<c:url value='/ScheduleCal.do'/>";
		
		if($('#ScheGubun', Con).val() != 'All') $('#ScheGubun', Con).val('All');
		if($('#SearchPerSabun', Con).val() == '') SearchPerSabun = $('#PerSabun', Con).val();
		else SearchPerSabun = $('#SearchPerSabun', Con).val();
		if(SearchPerSabun == ",") SearchPerSabun = "";
		
		if($('#Per'+divCode+'Ary'+idx).is(":checked")) {
			SearchPerSabun = SearchPerSabun + " " + PerSabun;
			$('#span'+PerSabun).attr('style', 'background-color:#FEFFD5;font-weight:bold;');
		}
		else {
			SearchPerSabun = SearchPerSabun.replace(PerSabun, "").replace("  ", " ");
			$('#span'+PerSabun).attr('style', '');
		}
		if(SearchPerSabun == "") SearchPerSabun = ",";
		$('#SearchPerSabun', Con).val(SearchPerSabun);
		Con.target = "mainFrame";
		Con.submit();
		
	},
	
	
	SelAll : function(Obj,divCode) {
		var All = $('#'+Obj+'');
		var ChkList = $('input[name='+Obj+'Ary]');
		
		
		var Con = '';
		
		//if($('#Parent').val() == "ScheduleCal") {
			Con = parent.mainFrame.ScheduleCal;
			Con.action = "<c:url value='/ScheduleCal.do'/>";
		//}
		//else {
		//	Con = parent.mainFrame.ScheduleList;
		//	Con.action = "<c:url value='/ScheduleList.do'/>";
		//}
		
		var SearchPerSabun = $('#SearchPerSabun', Con).val();		//$('#PerSabun').val(), 
		
		
		if($('#ScheGubun', Con).val() != 'All') $('#ScheGubun', Con).val('All');

		if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
			for(var i = 0; i <= ChkList.length - 1; i++) {// 모든 체크박스를 체크해제
				//if('${loginVO.regPerSabun}' != ChkList[i].value) {
					ChkList[i].checked = false;
					SearchPerSabun = SearchPerSabun.replace(ChkList[i].value, "").replace("  ", " ");
					$('#span'+ChkList[i].value).attr('style', '');
				//}
			}
		}
		else { // 그게 아니라면
			for(var i = 0; i <= ChkList.length - 1; i++) {
				//if('${loginVO.regPerSabun}' != ChkList[i].value) {
					ChkList[i].checked = true;// 모든 체크박스를 체크
					SearchPerSabun += " " + ChkList[i].value;
					$('#span'+ChkList[i].value).attr('style', 'background-color:#FEFFD5;font-weight:bold;');
				//}
			}
		}
		$('#SearchPerSabun', Con).val(SearchPerSabun);
		Con.target = "mainFrame";
		Con.submit();
	},
};
 
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();		//화면세팅

});

 
 
</script>