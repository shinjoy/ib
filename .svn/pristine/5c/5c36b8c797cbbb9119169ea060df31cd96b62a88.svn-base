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

	$(document).ready(function (){
			
			if('${uploadType}' == 'stock') $("#uploadTitle").html(" *주식 시가 일괄 등록"); 
			else $("#uploadTitle").html(" *회사 기본 정보 일괄 등록");  
			
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
 
	
	
	//파일 업로드시 확장자 체크
	function CheckFile(ObjNm, File) {
		flag = false;
		if(!File) return;
		while(File.indexOf("\\") != -1)
		File = File.slice(File.indexOf("\\") + 1);
		ext = File.slice(File.indexOf(".")).toLowerCase();
	
		if(ext == ".csv") flag = true;
		else {
			ext = File.substring(File.length-4).toLowerCase();
			if(ext == ".csv") flag = true;
		}
	
		if(flag == false) {
			alert(File + " 파일은 등록 불가능한 파일입니다. 파일을 다시 선택하십시오.");
			$('#'+ObjNm+'').val('');
			return false;
		}
	}

 
 
	//일괄 업로드
	function doUpload() {
		
		if($('#fileUrl').val() == '') {
			alert('파일선택을 하시기 바랍니다!');
			return false;
		}
		
		if('${uploadType}' == 'stock') $('#fileForm').attr('action', "<c:url value='/company/stockPriceAddEnd.do'/>").submit();
		else $('#fileForm').attr('action', "<c:url value='/company/companyInfoAddEnd.do'/>").submit();
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
		<article><strong id="uploadTitle" style="margin-top:10px;"></strong>
			<table class="t_skin03" style="width:300px;margin-top:20px;">
				<tr>
					<td>
						<input type="file" name="fileUrl" id="fileUrl" style="height:23px;font-size:13px;border:0px;" onchange="CheckFile(this.name, this.value);"/>
					</td>
				</tr>
			
				<tr>
					<td class="cent">
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