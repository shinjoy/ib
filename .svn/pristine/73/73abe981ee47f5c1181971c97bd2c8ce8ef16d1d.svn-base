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
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=2.1'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/popUp.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

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
	
	$(".popUpMenu").show();
	
 });

 function validation(tblCnt){
	for(var i=1;i<4;i++){
	 	var rto =  $("#tbl"+tblCnt+" input[id^=ratio"+i+"]").val();
	 	if(parseFloat(rto)>1) {
	 		alert("퍼센트문자를 지우고, 0.xxx 와 같이 소수로 입력하세요.");
	 		return false;
	 	}
	}
	if(isNullAlert(tblCnt,'tm','접수일자를'))
		return false;
	if(isNullAlert(tblCnt,'way','방법을'))
		return false;
	if(isNullAlert(tblCnt,'cate','구분을'))
		return false;
	/* if(isNullAlert(tblCnt,'AP_cpnId','회사를'))
		return false; */
	if(isNullAlert(tblCnt,'rank','회차를'))
		return false;
	if(isNullAlert(tblCnt,'pri','금액을'))
		return false;
	if(isNullAlert(tblCnt,'wrtDueDt','워런트만기일을'))
		return false;
	if(isNullAlert(tblCnt,'refix','리픽싱을'))
		return false;

 	return true;
 }
 
 function isNullAlert(tblCnt, id, text){
	 if($("#tbl"+tblCnt+" input[id^="+id+"]").val().is_null()){
		alert(text+" 입력하십시요.");
		return true;
	}
 }
 
 function modifyNotice(tblCnt){
	//var obj = $(th).parent().parent();
	if(!validation(tblCnt)) return;
	
	var cpnIdList = [];
	var investorPriceList = [];
	var idListStr = '';
	var priceListStr = '';
	
	var rcUnderWriterCnt = $("#tbl"+tblCnt+" tr[id^=rcUnderWriterTr]").size();
	$("#tbl"+tblCnt+" input[id=rcUnderWriterCnt]").val(rcUnderWriterCnt);
	
	if(rcUnderWriterCnt > 0){
		for(var i=0;i<rcUnderWriterCnt;i++){
			if($("#tbl"+tblCnt+" input[id=rcUnderWriterDelFlag"+i+"]").val()=='N'){
				cpnIdList.push($("#tbl"+tblCnt+" input[id=rcUnderWriterId"+i).val());
				investorPriceList.push($("#tbl"+tblCnt+" input[id=rcUnderWriterPrice"+i).val());
				
				//인수자 필수체크 안함 20170911 ksm
				/* if(isNullAlert(obj,'rcUnderWriterNm'+i,'인수자를')){
					$("#rcUnderWriterNm"+i).focus();
					return;
				}
				
				if(isNullAlert(obj,'rcUnderWriterPrice'+i,'인수자당 투자금액을')){
					$("#rcUnderWriterPrice"+i).focus();
					return;
				}	 */			
			}
		}	
	}
	var modifyUnderWriterCnt = $("#tbl"+tblCnt+" tr[id^=modifyUnderWriterTr]").size();

	$("#tbl"+tblCnt+" input[id=modifyUnderWriterCnt").val(modifyUnderWriterCnt);

	if(modifyUnderWriterCnt > 0){
		for(var i=0;i<modifyUnderWriterCnt;i++){
			if($("#tbl"+tblCnt+" input[id=modifyUnderWriterDelFlag"+i+"]").val()=='N'){			
				cpnIdList.push($("#tbl"+tblCnt+" input[id=modifyUnderWriterId"+i+"]").val());
				investorPriceList.push($("#tbl"+tblCnt+" input[id=modifyUnderWriterPrice"+i+"]").val());
				
				//인수자 필수체크 안함 20170911 ksm
				/* if($("#tbl"+tblCnt+" input[id=modifyUnderWriterNm"+i+"]").val().is_null()){
					alert("인수자를 입력하십시요.");
					$("#tbl"+tblCnt+" input[id=modifyUnderWriterNm"+i+"]").focus();
					return;
				}
				if($("#tbl"+tblCnt+" input[id=modifyUnderWriterPrice"+i+"]").val().is_null()){						
					alert("인수자당 투자금액을 입력하십시요.");
					$("#tbl"+tblCnt+" input[id=modifyUnderWriterPrice"+i+"]").focus();
					return;
				} */
			}
		}
	}
	
	/* if(confirm('테스트')){
		
	}else{
		alert(cpnIdList);
		return;
	} */
		
	if(cpnIdList.length > 0){
		idListStr = cpnIdList.join('::');
	}
	if(investorPriceList.length > 0){
		priceListStr = investorPriceList.join('::');
	}
	
	var data = {
			sNb: 		$("#tbl"+tblCnt+" input:eq(20)").val()
			,tmDt: 		$("#tbl"+tblCnt+" input:eq(0)").val()
			,way: 		$("#tbl"+tblCnt+" input:eq(1)").val()
			,categoryCd: $("#tbl"+tblCnt+" input:eq(2)").val()
			,rank: 		$("#tbl"+tblCnt+" input:eq(4)").val()
			,price: 	$("#tbl"+tblCnt+" input:eq(5)").val().replace(',','')
			,coupon: 	$("#tbl"+tblCnt+" input:eq(6)").val()
			,ytm: 		$("#tbl"+tblCnt+" input:eq(7)").val()
			,ytp: 		$("#tbl"+tblCnt+" input:eq(8)").val()
			,payupDt: 	$("#tbl"+tblCnt+" input:eq(9)").val()						//납입일
			,dueDt: 	$("#tbl"+tblCnt+" input:eq(10)").val()						//발행경과일
			,put: 		$("#tbl"+tblCnt+" input:eq(11)").val()
			,eventPrice:$("#tbl"+tblCnt+" input:eq(12)").val().replace(',','')
			,wrtDueDt: 	$("#tbl"+tblCnt+" input:eq(13)").val()
			,refixSale: ($("#tbl"+tblCnt+" input:eq(14)").val().indexOf('%')>-1) ? $("#tbl"+tblCnt+" input:eq(14)").val().replace('%','')/100:$("#tbl"+tblCnt+" input:eq(14)").val()
			,superCpn: 	$("#tbl"+tblCnt+" input:eq(15)").val()
			,buyback: 	$("#tbl"+tblCnt+" input:eq(16)").val()
			,premium: 	$("#tbl"+tblCnt+" input:eq(17)").val()
			,target: 	$("#tbl"+tblCnt+" input:eq(18)").val()
			,relation: 	$("#tbl"+tblCnt+" input:eq(19)").val()
			,rgId: $("#rgstId").val()
			
			,cpnId: 	$("#tbl"+tblCnt+" input:eq(3)").val()	//회사추가 20150818
			,idListStr : idListStr
			,priceListStr : priceListStr
	};	
	var url = "<c:url value='/work/modifyPublicNoticeMezzanine.do'/>";
	var fn = function(){
		//toast.push('수정되었습니다.');
		alert('수정되었습니다.');
		opener.location.reload();
		window.close();
	};
	
	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
   	var beforeFn = function(){
   		// 로딩 이미지 보여주기 처리
   		$('.wrap-loading', parent.mainFrame.document).removeClass('display-none');
   	};
   	var completeFn = function(){
   		// 로딩 이미지 감추기 처리
        //$('.wrap-loading', parent.mainFrame.document).addClass('display-none');  >> 계속 유지하다가 submit 마무리 되면 어차피 화면 재로딩 되며 사라진다.
   	};
   	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
   	
   	//commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
   	commonAjax("POST", url, data, fn);
}
 
