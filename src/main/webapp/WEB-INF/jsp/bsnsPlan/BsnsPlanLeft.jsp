<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Left</title>
<link href="<c:url value='/css/leftMenu.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
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

</head>
<body>
	<form id="staffName" name="cName" method="post" action="<c:url value='/bsnsPlan/viewIndex.do' />">
		<input type="hidden" id="s_Name" name="staffNm">
		<input type="hidden" id="s_Id" name="rgId">
		<input type="hidden" id="s_year" name="choice_year">
	</form>
<%-- 	
	<header>
		<h2 id="login_name">이름: ${userLoginInfo.name}</h2>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;IP: ${userLoginInfo.ip}
			<br/>Date: ${userLoginInfo.loginDt}
		</h4>
	</header>
 --%>
	<section>
		<article>
		<div id="menubody">
		<br/>
		<ul class="dual">
				<li>업무목표</li>
				<br/>
			<div id="divisionDiv"></div>
		</ul>
		
		</div>
		</article>
	</section>
</div>
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
			if(divisionList[i].divCode=="SYNERGY"){ //일단 FIDES 는 사용하지않으니 SYNERGY만, 추후 사용할시 if문만 빼주면 됨.
			 	var str="";
			 	str='<div id="userListDiv'+divisionList[i].divCode+'"></div>'
			 	$("#divisionDiv").append(str);
			 	fnObj.getUserList(divisionList[i].divCode,divisionList[i].divName,divisionList.length); 
			}
		 }
	},

	getUserList : function(divCode,divName,count){
		

    	var url = contextRoot + "/work/selectuserList.do";
    	var param = {division : divCode};
    
    	    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    	
    		
    		
    		if(list.length>0){
    			var str='<li>'; 
    			for(var i=0 ; i<list.length ;i++){
	    			str+=' <a onclick="fnObj.sortUser(this,\''+list[i].usrNm+'\',\''+list[i].usrId+'\');">'+list[i].usrNm+'</a> ';
		    		if(i%2 ==1 ){
		            	str+="</li><li>";
		            }
    			}
    			if(count>1){
    				str='<li>'+divName+'</li>'+str;
    			}
    			$("#userListDiv"+divCode).html(str);
    		}
        
        
		
    	};
    	commonAjax("POST", url, param, callback, true, null, null);
	
	},

	 sortUser : function(th,staffName,staffId){
		var obj = $(th);
		$('li .bgOrg').removeClass('bgOrg');
		$('#s_Name').val(staffName);
		$('#s_Id').val(staffId);
		obj.addClass('bgOrg');
		
		//var mainIframeYear = parent.mainFrame.choice_year;
		//$("#s_year").val(mainIframeYear==null?'':mainIframeYear.value);
		var mainIframeMon = $('#mainFrame',window.parent.document).contents().find('#choice_month').val();
		var mainIframeYear = $('#mainFrame',window.parent.document).contents().find('#choice_year').val();
		$("#s_mon").val(mainIframeMon);
		$("#s_year").val(mainIframeYear);
		var frm = document.getElementById('staffName');//sender form id
		frm.target = "mainFrame";//target frame name
		frm.submit();
	}

	
	
	
};
 
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();		//화면세팅

});
 
</script>