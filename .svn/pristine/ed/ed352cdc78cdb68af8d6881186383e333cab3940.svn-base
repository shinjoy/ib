<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js'/>" ></script>
<style>
section{font-size:12px;} 
th{height:25px;border-top:1px solid grey;border-bottom:1px solid grey;}
tbody tr:hover{background-color:lavenderblush !important;} 
tbody td{border-bottom:1px solid lightgrey;margin:0px;}

body section a{
	font-family:"돋움", "Dotum", "굴림", "Gulim"!important;	
}

</style>
<script>
function linkPage(pageNo){
	$("#pageIndex").val(pageNo);
	document.slctIdx.submit();
}
function deleteFileInfo(snb){
	if(confirm("삭제하시겠습니까?")){
		var DATA = ({sNb:snb});
		var url = "../control/deleteFileInfo.do";
		var fn = function(){
			document.slctIdx.action = "mainFile.do";
			document.slctIdx.submit();
		};
		ajaxModule(DATA,url,fn);
	}
}
$(document).ready(function(){
	//parent.reloadpage();
	//$('th').css({'height':'25px','border-top':'1px solid grey','border-bottom':'1px solid grey','background-color':'#E0F8F7'});
	//$('tbody td').css({'border-bottom':'1px solid lightgrey','margin':'0px'});
});

</script>
</head>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<body>

<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/basic/filesUpload.do' />" method="post" encType="multipart/form-data">
	<input type="hidden" id="m_categoryCd" name="categoryCd" value="00000">
	<input type="hidden" id="m_offerSnb" name="offerSnb">
	<input type="hidden" id="m_rtn" name="rtn" value="control/mainFile">
	<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">
</form>

<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<div style="float:left;padding-left:10px;vertical-align:middle;">
	<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../images/file/fileDisk.png' />" align="absmiddle">File</a>
	<span id="uploadsubmitbtn" style="display:none;"><a class="btn glass s bold" href="javascript:saveComment('','0')">업로드</a></span>
	<div><table id="file_list"></table></div>
</div>
<div style="float:left;padding-left:10px;vertical-aligh:middle;">
	<form name="slctIdx" action="<c:url value='/control/mainFile.do' />" method="post">
		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
		<input type="search" class="textSearch" id="nameSearch" name="realName" placeholder="파일명" autofocus="autofocus" value="${searchName}"><input type="submit" class="btnSearch" style="height:27px;" value="검색">
	</form>
</div>
<div class="clear"></div>
	<section>
		<article style="height:470px">
		<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
		<table class="t_skinR00" style="width:98%;"><thead>
			<tr>
				<th class="cent bgYlw">파일명</th>
				<th class="cent bgYlw" style="width:120px">등록일</th>
				<th class="cent bgYlw" style="width:70px">등록자</th>
			</tr></thead>
			<tbody>
			<c:forEach var="f" items="${fileList}" varStatus="d">			
				<c:choose>
				<c:when test="${f.privateYn eq 'Y'}">
				<%-- 비밀메모 의 첨부파일은 안보이도록 --%>
				</c:when>
				<c:otherwise>			
				<tr>
					<td style="<c:if test="${f.offerSnb != 0}">color:navy;</c:if>padding-left:10px;">
						<c:set var="extension" value="${fn:split(f.realName,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosition" id="file${d.count }"<c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="다운로드">
						
						<%-- 입력한 당일만 삭제 가능하게 작업 --%>
						<fmt:formatDate var="cur_day" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/><fmt:parseDate var="parseDate" value="${f.rgDt}" pattern="yyyy-MM-dd" scope="page"/><fmt:formatDate var="rgDate" value="${parseDate}" pattern="yyyy-MM-dd"/>
						
						<span class="filePosition" id="titlefile${d.count }"><a><c:if test="${not empty f.cpnNm}">${f.cpnNm} - </c:if>${f.realName}</a></span> <c:if test="${(userLoginInfo.id == f.rgId) and (cur_day == rgDate)}"><span class="hand" onclick="javascript:deleteFileInfo('${f.sNb }')"><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제" align="absmiddle"/></span></c:if>
						<input type="hidden" id="mkNames${d.count }" value="${f.makeName}"/></td>
					<td class="cent">${fn:substring(f.rgDt,0,16)}</td>
					<td class="cent">${f.usrNm}</td>
					
				</tr>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			</tbody>
		</table>
		</article>
			
		<c:if test="${not empty fileList }">
		<div align="center">
			<ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" />
		</div>
		</c:if>
	</section>
</body>
</html>