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
$(document).ready(function(){
/* 	var arg = window.dialogArguments;
	if(arg!=null){
		if(${empty companyList}) {
			$("#c_Name").val(arg.snb);
			$("#popUp").val("Y");
			$("#companyName").submit();
		}
	} */
	if(${popUp == "Y"}){
		$("#addBtn").css("display","none");
		$("#modiBtn").css("display","none");
		$("tr").attr("onclick","");
	}
 });
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


<form id="companyName" name="companyName" action="<c:url value='/company/main.do' />" method="post">
	<input type="hidden" id="c_Name" name="sNb">
	<input type="hidden" id="i_Name" name="cpnId">
	<input type="hidden" id="popUp" name="popUp">
</form>
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>

<script>
var arg = window.dialogArguments;
if(arg!=null){
	if(${empty companyList}) {
		$("#c_Name").val(arg.snb);
		$("#popUp").val("Y");
		$("#companyName").submit();
	}
};
</script>
<!-- 정보정리 -->

<div class="popUpMenu title_area offerL" id="00offerPr1">
	<p class="closePopUpMenu" title="닫기">ⅹ닫기</p>
	<c:forEach var="offer2" items="${offerList2}" varStatus="status">
		<c:choose>
			<c:when test="${offer2.middleOfferCd == '00000'}">
				<c:set var="slct1st" value="00012"/>
				<c:if test="${offer2.offerCd == '00013'}"><c:set var="slct1st" value="00013"/></c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${offer2.middleOfferCd+0 < 3}"><c:set var="slct1st" value="00010"/></c:if>
				<c:if test="${offer2.middleOfferCd+0 < 20 and offer2.middleOfferCd+0 > 10}"><c:set var="slct1st" value="00011"/></c:if>
			</c:otherwise>
		</c:choose>
	<ul>
		<li>

	
		<select class="work-1stSelect" disabled="true"><!-- 딜 -->
			<c:forEach var="cmmCd" items="${cmmCd1stSlctList}">
			<c:if test="${cmmCd.cdSort == '00003'}">
				<option value="${cmmCd.dTailCd}" <c:if test="${slct1st == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:if>
			</c:forEach>
		</select>
		<select class="work-2ndSelect" disabled="true" <c:if test="${slct1st != '00010'}">style="display:none"</c:if>><!-- 중개 -->
			<c:forEach var="cmmCd" items="${cmmCdDealList}">
			<c:if test="${cmmCd.cdSort == '00000'}">
				<option value="${cmmCd.dTailCd}" <c:if test="${offer2.middleOfferCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:if>
			</c:forEach>
		</select>
		<select class="work-2ndSelect" disabled="true" <c:if test="${slct1st != '00011'}">style="display:none"</c:if>><!-- 일임계약 -->
			<c:forEach var="cmmCd" items="${cmmCdDealList}">
			<c:if test="${cmmCd.cdSort == '00001'}">
				<option value="${cmmCd.dTailCd}" <c:if test="${offer2.middleOfferCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:if>
			</c:forEach>
		</select>
		<select class="work-2ndSelect" disabled="true" <c:if test="${slct1st != '00012'}">style="display:none"</c:if>><!-- 미팅 -->
			<c:forEach var="cmmCd" items="${cmmCdOfferList}">
			<c:if test="${cmmCd.cdSort == '00000'}">
				<option value="${cmmCd.dTailCd}" <c:if test="${offer2.offerCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:if>
			</c:forEach>
		</select>
		<select class="work-3rdSelect" disabled="true" <c:if test="${slct1st != '00010'}">style="display:none"</c:if>><!-- 제안 -->
			<c:forEach var="cmmCd" items="${cmmCdOfferList}">
			<c:if test="${cmmCd.cdSort == '00001'}">
				<option value="${cmmCd.dTailCd}" <c:if test="${offer2.offerCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:if>
			</c:forEach>
		</select>

		
		<span id='CateCd_${cnt}' <c:if test="${slct1st != '00010'}">style="display:none"</c:if>><!-- &nbsp;유형: -->
		<select id='categoryCd_${cnt}' disabled="true">
				<option value="" selected>-유형선택-</option>
			<c:forEach var="cmmCd" items="${cmmCdCategoryList}">
				<option value="${cmmCd.dTailCd}" <c:if test="${offer2.categoryCd == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
			</c:forEach>
		</select></span>	
		
		<span style="float:right;"><b>${offer2.rgNm } </b>${offer2.tmDt }</span>				
		
	</li>
	
	<li style="margin-top:2px;line-height:20px;">

			<span id="slctCpn_${dataStatus.count}" <c:if test="${offer2.offerCd<00004}">style="display:none;"</c:if>>
			<b>물건</b>: <span class="btn s orange" style="vertical-align:top;"><a class="c_title">${offer2.cpnNm}</a></span>
			&nbsp;</span>
			<span id="slctPrsn_${dataStatus.count}" <c:if test="${offer2.offerCd =='00004' or offer2.offerCd=='00005'}">style="display:none;"</c:if>>
			<b>상대방</b>: 	<span class="btn s blue" style="vertical-align:top;"><a class="c_title">${offer2.cstCpnNm} : ${offer2.cstNm}</a></span>
			</span>
			

			<c:if test="${not empty offer2.realNm}">
				<c:choose>
					<c:when test="${fn:indexOf(offer2.realNm,'^^^') > 0}">
						<c:set var="imgNm" value="${fn:split(offer2.realNm, '^^^')}"/>
						<c:set var="makeNm" value="${fn:split(offer2.makeNm, '^^^')}"/>
						
						<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
							<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
						</c:forEach>
					
						<c:forEach var="im" items="${imgNm}" varStatus="imSt">
							<c:set var="extension" value="${fn:split(im,'.')}"/>
							<c:set var="lastDot" value="${fn:length(extension)-1}"/>
							
							<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
							<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
							<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
							<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
							
							&nbsp;<img class="mail_send filePosition" id="file${imSt.count}" 
							<c:choose>
								<c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when>
								<c:otherwise>src="../images/file/${ext}.png"</c:otherwise>
							</c:choose>

							title="${im}">
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:set var="extension" value="${fn:split(offer2.realNm,'.')}"/>
						<c:set var="lastDot" value="${fn:length(extension)-1}"/>
						<input type="hidden"  id="mkNames1" value="${offer2.makeNm}"/>

						<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
						<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
						<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
						<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
						
						&nbsp;<img class="mail_send filePosition" id="file1" 
						<c:choose>
							<c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when>
							<c:otherwise>src="../images/file/${ext}.png"</c:otherwise>
						</c:choose>
						title="${offer2.realNm}">
					</c:otherwise>
				</c:choose>
			</c:if>

			
		</li>				
		
		<li><input class="m_note" type="text" value="발행규모 : ${offer2.price}" style="margin-top:2px;<c:if test="${slct1st == '00012'}">display:none</c:if>" disabled="true" <%--  <c:if test="${empty offer2.price || offer2.price=='발행규모'}">style="display:none;"</c:if> --%>></li>
		
		
		<c:if test="${not empty offer2.financing or not empty offer2.management or not empty offer2.mna or not empty offer2.etc}">
		<li style="padding-top:5px;"><b>핵심체크사항</b></li>
		<li style="border:2px dotted navy;">
			<ul style="width:465px; padding: 2px;font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;">
				<li>
				<c:if test="${not empty offer2.financing }">&nbsp;&nbsp;자금조달: ${offer2.financing}</c:if>
				<c:if test="${not empty offer2.management }">&nbsp;&nbsp;자산운용: ${offer2.management}</c:if>
				<c:if test="${not empty offer2.mna }">&nbsp;&nbsp;M&A: ${offer2.mna}</c:if>
				<c:if test="${not empty offer2.etc }">&nbsp;&nbsp;기타: ${offer2.etc}</c:if>
				</li>
			</ul>
		</li>
		</c:if>
		<li class="c_note v-textarea">${fn:replace(offer2.memo, lf,"<br/>")}</li>
	</ul>
	</c:forEach>