//숫자만 입력 가능 20170807 ksm
function OnlyNum(Value) {
	var re = /[^0-9\.\,\-]/gi;
	return Value.replace(re,"");
}

//인수자당 투자 금액 총합 20170807 ksm
function sumPrice(flag, cnt){
	var size = $("#tbl"+cnt+" input[id^="+flag+"UnderWriterPrice]").size();
	var otherSize = "";
	var priceSum = 0;
	if(flag == 'modify'){
		otherSize = $("#tbl"+cnt+" input[id^=rcUnderWriterPrice]").size();
		for(var i=0;i<otherSize;i++){
			var rcPrice = $("#tbl"+cnt+" input[id=rcUnderWriterPrice"+i+"]").val();
			if($("#tbl"+cnt+" input[id=rcUnderWriterDelFlag"+i+"]").val()=='N' && 
					OnlyNum(rcPrice) != ""){
					priceSum += parseFloat(rcPrice);
			}
		}
		
	}else if(flag == 'rc'){
		otherSize = $("#tbl"+cnt+" input[id^=modifyUnderWriterPrice]").size();
		for(var i=0;i<otherSize;i++){
			var modifyPrice = $("#tbl"+cnt+" input[id=modifyUnderWriterPrice"+i+"]").val();
			if($("#tbl"+cnt+" input[id=modifyUnderWriterDelFlag"+i+"]").val()=='N' 
					&& OnlyNum(modifyPrice) != ""){
					priceSum += parseFloat(modifyPrice);
			}
		}
	}
	
	for(var i=0;i<size;i++){
		var flagPrice = $("#tbl"+cnt+" input[id="+flag+"UnderWriterPrice"+i+"]").val();
		if($("#tbl"+cnt+" input[id="+flag+"UnderWriterDelFlag"+i+"]").val()=='N' 
				&& OnlyNum(flagPrice) != ""){
				priceSum += parseFloat(flagPrice);
		}
	}
	
	$("#tbl"+cnt+" input[id=pri]").val(priceSum);
}

