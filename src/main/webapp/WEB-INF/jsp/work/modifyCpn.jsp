<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회사명 수정 - ${cpnNm}</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=2.1'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->


<script>

//저장
function doSave(){
	var cpnSnbInput = $('#cpn_snb');
	if(isEmpty(cpnSnbInput.val().trim())){
		alert('회사가 정상적으로 선택되지 않았습니다. 다시 시도해주시기 바랍니다.!');
		return;
	}
	
	var cpnNmInput = $('#cpn_nm');
	if(isEmpty(cpnNmInput.val().trim())){		//회사명 체크
		alert('회사명을 입력하시기 바랍니다!');
		cpnNmInput.focus();
		return;
	}
	
	if(!confirm('저장하시겠습니까?\n\n' + cpnNmInput.val())) return;
	
	var	param = {
				cpnSnb	: cpnSnbInput.val(),
				cpnNm	: cpnNmInput.val()
				};
	
	var	url = contextRoot + "/work/modifyCpnNm.do";
	
	var fn = function(arg){
		opener.location.reload();
		window.close();
	};
	
	commonAjax("POST", url, param, fn);
	    	 
}

</script>
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
	<section>
		<article>
			<table class="net_table_apply">
				<colgroup>
		          <col width="24%">
		          <col width="*">
       			</colgroup>
       			<tbody>
					<tr>
						<th scope="row"><span class="star">*</span>회사명</th>
						<td colspan="1">
							<input type="hidden" id="cpn_snb" class="applyinput_B w_st01" value="${cpnSnb}"/>
							<input type="text" id="cpn_nm" class="applyinput_B w_st01" value="${cpnNm}"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<p class="bsnsR_btn">
							<span class="btn s blue"><a href="javascript:doSave();">저장</a></span>
						</p>
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</section>
</body>
</html>