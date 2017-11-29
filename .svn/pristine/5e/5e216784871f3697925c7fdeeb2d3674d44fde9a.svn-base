<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="offer" items="${offerList}" varStatus="status">
	<c:choose>
		<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
		<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
	</c:choose>
		<td>${offer.tmDt}&nbsp;&nbsp;</td>
		<td><b>${offer.cpnNm}</b></td>
		<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font><c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">&nbsp;<b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr></td>
		<td></td>
		<td>${offer.rgNm}</td>
		<td>
			<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
		</td>
	<c:if test="${offer.middleOfferCd > 0}">
		<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
		<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
		<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
	</tr>
	<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
	<tr>
		<td></td>
		<td colspan="8" style="max-width:400px;">
			<font color="#B45F04">
				<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;CB/EB: ${offer.financing}</c:if>
				<c:if test="${not empty offer.humanNet 		}">&nbsp;&nbsp;워런트/블록딜: ${offer.humanNet}</c:if>
				<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;분석의견: ${offer.audit}</c:if>
				<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;자산운용: ${offer.management}</c:if>
				<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;실적: ${offer.etc}</c:if>
				<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;투자관심: ${offer.investInte}</c:if>
				<c:if test="${not empty offer.resource 		}">&nbsp;&nbsp;매수추천: ${offer.resource}</c:if>
				<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;M&A: ${offer.mna}</c:if>
				<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;공유: ${offer.share}</c:if>
			</font>
		</td>
	</tr>
	</c:if>
	</c:forEach>
	
	
	<c:forEach var="offer" items="${staffOfferList}" varStatus="status">
	<c:choose>
		<c:when test="${(offer.offerCd == '00006') or (offer.offerCd == '00007') or (offer.offerCd == '00013') }"><tr class="link"  onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');"></c:when>
		<c:otherwise><tr class="link" onclick="ajaxOffer(event,'${offer.sNb}')"></c:otherwise>
	</c:choose>
		<td>${offer.tmDt}&nbsp;&nbsp;</td>
		<td><b>${offer.cpnNm}</b></td>
		<td><font color="green">${offer.offerNm}<c:if test="${empty offer.offerNm}">${offer.middleOfferNm }</c:if></font></td>
		<td>${offer.cstCpnNm}&nbsp;&nbsp;</td>
		<td>${offer.cstNm}</td>
		<td>
			<c:if test="${not empty offer.realNm}"><c:choose><c:when test="${fn:indexOf(offer.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(offer.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(offer.makeNm, '^^^')}"/><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(offer.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>&nbsp;<img class="mail_send filePosi" id="file1" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${offer.realNm}"></c:otherwise></c:choose></c:if>
		</td>
		
	<c:if test="${offer.middleOfferCd > 0}">
		<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
		<td style="max-width: 200px;"><c:if test="${not empty offer.result}">/</c:if> ${offer.result}</td>
		<td style="max-width: 200px;"><c:if test="${not empty offer.subMemo}">/</c:if> ${offer.subMemo}</td></c:if><c:if test="${offer.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
	</tr>
	<c:if test="${not empty offer.financing or not empty offer.humanNet or not empty offer.management or not empty offer.mna or not empty offer.etc or not empty offer.share or not empty offer.resource or not empty offer.investInte}">
	<tr>
		<td></td>
		<td colspan="8" style="max-width:400px;">
			<font color="#B45F04">
				<c:if test="${not empty offer.financing 	}">&nbsp;&nbsp;CB/EB: ${offer.financing}</c:if>
				<c:if test="${not empty offer.humanNet 		}">&nbsp;&nbsp;워런트/블록딜: ${offer.humanNet}</c:if>
				<c:if test="${not empty offer.audit 		}">&nbsp;<c:forEach var="starC" begin="1" end="${offer.star}"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach><c:forEach var="starC" begin="${offer.star+1}" end="5"><img class="" id="file${starC}" src="../images/figure/star_g.png" style="width:10px;height:10px;"/></c:forEach>&nbsp;분석의견: ${offer.audit}</c:if>
				<c:if test="${not empty offer.management 	}">&nbsp;&nbsp;자산운용: ${offer.management}</c:if>
				<c:if test="${not empty offer.etc 			}">&nbsp;&nbsp;실적: ${offer.etc}</c:if>
				<c:if test="${not empty offer.investInte 	}">&nbsp;&nbsp;투자관심: ${offer.investInte}</c:if>
				<c:if test="${not empty offer.resource 		}">&nbsp;&nbsp;매수추천: ${offer.resource}</c:if>
				<c:if test="${not empty offer.mna 			}">&nbsp;&nbsp;M&A: ${offer.mna}</c:if>
				<c:if test="${not empty offer.share 		}">&nbsp;&nbsp;공유: ${offer.share}</c:if>
			</font>
		</td>
	</tr>
	</c:if>
	</c:forEach>
<tr><td colspan="9" style="text-align:center;padding-left:120px;"><ui:pagination type="image" paginationInfo = "${paginationInfo}" jsFunction="linkPage" /></td></tr>