//인수자, 인수자당 투자금액 Row 추가 20170803 ksm
var g_WriterCnt = 0;
function addRow(flag, tblCnt){
	
	//창 높이 늘리기
	window.resizeTo(window.outerWidth, window.outerHeight + 20);
	
	
	g_WriterCnt++;

	if($("#tbl"+tblCnt+" input[id^=rcUnderWriterPrice]").size() > 0){
		if($("#tbl"+tblCnt+" #modifyUnderWriter tr[id^=modifyUnderWriterTr]").size() == 0){		//추가한 row가 없을 경우 cnt는 0부터 
			g_WriterCnt = 0;	
		}
	}
	
	var str = "<tr id='"+flag+"UnderWriterTr"+g_WriterCnt+"' >";
	str += "<input type='hidden' name='"+flag+"UnderWriterDelFlag"+g_WriterCnt+"' id='"+flag+"UnderWriterDelFlag"+g_WriterCnt+"' value='N' />";
	str += "<td class='cent bgWht pd0' style='border-radius:0px;'>";
	str += "<input type='text' name='"+flag+"UnderWriterNm"+g_WriterCnt+"' id='"+flag+"UnderWriterNm"+g_WriterCnt+"' size='40' readonly />";
	str += "<input type='hidden' class='w96' name='"+flag+"UnderWriterId"+g_WriterCnt+"' id='"+flag+"UnderWriterId"+g_WriterCnt+"'>";
	str += "&nbsp<span class='btn s orange' style='margin-top:-5px;'><a onclick=\"popUpInvestor('"+g_WriterCnt+"','c','"+flag+"','"+tblCnt+"')\" id='AP_cpnNm' class='c_title'>인수자 선택</a></span>";
	str += "</td>";
	str += "<td class='cent bgWht won' style='width:47px;'>";
	str += "<input type='text' class='w96' name='"+flag+"UnderWriterPrice"+g_WriterCnt+"' id='"+flag+"UnderWriterPrice"+g_WriterCnt+"' onblur=\"sumPrice('"+flag+"','"+tblCnt+"');\" /></td>";
	str += "<td class='cent bgWht pd0' style='border-radius:0px;'><span class='btn s green' onclick=\"javascript:delRow('"+g_WriterCnt+"','"+flag+"','"+tblCnt+"');\"><a>-</a></span></td></tr>";
	
	$("#tbl"+tblCnt+" tbody[id="+flag+"UnderWriter]").append(str);
}

//인수자, 인수자당 투자금액 Row 삭제 20170803 ksm
function delRow(rId, flag, cnt){
	$("#tbl"+cnt+" tr[id="+flag+"UnderWriterTr"+rId+"]").hide();
	$("#tbl"+cnt+" input[id="+flag+"UnderWriterDelFlag"+rId+"]").val('Y');		
	sumPrice(flag,cnt);
}


