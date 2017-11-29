<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :S  ======================== --%>
<c:set var="mezzL" value="${userLoginInfo.mezzL}"/>		<%-- 메자닌 상장 권한 --%>
<c:set var="mezzN" value="${userLoginInfo.mezzN}"/>		<%-- 메자닌 비상장 권한 --%>

<c:if test="${userLoginInfo.permission > '00020'  or  userLoginInfo.id eq 'gjh'}">	<%-- 개발자 or 대표님 은 무조건 'Y' --%>
<c:set var="mezzL" value="Y"/>
<c:set var="mezzN" value="Y"/>
</c:if>
<%-- ======================= 세션 정보에 따른 변수 선언 (간단한 이름으로 재정의 사용) :E  ======================== --%>

<style>
.tab_t{
    border-top: 1px solid #fff;
    border-right: 1px solid #fff;
    border-left: 1px solid #fff;
    padding: 2px 5px 6px 7px;
    border-radius: 3px 3px 0px 0px;
    font-size: 12px;
    color: #fff;
    background-color: transparent;
    margin-left:2px;
    cursor:pointer
 }
.tab_t:hover{
	color: gold;
}

/* .tab_00001{
	border-left:1px solid black;
} */
.tab_t_on{
    background-color: #ffffff;
    color: #ff5b49;	/* #ff5b49; */
    border-top: 1px solid #4cb1c9;
    border-left: 1px solid #4cb1c9;
    border-right: 1px solid #4cb1c9;
    font-weight: 700;
    /* box-shadow: 0px 2px 6px #4cb1c9; */
 }
 #showTabDiv{
 	padding-left:10px;
 }
