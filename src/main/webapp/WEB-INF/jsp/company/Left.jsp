<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.1'/>" ></script>
<script>
function linkPage(pageNo){
	$("#pageIndex").val(pageNo);
	document.searchCpn.submit();
	//location.href = "<c:url value='/company/selectLeft.do'/>?pageIndex="+pageNo+"&cpnNm="+str;
	//location.href = "<c:url value='/company/searchName.do'/>?pageIndex="+pageNo+"&cpnNm="+$("#nameSearch").val();
}
	var db ="";
	
	function trick(){
		if(db !=$("#nameSearch").val()){
			mozilaAjax();
			db = $("#nameSearch").val()
		}
		setTimeout("trick()", 10);
	}
$(document).ready(function(){
	//trick();
	//$("tr:even").css("background-color", "#E0F8F7");
	$("#nameSearch").focus();
	//document.getElementById('nameSearch').focus();
	
 });
 
function ajaxSearching(){
	var url = 'ajaxSearchName.do'
		,data = { 
			pageIndex: $('#pageIndex').val()
			,cpnNm: $('#nameSearch').val()
		},fn = function(arg){
		console.log(arg.length);
		if(arg.length>800) $('#icd').html(arg);
	};
	ajaxModule(data,url,fn);
}

//회사 업로드 (CSV)
function uploadCompanyByCsv(){
	var frm = document.getElementById('rgstCpnNm');//sender form id
	frm.action = "../company/uploadCompanyByCsv.do";
	frm.target = "mainFrame";//target frame name
	frm.submit();
}

//시가등록 및 회사(상장)
function uploadStockCompany(type){
	$("#uploadType").val(type);
	var frm = document.getElementById('stockCompanyFrm');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}


</script>

</head>
<body>
<%-- 	
	<header>
		<h2 id="name">이름: ${userLoginInfo.name}</h2>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;IP: ${userLoginInfo.ip}
			<br/>Date: ${userLoginInfo.loginDt}
		</h4>
	</header>
 --%>
	<section>
		<article>
			<form name="searchCpn" action="<c:url value='/company/searchName.do' />" method="post">
			<div style="margin:4px 9px;">
				<input type="hidden" id="idchk_commit" value="">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				<input class="nameSearch textSearch" type="search" id="nameSearch" name="cpnNm" onkeyup="javascript:ajaxSearching();" placeholder="법인명/코드" autofocus="autofocus" value="${searchName}" style="ime-mode:active;">
				<input class="btnSearch" type="submit" value="검색">
			</div>
			</form>
			<div id="icd"><%@include file="../includeJSP/CpnLeft.jsp" %></div>
		</article>
	</section>
</body>
</html>