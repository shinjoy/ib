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

	//20150902
	setSortBtn();		//정렬버튼 모양 세팅 함수 호출
	
	//인수자검색화면시 초기화버튼 보이기 20170830 ksm
	if('${investorId}' != '' || '${way}' != ''){
		$("#resetBtn").show();
	}
		
	//---------- draggable :S ----------
	$(".closePopUpMenu").mousedown(function(){
		$(".popUpMenu").draggable({disabled:false, opacity:'0.8'});		
	});
	$(".closePopUpMenu").mouseup(function(){
		$(".popUpMenu").draggable({disabled:true});
		$(".popUpMenu").css('height', 'auto');
	});	
	//---------- draggable :E ----------
	
	/* <c:if test="${foldCheckYn eq 'Y'}">
		$(".otherReceiver").hide();
	</c:if>
	<c:if test="${foldCheckYn ne 'Y'}">
		$(".otherReceiver").show();
	</c:if> */
	
	doFoldCheck()
 });

 function validation(obj){
	for(var i=1;i<4;i++){
	 	var rto =  obj.find("[id^=ratio"+i+"]").val();
	 	if(parseFloat(rto)>1) {
	 		alert("퍼센트문자를 지우고, 0.xxx 와 같이 소수로 입력하세요.");
	 		return false;
	 	}
	}
	if(isNullAlert(obj,'tm','접수일자를'))
		return false;
	if(isNullAlert(obj,'way','방법을'))
		return false;
	if(isNullAlert(obj,'cate','구분을'))
		return false;
	if(isNullAlert(obj,'AP_cpnId','회사를'))
		return false;
	if(isNullAlert(obj,'rank','회차를'))
		return false;
	if(isNullAlert(obj,'pri','금액을'))
		return false;
	if(isNullAlert(obj,'wrtDueDt','워런트만기일을'))
		return false;
	if(isNullAlert(obj,'refix','리픽싱을'))
		return false;

 	return true;
 }
 
 function isNullAlert(obj, id, text){
	 if(obj.find("[id^="+id+"]").val().is_null()){
		alert(text+" 입력하십시요.");
		return true;
	}
 }
 
 function insertNotice(th){
	var obj = $(th).parent().parent().parent();
	if(!validation(obj)) return;
	
	//20170803 ksm
	var addUnderWriterCnt = $("tr[id^=addUnderWriterTr]").size();
	
	$("#addUnderWriterCnt").val(addUnderWriterCnt);
	
	var cpnIdList = [];
	var investorPriceList = [];
	
	for(var i=0;i<addUnderWriterCnt;i++){
		if($("#addUnderWriterDelFlag"+i).val()=='N'){
			cpnIdList.push($("#addUnderWriterId"+i).val());
			investorPriceList.push($("#addUnderWriterPrice"+i).val());
			
			//인수자 필수체크 안함 20170911 ksm
			/* if(isNullAlert(obj,'addUnderWriterNm'+i,'인수자를')){
				$("#addUnderWriterNm"+i).focus();
				return;
			}
			
			if(isNullAlert(obj,'addUnderWriterPrice'+i,'인수자당 투자금액을')){
				$("#addUnderWriterPrice"+i).focus();
				return;
			}	 */			
		}
	}
	
	var idListStr = '';
	var priceListStr = '';
	
	if(cpnIdList.length > 0){
		idListStr = cpnIdList.join('::');
	}
	if(investorPriceList.length > 0){
		priceListStr = investorPriceList.join('::');
	}
	
	var data = {
			tmDt: 		obj.find('input:eq(0)').val()
			,way: 		obj.find('input:eq(1)').val()
			,categoryCd:obj.find('input:eq(2)').val()
			,cpnId: 	obj.find('input:eq(3)').val()
			,rank: 		obj.find('input:eq(4)').val()
			,price: 	obj.find('input:eq(5)').val().replace(',','')
			,coupon: 	obj.find('input:eq(6)').val()
			,ytm: 		obj.find('input:eq(7)').val()
			,ytp: 		obj.find('input:eq(8)').val()
			,payupDt: 	obj.find('input:eq(9)').val()
			,dueDt: 	obj.find('input:eq(10)').val()
			,put: 		obj.find('input:eq(11)').val()
			,eventPrice:obj.find('input:eq(12)').val()
			,wrtDueDt: 	obj.find('input:eq(13)').val()
			,refixSale: obj.find('input:eq(14)').val()
			,superCpn: 	obj.find('input:eq(15)').val()
			,buyback: 	obj.find('input:eq(16)').val()
			,premium: 	obj.find('input:eq(17)').val()
			,target: 	obj.find('input:eq(18)').val()
			,relation: 	obj.find('input:eq(19)').val()
			,rgId: $("#rgstId").val()
			,idListStr : idListStr
			,priceListStr : priceListStr				
	};	
	var url = "<c:url value='/work/insertPublicNoticeMezzanine.do'/>";
	var fn = function(){
		toast.push('등록되었습니다.')
		document.modifyRec.submit();
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
   	
   	
   	commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
	//ajaxModule(data,url,fn);
}
 
 function modifyNotice(th, tblCnt){
	var obj = $(th).parent().parent().parent();
	if(!validation(obj)) return;
	
	//20170808 ksm
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
		
	if(cpnIdList.length > 0){
		idListStr = cpnIdList.join('::');
	}
	if(investorPriceList.length > 0){
		priceListStr = investorPriceList.join('::');
	}
	
	var data = {
			sNb: 		obj.find('input:eq(20)').val()
			,tmDt: 		obj.find('input:eq(0)').val()
			,way: 		obj.find('input:eq(1)').val()
			,categoryCd:obj.find('input:eq(2)').val()
			,rank: 		obj.find('input:eq(4)').val()
			,price: 	obj.find('input:eq(5)').val().replace(',','')
			,coupon: 	obj.find('input:eq(6)').val()
			,ytm: 		obj.find('input:eq(7)').val()
			,ytp: 		obj.find('input:eq(8)').val()
			,payupDt: 	obj.find('input:eq(9)').val()						//납입일
			,dueDt: 	obj.find('input:eq(10)').val()						//발행경과일
			,put: 		obj.find('input:eq(11)').val()
			,eventPrice:obj.find('input:eq(12)').val().replace(',','')
			,wrtDueDt: 	obj.find('input:eq(13)').val()
			,refixSale: (obj.find('input:eq(14)').val().indexOf('%')>-1) ? obj.find('input:eq(14)').val().replace('%','')/100:obj.find('input:eq(14)').val()
			,superCpn: 	obj.find('input:eq(15)').val()
			,buyback: 	obj.find('input:eq(16)').val()
			,premium: 	obj.find('input:eq(17)').val()
			,target: 	obj.find('input:eq(18)').val()
			,relation: 	obj.find('input:eq(19)').val()
			,rgId: $("#rgstId").val()
			
			,cpnId: 	obj.find('input:eq(3)').val()	//회사추가 20150818
			,idListStr : idListStr
			,priceListStr : priceListStr
	};	
	var url = "<c:url value='/work/modifyPublicNoticeMezzanine.do'/>";
	var fn = function(){
		toast.push('수정되었습니다.');
		document.modifyRec.submit();
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
   	
   	commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
}
function excelDownload(){
	$('body').append('<iframe id="excelDown" style="display:none;"></iframe><form id="excelform"></form>');
	$('#excelform').attr('action',"../work/excelPublicNoticeMezzaine.do");
	$('#excelform').attr('target','excelDown');
	$('#excelform').submit();
}
function deleteNotice(snb){
	if(confirm('삭제하시겠습니까?')){
		var url = "<c:url value='/work/deletePublicNoticeMezzanine.do'/>"
		var data = {sNb:snb}
		var fn = function(arg){
			toast.push('삭제되었습니다.');
			document.modifyRec.submit();
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
	   	
	   	commonAjax("POST", url, data, fn, true, beforeFn, completeFn);
		//ajaxModule(data,url,fn);
	}else{
		return;
	}
}

function sortTable(flag,ttT){
	if(ttT=='total'){
		$("#ttT").val(flag);
		$("#sorting").val('1');
	}else
		$("#sorting").val(flag);
	
	//인수자검색시 정렬 추가 20170830 ksm
	if('${investorId}' != ''){
		$("#investorId").val('${investorId}');
	}
	
	//회사명검색시 정렬 추가 20170830 ksm
	if('${cpnNm}' != ''){
		$("#s_cpnNm").val('${cpnNm}');
	}
		
	//방법(공모,사모) 검색시 정렬 추가 20170913 ksm
	if('${way}' != ''){
		$("#s_way").val('${way}');
	}
	document.modifyRec.submit();
}


//20150902 추가 (양방향정렬)
var sortBtn = '${sortBtn}';		//정렬한 곳 숫자값 ('1',~'5' 또한 음수값도)
function setSortBtn(){
	var sign;
	if(sortBtn == undefined || sortBtn == null || sortBtn == '' || sortBtn == '0'){
		sign = 1;
		sortBtn = 1;
	}else{
		sign = ((1 * sortBtn) > (-1 * sortBtn))? 1:-1;
	}// 1:정방향정렬, -1:역방향정렬
	 
	for(var i=1; i<=7; i++){
		var btnShape = '▽';		
		if(sortBtn == i){
			btnShape = '▲';
		}else if((sortBtn * -1) == i){
			btnShape = '▼';
		}
		$('#sortBtn'+i).html(btnShape);		//모양세팅
	}
}

//회사명 검색
function doSearch(){
	/* if($('#inputCpnNm').val().length < 2){
		alert('2글자 이상 입력해주세요!');
		return;
	} */
	$('#s_cpnNm').val($('#inputCpnNm').val());
	document.modifyRec.submit();
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

//메자닌시장현황 팝업
function mezzanineStatus(){
	var sUrl = "${pageContext.request.contextPath}/work/mezzanineStatus.do";
	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=1150, height=800, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
	window.open(sUrl, "_blank", option);
	//parent.mainFrame.location.href = sUrl;
}

//경쟁사현황 팝업
function investorStatus(){
	var sUrl = "${pageContext.request.contextPath}/work/investorStatus.do";
	var option = "left=" + (screen.width > 1400?"700":"0") + ", top=" + (screen.height > 810?"100":"0") + ", width=680, height=670, menubar=no, status=no, toolbar=no, location=no, scrollbars=yes, resizable=no";
	window.open(sUrl, "_insuCpn", option);	 
}

//년도별보기 
function doYearCheck(cYear, way){
	$("#s_choiceYear").val(cYear);
	
	if(way != null)	$("#s_way").val(way);
	
	if($("#wrtYn").is(':checked'))	$("#s_wrtYn").val('Y');
	else $("#s_wrtYn").val('N');
	
	document.modifyRec.submit();
}

//워런트만기체크
function doWrtCheck(){
	
	if($("#wrtYn").is(':checked'))	$("#s_wrtYn").val('Y');
	else $("#s_wrtYn").val('N');
	
	if('${investorId}' != ''){
		$("#investorId").val('${investorId}');
	}
	
	if('${cpnNm}' != ''){
		$("#s_cpnNm").val('${cpnNm}');
	}
	
	if('${way}' != ''){
		$("#s_way").val('${way}');
	}
	
	document.modifyRec.submit();
}

//경쟁사현황에서 검색
function searchInvestor(rVal){
	if(rVal != null){
		$("#investorId").val(rVal.i);
	}	
	if($("#wrtYn").is(':checked'))	$("#s_wrtYn").val('Y');
	else $("#s_wrtYn").val('N');
	
	document.modifyRec.submit();
}


//복수 인수자 접기
function doFoldCheck(){
	if($("#foldYn").is(':checked')){
		$(this).val('Y');
		$(".otherReceiver").hide();
	}else{
		$(this).val('N');
		$(".otherReceiver").show();
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
		
		<c:set var="now" value="<%= new java.util.Date() %>"/>
		<fmt:formatDate var="cur_day" value='${now}' pattern='yyyy-MM-dd'/>
		
		<form name="modifyRec" action="<c:url value='/work/selectPublicNoticeMezzaine.do' />" method="post">
			<input type="hidden" name="sorting" id="sorting" value="${sorting}">
			<input type="hidden" id="ttT" name="total" value="${ttT}">
			<!-- 20170824 ksm -->
			<input type="hidden" id="s_cpnNm" name="cpnNm">
			<input type="hidden" name="choice_year" id="s_choiceYear" value="${choiceYear}">
			<!-- 20170830 ksm -->
			<input type="hidden" name="wrtYn" id="s_wrtYn" value="${wrtCheckYn}">			
			<input type="hidden" name="investorId" id="investorId">			
			<input type="hidden" name="way" id="s_way">			
		</form>
		
		<input type="hidden" id="SendReceive" value="MR">
		
		<div id="fixedTop" class="fixed-top" style="z-index:10;">

			<header>
				<form name="dayForm" id="dayForm" method="post" action="<c:url value='/work/selectPublicNoticeMezzaine.do' />" onsubmit="return false;">
				<input type="hidden" name="total" id="total">
				<div class="year_wrap" style="top:0px"><h2 class="headerTitle">
				
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<fmt:formatDate var="curYear" value='${now}' pattern='yyyy'/>
								
					공시 <small>(메자닌)</small>
					<!-- 년도별 보기 20170823 ksm -->
					&nbsp;
					<span class="year">
						<select id="choiceYear" name="choice_year" onchange="doYearCheck(this.value);">
							<c:forEach var="year" begin="2010" end="${curYear+2}">
								<option value="${year}" 
								<c:choose>
									<c:when test="${choiceYear eq ''}">
										<c:if test="${year eq curYear}">selected</c:if>>
									</c:when>
									<c:otherwise>
										<c:if test="${year eq choiceYear}">selected</c:if>>									
									</c:otherwise>
								</c:choose>
								${year}</option>
							</c:forEach>
						</select>
					</span>
					&nbsp;&nbsp;<span class="btn s green"><a onclick="javascript:view('tbl00',this,event);">메자닌입력</a></span>
					&nbsp;&nbsp;<span class="btn s"><a onclick="javascript:excelDownload(this,event);">엑셀다운</a></span>
					&nbsp;&nbsp;
					<span style="font-size:12px;">회사명<input type="text" id="inputCpnNm" onKeydown="javascript:if(event.keyCode == 13) doSearch();" value="${cpnNm}" style="font-size:11px;border:1px solid #999999;width:150px;height:13px;padding-left:2px!important;"></span><span class="btn s green"><a onclick="javascript:doSearch();">검색</a></span>
					&nbsp;&nbsp;<input type="checkbox" name="wrtYn" id="wrtYn" onclick="doWrtCheck();" <c:if test="${wrtCheckYn eq 'Y'}">checked</c:if>><label for="wrtYn"><font style="font-size:12px;">워런트만기제외</font></label>
					<%-- &nbsp;&nbsp;<input type="checkbox" name="foldYn" id="foldYn" onclick="doFoldCheck();" <c:if test="${foldCheckYn eq 'Y'}">checked</c:if>><label for="foldYn"><font style="font-size:12px;">복수인수자접기</font></label> --%>
					&nbsp;&nbsp;<input type="checkbox" name="foldYn" id="foldYn" onclick="doFoldCheck();" checked><label for="foldYn"><font style="font-size:12px;">인수자접기</font></label>
					&nbsp;&nbsp;
					&nbsp;<span class="btn s green"><a onclick="javascript:mezzanineStatus();">메자닌시장현황</a></span>
					&nbsp;<span class="btn s green"><a onclick="javascript:investorStatus();">경쟁사현황</a></span>
					&nbsp;<span class="btn s blue"><a onclick="popUpInvestor('','c','MNG','');">인수자관리</a></span>
					&nbsp;&nbsp;<span class="btn s red" id="resetBtn" style="display:none;"><a onclick="doYearCheck('${curYear}');">초기화</a></span>
					</h2>				
				</div>
				</form>
				<h2 class="headerTitle">&nbsp;</h2>
			</header>
			
<div>
	<div class="clear" style="float:left;width:10px;height:15px;">&nbsp;</div>
	<div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${empty ttT}">on</c:if>" onclick="sortTable('','total')">전체</div>
	<c:forEach var="ct" items="${CategoryList}" varStatus="cateS">
	<div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${ttT eq ct.categoryCd}">on</c:if>" onclick="sortTable('${ct.categoryCd}','total')">${ct.categoryCd}</div>
	</c:forEach>
	<%-- <div style="height:16px;line-height:15px;"class="1st subTab<c:if test="${ttT eq 'event'}">on</c:if>" onclick="sortTable('event','total')">행사공시</div> --%>
	<div class="tabUnderBar" style="float:left;height:15px;">&nbsp;</div>
</div>
			
			<table class="t_skinR00" style="table-layout: fixed;">
				<colgroup>
					<col width="70">			<!-- 접수일자 -->
					<col width="40">			<!-- 방법 -->
					<col width="30">			<!-- 구분 -->
					<col width="100">			<!-- 회사명 -->
					
					<col width="30">			<!-- 회차 -->
					<col width="50">			<!-- 금액 -->
					<col width="100">			<!-- 인수자 -->
					<col width="50">			<!-- 인수자당 투자액 -->
					<col width="40">			<!-- 쿠폰 -->
					<col width="40">			<!-- YTM -->
					<col width="40">			<!-- YTP -->
					<col width="60">			<!-- 납입일 -->
					<col width="60">
					<col width="60">
					<col width="60">
					<col width="60">
					
					<col width="60">			<!-- 현재가 -->
					<col width="60">			<!-- 상승률 -->
					<col width="60">			<!-- 워런트만기 -->
					<col width="40">			<!-- 워런트잔여일 -->
					<col width="60">			<!-- 리픽싱 -->
					<col width="100">			<!-- 주관회사 -->
					<col width="60">			<!-- BuyBack -->
					<col width="50">
					<col width="100">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th onclick="sortTable(${(sortBtn==1||sortBtn==-1)?sortBtn:1});" class="hand">접수일자<br/><div id="sortBtn1"></div></th>
						<th onclick="sortTable(${(sortBtn==2||sortBtn==-2)?sortBtn:2});" class="hand pd0">방법<br/><div id="sortBtn2"></div></th>
						<th onclick="sortTable(${(sortBtn==3||sortBtn==-3)?sortBtn:3});" class="hand pd0">구분<br/><div id="sortBtn3"></div></th>
						<th onclick="sortTable(${(sortBtn==4||sortBtn==-4)?sortBtn:4});" class="hand pd0">회사명<br/><div id="sortBtn4"></div></th>
						<th class="pd0">회차</th>
						<th class="pd0">금액<small>(억)</small></th>
						<th class="pd0">인수자</th>
						<th class="pd0">인수자당<br/>투자액</th>
						<th class="pd0">쿠폰</th>
						<th class="pd0">YTM</th>
						<th class="pd0">YTP</th>						
						<th class="pd0">납입일</th>
						<th class="pd0">발행<br/>경과일</th>
						<th class="pd0">사채만기</th>
						<th class="pd0">PUT</th>
						<th class="pd0">행사가</th>
						<th class="pd0 hand" onclick="sortTable(${(sortBtn==7||sortBtn==-7)?sortBtn:7});">현재가<div id="sortBtn7"></div></th>
						<th class="pd0 hand" onclick="sortTable(${(sortBtn==6||sortBtn==-6)?sortBtn:6});">상승률<div id="sortBtn6"></div></th>
						<th class="pd0 hand" onclick="sortTable(${(sortBtn==5||sortBtn==-5)?sortBtn:5});">워런트<br/>만기<div id="sortBtn5"></div></th>
						<th class="pd0">워런트<br/>잔여일</th>
						<th class="pd0">리픽싱</th>
						<th class="pd0">주관회사<br/><small>(담당자)</small></th>						
						<th class="pd0">Buy<br/>Back</th>
						<th class="pd0">프리미엄</th>
						<th class="pd0">대상</th>
						<th class="pd0">관계</th>
					</tr>
				</thead>
				</table></div>
			<div style="padding-top:95px;">
			<table class="t_skinR00" style="table-layout: fixed;">
				<colgroup>
					<col width="70">			<!-- 접수일자 -->
					<col width="40">			<!-- 방법 -->
					<col width="30">			<!-- 구분 -->
					<col width="100">			<!-- 회사명 -->
					
					<col width="30">			<!-- 회차 -->
					<col width="50">			<!-- 금액 -->
					<col width="100">			<!-- 인수자 -->
					<col width="50">			<!-- 인수자당 투자액 -->
					<col width="40">			<!-- 쿠폰 -->
					<col width="40">			<!-- YTM -->
					<col width="40">			<!-- YTP -->
					<col width="60">			<!-- 납입일 -->
					<col width="60">			<!-- 발행경과일 -->
					<col width="60">
					<col width="60">
					<col width="60">
					
					<col width="60">			<!-- 현재가 -->
					<col width="60">			<!-- 상승률 -->
					<col width="60">			<!-- 워런트만기 -->
					<col width="40">			<!-- 워런트잔여일 -->
					<col width="60">			<!-- 리픽싱 -->
					<col width="100">			<!-- 주관회사 -->
					<col width="60">			<!-- BuyBack -->					
					<col width="50">
					<col width="100">
					<col width="">
				</colgroup>
				<tbody>
					<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">
						<tr>
							<td class="cent" style="padding: 5px 0px;">${nt.tmDt}</td>
							<td class="cent pd0"><nobr>${nt.way}</nobr></td>
							<td class="cent pd0"><nobr>${nt.categoryCd}</nobr></td>
							<td class="cent pd0"><a onclick="popUp('','rcmdCpn','','${nt.cpnSnb}')" style="cursor:pointer;">${nt.cpnNm}</a></td>
							
							<td class="cent pd0">${nt.rank}</td>
							<td class="won"><fmt:formatNumber value="${nt.price}" groupingUsed="true"/></td>
							<c:choose>
								<c:when test="${fn:length(nt.receiverList) gt 0}">
									<c:forEach var="rc" items="${nt.receiverList}" varStatus="rcStatus">
										<c:if test="${rcStatus.first}">
											<td class="pd0 overFlowHidden" title="${rc.cpnNm}"><nobr>${rc.cpnNm}</nobr></td>	
											<td class="won"><fmt:formatNumber value="${rc.price}" groupingUsed="true"/></td>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td class="pd0 overFlowHidden" title="${nt.underWriter}"><nobr>${nt.underWriter}</nobr></td>
									<td class="won"></td>
								</c:otherwise>
							</c:choose>
							<td class="cent pd0">${nt.coupon}%</td>
							<td class="cent pd0">${nt.ytm}%</td>
							<td class="cent pd0"><c:if test="${nt.ytp ne '0.0'}">${nt.ytp}%</c:if><c:if test="${nt.ytp eq '0.0'}">${nt.ytm}%</c:if></td>
							<td class="cent pd0">${nt.payupDt}</td>							
							<td class="cent pd0">${nt.btPayUpTmDt}</td>
							<td class="cent pd0">${nt.dueDt}</td>
							<td class="cent pd0">${nt.put}</td>
							<td class="won"><fmt:formatNumber value="${nt.eventPrice}" groupingUsed="true"/></td>
							<td class="won"><fmt:formatNumber value="${nt.curPrice}" groupingUsed="true"/></td>
							<%-- <td class="cent pd0"><b>${nt.ratio}%</b></td> --%>
							<td class="cent pd0"><b><fmt:formatNumber value="${(nt.curPrice-nt.eventPrice)*100/nt.eventPrice}" pattern="0.00" />%</b></td>
							<td class="cent pd0">${nt.wrtDueDt}</td>
							<td class="cent pd0">${nt.btWrtTmDt}</td>
							<td class="cent pd0">${nt.refixSale}</td>
							<td class="pd0 overFlowHidden" title="${nt.superCpn}"><nobr>${nt.superCpn}</nobr></td>							
							<td class="cent pd0">${nt.buyback}</td>
							<td class="cent pd0 overFlowHidden" title="${nt.premium}">${nt.premium}</td>
							<td class="pd0 overFlowHidden" title="${nt.target}"><nobr>${nt.target}</nobr></td>
							<td class="pd0 overflowHide" title="${nt.relation}"><nobr>${nt.relation}</nobr>
								<span class="btn s orange" style="float:left;margin-left:5px;"><a onclick="javascript:view('tbl${ntS.count}',this,event)">수정</a></span>
								<c:if test="${cur_day eq nt.rgDt}"></c:if>
								<span class="btn s red" style="float:left;margin-left:5px;"><a onclick="javascript:deleteNotice('${nt.sNb}')">삭제</a></span>
							</td>
						</tr>
						<!-- S: 20170808 ksm -->
						<c:forEach var="rc2" items="${nt.receiverList}" varStatus="rcStatus2">
							<c:if test="${rcStatus2.index > 0}">
								<tr class="otherReceiver">
									<td class="cent" style="padding: 5px 0px;"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									
									<td class="cent pd0"></td>
									<td class="won"></td>
									<%-- <td class="pd0 overFlowHidden" title="${nt.underWriter}"><nobr>${nt.underWriter}</nobr></td> --%>
									<td class="pd0 overFlowHidden" title="${rc2.cpnNm}">${rc2.cpnNm}</td>	
									<td class="won"><fmt:formatNumber value="${rc2.price}" groupingUsed="true"/></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>							
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="won"></td>
									<td class="won"></td>
									<%-- <td class="cent pd0"><b>${nt.ratio}%</b></td> --%>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="cent pd0"></td>
									<td class="pd0 overFlowHidden" title=""></td>							
									<td class="cent pd0"></td>
									<td class="cent pd0 overFlowHidden" title=""></td>
									<td class="pd0 overFlowHidden" title=""></td>
									<td class="pd0 overflowHide" title=""></td>
								</tr>
							</c:if>	
						</c:forEach>
						<!-- E: 20170808 ksm -->
					</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
	<!-- 20170803 ksm -->		
	<div class="popUpMenu" style="width:1300px;display:none" id="tbl00">
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
						<td class="cent bgWht pd0" style="width:70px;border-radius:0px;"><input type="text" class="w96" id="tm"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="way"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="cate"/></td>
						<td class="cent bgWht pd0"><input type="hidden" class="w96" id="AP_cpnId_00"><span class="btn s orange" style="vertical-align:top;"><a onclick="popUp('00','c')" id="AP_cpnNm_00" class="c_title">회사선택</a></span></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="rank"/></td>
						<td class="cent bgWht won" style="width:47px;border-radius:0px;"><input type="text" class="w96" id="pri"/></td>
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
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="ratio1"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio2"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio3"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht won" style="width:57px;"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="wrtDueDt"/></td>
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="refix"/></td>
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
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id=""/></td>
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id=""/></td>
					</tr>
				</tbody>
			</table>
		
		</div>
		
		<div style="float:left;width:35%">
		
			<table class="t_skinR00" style="width:100%;margin-top:0px;vertical-align:top;float:left;" align="right;">
				<input type="hidden" name="addUnderWriterCnt" id="addUnderWriterCnt" value="" />		<!-- 신규 인수자 cnt 20170803 ksm-->
				<thead>
					<tr>
						<th class="pd0 w100p" style="border-radius:0px;height:27px;">인수자</th>
						<th class="pd0 w70p">인수자당<br>투자금액<small>(억)</small></th>
						<th class="pd0 w30p" style="border-radius:0px;"></th>
					</tr>
				</thead>
				<tbody>
					<tr id='addUnderWriterTr0'>
					<!-- <input type='hidden' name='addUnderWriterId0' id='addUnderWriterId0' value='' /> -->			
					<input type="hidden" name='addUnderWriterDelFlag0' id='addUnderWriterDelFlag0' value='N' />
						<td class='cent bgWht pd0' style='border-radius:0px;'>
							<input type='text' name='addUnderWriterNm0' id='addUnderWriterNm0' size='40' readonly/>
							<input type="hidden" class="w96" name="addUnderWriterId0" id="addUnderWriterId0">
							<span class="btn s orange" style="margin-top:-5px;"><a onclick="popUpInvestor('0','c','add','00')" id="AP_cpnNm" class="c_title">인수자 선택</a></span>
						</td>
						<td class='cent bgWht won' style='width:47px;'><input type='text' class='w96' id='addUnderWriterPrice0' onblur='sumPrice("add","00");'/></td>
						<td class='cent bgWht pd0' style='border-radius:0px;'></td>
					</tr>
					<tbody id="addUnderWriter"></tbody>
					<tr>
						<td class="bgWht" colspan="3" style="text-align:right;padding-right:8px;">
							<span class="btn s green" onclick="javascript:addRow('add','00');"><a>+</a></span>
						</td>					
					</tr>
				</tbody>
			</table>
	
		</div>
		
		<div style="width:100%; float:left;">
			<p class="cent" style="margin:3px 0px;"><span class="btn s green" onclick="javascript:insertNotice(this);"><a>저장</a></span></p>
		</div>
		<!-- E: 20170803 ksm -->
	</div>
	<c:forEach var="nt" items="${NoticeList}" varStatus="ntS">	
	<div class="popUpMenu" style="width:1300px;display:none" id="tbl${ntS.count}">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		
		<!-- S: 20170808 ksm -->
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
						<td class="cent bgWht pd0" style="width:70px;border-radius:0px;"><input type="text" class="w96" id="tm" value="${nt.tmDt}" /></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="way" value="${nt.way}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="cate" value="${nt.categoryCd}"/></td>
						<td class="cent bgWht pd0"><input type="hidden" class="w96" id="AP_cpnId_${ntS.count}" value="${nt.cpnId}"><span class="btn s orange" style="vertical-align:top;"><a onclick="popUp('00','c')" id="AP_cpnNm_${ntS.count}" class="c_title">${nt.cpnNm}</a></span></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="rank" value="${nt.rank}"/></td>
						<td class="cent bgWht won" style="width:47px;border-radius:0px;"><input type="text" class="w96" id="pri" value="${nt.price}"/></td>
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
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="ratio1" value="${nt.coupon/100}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio2" value="${nt.ytm/100}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="ratio3" value="${nt.ytp/100}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.payupDt}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.dueDt}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.put}"/></td>
						<td class="cent bgWht won" style="width:57px;"><input type="text" class="w96" id="" value="${nt.eventPrice}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="wrtDueDt" value="${nt.wrtDueDt}"/></td>
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="refix" value="${nt.refixSale}"/></td>
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
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.superCpn}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.buyback}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.premium}"/></td>
						<td class="cent bgWht pd0"><input type="text" class="w96" id="" value="${nt.target}"/></td>
						<td class="cent bgWht pd0" style="border-radius:0px;"><input type="text" class="w96" id="" value="${nt.relation}"/></td>
						<input type="hidden" value="${nt.sNb}"/>
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
						<c:when test="${fn:length(nt.receiverList) gt 0}">
							<c:forEach var="rc" items="${nt.receiverList}" varStatus="rcS">
								<tr id='rcUnderWriterTr${rcS.index}'>
								<input type="hidden" name='rcUnderWriterDelFlag${rcS.index}' id='rcUnderWriterDelFlag${rcS.index}' value='N' />
									<td class='cent bgWht pd0' style='border-radius:0px;'>
										<input type='text' name='rcUnderWriterNm${rcS.index}' id='rcUnderWriterNm${rcS.index}' size='40' value='${rc.cpnNm}' readonly />
										<input type="hidden" class="w96" name="rcUnderWriterId${rcS.index}" id="rcUnderWriterId${rcS.index}" value='${rc.cpnId}' >
											<span class="btn s orange" style="margin-top:-5px;"><a onclick="popUpInvestor('${rcS.index}','c','rc','${ntS.count}')" id="AP_cpnNm" class="c_title">인수자 선택</a></span>
									</td>
									<td class='cent bgWht won' style='width:47px;'><input type='text' class='w96' id='rcUnderWriterPrice${rcS.index}' onblur='sumPrice("rc","${ntS.count}");' value='${rc.price}'/></td>
									<td class='cent bgWht pd0' style='border-radius:0px;'><span class='btn s green' onclick='javascript:delRow("${rcS.index}","rc","${ntS.count}");'><a>-</a></span></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr id='modifyUnderWriterTr0'>
								<input type="hidden" name='modifyUnderWriterDelFlag0' id='modifyUnderWriterDelFlag0' value='N' />
								<td class='cent bgWht pd0' style='border-radius:0px;'>
									<input type='text' name='modifyUnderWriterNm0' id='modifyUnderWriterNm0' size='40' readonly />
									<input type="hidden" class="w96" name="modifyUnderWriterId0" id="modifyUnderWriterId0" >
									<span class="btn s orange" style="margin-top:-5px;"><a onclick="popUpInvestor('0','c','modify','${ntS.count}')" id="AP_cpnNm" class="c_title">인수자 선택</a></span>
								</td>
								<td class='cent bgWht won' style='width:47px;'><input type='text' class='w96' id='modifyUnderWriterPrice0' onblur='sumPrice("modify","${ntS.count}");'/></td>
								<td class='cent bgWht pd0' style='border-radius:0px;'></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tbody id="modifyUnderWriter"></tbody>
					<tr>
						<td class="bgWht" colspan="3" style="text-align:right;padding-right:8px;">
							<span class="btn s green" onclick="javascript:addRow('modify','${ntS.count}');"><a>+</a></span>
						</td>					
					</tr>
				</tbody>
			</table>
	
		</div>
		
		<div style="width:100%; float:left;">
			<p class="cent" style="margin:3px 0px;"><span class="btn s orange" onclick="javascript:modifyNotice(this,${ntS.count});"><a>저장</a></span></p>
		</div>
		<!-- E: 20170808 ksm -->
	</div>
	</c:forEach>
</div>
</body>
</html>