//인수자 선택 된것 화면에 추가 20170804 ksm
function returnPopUpInvestor(rVal){
	var flag = rVal.f
	var nm = rVal.nm
	var num = rVal.n;
	var cpnSnb = rVal.cpnSnb;
	var kind = rVal.k;
	var tblCnt = rVal.t;
	
	if(flag=='c'){
		var tmpSpan = document.createElement("span");
		tmpSpan.innerHTML = rVal.nm;
		
		var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cpnId = rVal.snb;
		
		var cpnIdList = [];
		var underWriterCnt = $("#tbl"+tblCnt+" tr[id*=UnderWriterTr]").size();
		
		//인수자 선택 중복체크
		if(underWriterCnt > 0){
			for(var i=0;i<underWriterCnt;i++){
				if($("#tbl"+tblCnt+" input[id*=UnderWriterDelFlag"+i+"]").val()=='N'){
					cpnIdList.push($("#tbl"+tblCnt+" input[id*=UnderWriterId"+i).val());
				}
			}
		}
		
		for(var i=0;i<cpnIdList.length;i++){
			if(cpnId == cpnIdList[i]){
				alert("이미 선택된 인수자입니다!");
   				return;	
			}	
		}
		cpnIdList.push(cpnId);
		$('#tbl'+tblCnt+' input[id='+kind+'UnderWriterNm'+num+']').val(cpnNm);		//회사명 표시
		$('#tbl'+tblCnt+' input[id='+kind+'UnderWriterId'+num+']').val(cpnId);		//회사Snb 저장			
		
		mnaPopup.close();	//팝업닫기
	}
}
</script>
</head>
<style>
.t_skinR00 th, .t_skinR00 td{font-size:11px !important;} 
tbody tr:hover{background-color: moccasin !important;}
input{margin:4px 0px;padding:2px 0px !important;}

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

<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>