</style>


		<div id="div_header" class="fixed-top" style="z-index:10;">
			<table class="t_skinR00" style="width:100%;height:25px;table-layout:fixed;font-size:11px;color:white;background:#4cb1c9;">
				<colgroup>
					<col width="100%">
				</colgroup>
				<thead>
					<tr style="height:29px;">
						<th style="text-align:left;padding-left:15px;font-size:13px;" class="bgYlw">딜
							<span id="showTabDiv">
								<c:forEach items="${cmmCdAllDealTabList}" var="item" varStatus="itemIndex">
								
									<!-- ========== 메뉴권한 : 비상장 메자닌(mezzN) = 'Y'(허용자), 'N'(불가자) 는 프리IPO('00005'), 벤처('00006') 2가지 메뉴는 허용 ========= -->
									<c:if test="${(item.dTailCd eq '00005' or item.dTailCd eq '00006') or mezzN ne 'N'}">
									<!-- ==================================================================================================================== -->
									
									<span onclick="moveTab('${item.dTailCd}');" class="tab_t tab_${item.dTailCd} <c:if test="${TAB eq item.dTailCd*1}">tab_t_on</c:if>">
									<c:choose>
									<c:when test="${item.dTailCd eq '00003' or item.dTailCd eq '00009'}">${item.cdDc}</c:when>
									<c:otherwise>${item.cdNm}</c:otherwise>
									</c:choose>
									</span>
									
									</c:if>
								</c:forEach>
							</span>						
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:0px;height:18px;background:#dcebf1;overflow-y:auto; border-bottom: 1px solid skyblue;">
			<table class="t_skinR00" style="width:100%;table-layout:fixed;font-size:11px;color:#3585c8;">
				<colgroup>					
					<col width="38">			<!-- 날짜 -->
					<col width="50">			<!-- 발행/투자 -->
					<col width="40">			<!-- 유형 -->
					<col width="165">			<!-- 딜제목 -->
					<col width="30">			<!-- 진행단계 -->
					<col width="97">			<!-- 투자의견 -->
					<col width="63">			<!-- 분석 -->
					<col width="37">			<!-- 등록자 -->
				</colgroup>
				<thead>
					<tr bgcolor="#dcebf1">
						<th style="height:10px" class="bgYlw">날짜</th>
						<th class="bgYlw pd0">발행<b>/</b>투자&nbsp;</th>
						<th class="bgYlw pd0">유형</th>
						<th class="bgYlw pd0">딜제목</th>
						<th class="bgYlw pd0">진행</th>
						<th class="bgYlw pd0">투자의견</th>
						<th class="bgYlw pd0">분석</th>
						<th class="bgYlw pd0">등록자</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="div_content" style="padding-top:0px;height:360px;background:white;overflow-y:auto;">
			<table class="t_skinR00" style="width:100%;table-layout:fixed;font-size:12px;">
				<colgroup>					
					<col width="38">			<!-- 날짜 -->
					<col width="50">			<!-- 발행/투자 -->
					<col width="40">			<!-- 유형 -->
					<col width="165">			<!-- 딜제목 -->
					<col width="30">			<!-- 진행단계 -->
					<col width="97">			<!-- 투자의견 -->
					<col width="63">			<!-- 분석 -->
					<col width="37">			<!-- 등록자 -->
				</colgroup>
				<tbody>
				<%-- 입력한 당일만 삭제 가능하게 작업 --%>
				
					<c:forEach var="offer" items="${offerList5}" varStatus="status">
					
					
						<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :S  ================== --%>
						<c:choose>
						<c:when test="${mezzL eq 'Y'}">
							<c:set var="asterDeal" value="N"/>
						</c:when>		<%-- 내가 등록한 딜이 아니면서 --%>		<%--             상장사 이고			 --%>		<%--						메자닌 (CB, EB, BW, RCPS) 이고																		 --%>	<%--	진행중 인 건		 --%>		<%--						제안중이 아니고					 --%>
						<c:when test="${offer.rgId ne userLoginInfo.id and ('A' eq offer.cpnStts or 'Q' eq offer.cpnStts) and (offer.categoryCd eq '00001' or offer.categoryCd eq '00002' or offer.categoryCd eq '00003' or offer.categoryCd eq '00015')  and (offer.progressCd eq '00001' or offer.progressCd eq '00002')}">	<%-- and (offer.middleOfferCd ne '00004' and offer.middleOfferCd ne '00005') --%>
							<c:set var="asterDeal" value="Y"/>	<%-- 별표시(숨김) --%>
						</c:when>
						<c:otherwise>
							<c:set var="asterDeal" value="N"/>
						</c:otherwise>
						</c:choose>
						<%-- ================== 권한에 따라 '*' 처리해야 하는 딜 건인지 변수(asterDeal) 에 저장 :E  ================== --%>
					
					
						<c:choose>
						
						<%-- <c:when test="${division eq 'FIDES' and (offer.division ne 'FIDES') and (fn:substring(offer.cpnId, 0, 1) eq 'A' or fn:substring(offer.aCpnId, 0, 1) eq 'A')}">	of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id
						<!-- 사용자의 division 이 'SYNERGY' 가 아닐때, 딜 등록자가 'SYNERGY' 이면서 상장사('A**') 인경우는 안보인다 -->
						</c:when> --%>
						
						<c:when test="${offer.rgId ne userLoginInfo.id and ((offer.categoryCd ne '00008' and offer.infoLevel lt userLoginInfo.infoLevel)||(offer.categoryCd eq '00008' and offer.infoLevel lt userLoginInfo.mnaLevel))}">	<%--of.secretYn eq 'Y' and of.rgId ne userLoginInfo.id --%>
						<!-- 보안등급이 나의 등급보다 높고 내가 등록한게 아니면 안보인다. -->
						</c:when>
						
						<c:otherwise>
					
					
						<c:set var="mnaYN" value="N"/><c:if test="${offer.categoryCd eq '00008'}"><c:set var="mnaYN" value="Y"/></c:if>						
						<c:set var="dueDate" value="${offer.dueDt}" scope="page"/>
						<tr id="investTr${status.count}"
							class="<c:if test="${dueDate <= cur_day}"> red</c:if>
							
							<c:if test="${mnaYN eq 'Y'}">
								<c:if test="${offer.progressCd eq '00001' or offer.progressCd eq '00002'}"> bgOdd</c:if>"
								<c:choose>
									<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
									<c:otherwise>  <c:if test="${offer.progressCd ne '00004' and offer.progressCd ne '00006'}">style="height:18px;"</c:if><c:if test="${offer.progressCd eq '00004'}">style="height:18px;background-color:#DCEACE"</c:if><c:if test="${offer.progressCd == '00006'}">style="height:18px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${mnaYN eq 'N'}">
								<c:if test="${offer.progressCd eq '00001'}"> bgOdd</c:if>"
								<c:choose>
									<c:when test="${offer.progressCd == '10000'}"> style="height:40px;background-color:#B9B9B9" </c:when>
									<c:when test="${offer.progressCd == '10001'}"> style="height:40px;background-color:#AAAAAA" </c:when>
									<c:when test="${offer.progressCd == '10002'}"> style="height:40px;background-color:#999999" </c:when>
									<c:otherwise>  <c:if test="${offer.progressCd ne '00002' and offer.progressCd ne '00003'}">style="height:18px;"</c:if><c:if test="${offer.progressCd == '00002'}">style="height:18px;background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="height:18px;background-color:#A9F5BC"</c:if><%-- <c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if> --%></c:otherwise>
								</c:choose>
							</c:if>
						>
							<!-- 날짜 -->
							<td class="hand" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');" style="text-align:left;padding-left:5px;">${fn:substring(fn:replace(offer.tmDt,'-','.'),2,10)}</td>
							<!-- 규모 -->
							<td class="hand cent" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');" style="padding-left:5px;color:blue;">
								<c:set var="money" value="${fn:replace(fn:replace(offer.price,'억',''),'원','')}/${fn:replace(fn:replace(offer.investPrice,'억',''),'원','')}"/>
								<%-- ${fn:replace(fn:replace(offer.price,'억',''),'원','')}/${fn:replace(fn:replace(offer.investPrice,'억',''),'원','')} --%>
								${fn:substring(money,0,7)}<c:if test="${fn:length(money)>7}">..</c:if>
							</td>
							<!-- 유형 -->
							<td class="hand " onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');" style="padding-left:5px;">
								<c:choose>
									<c:when test="${offer.categoryNm eq '프리 IPO'}"><font color="green"><b>P-IPO</b></font></c:when>
									<c:when test="${offer.categoryNm eq '바이오/헬스케어'}"><font color="green"><b>BIO/H.C</b></font></c:when>
									<c:otherwise><font color="green"><b>${offer.categoryNm}</b></font></c:otherwise>
								</c:choose>
							</td>
							<!-- 딜제목 -->
							<td class="pd0 hand hov" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');" style="padding-left:5px!important;overflow:hidden;">
								<nobr>
								<c:if test="${not empty offer.tmpNum1 or not empty offer.tmpNum2}"><img class="filePosi" id="fileNew${status.count}" src="../images/file/new0.gif" style="width:23px;height:11px"/></c:if>
								<b><c:choose><c:when test="${asterDeal eq 'Y'}">***</c:when><c:otherwise>${offer.cpnNm}</c:otherwise></c:choose><%-- <c:if test="${not empty offer.cpnType}">(${offer.cpnType})</c:if> --%></b><c:if test="${'A' ne offer.cpnStts and 'Q' ne offer.cpnStts}"><font color="gray"><small>(비상장)</small> </font></c:if>&nbsp;
								
								<%-- <font color="gray">${offer.middleOfferNm}</font> --%>
								<span style="display:inline-block;width:3px;"></span>
								<c:if test="${offer.fileCnt != 0}"><span style="color:#89A0DA">
									<img class="filePosi" id="file${status.count}" src="../images/file/files.png" style="width:12px;height:12px;vertical-align:middle;"/><b style="font-size:11px;">[${offer.fileCnt + offer.commentFileCnt}]</b></span></c:if>
								<c:if test="${offer.analysis != 0}"><span style="color:mediumvioletred">
									<img class="filePosi" id="fileAn${status.count}" src="../images/recommend/analy.png" style="width:12px;height:12px;vertical-align:middle;"/><b style="font-size:11px;">[${offer.analysis}]</b></span></c:if>
								<c:if test="${offer.opinion != 0}"><span style="color:darkgoldenrod">
									<img class="filePosi" id="fileOp${status.count}" src="../images/recommend/comment1.png" style="width:12px;height:12px;vertical-align:middle;"/><b style="font-size:11px;">[${offer.opinion}]</b></span></c:if>&nbsp;</nobr>
								</nobr>
							</td>
							<!-- 진행 -->
							<c:if test="${offer.categoryCd ne '00008'}">	<!-- M&A 아닐때 -->
							<td class="hand pd0" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">
								<font color="<c:choose>
												<c:when test="${offer.progressCd eq '00001'}">#0D7AA6</c:when>
												<c:when test="${offer.progressCd eq '00003'}">#FF1111</c:when>
												<c:otherwise>#0D7AA6</c:otherwise></c:choose>">	<%--#333333--%>
												
											<c:choose>
												<c:when test="${TAB eq '00002' and offer.progressCd eq '00001'}">제안중</c:when>	<%-- 딜제안중 탭 이면서 진행중 일때 --%>
												<c:otherwise>${offer.progressNm}</c:otherwise>
											</c:choose>
								</font>
							</td>
							</c:if>
							<c:if test="${offer.categoryCd eq '00008'}">	<!-- M&A 일때 -->								
								<td class="hand cent pd0" style="color:#0D7AA6;" onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');">
									<c:forEach var="cmmCd" items="${cmmCdMnaPgCdList}"><c:if test="${offer.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach>										
								</td>
							</c:if>
							
							<!-- 투자 의견 -->
							<td class="pd0 hov" style="text-align:left;overflow:hidden;padding-left:5px!important;">
								<nobr>
								<a class="opinion_m hand" id="opinion_${offer.sNb}" other_option="option_${offer.cpnNm}_${offer.rgId}"><font color="blue">
								<c:choose><c:when test="${empty offer.investOpinion}"><small><font style="color:silver"><i class="axi axi-edit2" style="font-size:12px;"></i></font></small></c:when>
									<c:otherwise>${fn:substring(offer.investOpinion,0,14)}<c:if test="${fn:length(offer.investOpinion)>14}">&nbsp;...</c:if></c:otherwise></c:choose>
								</font></a>
								</nobr>
							</td>
							
							<!-- 분석 -->
							<td class="hand " onclick="popUp('${offer.tmDt}','rcmdComment','','${offer.sNb}');" style="padding-left:5px;text-align:center;">
							<c:choose>
								<c:when test="${offer.analUserCount > 0}">
									<span style="cursor:pointer;color:#0808ad;">
										${offer.analUserFirst}<c:if test="${offer.analUserCount > 1}"><font style="font-size:11px;"><i class="axi axi-person"></i>${offer.analUserCount}</font></c:if>										
										<c:choose>
										<c:when test="${offer.analEachCount ge offer.analUserCount}">
											<span style="font-size:11px;margin-left:0px;border-radius:0px;border:1px solid white;padding:0px 1px 1px 1px;background:#33468e;color:white">完</span>
										</c:when>
										<c:otherwise>
											<span style="font-size:11px;margin-left:0px;border-radius:0px;border:1px solid white;padding:0px 1px 1px 1px;background:#007cff;color:white">進</span>
										</c:otherwise>
										</c:choose>
									</span>
								</c:when>
								<c:otherwise>
									<font color="#FFCECE">미지정</font>
								</c:otherwise>
							</c:choose>
							</td>
							
							<!-- 등록자 -->
							<td class="hand hov" style="text-align:right;padding-right:5px;" onclick="memoDivNew(event,'${offer.rgNm}');">${offer.rgNm}</td>							
						</tr>
						
						</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