</div>




<!-- 정보정리 -->
<!-- 노트 -->
<div z-index="100">
	<c:forEach var="note" items="${noteList}" varStatus="status">
	<div class="popUpMenu title_area" id="00notePr${status.count}">
		<p class="closePopUpMenu">ⅹ닫기</p>
			<ul>
				<li class="c_title">${note.title}&nbsp;</li>
				<li class="c_note">&nbsp;${fn:replace(note.note, lf,"<br/>")}</li>
			</ul>
	</div>
	</c:forEach>
</div>
<!-- 노트 -->

 
	<header>
	</header>
	<section>
		<article>
			<c:if test="${fn:length(companyList) == 0}">
			<!-- <h2>&nbsp;이름을 선택하세요.</h2> -->
			<h3>&nbsp;&nbsp;신규 추가된 법인 네트워크 정보 20</h3>
			<div class=" title_area offerL" id="offerPr" style="display:block">
			<c:forEach var="net" items="${cpnNetList}">
				<ul style="background-color:white;border: solid gray 1px;padding: 4px;margin:3px;">
					<li style="width:100px;float:left;padding-left:7px;"><small>&nbsp;</small></li>
					<li style="width:30px;float:left">&nbsp;</li>
					<li style="width:80px;float:left;"><small>${net.cstCpnNm}</small></li>
					<li style="float:right;padding-right:7px;">${net.rgDt }</li>
					<div class="clear"></div>
					<li style="width:100px;font-weight:bold;float:left;padding-left:7px;">${net.cpnNm}</li>
					<li style="width:30px;float:left">→</li>
					<li style="width:80px;font-weight:bold;float:left;">${net.cstNm}</li>
					<li style="float:right;padding-right:7px;"><small>${net.rgNm}</small></li>
					<div class="clear"></div>
					<li style="float:none;margin:5px;padding:2px;border: solid lightgray 1px;">&nbsp;${net.note}</li>
				</ul>
			</c:forEach>
			</div>
			</c:if>
			
		<c:forEach var="cpn" items="${companyList}">
			<input type="hidden" id="cst_snb" value="${cpn.sNb}">
			
			<table class="t_skin04">
				<thead>
					<th class="tbColor tbColorSub">회사명</th>
					<td><h3>&nbsp;&nbsp;${cpn.cpnNm} (${cpn.cpnId})</h3></td>
				</thead>
			</table><br/><br/><table class="t_skin04">
				<thead><tr>
					<th class="tbColor tbColorSub">대표이사</th>
					<td class="tbColorSub" colspan="3">&nbsp;
						<span style="vertical-align: middle;">
							<b>${cpn.cstNm}</b>
							<c:if test="${fn:length(cpn.cstNm) == 0}">
							&nbsp;&nbsp;<spring:message code="info.nodata.msg" />
							</c:if>
						</span>
						&nbsp;&nbsp;
						<span class="red btn s" id="modiBtn"><a onclick="popUp('_0','ceo','','${cpn.cpnId}')">&nbsp;&nbsp;수정&nbsp;&nbsp;</a></span>
					</td></tr>
				</thead>
			
				<tbody>
					<td colspan="4">
						<table class="sub_tbl">
							<c:forEach var="note" items="${noteList}" varStatus="status">
							<tr>
								<td><a class="noteNote" id="0_noteNote_${status.count}"><nobr><b>${fn:substring(note.title,0,18)}<c:if test="${fn:length(note.title) > 18}">...</c:if></b></nobr></a></td>
								<td></td>
								<td>${fn:replace(note.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>입력자:${note.rgNm}</small></nobr></td>
								<td></td>
								<td><nobr><small>${fn:substring(note.rgDt,0,10)}</small></nobr></td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(noteList) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table>
					</td>
				</tbody>


				<thead>
					<th class="tbColor tbColorSub">대표이사 네트워크</th>
					<td class="tbColorSub" style="min-width:220px;">&nbsp;
						<span class="btn s blue" id="addBtn">
							<a href="" onclick="popUp('_0','C','${cpn.cstNm}','${cpn.ceoId}'); return false;">&nbsp;&nbsp;추가&nbsp;&nbsp;</a>
						</span>
					</td>
					<th class="tbColor tbColorSub">관련인물</th>
					<td class="tbColorSub" style="min-width:220px;">&nbsp;
						<span class="btn s blue popUpBtn" >
							<%-- <a href="" onclick="popUp('_0','PersonCPNnet','${cst.cstNm}','${cst.sNb}'); return false;">&nbsp;&nbsp;추가&nbsp;&nbsp;</a> --%>
						</span>
					</td>
				</thead>
				<tbody>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="netP" items="${netList}" varStatus="status">
							<tr class="link" onclick="slctCst('${netP.subSNb}');">
								<td><nobr><b>${netP.cstNm}</b></nobr></td>
								<td>${netP.cpnNm}</td>
								<td>${netP.position}</td>
								<td></td>
								<td>${fn:replace(netP.note,lf, "<br/>")}</td>
								<td></td>
								<td><small>${netP.rgNm}</small></td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(netList) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table>
					</td>
					<td colspan="2">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="cstN" items="${cstList}" varStatus="status">
							<tr class="link" onclick="slctCst('${cstN.subSNb}');">
								<td><nobr><b>${cstN.cstNm}</b></nobr></td>
								<td>${cstN.cpnNm}</td>
								<td></td>
								<td>${fn:replace(cstN.note,lf, "<br/>")}</td>
								<td></td>
								<td><nobr><small>${cstN.rgNm}</small></nobr></td>
							</tr>
							<tr>
								<!-- <td style="background-color:white !important;">|</td> -->
								
								<td valign="top" style="padding:1px; color:gray" align="right">└─▷</td>
								<td valign="middle" style="padding:1px; color:gray"><nobr>${cpn.cpnNm}&nbsp;</nobr><br/>친밀도</td>
								<td class="pd0" colspan="4">
									<table class="t"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5">
										<td class="tabImportant <c:if test="${cstN.lvCd>=L5.count}">bgLightGray</c:if>" title="${L5.count}" onclick="javascript:selectLvCd('CD','${L5.count}','${cstN.sNb}','companyName')"></td>
									</c:forEach></tr></table>
								</td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(cstList) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table>
					</td>
				</tbody>

			<!-- </table><br/>&nbsp;<br/><table class="t_skin04"> -->
				
				<thead>
					<th class="tbColor tbColorSub">직원</th>
					<td class="tbColorSub" colspan="3"></td>
				</thead>
				<tbody>
					<td colspan="4">
						<table class="sub_tbl t_skin04_cstNcpn">
							<c:forEach var="employee" items="${employeeList}" varStatus="status">
							<tr class="link" onclick="slctCst('${employee.sNb}');" style="float:left;">
								<td><b>${employee.cstNm}</b></td>
								<td>${employee.position}</td>
							</tr><tr style="float:left;"><td>|</td></tr>
							</c:forEach>
							<c:if test="${fn:length(employeeList) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table>
					</td>
				</tbody>

				<thead>
					<th class="tbColor tbColorSub">시너지 컨텍포인트</th>
					<td class="tbColorSub" colspan="3"></td>
				</thead>
				<tbody>
					<td colspan="4">
						<table class="sub_tbl">
							<c:set var="ibStaff" />
							<c:set var="cpnCst" />
<%-- 							
							<c:forEach var="contact" items="${contactList}" varStatus="status">
							<c:if test="${(cpnCst != contact.cstNm || ibStaff != contact.rgNm) && (contact.cpnNm == contact.cstCpnNm)}">
							<tr>
							<c:if test="${cpnCst == contact.cstNm}">
								<td></td><td></td>
							</c:if>
							<c:if test="${cpnCst != contact.cstNm}">
								<td>
									<c:set var="cpnCst" value="${contact.cstNm}"/>${contact.cstNm}
								</td>
								<td>
									${contact.position}
								</td>
							</c:if>
								<td><c:if test="${ibStaff != contact.rgNm}">
									<c:set var="ibStaff" value="${contact.rgNm}"/>${contact.rgNm}
									</c:if>
								</td>
								<td></td>
								<td></td>
							</tr>
							</c:if>
							</c:forEach>
							 --%>
							
							<c:forEach var="contact2" items="${contactList2}" varStatus="status">
							<c:if test="${(cpnCst != contact2.cstNm || ibStaff != contact2.rgNm)}">
							<tr>
							<c:if test="${cpnCst == contact2.cstNm}">
								<td></td><td></td><td></td>
							</c:if>
							<c:if test="${cpnCst != contact2.cstNm}">
								<td style="text-align: right;">${contact2.cstCpnNm}</td>
								<td><c:set var="cpnCst" value="${contact2.cstNm}"/><nobr><b>${contact2.cstNm}</b></nobr></td>
								<td>${contact2.position}</td>
							</c:if>
								<td><c:if test="${ibStaff != contact2.rgNm}">
									<c:set var="ibStaff" value="${contact2.rgNm}"/><nobr><b>${contact2.rgNm}</b></nobr>
									</c:if></td>
							</tr>
							</c:if>
							</c:forEach>
							
							
							<c:if test="${fn:length(contactList2) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table>
					</td>
				</tbody>

				<thead>
					<th class="tbColor tbColorSub">시너지와 이력</th>
					<td class="tbColorSub" colspan="3"></td>
				</thead>
				<tbody>
<%-- 
				<tr>
					<td colspan="4"><a class="cpnNm" id="0_cpnNm_0">
						<table class="sub_tbl">
						
							<c:forEach var="offer" items="${offerList}" varStatus="status">
							<tr>
								<td>${offer.tmDt}</td>
								<td>${fn:substring(offer.memo,0,8)}<c:if test="${fn:length(offer.memo) > 8}">...</c:if></td>
								<td>${offer.cpnNm}</td>
								<td>${offer.cstNm}</td>
								<td>${offer.offerNm}</td>
								<td>${offer.rgNm}</td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(offerList) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table></a>
					</td>
				</tr>
--%>
				<tr>
					<td colspan="4"><a class="cpnNm" id="0_cpnNm_1">
						<table class="sub_tbl">
							<c:forEach var="offer2" items="${offerList2}" varStatus="status">
							<tr>
								<td>${offer2.tmDt}</td>
								<%-- <td>${fn:substring(offer2.memo,0,8)}<c:if test="${fn:length(offer2.memo) > 8}">...</c:if></td> --%>
								<td style="text-align: right;">${offer2.cstCpnNm}</td>
								<td>${offer2.cstNm} ${fn:substring(offer2.position,0,6)}<c:if test="${fn:length(offer2.position) > 6}">..</c:if></td>
								<td>${offer2.offerNm}<c:if test="${empty offer2.offerNm}">${offer2.middleOfferNm }</c:if></td>
								<td>${offer2.rgNm}</td>
								<td>
						<c:if test="${not empty offer2.realNm}">
							<c:choose>
								<c:when test="${fn:indexOf(offer2.realNm,'^^^') > 0}">
									<c:set var="imgNm" value="${fn:split(offer2.realNm, '^^^')}"/>
									<c:set var="makeNm" value="${fn:split(offer2.makeNm, '^^^')}"/>
									
									<c:forEach var="im" items="${imgNm}" varStatus="imSt">
										<c:set var="extension" value="${fn:split(im,'.')}"/>
										<c:set var="lastDot" value="${fn:length(extension)-1}"/>

										<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
										<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
										<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
										<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
										
										&nbsp;<img class="mail_send filePosi" id="file${imSt.count}" 
										<c:choose>
											<c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when>
											<c:otherwise>src="../images/file/${ext}.png"</c:otherwise>
										</c:choose>
										title="${im}">
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:set var="extension" value="${fn:split(offer2.realNm,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>

									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									
									&nbsp;<img class="mail_send filePosi" id="file1" 
									<c:choose>
										<c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when>
										<c:otherwise>src="../images/file/${ext}.png"</c:otherwise>
									</c:choose>
									title="${offer2.realNm}">
								</c:otherwise>
							</c:choose>
						</c:if>
								</td><c:if test="${offer2.middleOfferCd > 0}">
								<td><c:forEach var="cmmCd" items="${cmmCdProgressCdList}"><c:if test="${offer2.progressCd == cmmCd.dTailCd}">${cmmCd.cdNm}</c:if></c:forEach></td>
								<td><c:if test="${not empty offer2.result}">/</c:if> ${offer2.result}</td>
								<td><c:if test="${not empty offer2.subMemo}">/</c:if> ${offer2.subMemo}</td></c:if><c:if test="${offer2.middleOfferCd < 1}"><td></td><td></td><td></td></c:if>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(offerList2) == 0}">
							<tr>
								<td><spring:message code="info.nodata.msg" /></td>
							</tr>
							</c:if>
						</table></a>
					</td>
				</tr>
				</tbody>


			</c:forEach>
			</table>
		</article>
	</section>
</body>
</html>