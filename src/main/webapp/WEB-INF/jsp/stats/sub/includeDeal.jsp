<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		<tbody>
		<%-- 입력한 당일만 삭제 가능하게 작업 --%>
			<c:forEach var="offer" items="${offerList}" varStatus="status">
				<c:set var="mnaYN" value="N"/><c:if test="${offer.categoryCd eq '00008'}"><c:set var="mnaYN" value="Y"/></c:if>
				<fmt:formatDate var="dueDate" value="${offer.dueDt}" pattern="yyyy-MM-dd" scope="page"/>
				<tr class="<c:if test="${dueDate <= curDate}"> red</c:if>
					<c:if test="${mnaYN eq 'Y'}">
						<c:if test="${offer.progressCd == '00001'}"> bgOdd</c:if>"
						<c:choose>
							<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
							<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00004' and offer.progressCd ne '00006'}">style="height:40px;"</c:if><c:if test="${offer.progressCd eq '00002'}">style="height:40px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd eq '00004'}">style="height:40px;background-color:#DCEACE"</c:if><c:if test="${offer.progressCd == '00006'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${mnaYN eq 'N'}">
						<c:if test="${offer.progressCd == '00001'}"> bgOdd</c:if>"
						<c:choose>
							<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
							<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00003'}">style="height:40px;"</c:if><c:if test="${offer.progressCd == '00002'}">style="height:40px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="height:40px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
						</c:choose>
					</c:if>
				>
					<td class="cent pd0" style="width:74px;color:black;">${offer.tmDt}</td>
				<input type="hidden" id="offerSnb${status.count}" value="${offer.sNb}">
					<td class="cent pd0">${offer.middleOfferNm}<c:if test="${empty offer.middleOfferNm}">${offer.offerNm}</c:if></td>
					<td class="cent pd0"><c:if test="${offer.sellBuy eq '0'}"><span class="btn s red"><a>Sell</a></span></c:if><c:if test="${offer.sellBuy eq '1'}"><span class="btn s blue"><a>Buy</a></span></c:if><c:if test="${offer.sellBuy eq '2'}"><span class="btn s"><a>투자유치</a></span></c:if></td>
					<td class="cent pd0">${offer.cpnTypeCdNm}</td>
					<td class="cent pd0">${offer.price}</td>
					<td class="cent pd0">${offer.investPrice}</td><%-- popUp 함수 오류나면 changePage 함수로 --%>
					<td class="pd0 hand hov" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">&nbsp;&nbsp;
						<c:if test="${not empty offer.tmpNum1 or not empty offer.tmpNum2}"><img class="filePosition" id="fileNew${status.count}" src="../images/file/new0.gif" style="width:23px;height:11px"/></c:if>
						<b>${offer.cpnNm}<c:if test="${offer.middleOfferCd == '00000' or empty offer.cpnNm}"> : ${offer.cstNm}<c:if test="${offer.cpnNm ne offer.cstCpnNm}">(${offer.cstCpnNm})</c:if></c:if><c:if test="${not empty offer.cpnType}">(${offer.cpnType})</c:if></b>&nbsp;
						<c:forEach var="cmmCd" items="${cmmCdCategoryList}"><c:if test="${offer.categoryCd == cmmCd.dTailCd}">${cmmCd.cdNm}<span style="display:inline-block;width:20px;"></span></c:if></c:forEach>
						<c:if test="${offer.fileCnt != 0}"><span style="color:#89A0DA">
							<img class="filePosition" id="file${status.count}" src="../images/file/files.png" style="width:16px;height:16px"/><b>[${offer.fileCnt + offer.commentFileCnt}]</b></span></c:if>
						<c:if test="${offer.analysis != 0}"><span style="color:mediumvioletred">
							<img class="filePosition" id="fileAn${status.count}" src="../images/recommend/analy.png" style="width:16px;height:16px"/><b>[${offer.analysis}]</b></span></c:if>
						<c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">
							<img class="filePosition" id="fileOp${status.count}" src="../images/recommend/comment1.png" style="width:16px;height:16px"/><b>[${offer.opinion}]</b></span></c:if>&nbsp;</nobr>
					</td>
					<td class="cent hand pd0" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">${offer.memoLong}</td>
					<td class="cent pd0"><a href="javascript:popupCst(${offer.cstSnb});">${offer.cstCpnNm} ${offer.cstNm}</a></td>
					<td class="cent pd0">${offer.progressNm}</td>
					<td class="cent pd0" style="overflow:hidden;">
						<a class="opinion_m" id="opinion_${offer.sNb}"><font color="blue">
						<c:choose><c:when test="${empty offer.investOpinion}"><small><font style="color:gray">의견..</font></small></c:when>
							<c:otherwise>${offer.investOpinion}</c:otherwise></c:choose>
						</font></a>
					</td>
					<td class="cent pd0 personName"><nobr>${offer.rgNm}</nobr></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
		
	<div>
	<!-- 의견 -->
		<c:forEach var="offer" items="${offerList}" varStatus="status">
		<div class="popUpMenu title_area" id="opinionPr${offer.sNb}" name="textR">
		<c:choose><c:when test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014'  or  userLoginInfo.name==offer.rgNm}"> 
				<input type="hidden" id="dealOpinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul><c:choose>
					<c:when test="${empty offer.investOpinion}"><li class="c_note"><textarea id="opinionarea0" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
					<c:otherwise><li class="c_note"><textarea id="opinionarea${offer.sNb}">${offer.investOpinion}</textarea></li></c:otherwise></c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
						<!-- <span class="dealResult_btnDel">완전삭제</span> -->
					</p>
				</ul>
			</c:when><c:otherwise>
				<input type="hidden" id="opinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.investOpinion, lf,"<br/>")}</li>
				</ul></c:otherwise>
		</c:choose>
		</div>
		</c:forEach>
	<!-- 의견 -->
	
	<c:if test="${TAB eq '00008'}">
	<%-- 직원 플로팅 div --%>
		<div class="popUpMenu" id="test" >
			<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
				<input type="hidden" id="TofferSnb"/>
				<input type="hidden" id="TstCnt"/>
			<c:forEach var="staff" items="${userList}" varStatus="tttStatus">
				<c:if test="${staff.srtCd != '00000'}">
				<p class="pd0 mg0"><label for="chbox${tttStatus.count}" class="checkR"><input type="checkbox" name="memoSndName" id="chbox${tttStatus.count}" value="${staff.usrNm}" >${staff.usrNm}</label></p>
				</c:if>
			</c:forEach>
			<p class="bsnsR_btn"><span class="btn s green" onclick="javascript:pickStaff('insertMemo.do',this)"><a>&nbsp;&nbsp;&nbsp;선정&nbsp;&nbsp;&nbsp;</a></span></p>
		</div>
	<%-- 직원 플로팅 div --%>
	</c:if>
	</div>