<!-- 의견 -->
	<c:forEach var="offer" items="${offerList5}" varStatus="status">
		<div class="popUpMenu title_area" id="opinionPr${offer.sNb}" name="textR">								<!-- 아래 시너지가 아니면 모두 입력/수정 가능하도록 -->
		<c:choose>
			<c:when test="${userLoginInfo.permission > '00019' or userLoginInfo.permission == '00014' or userLoginInfo.division ne 'SYNERGY'}">		<%-- 20150826   or  userLoginInfo.name==offer.rgNm}"> --%> 
				<input type="hidden" id="dealOpinionSNb${offer.sNb}" value="${offer.sNb }">
				<input type="hidden" name="dealCpnNm" value="${offer.cpnNm}">			<!-- 회사명 -->
				<input type="hidden" name="dealRgNm" value="${offer.rgNm}">				<!-- 등록자 -->
				<input type="hidden" name="dealRgUserPhn" value="${offer.rgUserPhn}">	<!-- 등록자 전화번호 -->
				
				<input type="hidden" id="dealOpinionCpnNm${offer.sNb}" value="${offer.cpnNm}">		<!-- 딜 회사명 -->
				<input type="hidden" id="dealOpinionDealRgId${offer.sNb}" value="${offer.rgId}">	<!-- 딜 등록자 usr_id -->
				
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul><c:choose>
					<c:when test="${empty offer.investOpinion}"><li class="c_note"><textarea id="opinionarea0" placeholder="투자의견을 입력하세요."></textarea></li></c:when>
					<c:otherwise><li class="c_note"><textarea id="opinionarea${offer.sNb}">${offer.investOpinion}</textarea></li></c:otherwise></c:choose>
					<p class="bsnsR_btn">
						<span class="dealResult_btnOk2 btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
					</p>
				</ul>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="opinionSNb${offer.sNb}" value="${offer.sNb }">
				<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
				<ul>
					<li class="c_note v-textarea">${fn:replace(offer.investOpinion, lf,"<br/>")}</li>
				</ul>
			</c:otherwise>
		</c:choose>
		</div>
	</c:forEach>
<!-- 의견 -->