<div id="wrap" class="content_box">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
	
	<article>
		<div class="popUpMenu" style="width:1300px;display:" id="tbl00">
			<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
			
			<div style="float:left;width:65%">
				<table class="t_skinR00" style="width:100%;float:left;">
					<thead>
						<tr>
							<th class="" style="width:120px;border-radius:0px;height:20px;">접수일자</th>
							<th class="pd0 w120p">방법</th>
							<th class="pd0 w60p">구분</th>
							<th class="pd0">회사명</th>
							<th class="pd0 w60p">회차</th>
							<th class="pd0 w90p" style="border-radius:0px;">금액<small>(억)</small></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cent bgWht pd0" style="width:70px;border-radius:0px;"><input type="text" class="w96" id="tm" value="${noticeInfo.tmDt}" /></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="way" value="${noticeInfo.way}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="cate" value="${noticeInfo.categoryCd}"/></td>
							<td class="cent bgWht pd0"><input type="hidden" class="w96" id="AP_cpnId_00" value="${noticeInfo.cpnId}">${noticeInfo.cpnNm}</td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="rank" value="${noticeInfo.rank}"/></td>
							<td class="cent bgWht won" style="width:47px;border-radius:0px;"><input type="text" class="w96" id="pri" value="${noticeInfo.price}"/></td>
						</tr>
					</tbody>
				</table>	
			
				<table class="t_skinR00" style="width:100%;">
					<thead>
						<tr>	
							<th class="pd0" style="height:30px;border-radius:0px;">쿠폰</th>
							<th class="pd0">YTM</th>
							<th class="pd0">YTP</th>
							<th class="pd0">납입일</th>
							<th class="pd0">사채만기</th>
							<th class="pd0">PUT</th>
							<th class="pd0">행사가</th>
							<th class="pd0 w120p">워런트<br/>만기</th>
							<th class="pd0" style="border-radius:0px;">리픽싱</th>
						</tr>
					</thead>
					<tbody>
						<tr>	
							<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="ratio1" value="${noticeInfo.coupon/100}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio2" value="${noticeInfo.ytm/100}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio3" value="${noticeInfo.ytp/100}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.payupDt}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.dueDt}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.put}"/></td>
							<td class="cent bgWht won" style="width:57px;"><input type="text" class="w96" id="" value="${noticeInfo.eventPrice}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="wrtDueDt" value="${noticeInfo.wrtDueDt}"/></td>
							<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="refix" value="${noticeInfo.refixSale}"/></td>
						</tr>
					</tbody>
				</table>
				
				<table class="t_skinR00" style="width:100%;">
					<thead>
						<tr>
							<th class="pd0 w200p" style="border-radius:0px;">주관회사<br/><small>(담당자)</small></th>
							<th class="pd0 w120p">BuyBack</th>
							<th class="pd0">프리미엄</th>
							<th class="pd0 w300p">대상</th>
							<th class="pd0 w120p" style="border-radius:0px;">관계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.superCpn}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.buyback}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.premium}"/></td>
							<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${noticeInfo.target}"/></td>
							<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="" value="${noticeInfo.relation}"/></td>
							<input type="hidden" value="${noticeInfo.sNb}"/>
						</tr>
					</tbody>
				</table>
			
			</div>
			
			<div style="float:left;width:35%">
				
				<table class="t_skinR00" style="width:100%;margin-top:0px;vertical-align:top;float:left;" align="right;">
					<input type="hidden" name="rcUnderWriterCnt" id="rcUnderWriterCnt" value="" />		<!-- 기존 인수자 cnt 20170808 ksm-->
					<input type="hidden" name="modifyUnderWriterCnt" id="modifyUnderWriterCnt" value="" />		<!-- 신규 인수자 cnt 20170808 ksm-->
					<thead>
						<tr>
							<th class="pd0 w100p" style="border-radius:0px;height:27px;">인수자</th>
							<th class="pd0 w70p">인수자당<br>투자금액<small>(억)</small></th>
							<th class="pd0 w30p" style="border-radius:0px;"></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(noticeInfo.receiverList) gt 0}">
								<c:forEach var="rc" items="${noticeInfo.receiverList}" varStatus="rcS">
									<tr id='rcUnderWriterTr${rcS.index}'>
									<input type="hidden" name='rcUnderWriterDelFlag${rcS.index}' id='rcUnderWriterDelFlag${rcS.index}' value='N' />
										<td class='cent bgWht pd0' style='border-radius:0px;'>
											<input type='text' name='rcUnderWriterNm${rcS.index}' id='rcUnderWriterNm${rcS.index}' size='40' value='${rc.cpnNm}' readonly />
											<input type="hidden" class="w96" name="rcUnderWriterId${rcS.index}" id="rcUnderWriterId${rcS.index}" value='${rc.cpnId}' >
												<span class="btn s orange" style="margin-top:-5px;"><a onclick="popUpInvestor('${rcS.index}','c','rc','00')" id="AP_cpnNm" class="c_title">인수자 선택</a></span>
										</td>
										<td class='cent bgWht won' style='width:47px;'><input type='text' class='w96' id='rcUnderWriterPrice${rcS.index}' onblur='sumPrice("rc","00");' value='${rc.price}'/></td>
										<td class='cent bgWht pd0' style='border-radius:0px;'><span class='btn s green' onclick='javascript:delRow("${rcS.index}","rc","00");'><a>-</a></span></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr id='modifyUnderWriterTr0'>
									<input type="hidden" name='modifyUnderWriterDelFlag0' id='modifyUnderWriterDelFlag0' value='N' />
									<td class='cent bgWht pd0' style='border-radius:0px;'>
										<input type='text' name='modifyUnderWriterNm0' id='modifyUnderWriterNm0' size='40' readonly />
										<input type="hidden" class="w96" name="modifyUnderWriterId0" id="modifyUnderWriterId0" >
										<span class="btn s orange" style="margin-top:-5px;"><a onclick="popUpInvestor('0','c','modify','00')" id="AP_cpnNm" class="c_title">인수자 선택</a></span>
									</td>
									<td class='cent bgWht won' style='width:47px;'><input type='text' class='w96' id='modifyUnderWriterPrice0' onblur='sumPrice("modify","00");'/></td>
									<td class='cent bgWht pd0' style='border-radius:0px;'></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tbody id="modifyUnderWriter"></tbody>
						<tr>
							<td class="bgWht" colspan="3" style="text-align:right;padding-right:8px;">
								<span class="btn s green" onclick="javascript:addRow('modify','00');"><a>+</a></span>
							</td>					
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="width:100%; float:left;">
				<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:modifyNotice('00');"><a>저장</a></span></p>
			</div>
		</div>
	</article>
</div>
</body>
</html>