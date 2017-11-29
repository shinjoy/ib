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
		if('<c:out value='${upload}'/>' > 0 ) {
			//window.returnValue=rVal;
			alert("등록되었습니다.");
			window.close();
		}
	});
/* ${message} */
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
<form id="fileForm" name="fileForm" action="<c:url value='/person/ExcelProcess.do' />" method="post" enctype="multipart/form-data">
	<header>
	</header>
	<section>
		<article>
			<table class="t_skin03">
				<tr>
					<td colspan=2>
					<ul>
						<li>업로드 하실 엑셀 파일을</li>
						<li><font color="blue">통합문서</font>나 <font color="blue">97-2003 통합문서</font>로 저장 하신 후 업로드 하여 주세요.</li>
						<li><font color="red">아래 사진과 같은 양식으로 작성해 주세요.</font></li> 
						<li><font color="red"><b>줄 2번 부터 DB에 입력됩니다.</b></font></li>
					</ul>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<img src="<c:url value='/images/personUpload.GIF' />" alt="help upload"  style="width:100%" border="0">
					</td>
				</tr>
				<tr>
					<td class="">PERSON 업로드</td>
					<td>
						<input type="file" name="fileUrl" style="height: 20px;" size="15"  class="fc" />
					</td>
				</tr>
			
				<tr>
					<td colspan=2 class="cent">
					<p class="bsnsR_btn btn s green">
						<input type="submit" value="저장">
					</p>
					</td>
				</tr>

			</table>
		</article>
	</section>
</form>
</body>
</html>