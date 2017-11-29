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
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/base.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/keyPointChk.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script>
 $("tr:even").css("background-color", "#E0F8F7");
 $(document).ready(function(){
	 $(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	 $('.tabUnderBar').css('width','calc(100% - '+ parseInt(10 + 68*($('.1st').length)) +'px)');
	 $('.tabUnderBar2').css('width','calc(100% - '+ parseInt(10 + 68*($('.2nd').length)) +'px)');
 });

 function viewPer(th,sep){
 	$("#page").val(sep);
 	document.modifyRec.submit();
 }

//정보정리 팝업을 위한 ajax
function statsOfferdivAjax(e,rgName, th, snb, report){
	var DATA = {
				sNb: snb,
				tmpNum1: "on",
				rgNm: rgName,
				reportYN: report,
				day: $(th).attr('name'),
				tmpNum2:$('#pageName').val()
		}, fn = function(arg){
			$("#offerDiv").html(arg);
			view("offerPr",'',e);
			if("MainLogo"===$('#pageName').val()) checkMainTable(th,'1',snb);
		};
	ajaxModule(DATA,"../stats/statsPrivateOffer.do",fn);
}

//별 갯수, 분석자명 검색
function tabTable(flag, name){
	
	if(flag!='0'){		// 별검색
		if(flag == 'total') $("#total").val(flag);
		else $("#page").val(flag);
	}
	
	if(isEmpty(name)){
		$('#name').val($('#name').val());	//기분석자명
	}else if(name == 'ALL'){
		$('#name').val('');	//모두
	}else{
		$('#name').val(name);				//분석자명
	}
	
	$('#sorting').val('');
	$('input[name=srchYear]').val($('#choice_year').val());		//년도
		
	document.modifyRec.submit();
}


//엑셀다운로드
function excelDownList(){
	
	
	if($('#excelform')!=undefined) $('#excelform').remove();
	
	var str ='';
	str +='<form name="frm" id="excelform"  method="post">';
	str +='<input type="hidden" name="sorting" value="'+$("#sorting").val()+'">';
	str +='<input type="hidden" name="name"  value="'+$("#name").val()+'">';
	str +='<input type="hidden" name="page"  value="'+$("#page").val()+'">';
	str +='<input type="hidden" name="total" value="'+$("input[name=total]").val()+'">';
	str +='<input type="hidden" name="srchYear" value="'+$("input[name=srchYear]").val()+'">';
	str +='</form>';

	$('body').append(str);
	
	$('#excelform').attr('action',"../work/excelDownloadComment.do");
	$('#excelform').submit();
	//$('.wrap-loading').removeClass('display-none');
	$('#excelform').remove();
	
}

</script>
<style>
	tbody tr:hover {background-color: moccasin !important;}
	.fixed-top .btn_uni_exceldown { background:url(../images/common/btn_excel_download.gif) no-repeat 0 0;  position:absolute; right:0px; top:44px; z-index:15; display:inline-block; width:112px; height:27px; }
	.fixed-top .btn_uni_exceldown:hover { background:url(../images/common/btn_excel_download.gif) no-repeat 0 0!important;  }
	.fixed-top .btn_uni_exceldown em { display:none; }
	
	

.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}	
</style>
</head>
<body>

<div class="wrap-loading display-none">
    <div><img src="${pageContext.request.contextPath}/images/ajax_loading.gif" /></div>
</div>

