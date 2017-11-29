<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<script>

	$(document).ready(
		function (){
			if('<c:out value='${upload}'/>' > '0' ) {
				//window.returnValue=rVal;
				alert("SUCCESS!");
				window.close();
			}
			
			if('<c:out value='${upload}'/>' == '0' ) {
				alert("FAIL!!\n\n${failMsg}");
				window.close();
			}
		}
	);
	/* ${message} */
 
 
 
	//일괄 업로드
	function doUpload() {
		if($('#fileUrl').val() == '') {
			alert('파일선택을 하시기 바랍니다!');
			return false;
		}
		
		$('#fileForm').attr('action', "<c:url value='/company/uploadCompanyProcess.do'/>").submit();
	}
 
 
</script>
 <base target="_self">
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<form id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
	<header>
	</header>
	<section style="margin:5px;">
		<article>
			<table class="t_skin03" style="width:820px;">
				<tr>
					<td colspan=2><b><ul>
						<li>CSV 형식 파일</li>
						<li><font color="blue"><b>줄 2번 부터 DB에 입력됩니다.</b></font></li>						
						<li><b>DATA가 없는 열은 <font color="red">'삭제'</font>하십시오.</b></li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						*참조: CSV 파일을 엑셀로 열었을때 모습 ... <font color=red>반드시 <b>CSV</b> 파일로 저장해서 업로드!!</font>
						<br/><br/>   
						<b>법인코드, 법인명, 업종, 상장일자, 주요품목</b><br/>
						<img src="<c:url value='/images/info/cpnUpCsv.png' />" alt="help upload"  style="" border="0">
					</td>
				</tr>
				<tr>
					<td align="center">회사정보파일</td>
					<td>
						<input type="file" name="fileUrl" id="fileUrl" style="height:23px;font-size:13px;border:0px;" />
					</td>
				</tr>
			
				<tr>
					<td colspan=2 class="cent">
					<span class="bsnsR_btn btn s green">
						<input type="button" value=" 일괄 업로드 " onclick="doUpload();">
					</span>
					</td>
				</tr>

			</table>
		</article>
	</section>
</form>
</body>
</html>