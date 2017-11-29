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
<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
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
	   padding: 10px;
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
	<input type="hidden" name="readN"		id="readN"/>
	<div class="SubTitle">
		${userLoginInfo.name} ${userLoginInfo.position}<br/>
		
	    (${userLoginInfo.hqName})<br/>
		이메일 : <a href="http://mail.synergynet.co.kr" target="_new">${userLoginInfo.email}</a><br/>
		핸드폰 : ${userLoginInfo.phn1}<p/>
	
	</div>

	<div class="checkArea"></div>
	
	</form>
</body>
</html>


<script>


var myGrid = new SGrid();					   // instance		new sjs


var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division ="${userLoginInfo.division}";
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

var g_cateList = [];

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	preloadCode: function(){
		
		
	},
	pageStart: function(){
	
		fnObj.getBoardCateList();
		//fnObj.getEmpList();
	},
	
	

	getBoardCateList : function(){
		

    	var url = contextRoot + "/board/getCateList.do";
    	var param = {GrpCd:$("#GrpCd").val()};
    
    	    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		g_cateList = list;
    		var str=" ";
    		if(list.length>0){
    			str+=' <div style="width: 94%;border:1px solid #969c9c;margin-top: 30px; border-radius: 3px;"> ';
    			str+=' <div style="font-weight:bold;background-color:#b1b1b1;padding: 3px;" onclick="fnObj.CateSel(\'\');" ><span style="margin-left:5px;">${GrpInfo.grpNm}</span></div>';
    			str+=' <div>';
    			str+=' <div style="padding: 3px;">';
    			for(var i=0 ; i<list.length ;i++){
    				
            		str += '<input type="radio" name="CateList" id="CateList'+i+'" value="'+list[i].catecd+'" onclick="fnObj.CateSel(this.value);">';
            		str += '<span id="span'+list[i].catecd+'" class="spanAll">';
            		str += '<label for="CateList'+i+'">'+list[i].catenm+'</label><span  style="color:#888888;size:8pt;cursor:pointer;margin-left:5px;" onclick="fnObj.CateNoReadSel('+i+','+list[i].catecd+');"><strong style="color:#1181f5;text-decoration:underline;">'+list[i].noReadCnt+'</strong></span>';
            		
            		if(list[i].boardcnt >list[i].readcnt ){
            			str+='<img src="<c:url value='/images/sp/icon_new.gif'/>" width="13" height="10" style="margin-left:5px;">';
            		}
            		str+='</span><br/>';
            	}
    			str+='</div></div>';
    		}
        	
        
    		$(".checkArea").html(str);
    		
    	};
    	commonAjax("POST", url, param, callback, true, null, null);
	
	},
	
	CateNoReadSel : function(CateNum,CateCd) {
		$('#CateList'+CateNum).prop('checked',true);
		$('#CateCd').val($('#CateList'+CateNum).val());
		$('#readN').val('Y');
		$('#myInfo').attr('target', 'mainFrame').attr('action', "<c:url value='/BoardList.do'/>").submit();
		
		for(var i=0;i<g_cateList.length;i++){
			$('#span'+g_cateList[i].catecd).attr('style', 'background-color:#FFFFFF;');
		}
		//$('#span'+CateCd).attr('style', 'font-weight:bold;background-color:#c7fffe;padding: 3px 2px 2px 1px;');
	},
	
	CateSel : function (CateCd) {
		$('#CateCd').val(CateCd);
		$('#readN').val('');
		$('#myInfo').attr('target', 'mainFrame').attr('action', "<c:url value='/BoardList.do'/>").submit();
		
		for(var i=0;i<g_cateList.length;i++){
			$('#span'+g_cateList[i].catecd).attr('style', 'background-color:#FFFFFF;');
		}
		$('#span'+CateCd).attr('style', 'font-weight:bold;background-color:#c7fffe;padding: 3px 2px 2px 1px;');
		
	}
	
	
};
 
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();		//화면세팅

});

 
 
</script>