<div id="offerDiv"><div id="offerPr" style="display: none;"></div></div>
<div id="wrap">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	<input type="hidden" id="SendReceive" value="resource">
	
	<form id="modifyRec" name="modifyRec" action="<c:url value='/work/analysisComments.do' />" method="post">
		<input type="hidden" name="sorting" id="sorting" value="${sorting}">
		<input type="hidden" name="name" id="name" value="${name}">
		<input type="hidden" name="page" id="page" value="${TAB}">
		<input type="hidden" name="total" value="${ttT}">
		<input type="hidden" name="srchYear" value="${srchYear}">
	</form>
	
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
		<div class="fixed-top" style="z-index:10;">
			<header>
				<table>
					<tr><td><h2 class="headerTitle">분석의견</h2></td>
						<td><span class="year">
								<select id='choice_year' name='choice_year' onchange="tabTable();">
									<option value="9999" <c:if test="${srchYear eq 'ALL'}">selected</c:if>>전체</option>
									<c:forEach var="year" begin="2015" end="${cur_year}">
										<option value="${year}"
										<c:choose>
											<c:when test="${srchYear == null}">
												<c:if test="${year == cur_year}">selected</c:if>>
											</c:when>
											<c:otherwise>
												<c:if test="${year == srchYear}">selected</c:if>>
											</c:otherwise>
										</c:choose>
										${year}</option>
									</c:forEach>
								</select>
							</span>
						</td>
					</tr>
				</table>
			</header>
			<!-- <span style="float:right;">* 데이터가 많아 네트워크가 불안정할 경우 개인별로 다운 받으시기 바랍니다.</span> -->
			<a class="btn_uni_exceldown" href="javascript:excelDownList();"><em>엑셀파일다운받기</em></a>
			<div class="clear" style="height:4px;"></div>
			<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			<div class="1st subTab<c:if test="${empty TAB}">on</c:if> sng" onclick="tabTable()">모두보기</div>
			<div class="1st subTab<c:if test="${TAB == '1'}">on</c:if>" onclick="tabTable(1)"><c:forEach var="starC" begin="1" end="1"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach></div>
			<div class="1st subTab<c:if test="${TAB == '2'}">on</c:if>" onclick="tabTable(2)"><c:forEach var="starC" begin="1" end="2"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach></div>
			<div class="1st subTab<c:if test="${TAB == '3'}">on</c:if>" onclick="tabTable(3)"><c:forEach var="starC" begin="1" end="3"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach></div>
			<div class="1st subTab<c:if test="${TAB == '4'}">on</c:if>" onclick="tabTable(4)"><c:forEach var="starC" begin="1" end="4"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach></div>
			<div class="1st subTab<c:if test="${TAB == '5'}">on</c:if>" onclick="tabTable(5)"><c:forEach var="starC" begin="1" end="5"><img class="" id="file${starC}" src="../images/figure/star_y.png" style="width:10px;height:10px;"/></c:forEach></div>
			<!-- <button name="reg_btn" class="btn_standard" onclick="excelDownList();" style="border:1px solid #bdc9d6; background-color:#e5e8ea;">엑셀다운</button> -->
			<div class="tabUnderBar" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			
				
			<div class="clear" style="height:4px;"></div>
			<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			<div class="2nd subTab<c:if test="${name == ''}">on</c:if> sng" onclick="tabTable(0,'ALL')">모두보기</div>
			<%--
			<div class="2nd subTab<c:if test="${name == '김지영'}">on</c:if>" onclick="tabTable(0,'김지영')">김지영</div>
			<div class="2nd subTab<c:if test="${name == '오일평'}">on</c:if>" onclick="tabTable(0,'오일평')">오일평</div>
			<div class="2nd subTab<c:if test="${name == '이명철'}">on</c:if>" onclick="tabTable(0,'이명철')">이명철</div>
			<div class="2nd subTab<c:if test="${name == '이진호'}">on</c:if>" onclick="tabTable(0,'이진호')">이진호</div>
			<div class="2nd subTab<c:if test="${name == '채원흠'}">on</c:if>" onclick="tabTable(0,'채원흠')">채원흠</div>
			 --%>
			<div class="2nd subTab<c:if test="${name == '김우영'}">on</c:if>" onclick="tabTable(0,'김우영')">김우영</div>
			<div class="2nd subTab<c:if test="${name == '방영학'}">on</c:if>" onclick="tabTable(0,'방영학')">방영학</div>
			<div class="2nd subTab<c:if test="${name == '박종운'}">on</c:if>" onclick="tabTable(0,'박종운')">박종운</div>
			<div class="2nd subTab<c:if test="${name == '조중혁'}">on</c:if>" onclick="tabTable(0,'조중혁')">조중혁</div>
			
			<div class="2nd subTab<c:if test="${name == '김대홍'}">on</c:if>" onclick="tabTable(0,'김대홍')">김대홍</div>
			<div class="2nd subTab<c:if test="${name == '이종민'}">on</c:if>" onclick="tabTable(0,'이종민')">이종민</div>
			<div class="2nd subTab<c:if test="${name == '장영재'}">on</c:if>" onclick="tabTable(0,'장영재')">장영재</div>
			<div class="2nd subTab<c:if test="${name == '최진혁'}">on</c:if>" onclick="tabTable(0,'최진혁')">최진혁</div>
			<div class="2nd subTab<c:if test="${name == '김영도'}">on</c:if>" onclick="tabTable(0,'김영도')">김영도</div>
			<div class="2nd subTab<c:if test="${name == '김도연'}">on</c:if>" onclick="tabTable(0,'김도연')">김도연</div>
			
			<div class="tabUnderBar2" style="float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			
			<table class="t_skinR00" style="padding-top:5px;table-layout:fixed;">
				<colgroup>
					<col width="52">        <!--<col width="72">  -->
					<col width="62">        <!--<col width="92">  -->
					<col width="112">       <!--<col width="112"> -->
					<%-- <col width="140">       <!--<col width="112"> --> --%>
					<col width="80">        <!--<col width="92">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="48">        <!--<col width="72">  -->
					<col width="48">        <!--<col width="72">  -->
					<col width="285">       <!--<col width="180"> -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
				</colgroup>
				<thead>
					<tr>
						<th onclick="sortTable('a');" class="hand bgYlw">입력자<br/>▼</th>
						<th onclick="sortTable();"    class="hand bgYlw">기준일<br/>▼</th>
						<th onclick="sortTable('b');" class="hand bgYlw">회사명<br/>▼</th>
						<!-- <th class="">주소</th> -->
						<th onclick="sortTable('c');" class="hand bgYlw">별표<br/>▼</th>
						<th class="bgYlw">분석<br/>유효기간</th>
						<th class="bgYlw">주가<br/>등락률</th>
						<th class="bgYlw">구분</th>		<%-- 정보정리<br/> --%>						
						<th class="">내용</th>
						<th class="bgYlw">기준일<br/>주가</th>
						<th class="bgYlw">현재가</th>
						<th class="bgYlw">현재<br/><nobr>상승률<small> (%)</small></nobr></th>
						<th class="bgYlw">최저가</th>
						<th class="bgYlw">최저<br/><nobr>상승률<small> (%)</small></nobr></th>
						<th class="bgYlw">최고가</th>
						<th class="bgYlw" style="width:65px">최고<br/><nobr>상승률<small> (%)</small></nobr></th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:145px;">
			<table class="t_skinR00" id="SGridTarget" style="table-layout:fixed;">
				<colgroup>
					<col width="52">        <!--<col width="72">  -->
					<col width="62">        <!--<col width="92">  -->
					<col width="112">       <!--<col width="112"> -->
					<%-- <col width="140">       <!--<col width="112"> --> --%>
					<col width="80">        <!--<col width="92">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="48">        <!--<col width="72">  -->
					<col width="48">        <!--<col width="72">  -->
					<col width="285">       <!--<col width="180"> -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
					<col width="50">        <!--<col width="72">  -->
				</colgroup>
				<tbody>
					<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
					<tr id="excelContentRow">
						<td class="cent">${financ.rgNm}</td>
					<input type="hidden" id="snb${financStatus.count}" value="${financ.sNb }"/>
						<td class="cent"><div title="별표,분석유효기간 입력일 : ${financ.infoRgDt}">${financ.rgDt}</div></td>
						<td class="cent bold navy" onclick="popUp('','rcmdCpn','','${financ.cpnSnb}');"><a>${financ.cpnNm}</a></td>
						<%-- <td class="">
							${fn:substring(financ.cpnAddr, 0, 17)}
							<c:if test="${fn:length(financ.cpnAddr) > 17 }">...</c:if>
						</td> --%>
						<td class="cent"><c:if test="${not empty financ.star}">
							<c:forEach var="starC" begin="1" end="${financ.star}">
								<img class="filePosition" id="file${starC}" src="../images/figure/star_y.png" style="width:16px;height:16px;"/>
							</c:forEach>
							<c:forEach var="starC" begin="${financ.star+1}" end="5">
								<img class="filePosition" id="file${starC}" src="../images/figure/star_g.png" style="width:16px;height:16px;"/>
							</c:forEach>
							<span class="textStar" style="display:none;" >${financ.star }</span>		<!-- 엑셀 저장시 표시 -->
						</c:if></td>
						<td class="cent">${financ.expTerm} 개월</td>						
						<td class="cent">
							<c:if test="${not empty financ.expStartPrice and not empty financ.expPrice}">
								<c:choose>
									<c:when test="${(financ.expPrice - financ.expStartPrice) ge 0}"><font color=red></c:when>
									<c:otherwise><font color=blue></c:otherwise>
								</c:choose>
								
								<fmt:formatNumber value="${((financ.expPrice - financ.expStartPrice) / financ.expStartPrice) * 100}" pattern=".0"/> %
								<%-- <br/>(${financ.expPrice} &nbsp;, ${financ.expStartPrice}) --%>
							</c:if>
							<c:choose>
								<c:when test="${empty financ.expStartPrice and empty financ.expPrice}"><font color=silver>비상장</font></c:when>
								<c:when test="${financ.expDt gt financ.nowDt}"><font color=silver>날짜남음</font></c:when>								
								<c:otherwise><font color=silver></font></c:otherwise>
							</c:choose>
							
						</td>
						<td class="cent">${financ.tmpNum1}</td>
						<td class="hand" onclick="statsOfferdivAjax(event,'${financ.rgNm}',this,'${financ.sNb}','')">
							<a class="textSub">${fn:substring(financ.comment, 0, 42)}
							<c:if test="${fn:length(financ.comment) > 42 }">...</c:if>
							</a>
							<%-- <span style="display:none;" >${financ.comment }</span> --%>						<!-- 엑셀 저장시 표시 -->
						</td>
						
						<td class="cent"><fmt:formatNumber value="${financ.regPrice}" type="currency" currencySymbol=""/>
							<c:if test="${empty financ.expStartPrice and empty financ.expPrice}"><font color=silver>비상장</font></c:if>
						</td>
						<td class="cent"><fmt:formatNumber value="${financ.curPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.curPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.curPrice-financ.regPrice)<0}">blue</c:if>"><c:if test="${not empty financ.curPrice}"><fmt:formatNumber value="${(financ.curPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
						<td class="cent"><fmt:formatNumber value="${financ.minPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.minPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.minPrice-financ.regPrice)<0}">blue</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.minPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
						<td class="cent"><fmt:formatNumber value="${financ.maxPrice}" type="currency" currencySymbol=""/></td>
						<td class="cent <c:if test="${(financ.maxPrice-financ.regPrice)>0}">red</c:if> <c:if test="${(financ.maxPrice-financ.regPrice)<0}">blue</c:if>"><c:if test="${not empty financ.regPrice}"><fmt:formatNumber value="${(financ.maxPrice-financ.regPrice)/financ.regPrice *100}" pattern="0.00"/>%</c:if></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</div>
</body>
</html>