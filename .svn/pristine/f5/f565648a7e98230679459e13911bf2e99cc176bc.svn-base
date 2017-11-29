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
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=3.1'/>" ></script>
<style>input[type="radio"]{margin: -1px 2px 0 0 !important;}</style>
</head>
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
	
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<form id="companyName" name="companyName" action="<c:url value='/company/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="cpnId">
</form>
<form id="companyLeft" name="companyLeft" action="<c:url value='/company/selectLeft.do' />" method="post"></form>
	<header>
	</header>
	<section>
		<article>
			<table class="t_skin03">
				<tr>
					<td colspan="2">
						<label for="offerListed"><input type="radio" name="rdo_offer" id="offerListed">상장</label>
						<label for="offerNlisted"><input type="radio" name="rdo_offer" id="offerNlisted" checked="checked">비상장</label>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">코드</th>
					<td>
						<span id="cpn__id">${maxSeq}</span>
						<span id="cpn__idA" style="display:none;">${maxASeq}
							<font color="gray">(임의 상장코드)</font></span>
						<!-- <input class="intNum" type="text" id="cpn_id" style="display:none;" maxlength="6"/> -->
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">회사명 <font style="color:red;font-weight:bold">*</font></th>
					<td colspan="1">
						<input class="regist" type="text" id="cpn_nm" value="${cpnNm}" />
					</td>
				</tr>
				<%-- <tr>
					<th class="tbColor inputLine">대표이사</th>
					<td>
						<input type="hidden" id="AP_cstId_0" value="${workVO.cstId }"/>
						<a onclick="popUp('_0','p')" id="AP_cstNm_0" class="c_title" title="이름">이름선택</a>
					</td>
				</tr> --%>
			
				<tr>
					<td colspan="4">
					<p class="bsnsR_btn">
						<span class="newCpn_btnOk btn s green"><a>저장</a></span>
					</p>
					</td>
				</tr>

			</table>
		</article>
	</section>
</body>
</html>