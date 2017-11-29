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
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script> 
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drag-1.5.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.event.drop-1.2.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<script>
$(document).ready(function(){
	$(".t_skinR00 tbody tr:odd").css("background-color", "#F6F9FB");
	var tempX=0;
	window.onscroll = function(){//alert($("#fixedTop").attr('class'));
		var scrollX = window.scrollX || document.documentElement.scrollLeft;
		if(tempX != scrollX){
			//alert("좌우스크롤");
			$("#fixedTop").css('right',scrollX);
		}
	    tempX = scrollX;
	};
	
	
	
	//20150901
	setSortBtn();		//정렬버튼 모양 세팅 함수 호출
	
});



function addDeal(cpnId,th){
	var obj = $(th).parent().parent().parent();
	//var tm = obj.find('td:eq(0)').html();
	var tm = $("#CurDay").val();
	var tmArr = tm.split('-');
	var comment = "주관사 : "+obj.find('td:eq(9)').html();
	comment += "\n["+obj.find('td:eq(1)').html()+"] "+obj.find('td:eq(3)').html();
	comment += "\n 발행규모 "+obj.find('td:eq(4)').html()+"억, 할인율 "+obj.find('td:eq(8)').html();
	
	var data = {
			choice_year: tmArr[0]
			,choice_month: tmArr[1]
			,day: tmArr[2]
			,middleOfferCd:'00003'
			,cpnId: cpnId
			,price: obj.find('td:eq(4)').html()+"억"
			,categoryCd: '00004'
			,memo: comment
			,dueDt: obj.find('td:eq(6)').html()
			,rgId: $("#rgstId").val()
			};
	var url = "../work/insertDeal.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}

function validation(obj){
	if(obj.attr('id')=='tblSh00'){
		if(obj.find("[id^=tm]").val().is_null()){
			alert("공시일자를 입력하시요.\n\n예) 2016-01-01");
			return false;
		}
		if(obj.find("[id^=AP_cpnId]").val().is_null()){
			alert("회사를 선택하시요.");
			return false;
		}
	}
		
	/*
	var pri =  obj.find("[id^=ratio]").val();
	if(parseFloat(pri)>1) {
		alert("할인율은 퍼센트문자를 지우고, 0.xxx 와 같이 소수로 입력하세요.");
		return false;
	}
	if(obj.find("[id^=cate]").val().is_null()){
		alert("구분을 입력하시요.");
		return false;
	}

	if(obj.find("[id^=way]").val().is_null()){
		alert("증자방식을 입력하시요.");
		return false;
	}
	if(obj.find("[id^=pri]").val().is_null()){
		alert("발행규모를 입력하시요.");
		return false;
	}
	if(obj.find("[id^=subdt]").val().is_null()){
		if(confirm("청약일이 입력되지 않았습니다! 그대로 등록하시겠습니까?")){		//20150724 청약일 입력안해도 저장되도록 수정
			//////////go/////////
		}else{
			return;
		}
		//alert("청약일을 입력하시요.");
		//return false;
	}
	if(obj.find("[id^=ratio]").val().is_null()){
		alert("할인율을 입력하시요.");
		return false;
	}
	*/
	return true;
}
function insertNoticeSh(th){
	var obj = $(th).parent().parent();
	if(!validation(obj)) return;
	var data = {
			tmDt: 			obj.find('input:eq(0)').val()
			,cpnId: 		obj.find('input:eq(1)').val()
			,debtor: 	obj.find('input:eq(2)').val()			
			,majorSh: 			obj.find('input:eq(3)').val()
			,totalCount: 		obj.find('input:eq(4)').val()
			,creditor: 	obj.find('input:eq(5)').val()
			,securityAmount: 		obj.find('input:eq(6)').val()
			,securityType: obj.find('input:eq(7)').val()
			,securityShareCnt: 	obj.find('input:eq(8)').val()
			,keepYn: 		obj.find('input:eq(9)').val()
			,securityDt: 	obj.find('input:eq(10)').val()
			,comment: 	obj.find('input:eq(11)').val()
			,rgId: 			$("#rgstId").val()
	};	
	var url = "../work/insertPublicNoticeSh.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}
function modifyNoticeSh(th){
	var obj = $(th).parent().parent();
	if(!validation(obj)) return;
	var data = {
			sNb: 				obj.find('input:eq(0)').val()
			,tmDt: 				obj.find('input:eq(1)').val()			
			,debtor: 			obj.find('input:eq(2)').val()			
			,majorSh: 			obj.find('input:eq(3)').val()
			,totalCount: 		obj.find('input:eq(4)').val()
			,creditor: 			obj.find('input:eq(5)').val()
			,securityAmount: 	obj.find('input:eq(6)').val()
			,securityType: 		obj.find('input:eq(7)').val()
			,securityShareCnt: 	obj.find('input:eq(8)').val()
			,keepYn: 			obj.find('input:eq(9)').val()
			,securityDt: 		obj.find('input:eq(10)').val()
			,comment: 			obj.find('input:eq(11)').val()
			,rgId: 				$("#rgstId").val()
	};
	
	
	var url = "../work/modifyPublicNoticeSh.do";
	var fn = function(){
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}
function deleteNotice(snb){
	var url = "<c:url value='/work/deletePublicNotice.do'/>"
		, data = {sNb:snb}
		, fn = function(arg){
			document.modifyRec.submit();
		};
		ajaxModule(data,url,fn);
}

//20150901 추가(엑셀다운로드)
function excelDownload(){
	$('body').append('<iframe id="excelDown" style="display:none;"></iframe><form id="excelform"></form>');
	$('#excelform').attr('action',"../work/excelPublicNoticeSh.do");
	$('#excelform').attr('target','excelDown');
	$('#excelform').submit();
}

var sortBtn = '${sortBtn}';		//정렬한 곳 숫자값 ('1',~'5')
function setSortBtn(){
	var sign;
	if(sortBtn == undefined || sortBtn == null || sortBtn == '' || sortBtn == '0'){
		sign = 1;
		sortBtn = 1;
	}else{
		sign = ((1 * sortBtn) > (-1 * sortBtn))? 1:-1;
	}// 1:정방향정렬, -1:역방향정렬
	 
	for(var i=1; i<=5; i++){
		var btnShape = '▽';		
		if(sortBtn == i){
			btnShape = '▲';
		}else if((sortBtn * -1) == i){
			btnShape = '▼';
		}
		$('#sortBtn'+i).html(btnShape);		//모양세팅
	}
}

</script>

<script>
var myModal = new AXModal();		// instance

var fnObj = {
	//화면세팅
    pageStart: function(){
    	
    	//-------------------------- 모달창 :S -------------------------
    	myModal.setConfig({
    		windowID:"myModalCT",
    		//openModalID:"kkkkk",
    		width:740,
            mediaQuery: {
                mx:{min:0, max:767}, dx:{min:767}
            },
    		displayLoading:true,
            scrollLock: true,
    		onclose: function(){
    			//toast.push("모달 close");

				//if(window[myModal.winID].isSaved == false){		//저장을 안한상태로 창이 닫힐때, 이미 업로드한 파일은 삭제
    			//	window[myModal.winID].fnObj.deleteFile();	//팝업창 내 파일삭제함수 호출.
    			//}    			
    		}
    	});
    	//-------------------------- 모달창 :E -------------------------
    },
  	
    //공지사항 등록
    noticeShPopup: function(modeVal, sNb){
    	
   		var url = "<c:url value='/work/noticeShPopup.do'/>";
       	var params = {
       		mode:modeVal,
       		sNb:sNb
       	};	//"btype=1&cate=1".queryToObject();		//게시판유형(board_type), 게시판 카테고리 를 넘긴다. 
       	
       	myModal.open({
       		url: url,
       		pars: params,
       		titleBarText: '공시등록',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
       		method:"POST",
       		top: 150,
       		width: 720,
       		closeByEscKey: true				//esc 키로 닫기
       	});
       	    	
       	$('#myModalCT').draggable();
    	
    },
    
    doSearch : function(){
    	location.href ="<c:url value='/work/selectPublicNoticeSh.do'/>";	
    }
};


$(function() {
  $( "#tblSh00" ).draggable();
  
  fnObj.pageStart();		//화면세팅
});
</script>
</head>
<style> 
tbody tr:hover{background-color: moccasin !important;} input{margin:4px 0px;padding:2px 0px !important;}

.popUpMenu #closeTab{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}

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
<body>
<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	
		<article>
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		<input type="hidden" id="CurDay" value="${cur_day}"/>
		
		<form name="modifyRec" action="<c:url value='/work/selectPublicNoticeSh.do' />" method="post"><input type="hidden" name="sorting" id="sorting"><input type="hidden" name="total" value="${ttT}"></form>
		<input type="hidden" id="SendReceive" value="MR">
		
		<div class="fixedTop" style="z-index:10;">

			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectPublicNoticeSh.do' />">
				<input type="hidden" name="total" id="total">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<fmt:formatDate var="cur_year" value='${now}' pattern='yyyy'/>
								
					<%-- <span class="year">
						<select id='deal_select_year' name='choice_year'>
							<c:forEach var="year" begin="2011" end="${cur_year}">
								<option value="${year}"
								<c:choose>
									<c:when test="${choice_year == null}">
										<c:if test="${year == cur_year}">selected</c:if>>
									</c:when>
									<c:otherwise>
										<c:if test="${year == choice_year}">selected</c:if>>
									</c:otherwise>
								</c:choose> 
								${year}</option>
							</c:forEach>
						</select>
					</span>
					<span class="btn s red"><a onclick="totalView('total');">전체</a></span> --%>
				공시 <small>(최대주주변경과 관련)</small>
					&nbsp;&nbsp;<span class="btn s green"><a onclick="fnObj.noticeShPopup('new');">공시입력</a></span>
					&nbsp;&nbsp;<!-- <span class="btn s"><a onclick="javascript:excelDownload(this,event);">엑셀 다운로드</a>  -->
				</h2>
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
	
			<table class="t_skinR00">
				<thead>
					<tr>
						<th class="hand pd0" style="width:70px">공시일자<br/><div id="sortBtn1"></div></th>	<%--▽ --%>
						<th class="hand pd0" style="width:120px">회사명<br/></th>
						<th class="hand pd0" style="width:150px">채무자<br/><div id="sortBtn2"></div></th>
						<th class="hand pd0" style="width:150px">담보제공자<br/></th>
						<th class="hand pd0" style="width:40px">내역<br/></th>
						<th class="hand pd0" style="width:250px">담보권자<br/></th>
						<th class="hand pd0" style="width:110px">담보설정금액<br/></th>
						<th class="hand pd0" style="width:60px">담보권<br/>종류</th>
						<th class="hand pd0" style="width:70px">담보제공<br/>주식수<br/></th>
						<th class="hand pd0" style="width:40px">보호<br/>예수</th>
						<th class="hand pd0" style="width:150px">담보제공기간<br/></th>
						<th class="hand pd0">기타</th>						
					</tr>
				</thead>
				</table></div>
			<div>
			<table class="t_skinR00">
				<tbody>
					<c:forEach var="nt" items="${NoticeShList}" varStatus="ntS">
					
						<tr 
							<%-- <c:choose>
								<c:when test="${offer.progressCd == '10000'}"> style="background-color:#B9B9B9" </c:when>
								<c:otherwise> <c:if test="${offer.progressCd == '00002'}">style="background-color:#E7E7E7"</c:if><c:if test="${offer.progressCd == '00003'}">style="background-color:#A9F5BC"</c:if><c:if test="${fn:length(offer.cpnId) == 7}"> style="background-color:#CEF6EC"</c:if></c:otherwise>
							</c:choose> --%>
						>
							<td class="cent" style="width:69px;padding: 5px 0px;"><a onclick="javascript:fnObj.noticeShPopup('edit', '${nt.sNb}')">${nt.tmDt}</a></td>							
							<td class="cent pd0" style="width:120px"><a onclick="popUp('','rcmdCpn','','${nt.cpnSnb}')" style="cursor:pointer;">${nt.cpnNm}</a></td>
							<td class="cent pd0" style="width:150px"><a onclick="javascript:fnObj.noticeShPopup('edit', '${nt.sNb}')">${nt.debtor}</a></td>
							<td class="cent pd0" style="width:150px"><a onclick="javascript:fnObj.noticeShPopup('edit', '${nt.sNb}')">${nt.majorSh}</a></td>
							<td class="cent pd0" style="width:40px">${nt.totalCount}</td>
							<td class="cent pd0" style="width:250px">${nt.creditor}</td>
							<td class="cent pd0" style="width:110px">${nt.securityAmount}</td>
							<td class="cent pd0" style="width:60px">${nt.securityType}</td>
							<td class="cent pd0" style="width:70px">${nt.securityShareCnt}</td>
							<td class="cent pd0" style="width:40px">${nt.keepYn}</td>
							<td class="cent pd0" style="width:150px">${nt.securityDt}</td>
							<td class="cent pd0 w100p">${nt.comment}</td>														
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
		<div class="popUpMenu" style="width:1250px;display:none" id="tblSh00">
			<p id="closeTab" class="closeTab" style="display:block;"><span class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</span></p>
			<table class="t_skinR00">
				<thead>
					<tr>
						<th class="" style="width:60px;border-radius:0px;">공시일자</th>						
						<th class="pd0 w120p">회사명</th>
						<th class="pd0 w80p">채무자</th>
						<th class="pd0 w80p">담보제공자</th>
						<th class="pd0 w40p">내역</th>
						<th class="pd0 w120p">담보권자</th>
						<th class="pd0 w80p">담보설정금액</th>
						<th class="pd0 w40p">담보권<br>종류</th>
						<th class="pd0 w120p">담보제공<br>주식수</th>
						<th class="pd0 w40p">보호<br>예수</th>
						<th class="pd0 w120p">담보제공기간</th>
						<th class="" style="width:300px;border-radius:0px;">기타</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cent pd0" ><input type="text" class="w96" id="tm"></td>
						<td class="cent pd0"><input type="hidden" class="w96" id="AP_cpnId_00"><span class="btn s orange" style="vertical-align:top;"><a onclick="popUp('00','c')" id="AP_cpnNm_00" class="c_title">회사선택</a></span></td>
						<td class="cent pd0"><input type="text" class="w96" id="cate"></td>						
						<td class="cent pd0"><input type="text" class="w96" id="way"></td>
						<td class="won"><input type="text" class="w96 intNum" id="price00" onKeyPress="return numbersonly(event, false)"/></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id="subdt"></td>
						<td class="cent pd0"><input type="text" class="w96" id="ratio00"></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
						<td class="cent pd0"><input type="text" class="w96" id=""></td>
					</tr>
				</tbody>
			</table>
			<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertNoticeSh(this);"><a>저장</a></span></p>
		</div>
		<c:forEach var="nt" items="${NoticeShList}" varStatus="ntS">
		<div class="popUpMenu" style="width:1250px;display:none" id="tblSh${ntS.count}">
			<p id="closeTab" class="closeTab"><span class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</span></p>
			<table class="t_skinR00">
				<thead>
					<tr>						
						<th class="" style="width:60px;border-radius:0px;">공시일자</th>						
						<th class="pd0 w120p">회사명</th>
						<th class="pd0 w80p">채무자</th>
						<th class="pd0 w80p">담보제공자</th>
						<th class="pd0 w40p">내역</th>
						<th class="pd0 w120p">담보권자</th>
						<th class="pd0 w80p">담보설정금액</th>
						<th class="pd0 w40p">담보권<br>종류</th>
						<th class="pd0 w120p">담보제공<br>주식수</th>
						<th class="pd0 w40p">보호<br>예수</th>
						<th class="pd0 w120p">담보제공기간</th>
						<th class="" style="width:300px;border-radius:0px;">기타</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<input type="hidden" value="${nt.sNb}"/>
						<td class="cent pd0" style="width:69px;padding: 5px 0px;"><input type="text" class="w96" id="tm" value="${nt.tmDt}"></td>							
						<td class="cent pd0" style="width:120px">${nt.cpnNm}</td>
						<td class="cent pd0" style="width:150px"><input type="text" class="w96" id="way" value="${nt.debtor}"></td>
						<td class="cent pd0" style="width:150px"><input type="text" class="w96" id="way" value="${nt.majorSh}"></td>
						<td class="cent pd0" style="width:50px"><input type="text" class="w96" id="way" value="${nt.totalCount}"></td>
						<td class="cent pd0" style="width:250px"><input type="text" class="w96" id="way" value="${nt.creditor}"></td>
						<td class="cent pd0" style="width:120px"><input type="text" class="w96" id="way" value="${nt.securityAmount}"></td>
						<td class="cent pd0" style="width:120px"><input type="text" class="w96" id="way" value="${nt.securityType}"></td>
						<td class="cent pd0" style="width:70px"><input type="text" class="w96" id="way" value="${nt.securityShareCnt}"></td>
						<td class="cent pd0" style="width:120px"><input type="text" class="w96" id="way" value="${nt.keepYn}"></td>
						<td class="cent pd0" style="width:80px"><input type="text" class="w96" id="way" value="${nt.securityDt}"></td>
						<td class="cent pd0" style="width:80px"><input type="text" class="w96" id="way" value="${nt.comment}"></td>
					</tr>
				</tbody>
			</table>
			<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:modifyNoticeSh(this);"><a>수정</a></span></p>
		</div>
		<script>
			$( "#tblSh${ntS.count}" ).draggable();
		</script>
		</c:forEach>
</div>
</body>
</html>
