<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<c:set var="now" value="<%= new java.util.Date() %>"/>
<fmt:formatDate var="curDate" value='${now}' pattern='yyyy-MM-dd'/>
	<section>
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<input type="hidden" id="SendReceive" value="">
		
		<div class="fixed-top" style="z-index:10;">
		<form id="modifyRec" name="modifyRec" action="<c:url value='/stats/selectPrivateList.do' />" method="post"><input type="hidden" name="tab" id="tab" value="${TAB}"><input type="hidden" name="sorting" id="sorting" value=""><input type="hidden" name="total" id="total" value="${ttT}"><input type="hidden" name="tmpNum1" id="tmpNum1" value="${name}">
			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectWorkAllDeal.do' />">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
					<span class="btn s" onclick="javascript:location.href='<c:url value='/stats/index.do'/>';"><a>◀ 뒤로</a></span>
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
					<span class="year">
						<select name='choice_year' onchange="sortTable('total'<c:if test='${not empty TAB}'>,'${TAB}'</c:if>);">
							<c:forEach var="year" begin="2011" end="${cur_year}">
								<option value="${year}"
								<c:choose>
									<c:when test="${choice_year == null}"><c:if test="${year == cur_year}">selected</c:if>></c:when>
									<c:otherwise><c:if test="${year == choice_year}">selected</c:if>></c:otherwise>
								</c:choose> 
								${year}</option>
							</c:forEach>
						</select>
					</span>
					<%-- <span class="btn s red"><a onclick="sortTable('total'<c:if test='${not empty TAB}'>,'${TAB}'</c:if>);">전체</a></span> --%>
					<font color="blue">${name}</font> 년간 활동내역
					<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="search" class="textSearch" id="nameSearch" name="search" placeholder="회사명" autofocus="autofocus">
					<input type="submit" class="btnSearch" style="height:27px;" value="검색"> --%>
					</h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
		</form>
<div class="clear" style="height:4px;"></div>
<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
<div class="1st subTab<c:if test="${empty TAB}">on</c:if>" onclick="selectTab()">딜</div>
<div class="1st subTab<c:if test="${TAB eq 1}">on</c:if>" onclick="selectTab('1')">정보</div>
<div class="1st subTab<c:if test="${TAB eq 2}">on</c:if>" onclick="selectTab('2')">인맥</div>
<div class="1st subTab<c:if test="${TAB eq 3}">on</c:if>" onclick="selectTab('3')">코멘트</div>
<c:if test="${userLoginInfo.permission > '00019'}">
<div class="1st subTab<c:if test="${TAB eq 4}">on</c:if>" onclick="selectTab('4')">성과</div>
</c:if>
<%-- <div class="1st subTab<c:if test="${TAB eq 3}">on</c:if>" onclick="selectTab('3')">분석</div> --%>
<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
<div class="clear" style="height:4px;"></div>