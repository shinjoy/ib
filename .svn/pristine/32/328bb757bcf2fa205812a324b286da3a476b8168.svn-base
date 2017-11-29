<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js'/>" ></script><!-- 20160108 -->

<style>
.tr_selected {
	background:#ffbbbb!important;
	font-weight:bold;
}
</style>

<script>
function linkPage(pageNo){
	//location.href = "<c:url value='/person/selectLeft.do'/>?pageIndex="+pageNo;
	$("#pageIndex").val(pageNo);
	document.searchCst.submit();
}	

var db ="";
function trick(){
	if(db !=$("#nameSearch").val()){
		mozilaAjax();
		db = $("#nameSearch").val();
	}
	setTimeout("trick()", 10);
}

//인물등록하기
function rgstCst(cnt){
	if(cnt==0) cnt='';
	$('#s_Name').val($('#nameSearch').val()+cnt);
	$('#s_Name2').val($('#nameSearch').val()+cnt);
	var frm = document.getElementById('rgstCstNm');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}

function ajaxSearching(e){
	
	if(e.keyCode == 13){		//엔터키
		if($('.tr_selected').length > 0)
			$($('.tr_selected')[0]).trigger('click');
	}
	
	//위,아래 방향키를 통해 검색결과 선택		20160627
	if(e.keyCode == 38 || e.keyCode == 40){		//38 위로, 40 아래로 (방향키)
		var list = $('tr[name^=result_searched]');
		if(list.length > 0){
			var sel = $('.tr_selected');
			if(sel.length == 0){
				$(list[0]).addClass('tr_selected');
			}else{
				var tmp = '';
				
				var rIdx = ( 1 * ($(sel.get(0)).attr('name').substring(15)) - 1);		//선택된 현재 row index				
				if(e.keyCode == 38){	// 38 위로
					if(rIdx - 1 < 0) rIdx = list.length -1;
					else rIdx --;
				}else{					//e.keyCode == 40 아래로
					if(rIdx + 1 == list.length) rIdx = 0;
					else rIdx ++;
				}
				
				list.removeClass('tr_selected');
				$(list[rIdx]).addClass('tr_selected');				
			}
		}
		return;
	}
		
	var url = 'ajaxSearchName.do'
		,data = { 
			pageIndex: $('#pageIndex').val()
			,cstNm: $('#nameSearch').val()
			,cstNmKor: engTypeToKor($('#nameSearch').val())
		},fn = function(arg){
		console.log(arg.length);
		//if(arg.length>1500) 
			$('#icd').html(arg);
		
		
		//검색결과가 1건이면 자동 선택되도록 :S ----------	20160627
		var list = $('tr[name^=result_searched]');
		if(list.length == 1)
			list.addClass('tr_selected');
		//검색결과가 1건이면 자동 선택되도록 :E ----------
		
		
	};
	ajaxModule(data,url,fn);
}

$(document).ready(function(){
	
	if('<c:out value='${saveCnt}'/>' > 0 ) {	
		location.href ="<c:url value='/person/selectLeft.do'/>";
	}
	
	$("#nameSearch").focus();
	
 });
 
 
</script>
</head>
<body>

	<section>
		<article>
			<form name="searchCst" action="<c:url value='/person/searchName.do' />" method="post" onkeypress="return event.keyCode != 13;" >
			<div style="margin:4px 9px;">
				<input type="hidden" id="idchk_commit" value="">
				<input type="hidden" id="pageIndex" name="pageIndex" value="1">
				<%-- <select name="sort_t" style="height:23px;">
					<option value="0" <c:if test="${sortTitle==0}">selected</c:if>>이름</option>
					<option value="1" <c:if test="${sortTitle==1}">selected</c:if>>회사</option>
				</select> --%>
				
				<input type="hidden" id="cstNmKor" name="cstNmKor" value="DONTTOUCH"><!-- 검색기능의 default value 쿼리의 or 조건(cstNmKor) -->
				
				<input class="nameSearch textSearch" type="search" id="nameSearch" name="cstNm" onkeyup="javascript:ajaxSearching(event);" placeholder="이름/회사" autofocus="autofocus" value="${searchName}" style="ime-mode:active;">
				<input class="btnSearch" style="cursor:pointer;" onclick="ajaxSearching(event);" type="button" value="검색">
			</div>
			</form>
			<div id="icd"><%@include file="../includeJSP/CstLeft.jsp" %></div>
		</article>
	</section>
</body>
</html>