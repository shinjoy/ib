<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.t_skin04 tbody td, .t_skin04_left tbody td {
    padding: 5px 2px;
    border-top: 1px solid #E6E6E6;
    border-bottom: 1px solid #E6E6E6;
    border-right: 1px solid #E6E6E6;
    
    
    font-size: 11px;
    /* text-align: center; */
}
/*
header, section {
    font-family: 돋움, Tahoma, Geneva, sans-serif;    
}*/
</style>

<script>
function onNoff(cstSnb,rgnm,star,stSnb){
	var flag = 0;
	if(star==0) flag = 1;
	
	var URL = "../stockFirmManage/insertStockFirmIBstar.do";
	$.ajax({
		type:"POST",        //POST GET
		url:URL,     //PAGEURL
		data : ({
			 cstSnb: cstSnb
			,rgNm: rgnm
			,star: flag
			,starSnb: stSnb
		}),
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			selectStockFirmIb(rgnm,'','B');
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}

function slctIbCst(sNb,th){
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.target = "stockCstFrame";//target frame name
	frm.submit();

	$('.t_skin04_cstNcpn tr.LK2nd').css('background-color','');
	$('.t_skin04_cstNcpn tr.LK2nd').css('color','black');
	$(th).parent('tr').css('background-color','#75c5de');
	$(th).parent('tr').css('color','white');

	resize_iframe();
}


//체크박스 전체 체크
function allCheck(){
	
	var chkList = document.getElementsByName('mCheck');
	var toBe = document.getElementsByName('allChk')[0].checked;
	for(var i=0; i<chkList.length; i++){
   		chkList[i].checked = toBe;		//체크여부       		
   	}	
}

//직원별 증권사IB 고객 정보 호출 ... 신규메뉴(담당자별NEW) 에 정의된 함수 호출
function selectStockFirmIbNewToSortT(Col){
	/*
	Col - 'CPN'(증권사), 'NM'(이름), 'CDATE'(최근연락)
	*/
	parent.leftFrame.selectStockFirmIbNewToSort(Col);
}

</script>

<div style="overflow-y:scroll;overflow-x:hidden;border:0px solid #eeeeee;">
<table class="t_skin04_cstNcpn" style="width:100%; table-layout:fixed;">
	<colgroup>
		<col width="3%" />
		<col width="10%" />
		<col width="5%" />
		<col width="13%">
		<col width="4%" />
		
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		
		<col width="8%" /> 
		<c:if test="${fn:length(cstList) > 0 and (userLoginInfo.name eq cstList[0].myNm or userLoginInfo.permission > '00019' ) }">
		<col width="10%" /> <!-- 연락처1 -->
		<col width="8%" /> <!-- 연락처2 -->
		</c:if>
		<col width="7%" />
		<col width="7%" />
		<%--<col width="3%" /> --%>
	</colgroup>
	<tr style="padding:5px 7px;font-family: 돋움, Tahoma, Geneva, sans-serif;">
		<td class="cent bgYlw"><input type="checkbox" name="allChk" onclick="allCheck();" /></td>
		<td class="cent bgYlw" onclick="selectStockFirmIbNewToSortT('CPN');" style="cursor:pointer;"><b>증권사(회사)</b>&nbsp;<span id="sortBtnCPN">▽</span></td>
		<td class="cent bgYlw" onclick="selectStockFirmIbNewToSortT('NM');" style="cursor:pointer;"><b>이름</b>&nbsp;<span id="sortBtnNM">▽</span></td>
		<td class="cent bgYlw"><b>직책/직급</b></td>
		<td class="cent bgYlw"><b>전화</b></td>
		<td class="cent bgYlw"><b>미팅</b></td>
		<td class="cent bgYlw"><b>저녁<br/>미팅</b></td>
		<td class="cent bgYlw"><b>딜</b></td>
		<td class="cent bgYlw"><b>성과</b></td>
		<td class="cent bgYlw"><b>규모</b></td>
		<td class="cent bgYlw" onclick="selectStockFirmIbNewToSortT('CDATE');" style="cursor:pointer;"><b>최근연락</b>&nbsp;<span id="sortBtnCDATE">▽</span></td>
		<c:if test="${fn:length(cstList) > 0 and (userLoginInfo.name eq cstList[0].myNm or userLoginInfo.permission > '00019' ) }">
		<td class="cent bgYlw"><b>연락처1</b></td>
		<td class="cent bgYlw"><b>연락처2</b></td>
		</c:if>
		<%--<td class="cent bgYlw"><b>담당자총수</b></td> --%>
		<td class="cent bgYlw"><b>직전담당자</b></td>
		<td class="cent bgYlw"><b>현재담당자</b></td>
		<%--<td class="cent bgYlw"><b>즐겨<br/>찾기</b></td> --%>
	</tr>
</table>
</div>
<%--<div id="ddddd" style="height:400px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;"></div> --%>
<div style="height:775px;overflow-y:scroll;overflow-x:hidden;border:0px solid #eeeeee;">
<table class="t_skin04_cstNcpn" style="width:100%; table-layout:fixed;">
	<colgroup>
		<col width="3%" />
		<col width="10%" />
		<col width="5%" />
		<col width="13%">
		<col width="4%" />
		
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		<col width="4%" />
		
		<col width="8%" /> 
		<c:if test="${fn:length(cstList) > 0 and (userLoginInfo.name eq cstList[0].myNm or userLoginInfo.permission > '00019' ) }">
		<col width="10%" /> <!-- 연락처1 -->
		<col width="8%" /> <!-- 연락처2 -->
		</c:if>
		<col width="7%" />
		<col width="7%" />
		<%--<col width="3%" /> --%>
	</colgroup>
	<c:forEach var="cst" items="${cstList}"><tr class="link LK2nd">
		<td class="cent" title="선택"><input type="checkbox" name="mCheck" value="${cst.sNb}" /></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);">${cst.cpnNm }</td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);">&nbsp;<b>${cst.cstNm }</b>&nbsp;</td>
		<%--<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>${fn:substring(cst.position,0,5) }<c:if test="${fn:length(cst.position) > 4}">...</c:if></nobr></td> --%>
		<td class="" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);">&nbsp;${cst.position}</td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.callCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.meetCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.nightMeetCnt }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.dealCnt  }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.dealSCnt }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.price    }&nbsp;</nobr></td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.tmDt     }&nbsp;</nobr></td>
		<c:if test="${fn:length(cstList) > 0 and (userLoginInfo.name eq cstList[0].myNm or userLoginInfo.permission > '00019' ) }">
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);">&nbsp;${cst.phn1     }&nbsp;</td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);">&nbsp;${cst.phn2     }&nbsp;</td>
		</c:if>
		<%--<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;${cst.usrCnt   }&nbsp;</nobr></td> --%>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;
			<c:choose>
			<c:when test="${cst.usrCnt > 1}">
			<c:set var="usrList" value="${fn:split(cst.usrNm, ' > ')}" />
			<c:if test="${usrNm eq usrList[cst.usrCnt - 2]}"><b><font color=blue></c:if>
			<c:out value="${usrList[cst.usrCnt - 2]}" />
			</c:when>
			<c:otherwise>
			<%--<c:out value="${cst.usrNm}" /> --%>
			</c:otherwise>
			</c:choose>
			&nbsp;</nobr>
		</td>
		<td class="cent" title="${cst.position }" onclick="slctIbCst('${cst.sNb}',this);"><nobr>&nbsp;			
			<c:set var="usrList" value="${fn:split(cst.usrNm, ' > ')}" />
			<c:if test="${usrNm eq usrList[cst.usrCnt - 1]}"><b><font color=blue></c:if>			
			<c:out value="${usrList[cst.usrCnt - 1]}" />
			&nbsp;</nobr>
		</td>
		<%--<td class="cent" title="북마크"><img class="bd0 bookmark" <c:if test="${userLoginInfo.permission > '00019'  or userLoginInfo.name==cst.rgNm}">onclick="onNoff('${cst.sNb}','${cst.rgNm}','${cst.star}','${cst.starSnb}');"</c:if> <c:if test="${cst.star==0}">src="<c:url value='/images/bookmark/Bookmark round.png' />"</c:if><c:if test="${cst.star==1}">src="<c:url value='/images/bookmark/Bookmark-16.png' />"</c:if> style="width:16px;height:16px" alt="bookmark"></td> --%>
	</tr></c:forEach>
</table>
</div>

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
	<input type="hidden" name="part" value="bondIbPart">	<!-- 담당자별 증권사 IB 정보 화면에서 보여지는 간단한 화면을 return 하기 위한 구분자 -->
</form>
