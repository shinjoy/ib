<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stock.js'/>" ></script>
<script type="text/JavaScript">

function resize_iframe(){
	var height = document.documentElement.clientHeight || window.innerHeight || document.body.clientHeight;
	var stockCstFrame = document.getElementById("stockCstFrame").offsetTop;
	document.getElementById("staffName").style.height=parseInt(height-stockCstFrame-50)+"px";
	document.getElementById("stockFirmIBs").style.height=parseInt(height-stockCstFrame-50)+"px";
	document.getElementById("stockCstFrame").style.height=parseInt(height-stockCstFrame-50)+"px";
}

window.onresize=resize_iframe;

function insertStockFirmIbYN(){
	return "Y";
}

</script>
</head>
<body onload="resize_iframe();">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	<header>
	</header>
	<section>
		<article>
			<table class="t_skin04">
				<thead>
					<tr>
						<th class="cent bgYlw" style="width:140px;"><b>증권사</b></th>
						<th class="cent bgYlw" style="width:150px;"><b>IB 담당자</b></th>
						<th class="cent bgYlw"><b>인물정보</b></th>
					</tr>
				</thead>
				<tbody>
					<tr style="vertical-align:top;">
						<td>
							<div id="staffName" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;">
								<table class="t_skin04_cstNcpn"><c:forEach var="cpn" items="${companyList}">
									<tr class="link LK1st" onclick="selectStockFirmIb('${cpn.cpnNm }',this);resize_iframe();"><td style="padding:5px 7px;width:113px;">
										${cpn.cpnNm }
									</td></tr></c:forEach>
								</table>
							</div>
						</td>
						<td>
							<div id="stockFirmIBs" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;"></div>
						</td>
						<td>
							<iframe style="width:100%;height:500px;" id="stockCstFrame" name="stockCstFrame" src="<c:url value='/person/index.do'/>" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</section>

</body>
</html>