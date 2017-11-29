<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javaScript">
	
	top.document.title = "일정리스트";
	
	$(document).ready(function () {
		$(window).load(function() {
			$('#SelView', parent.document).height(document.body.scrollHeight);
			if($('#OrderKey').val() != '') ListOrderTitleSet();
		
		});
	});
	
	// 일정 보기
	function ScheView(ScheSeq) {
		
		//_parent.window.location="${pageContext.request.contextPath}/MbScheduleView.do?ScheSeq="+ScheSeq;
		
		 $('#ScheSeq').val(ScheSeq);
		$('#SelDateScheList').attr('target', "_parent")
		$('#SelDateScheList').attr("action", "<c:url value='/MbScheduleView.do'/>").submit(); 
		//$('#SelDateScheList').attr("action", "<c:url value='/MbScheduleCalajax.do'/>").submit(); 
	}
	
</script>
	
<body>
	
	<section data-role="page">
	<div data-role="content" style="padding:15px 3px 0px 3px;">
	<form name="SelDateScheList" id="SelDateScheList" action="" method="post">
	<input type="hidden" name="ScheSeq"			id="ScheSeq"/>
	<input type="hidden" name="DocType"			id="DocType"		value="New"/>
	<input type="hidden" name="SearchPerSabun"	id="SearchPerSabun"	value="${vo.searchPerSabun}"/>
		<div style="width:99%;height:25px;text-align:center;border-bottom:2px solid;">${vo.scheSDate}</div><div style="height:5px;"></div>
		<c:choose>
			<c:when test="${fn:length(SelDateList) eq 0}">
				<div style="width:99%;text-align:center;">등록된 일정이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="result" items="${SelDateList}" varStatus="status">
					<c:choose>
						<c:when test="${result.scheimportant eq 'top'}">
							<c:set var="DivSet" value="style='color:#FF0080;width:98%;line-height:25px;border-bottom:1px solid #00D9D9;font-size:9pt;'"/>
						</c:when>
						<c:otherwise>
							<c:set var="DivSet" value="style='color:#000000;width:98%;line-height:25px;border-bottom:1px solid #00D9D9;font-size:9pt;'"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${result.mysche eq 'My' || result.mysche eq 'MyEntry'}">
							<c:set var="SpanSet" value="style='background:#FF6060;color:white;text-shadow:none;font-size:11px;display:inline-block;width:35px;text-align:center;'"/>
						</c:when>
						<c:otherwise>
							<c:set var="SpanSet" value="style='background:#D7FFFF;font-size:11px;display:inline-block;width:35px;text-align:center;'"/>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${status.count eq 1}"><c:set var="TdT" value="input_T"/></c:when>
						<c:otherwise><c:set var="TdT" value=""/></c:otherwise>
					</c:choose>
					<%--
					<div class="Click" ${DivSet} onclick="ScheView('${result.scheseq}');">		<!-- class="Text_Cut Click" 20160211 -->
						<span ${SpanSet}>
						<c:choose>
							<c:when test="${result.viewtime eq 'A'}">종일</c:when>
							<c:otherwise>${result.viewtime}</c:otherwise>
						</c:choose>
						</span> ${result.regpernm} - ${result.schetitle}
					</div>
					 --%>
					
					<div class="Click" ${DivSet} onclick="ScheView('${result.scheseq}');">		<!-- class="Text_Cut Click" 20160211 -->
						<table><tr style="vertical-align:top;"><td>
						<span ${SpanSet}>
						<c:choose>
							<c:when test="${result.viewtime eq 'A'}">종일</c:when>
							<c:otherwise>${result.viewtime}</c:otherwise>
						</c:choose>
						</span></td>
						<td width="40" style="font-weight:bold;font-size:11px;">${result.regpernm}</td>
						
						<td>
							<script>
							var reTitle = '${result.schetitle}';
							reTitle = reTitle.replace(/\s\|A?[0-9]+\|/gi, '');	//회사코드 제거
							reTitle = reTitle.replace(/\s\([0-9]+\)/gi, ' ');		//인물id sequence 제거
							reTitle = reTitle.replace(/\/\sM&A\s\//gi, '<span style="font-size:11px;font-weight:bold;">M&A</span>');		//M&A여부 폰트변경
							document.write(reTitle);
							</script>
						</td>
						
						</tr></table>
					</div>
					
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</form>
	</div>
	</section>
</body>