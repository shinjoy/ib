<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>


	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
		pageContext.setAttribute("sp", "  ");
	</jsp:scriptlet>

<link href="<c:url value='/css/memo.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js'/>" ></script>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" var="todate" pattern="yyyy-MM-dd" />


<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>
$(document).ready(function(){
	
	getDivListPop('1');	//탭 - 1 부서별 2 사원별
	
	$('.M_comR').hover(
		function(){
			$(this).click();
		},function(){
		}
	);
	$(document).on("click",".closePopUpMenu",function(event){
		$(this).parent().parent().hide();
		// $(".popUpMenu").hide();
	});
	
	//---------- draggable :S ----------
	$("#closeTab").mousedown(function(){
		$("#offerPr").draggable({disabled:false, opacity:'0.8'});
	});
	$("#closeTab").mouseup(function(){
		$("#offerPr").draggable({disabled:true});		
	});
	
	$(".staff_header").mousedown(function(){
		$("#staffList").draggable({disabled:false, opacity:'0.8'});
	});
	$(".staff_header").mouseup(function(){
		$("#staffList").draggable({disabled:true});		
	});	
	//---------- draggable :E ----------
	
	
	$('#am_SMSTitle').val('');							//SMS 발송여부 초기화	
	$('#staffNmForSms').val('${staffNmForSms}');		//SMS 발송대상자 초기화
});


//직원 리스트
function getDivListPop(ver){		//ver : 탭종류 - 1 부서별 2 사원별
	$(".click_tab_pop").removeClass();
	$("#btn_pop_"+ver).addClass("click_tab_pop");
	var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",{enable :'Y',userCountChk:'Y'});
	$("#divisionDivPop").empty();
	for(var i=0;i<divisionList.length;i++){
		var str="";
		str='<div id="'+divisionList[i].divCode+'ListPop"></div>'
		$("#divisionDivPop").append(str);
		
		if(ver == '1') getUserListVer1Pop(divisionList[i].divCode,divisionList[i].divName,i); 
		else getUserListVer2Pop(divisionList[i].divCode,divisionList[i].divName); 
		
	}
}

//부서별
function getUserListVer1Pop(divCode,divName,idx){ 
    
	var url = contextRoot+"/work/selectuserList.do";
	var param = {
			division : divCode,
			deptOrder: 'Y'
		};
	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		var PerCnt=0;
		var dept = ''; 	  //부서명 변수
		var deptSeq = ''; //부서시퀀스 변수
		var classSet = '';
		var styleDisplay='';
		if(divCode == "${userLoginInfo.division}" ){	//login유저의  division일때 div세팅
			onclickSet= 'hiddenDiv(\''+divCode+'Pop\')' ;
			classSet  = 'axi-keyboard-arrow-up';
		}else{
			onclickSet= 'openDiv(\''+divCode+'Pop\')' ;
			styleDisplay = ' style="display:none;" ' ;
			classSet  = 'axi-keyboard-arrow-down';
		}
		if(list.length>0){
			var str=''; 
			/* ========회사선택 체크박스======== */
			str+='<p class="division_area"> <label for="Entry'+idx+'Pop"><input type="checkbox" name="EntryPop" id="Entry'+idx+'Pop" class="Entry_'+divCode+'Pop" onclick="selCompanyPop(this.name, ' + idx + ', \'' + divCode + '\');"><b>전체선택('+divName+')</b></label>'; //
			str += '<span id="span_'+divCode+'Pop" style="float:right;cursor:pointer;" onclick="'+onclickSet+'"><i id="btn_'+divCode+'Pop" class="axi '+classSet+'" style="font-size:20px;"></i></span></p>'; 
			str+= '<dl class="user_dl" id="dl_'+divCode+'Pop" '+ styleDisplay +'>';
			for(var i=0 ; i<list.length ;i++){
	    		deptSeq = list[i].deptSeq;
	    		if(list[i].deptNm != dept){		//새로운 부서 인원
	    			/* ========부서선택 체크박스======== */
	    			str+= '<dt class="user_dt"><label for="'+divCode+'_deptAry'+deptSeq+'Pop"><input type="checkbox" name="'+divCode+'deptAryPop" id="'+divCode+'_deptAry'+deptSeq+'Pop" class="'+divCode+'Pop"  onclick="selDeptPop(this.id);"><b>'+list[i].deptNm+'</b></label></dt>' ;		//줄바꾸고
    				dept = list[i].deptNm;		//부서 이름 
    				str += '<dd class="user_dd" style="margin:0px;">';	//새로운 부서일때 dd생성	
    				PerCnt=0;
	    		}
    			str+='<label for="EntryAry'+i+'Pop"><input type="checkbox" name="memoSndName" sabun="' + list[i].sabun + '" id="EntryAry'+i+'Pop" class="'+divCode+'_deptAry'+deptSeq+'Pop" value="'+list[i].usrNm+'" >' ;
	    		str+=list[i].usrNm+'</label>';
	    		PerCnt++;
	    		if(list[i].deptNm != dept){
					str += '</dd>';
				}
	    	}	
	    	str += '</dl>';
	    	$("#"+divCode+"ListPop").html(str); 
	    	
		}
	};
	commonAjax("POST", url, param, callback, false, null, null);
	
}

//사원별
function getUserListVer2Pop(divCode,divName){ 
    
	var url = contextRoot + "/work/selectuserList.do";
	var param = {division : divCode};

	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON
		var styleDisplay='';
		if(divCode == "${userLoginInfo.division}" ){	//login유저의  division일때 div세팅
			onclickSet= 'hiddenDiv(\''+divCode+'Pop\')' ;
			classSet  = 'axi-keyboard-arrow-up';
		}else{
			onclickSet= 'openDiv(\''+divCode+'Pop\')' ;
			styleDisplay = ' style="display:none;" ' ;
			classSet  = 'axi-keyboard-arrow-down';
		}
		if(list.length>0){
			var str='<p class="division_area">';
			str+='<label><input type="checkbox" onclick="selectAllforSndMemoDivName(this,0,\''+divCode+'ListPop\');"><b>전체선택('+divName+')</b></label>';
			str += '<span id="span_'+divCode+'Pop" style="float:right;cursor:pointer;" onclick="'+onclickSet+'"><i id="btn_'+divCode+'Pop" class="axi '+classSet+'" style="font-size:20px;"></i></span></p>'; 
			str+= '<dl class="user_dl" id="dl_'+divCode+'Pop" '+ styleDisplay +'>';
			str+='<dt class="user_dt" style="border-bottom:0px;background:#eceadf;">';
			for(var i=0 ; i<list.length ;i++){
	    		str+='<span style="width:155px;display:inline-block;"><label for="'+divCode+'chbox'+i+'" class="checkR"><input type="checkbox" name="memoSndName" sabun="' + list[i].sabun + '" id="'+divCode+'chbox'+i+'" value="'+list[i].usrNm+'" >' ;
	    		str+='<span style="width:45px;display:inline-block;"><b>' + list[i].usrNm+'</b></span>('+list[i].deptNm+')</label></span>';
	    		//str+='</dt>';
	    		if(i%2 == 1){
					str+='</dt>';
					str+='<dt class="user_dt" style="border-bottom:0px;background:#eceadf;">';
				} 
	    	}	
	    	str+='</dl>';
	    	$("#"+divCode+"ListPop").html(str);
		}
	};
	commonAjax("POST", url, param, callback, false, null, null);
}

function resizeTextarea(th){
	var obj=$(th);
	obj.css('height','1px');
	obj.css('height',(th.scrollHeight)+'px');
}
//회사 선택 
function selCompanyPop(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
	
	var All = $($('input:checkbox[name='+Obj+']')[idx]); //회사선택 체크박스
	var ChkList = $('input[name='+divCd+'deptAryPop]'); //부서선택 체크박스
	if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = false;
			selDeptPop($(ChkList[i]).attr('id')); //부서선택으로
		}
	}
	else { // 그게 아니라면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = true;
			selDeptPop($(ChkList[i]).attr('id'));//부서선택으로
		}
	}
}
//부서선택 
function selDeptPop(obj) {		
	var All = $("#"+obj);
	var ChkList = $("."+obj); ///해당 부서를 class 로 가지고 있는 사원의 체크박스 리스트
	if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = false;
		}
	}
	else { // 그게 아니라면
		for(var i=0; i<ChkList.length; i++) {
			ChkList[i].checked = true;		
		}
	}
}


//참조인 선택
function putStaffNames(th){
	
	var div = $(th).parent().parent();
	var nmValue = '';
	var sabunList = '';
	
	
	div.find('[name=memoSndName]:checked').each(function(){
		nmValue = nmValue+(nmValue==''?'':',')+this.value;			//참조인 이름들 문자열(',' 로 연결)
		sabunList = sabunList+(sabunList==''?'':',')+$(this).attr('sabun');	//참조인 사번들 문자열(',' 로 연결)
	});
	
	
	//수정 모드
	if($('#staffListMode').val() == "UPDATE"){
				
		var url = contextRoot + "/work/addMemoStaff.do";
		var param = {
						sNb			: $('#staffListAddMemoSNb').val(),		//s_nb
						mainSnb		: $('#staffListAddMemoMainSnb').val(),	//main_snb

						memoSndName	: nmValue,		//추가 참조인명 문자열	ex)'홍길동,홍당무'
						memoSndSabun: sabunList,	//참조인 사번 문자열 ex)'201708001,201703002'
						
						sttsCd		: '00001',
						SMSTitle	: $('#chkSmsSend').is(':checked')?'sms':''
					};
		//alert(JSON.stringify(param));
		//return;
		var callback = function(result){
			var obj = JSON.parse(result);
			var cnt = obj.resultVal;		//결과수
			
			if(obj.result == 'SUCCESS'){
				toast.push("추가되었습니다!");
				
				memoDivAjax(null, null, param.sNb, param.mainSnb);		//메모창 재오픈
				
			}else{
				//alert("해당 참조인의 댓글이 존재하여 삭제할 수 없습니다!");
			}
			
		};
		commonAjax("POST", url, param, callback, false, null, null);
				
		
	}else{
		//기존 신규 모드
		var NM = document.getElementById('am_Name');
		var	i = 0;
		
		
		if(nmValue!='') {
			NM.value = nmValue;				//참조인명 문자열
	
			$('#sabunList').val(sabunList);	//참조인 사번 문자열
			
			//$('#am_SMSTitle').val(($('#chkSmsSendGo').is(':checked'))?'sms':'');		//문자발송 여부
			//$('#am_SMSTitle').val(($('#chkSmsSend').is(':checked'))?'sms':'');		//문자발송 여부
			
			if($('#chkSmsSend').is(':checked')){
				$('#chkSmsSendGo').prop('checked', 'checked');							//문자발송 세팅
				$('#am_SMSTitle').val('sms');
			}
		}
		$("#selectUser").html(nmValue);		//선택 참조인 view
		div.hide();
	
	}
}//putStaffNames


//SMS 체크 이벤트 핸들러
function chkSmsSendClick(th){
	$('#am_SMSTitle').val(($(th).is(':checked'))?'sms':'');		//문자발송 여부
}


function textareaClick(th){
	var obj = $(th)
		,next = obj.next()
		,textarea = next.find('textarea');
	obj.css('display','none');
	$('.hideCntrl').css('display','');
	textarea.css('height',obj.css('height'));
	next.css('display','');
	textarea.focus();
	textarea.click();
}
function majorBsns(th){
	var obj = $(th)
		,redYN = obj.attr('class').indexOf('red');
	if(redYN>0) {
		obj.removeClass('red');
		$('#am_majorBsns').val('N');
	}else{
		obj.addClass('red');
		$('#am_majorBsns').val('Y');
	}
}


//메모 재전송 팝업
function reSend(snb){
	
	var url = "<c:url value='/work/memoResendPopup.do?s=' />" + snb;
	
	window.open(url, 'memoResendPop', 'scrollbars=no width=500 height=320');
}


//메모유형 버튼 보이도록
function showMemoTypeBtn(){
	$('#memoTypeBtnList').show();
}


//메모유형 변경(수정)
function chngMemoType(typeVal, memoSnb, typeNm, th){
	
	var url = contextRoot + "/work/updateMemoType.do";
	var param = {
					memoType : $(th).hasClass('selected')?'00010':typeVal,
					memoSnb	 : memoSnb
				};

	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		
		if(obj.result == 'SUCCESS'){
			toast.push("저장!");
			
			$('#memoTypeView').text(typeNm);	//변경 유형으로 텍스트변경
			$('#memoTypeBtnList').hide();		//버튼 숨기기
			
			if($(th).hasClass('selected')){		//해제 시도(이미 선택된 스타일)
				$('.cssMemoTypeBtn').removeClass('selected');	//해제
				$('#memoTypeView').css('visibility','hidden');	//숨긴다.
			}else{
				$('.cssMemoTypeBtn').removeClass('selected');	//변경 유형 버튼 스타일 적용
				$(th).addClass('selected');						//변경 유형 버튼 스타일 적용
				$('#memoTypeView').css('visibility','');		//보인다.
			}
			
		}
		
	};
	commonAjax("POST", url, param, callback, false, null, null);
}


//메모유형 변경(신규)
function chngMemoTypeNew(typeVal, typeNm, th){	
	
	if($(th).hasClass('selected')){					//이미 선택된 버튼은
		$('#memoTypeNew').val('00010');						//변경 유형 값 ('00010' 전달...기본값)
		//$('#memoTypeViewNew').text('전달');				//변경 유형으로 타입텍스트 변경
		$('#memoTypeViewNew').css('visibility','hidden');	//안보이게
		//버튼 스타일
		$(th).removeClass('selected');						//누름해제시켜준다
		
		$('#labelAlsoDailyWork').remove();					//업무등록(참조인) 초기화(안보이도록)
		
		//$('#staffList').hide();							//참조인 선택 팝업을 닫는다.
		
	}else{											//새로운 버튼 클릭
		$('#memoTypeNew').val(typeVal);						//변경 유형 값
		$('#memoTypeViewNew').text(typeNm);					//변경 유형으로 타입텍스트 변경
		$('#memoTypeViewNew').css('visibility','');			//보이게
		//버튼 스타일
		$('.cssMemoTypeBtn').removeClass('selected');		//전체 버튼 초기화
		$(th).addClass('selected');							//해당 버튼 누른모습으로
		
		//'업무요청' or '승인요청' 시 참조인의 업무일지에 등록시켜 2중 전달할 수 있는 옵션을 보이게한다.
		$('#labelAlsoDailyWork').remove();
		if(typeVal=='00030' || typeVal=='00040')
			$(th).parent().append('<label id="labelAlsoDailyWork"><input type="checkbox" name="alsoDailyWork" id="alsoDailyWork" checked>업무등록(참조인)</input></label>');
		
		if($("#selectUser").text() == ''){					//참조인을 선택하지 않은경우
			$('#btnReceiver').trigger('click');				//참조인 선택 팝업을 연다.
		}
		
		//'승인요청' 시 SMS도 발송
		if(typeVal=='00030') $('#chkSmsSend').prop('checked', 'checked');		//문자도 발송
	}
}


//메모 참조인 삭제
function delMemoStaff(sNb, mainSnb, name){
	
	if(!confirm("참조인 [" + name + "] 을 삭제하시겠습니까?")) return;
	
	var url = contextRoot + "/work/delMemoStaff.do";
	var param = {
					sNb		: sNb,
					mainSnb	: mainSnb,
					name	: name
				};

	var callback = function(result){
		var obj = JSON.parse(result);
		var cnt = obj.resultVal;		//결과수
		
		if(obj.result == 'SUCCESS'){
			toast.push("삭제되었습니다!");
			
			memoDivAjax(null, null, '${oriSNb}', '${oriMainSnb}');		//메모창 재오픈
			
		}else{
			alert("해당 참조인의 댓글이 존재하여 삭제할 수 없습니다!");
		}
		
	};
	commonAjax("POST", url, param, callback, false, null, null);
}


//참조인 추가버튼 클릭
function addMemoStaff(th, e, sNb, mainSnb){
	
	var memoVal = $('#memoarea0').val();
	if($.trim(memoVal) != ''){
		if(!confirm("[주의!!] 작성중인 메모가 있습니다! 그래도 진행하시겠습니까?\n(작성중인 메모는 저장되지 않습니다!)")) return;
	}
	
	var divId = "staffList";	
	var pstn = $(th).offset();
	var top = pstn.top
	var left = pstn.left;
	
	$('#staffListMode').val('UPDATE');				//수정모드
	$('#staffListAddMemoSNb').val(sNb);				//s_nb
	$('#staffListAddMemoMainSnb').val(mainSnb);		//main_snb
	
	$("#"+divId).css({"top":(top - 400) +"px","left":(left + 458) + "px"});
	$("#"+divId).css('display','block');
	$("#"+divId).show();
}


/* 
//메모 전달하기
function memoSnd(url,th,sms){

	var obj = $(th).parent().parent();
	obj.hide();
	$("#sttsCd").val('00001');
	$("#SMSTitle").val(sms);
	var frm = document.modifyRec;
	frm.action = url;
	frm.submit();

} */


<%--
//업무요청(참조인) 체크 이벤트
function chngRequestWork(){	
	if($('input[id=requestWork]').is(':checked')){
		$('#memoTypeNew').val('00040');						//요청 유형('00040')
		
		$('#memoTypeViewNew').text('요청');					//변경 유형으로 텍스트변경
		$('#memoTypeViewNew').css('visibility','');			//보이게
	}else{
		$('#memoTypeViewNew').css('visibility','hidden');	//안보이게
		$('#memoTypeNew').val('00010');						//전달 유형('00010')
	}
}
--%>

</script>
<style>
.btn_reply{
	background-color: #f38f2e;
	border:1px solid #ad7b10;
	padding:2px;
	color:#ffffff;
	margin:3px;
	cursor:pointer;
}
.btn_read{
	background-color: #3f5a92;
	border:1px solid #2b416f;
	padding:2px;
	color:#ffffff;
	margin:3px;
	cursor:pointer;
}
#divisionDivPop{
	border-bottom:1px solid #bfc9de;
}
#divisionDivPop div dl dd label {
    display: inline-block;
    margin-left: 4px;
   	color: #838383;
}

.cssMemoTypeView{
	/* font-size:13px;
	color:blue;
	border:1px solid #0000FF;
	border-radius:5px;
	display:inline-block;
	width:50px;
	height:20px;
	text-align:center;	
	background:white;
	 */
	box-shadow: rgb(21, 100, 173) 3px 4px 0px 0px; background: linear-gradient(rgb(121, 187, 255) 5%, rgb(55, 141, 229) 100%) rgb(121, 187, 255); 
	border-radius: 5px; border: 1px solid rgb(51, 123, 196); display: inline-block; color: rgb(255, 255, 255); 
	font-family: Arial; font-size: 13px; font-weight: bold; padding: 2px 7px; text-decoration: none; text-shadow: rgb(82, 142, 204) 0px 1px 0px;
}
.cssMemoTypeBtn{
	box-shadow: rgb(255, 255, 255) 0px 1px 0px 0px inset; 
	background: linear-gradient(rgb(255, 255, 255) 5%, rgb(246, 246, 246) 100%) rgb(255, 255, 255); 
	border-radius: 5px; 
	border: 1px solid rgb(220, 220, 220); 
	display: inline-block; 
	cursor: pointer; 
	color: rgb(102, 102, 102); 
	font-family: Arial; font-size: 12px; 
	padding: 1px 7px; 
	text-decoration: none; text-shadow: rgb(255, 255, 255) 0px 1px 0px;
}
.cssMemoTypeBtn:hover{
	box-shadow: rgb(255, 255, 255) 0px 1px 0px 0px inset; 
	border-radius: 5px; border: 1px solid rgb(220, 220, 220); 
	display: inline-block; 
	cursor: pointer; 
	color: rgb(102, 102, 102); 
	font-family: Arial; font-size: 12px; 
	padding: 1px 7px; text-decoration: none; text-shadow: rgb(255, 255, 255) 0px 1px 0px; 
	background: linear-gradient(rgb(246, 246, 246) 5%, rgb(255, 255, 255) 100%) rgb(246, 246, 246);
}
.cssMemoTypeBtn.selected{
	box-shadow: rgb(190, 226, 249) 0px 1px 0px 0px inset; 
	background: linear-gradient(rgb(99, 184, 238) 5%, rgb(70, 140, 207) 100%) rgb(99, 184, 238); 
	border-radius: 5px; border: 1px solid rgb(56, 102, 163); display: inline-block; cursor: pointer; color: rgb(255, 255, 255); 
	font-family: Arial; font-size: 12px; padding: 1px 7px; text-decoration: none; text-shadow: rgb(124, 172, 222) 0px 1px 0px;
}


</style>
<iframe id="uploadIFrame" name="uploadIFrame" style="display:none;visibility:hidden"></iframe>
<%-- 메모 --%>
	<div class="popUpMenu title_area" id="offerPr" style="display:block;width:500px;">
		<c:forEach var="workVO" items="${memoList}" varStatus="memoStatus">
			<input type="hidden" id="am_majorBsns" value="${workVO.major}">
			
		<c:choose>
		<c:when test="${userLoginInfo.name eq workVO.name}"> 
			<c:choose>
		<%-- =============================================== 타인에게 전달 받은 메모 :S ================================================== --%>
			<c:when test="${workVO.sttsCd=='00001' or workVO.sttsCd=='00002'}">
				<input type="hidden" id="memoSNb${memoStatus.count}" value="${workVO.sNb }">
			
				<p id="closeTab" name="textR">
					<span style="display:inline-block;width:350px;padding-right:30px;text-align:center;color:#ffffff;">
						<c:if test='${workVO.tmDt lt todate}'>일자 : ${workVO.tmDt}</c:if>
					</span>
					<span class="closePopUpMenu" title="닫기">ⅹ닫기</span>
				</p>
				<div style="clear:both;height:2px;"></div>
				
				<%-- 메모유형 --%>
				<c:if test="${workVO.memoType ne '00010'}">
				<div style="padding-left:5px;">
					<span class="cssMemoTypeView">${workVO.memoTypeNm}</span>					
				</div>
				</c:if>
				
				<c:if test="${workVO.major == 'Y'}"><div style="display:none;padding:0 0 2px 4px;"><span class="btn s red"><a>주업무</a></span></div></c:if> <!-- 숨김처리 -->
				<div class="M_basicInfoL Toogle">${workVO.rgNm}<br/>${fn:replace(fn:substring(workVO.rgDt,5,10),'-','.') }<div style="font-size:10px;">(${workVO.tmDtTime})</div></div>
				<div class="triL<c:if test='${workVO.priv == "Y"}'>org</c:if>">&nbsp;</div>
				<div class="M_comL clr${workVO.importance}" style="<c:if test='${workVO.priv == "Y"}'>background:#FAAC58;</c:if>">${fn:replace(fn:replace(workVO.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
			<%-- 파일첨부 --%>
				<div style="clear:both;height:4px;"></div>
				<div style="cursor:pointer;padding-left:50px;">
				<c:if test="${not empty workVO.realNm}"><c:choose><c:when test="${fn:indexOf(workVO.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(workVO.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(workVO.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(workVO.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${workVO.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${workVO.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${workVO.realNm}</span></c:otherwise></c:choose></c:if>
				</div>
			<%-- 파일첨부 --%>
				<div style="clear:both;height:8px;"></div>
				<%-- 
				<c:forEach var="cmnt" items="${cmntStaffNm}" varStatus="cmntS">
					<c:if test="${workVO.mainSnb == cmnt.mainSnb}">
					<div style="color:navy;font-size:11px;width:450px;">
						<div style="float:left;height:15px;">&nbsp;&nbsp;참조인:&nbsp;</div>
						<div>${cmnt.cmntStaffs}</div>
					</div>
					</c:if>
				</c:forEach>
				 --%>
				<c:if test="${fn:length(cmntStaffNmList) gt 0}">
				<div style="color:navy;font-size:11px;width:480px;">
					<div style="float:left;height:15px;">&nbsp;&nbsp;참조인
						<span style="font-weight:bold;color:blue;cursor:pointer;" onclick="addMemoStaff(this, event, ${workVO.sNb}, ${workVO.mainSnb});"><a>[+]</a></span>:&nbsp;
					</div>
					<div>
					<c:forEach var="cmnt" items="${cmntStaffNmList}" varStatus="cmntS">					
						${cmnt.name}<a href="javascript:delMemoStaff(${cmnt.sNb},${cmnt.mainSnb},'${cmnt.name}');"><font color=red><b>x</b></font></a>
					</c:forEach>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty cmntStaffNm}"><div style="clear:both;height:5px;"></div></c:if>
				<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
					<c:if test="${workVO.mainSnb == replyCmt.mainSnb}">
						<c:choose>
						<c:when test="${replyCmt.rgId==userLoginInfo.id}">
					<%-- 본인이 작성한 댓글 --%>					
					<div style="cursor:pointer;">
						<input type="hidden" id="repSNb${fn:substring(replyCmt.tmDt, 8,10)}_${memoStatus.count}" value="${replyCmt.repSnb}">
						<input type="hidden" id="memoRPSNb${memoStatus.count}" value="${replyCmt.sNb }">
						<input type="hidden" id="oldMemoTmdt${memoStatus.count}" value="${fn:substring(replyCmt.tmDt, 0,10)}">
						<div class="M_basicInfoR bsnsR_btn">나<br/>${fn:replace(fn:substring(replyCmt.tmDt, 5,10),'-','.')}<div style="font-size:10px;">(${replyCmt.tmDtTime})</div>
							<%--<span class="repEdit" onclick="replyUpd('${replyCmt.mainSnb}','${replyCmt.sNb}','${replyCmt.rgNm}',this)"><a><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></a></span> --%>
							<span class="btn s green" onclick="replyUpd('${replyCmt.mainSnb}','${replyCmt.sNb}','${replyCmt.rgNm}',this)"><a>저장</a></span>
							<span class="repEdit" onclick="replyDel('${replyCmt.sNb}')"><a><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
						</div>
						<div class="triR">&nbsp;</div>
						<div class="M_comR" title="클릭해서 수정하기" onclick="javascript:textareaClick(this);">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
						<div class="M_comRinTA" style="display:none;"><div class="repEdit"><textarea onkeyup="resizeTextarea(this)" onclick="resizeTextarea(this)" id="memoarea${memoStatus.count}" style="min-height:40px">${replyCmt.comment}</textarea></div></div>
						<c:if test="${replyCmt.sttsCd!='00002'}"><div style="float:right;color:red;width:14px;font-weight:bold;">1</div></c:if>
					</div>
					<%-- 파일첨부 --%>
					<div>
						<c:if test="${not empty replyCmt.realNm}"><c:choose><c:when test="${fn:indexOf(replyCmt.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(replyCmt.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(replyCmt.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(replyCmt.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${replyCmt.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${replyCmt.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${replyCmt.realNm}</span></c:otherwise></c:choose></c:if>
					</div>
					<%-- 파일첨부 --%>
					<div style="clear:both;height:5px;"></div>
					
					<%-- 본인이 작성한 댓글 --%>
						</c:when>
						<c:otherwise>
					<%-- 다른사람이 작성한 댓글 --%>
					
						<%-- <c:if test="${replyCmt.repSnb == '0'}"> --%>
					<div class="M_basicInfoL Toogle">${replyCmt.rgNm}<br/>${fn:replace(fn:substring(replyCmt.tmDt,5,10),'-','.') }<div style="font-size:10px;">(${replyCmt.tmDtTime})</div></div>
					<div class="triL">&nbsp;</div>
					<div class="M_comL">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
					<c:if test="${replyCmt.sttsCd!='00002'}"><div style="float:left;color:red;width:14px;font-weight:bold;text-align:right;">1</div></c:if>
					
					<%-- 파일첨부 --%>
					<div style="cursor:pointer;">
					<c:if test="${not empty replyCmt.realNm}"><c:choose><c:when test="${fn:indexOf(replyCmt.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(replyCmt.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(replyCmt.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(replyCmt.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${replyCmt.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${replyCmt.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${replyCmt.realNm}</span></c:otherwise></c:choose></c:if>
					</div>
					<%-- 파일첨부 --%>
					
					<div style="clear:both;height:8px;"></div>
					
						<%-- </c:if> --%>
					
					<%-- 다른사람이 작성한 댓글 --%>
						</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
			<!-- ============= 답글등록 :S ============= -->	
			<div style="border:1px solid #D4E6F1; background-color:#D4E6F1; margin-left:5px;margin-right:5px; padding-top:5px;padding-bottom:5px;">
				
				
				<c:if test="${(workVO.sttsCd=='00001' or workVO.sttsCd=='00002') and userLoginInfo.name==workVO.name}">
				<div class="M_basicInfoR">나<small>${fn:replace(fn:substring(replyCmt.tmDt, 5,10),'-','.')}</small>
					<c:if test="${(workVO.sttsCd=='00001' or workVO.sttsCd=='00002') and userLoginInfo.name==workVO.name}">
					<span class="btn s green" onclick="reply('${workVO.mainSnb}','${workVO.sNb}','${userLoginInfo.name}',this)"><a>답글달기</a></span>
					<span class="btn s gold" onclick="reply('${workVO.mainSnb}','${workVO.sNb}','${userLoginInfo.name}',this, null, 'Y')"><a>읽음확인</a></span></c:if>
					<div class="Impt" style="padding:1px;border-radius:5px;border:1px solid gray;margin:5px 0px;">
						중요도<br/>
						<select id="importance${memoStatus.count}">
							<option value="0" <c:if test="${workVO.importance == 0}">selected</c:if>>-</option>
							<option value="1" <c:if test="${workVO.importance == 1}">selected</c:if>>하</option>
							<option value="2" <c:if test="${workVO.importance == 2}">selected</c:if>>중</option>
							<option value="3" <c:if test="${workVO.importance == 3}">selected</c:if>>상</option>
						</select>
					</div>
					<div><label><input type="checkbox" id="chkSmsSendGo2" onclick="chkSmsSendClick(this);" style="padding: 2px 0px 2px 0px;"><b>SMS</b></label></div>
				</div>
				<div class="triRn">&nbsp;</div>
				<div class="M_comRinTAn"><div><textarea onkeyup="resizeTextarea(this)" style="min-height:80px" id="memoarea0" placeholder="답장을 입력하세요."></textarea></div></div>
		<%-- 파일업로드 --%>
			<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/basic/filesUpload4memo.do' />" method="post" encType="multipart/form-data">
				<input type="hidden" id="m_categoryCd" name="categoryCd" value="00004">
				<input type="hidden" id="m_rtn" name="rtn">
				<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">
			</form>

			<div style="float:left;padding-left:20px;vertical-align:middle;">
				<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../images/file/fileDisk.png' />" align="absmiddle">File</a>
				<div><table id="file_list"></table></div>
			</div>
		<%-- 파일업로드 --%>
				<div style="clear:both;height:1px;"></div>
				<%-- <div class="cent">
					<span class="Impt">
						중요도
						<select id="importance${memoStatus.count}">
							<option value="0" <c:if test="${workVO.importance == 0}">selected</c:if>>하</option>
							<option value="1" <c:if test="${workVO.importance == 1}">selected</c:if>>중</option>
							<option value="2" <c:if test="${workVO.importance == 2}">selected</c:if>>상</option>
						</select>
					</span>
					<span class="btn s blue" onclick="chkOk(this)"><a>확인</a></span>
				</div> --%>
				</c:if>
				
			</div>
			<!-- ============= 답글등록 :E ============= -->
				
			</c:when>
		<%-- =============================================== 타인에게 전달 받은 메모 :E ================================================== --%>
		
		
		<%-- =============================================== 본인이 작성한 메모 :S ====================================================== --%>
			<c:otherwise>
			
				<!-- ============= 본인이 작성한 첫글 :S ============= -->
				
				<input type="hidden" id="memoSNb${memoStatus.count}" value="${workVO.sNb }">
				<input type="hidden" id="oldMemoComment${memoStatus.count}" value="${workVO.comment}">
				<input type="hidden" id="oldMemoTmdt${memoStatus.count}" value="${fn:substring(workVO.tmDt, 0,10)}">
				
				<!-- <p id="closeTab" name="textR"><span class="closePopUpMenu" title="닫기">ⅹ닫기</span></p>				
				<div style="clear:both;height:5px;"></div> -->
				
				<p id="closeTab" name="textR">
					<span style="display:inline-block;width:350px;padding-right:30px;text-align:center;color:#ffffff;">
						<%-- <c:if test='${workVO.tmDt lt todate}'> --%>일자 : ${workVO.tmDt}<%-- </c:if> --%>
					</span>
					<span class="closePopUpMenu" title="닫기">ⅹ닫기</span>
				</p>
				<div style="clear:both;height:5px;"></div>
				
				
				<div class="M_basicInfoR">나<br/>${fn:replace(fn:substring(workVO.rgDt, 5,10),'-','.')}<div style="font-size:10px;">(${workVO.tmDtTime})</div>
					<%--<span style="margin:3px;" class="hand" onclick="memo_btnOk(this)"> --%></span><span class="btn s green" onclick="memo_btnOk(this)"><a>저장</a></span>
					
					<span style="margin:3px;" class="hand" onclick="<c:if test="${workVO.readCnt gt 0 or fn:length(replyList) gt 0}">alert('참조인이 확인하여 삭제할 수 없습니다!');return;</c:if>memo_btnDel(this)"><a><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
					
					<%-- <div class="hideCntrl" style="display:none;padding-top:3px;"><span class="btn s<c:if test="${workVO.major == 'Y'}"> red</c:if>" onclick="javascript:majorBsns(this);"><a>주업무</a></span></div> --%>
					<div class="hideCntrl" style="display:none;padding:1px;border-radius:5px;border:1px solid gray;margin:5px 0px;">
						중요도<br/>
						<select id="importance${memoStatus.count}">
							<option value="0" <c:if test="${workVO.importance == 0}">selected</c:if>>-</option>
							<option value="1" <c:if test="${workVO.importance == 1}">selected</c:if>>하</option>
							<option value="2" <c:if test="${workVO.importance == 2}">selected</c:if>>중</option>
							<option value="3" <c:if test="${workVO.importance == 3}">selected</c:if>>상</option>
						</select>
					</div>
					<div class="hideCntrl" style="display:none;padding:1px;border-radius:5px;border:1px solid gray;">
						비밀<br/>
						<select id="priv${memoStatus.count}">
							<option value="N" <c:if test="${workVO.priv == 'N'}">selected</c:if>>N</option>
							<option value="Y" <c:if test="${workVO.priv == 'Y'}">selected</c:if>>Y</option>
						</select>
					</div>					
					<!-- <div><label><input type="checkbox" id="chkSmsSendGo2" onclick="chkSmsSendClick(this);" style="padding: 2px 0px 2px 0px;"><b>SMS</b></label></div> -->					
				</div>
				
				<%-- 메모유형 변경 버튼 --%>
				<%-- <c:if test="${workVO.memoType eq '00040'}"> --%>
				<div style="padding-left:5px;">
					<span id="memoTypeView" class="cssMemoTypeView" <c:if test="${workVO.memoType eq '00010'}">style="visibility:hidden;"</c:if>>${workVO.memoTypeNm}</span>
					
					<span><a href="javascript:showMemoTypeBtn();">▶</a></span>
					<span id="memoTypeBtnList" style="display:none;">					
						<c:forEach var="typ" items="${cdMemoTypeList}" varStatus="stts">		<!-- 각 유형 -->
							<span class="cssMemoTypeBtn <c:if test="${workVO.memoType eq typ.dTailCd}">selected</c:if>" onclick="javascript:chngMemoType('${typ.dTailCd}','${workVO.sNb}','${typ.cdNm}',this);">${typ.cdDc}</span>							
						</c:forEach>
					</span>
					
				</div>
				<%-- </c:if> --%>
				
				<div class="triR<c:if test='${workVO.priv == "Y"}'>org</c:if>">&nbsp;</div>
				<div class="M_comR clr${workVO.importance}" title="클릭해서 수정하기" onclick="javascript:textareaClick(this);" style="<c:if test='${workVO.priv == "Y"}'>background:#FAAC58;</c:if>">${fn:replace(fn:replace(workVO.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
				<div class="M_comRinTA" style="display:none;"><div><textarea onkeyup="resizeTextarea(this)" onclick="resizeTextarea(this)" id="memoarea${memoStatus.count}" class="clr${workVO.importance}" style="min-height:140px;<c:if test='${workVO.priv == "Y"}'>background:#FAAC58;</c:if>">${workVO.comment}</textarea></div></div>
			<%-- 파일첨부 --%>
				<div style="cursor:pointer;">
				<c:if test="${not empty workVO.realNm}"><c:choose><c:when test="${fn:indexOf(workVO.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(workVO.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(workVO.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(workVO.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${workVO.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${workVO.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${workVO.realNm}</span></c:otherwise></c:choose></c:if>
				</div>
			<%-- 파일첨부 --%>
				<div style="clear:both;height:0px;"></div>
				
				<%-- <c:if test="${not empty cmntStaffNm}"> --%>
				<c:if test="${fn:length(cmntStaffNmList) gt 0}">
				<div class="hideCntrl" style="padding-top:3px;padding-left:5px; text-align:left;"><span class="btn s" onclick="javascript:reSend(${workVO.sNb});"><a>재전송</a></span></div>
				</c:if>
				
				<!-- ============= 본인이 작성한 첫글 :E ============= -->
				
				<!-- 참조인 -->
				<%-- <c:forEach var="cmnt" items="${cmntStaffNm}" varStatus="cmntS">
					<c:if test="${workVO.sNb == cmnt.mainSnb}">
						<div style="color:navy;font-size:11px;width:480px;">
							<div style="float:left;height:15px;">&nbsp;&nbsp;참조인:&nbsp;</div>
							<div>${cmnt.cmntStaffs}</div>
						</div>
					</c:if>
				</c:forEach> --%>
				<c:if test="${fn:length(cmntStaffNmList) gt 0}">
				<div style="color:navy;font-size:11px;width:480px;">
					<div style="float:left;height:15px;">&nbsp;&nbsp;참조인
						<span style="font-weight:bold;color:blue;cursor:pointer;" onclick="addMemoStaff(this, event, ${workVO.sNb}, ${workVO.mainSnb});"><a>[+]</a></span>:&nbsp;
					</div>
					<div>
					<c:forEach var="cmnt" items="${cmntStaffNmList}" varStatus="cmntS">					
						${cmnt.name}<a href="javascript:delMemoStaff(${cmnt.sNb},${cmnt.mainSnb},'${cmnt.name}');"><font color=red><b>x</b></font></a>
					</c:forEach>
					</div>
				</div>
				</c:if>
				<%-- <c:if test="${not empty cmntStaffNm}"> --%><c:if test="${fn:length(cmntStaffNmList) gt 0}"><div style="clear:both;height:5px;"></div></c:if>
				
				<c:set var="chkrpl" value="0"/>
				<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
					<c:if test="${workVO.sNb == replyCmt.mainSnb}"><c:set var="chkCmt" value="${replyCmt.sttsCd}"/><c:set var="chkrpl" value="1"/>
						<input type="hidden" id="memoRPSNb${rpS.count}" value="${replyCmt.sNb }">
							<c:choose>
							<c:when test="${replyCmt.rgId==userLoginInfo.id}">
						<%-- 본인이 작성한 댓글 --%>
						<%--div class="M_basicInfoR">나<br/>${fn:replace(fn:substring(replyCmt.tmDt,5,10),'-','.') }<br/>
							<span class="repEdit" onclick="replyUpd('${replyCmt.mainSnb}','${replyCmt.sNb}','${replyCmt.rgNm}',this)"><a><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></a></span>
							<span class="repEdit" onclick="replyDel('${replyCmt.sNb}')"><a><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
						</div>
						<div class="triR">&nbsp;</div>
						<div class="M_comR">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
						<div style="clear:both;height:5px;"></div--%>
						
						<div>
							<input type="hidden" id="oldMemoTmdt${memoStatus.count}" value="${fn:substring(replyCmt.tmDt, 0,10)}">
							<div class="M_basicInfoR bsnsR_btn">나<br/>${fn:replace(fn:substring(replyCmt.tmDt, 5,10),'-','.')}<div style="font-size:10px;">(${replyCmt.tmDtTime})</div>
								<%-- <span class="repEdit" onclick="replyUpd('${replyCmt.mainSnb}','${replyCmt.sNb}','${replyCmt.rgNm}',this)"><a><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></a></span>--%>
								<span class="btn s green" onclick="replyUpd('${replyCmt.mainSnb}','${replyCmt.sNb}','${replyCmt.rgNm}',this)"><a>저장</a></span>
								<span class="repEdit" onclick="replyDel('${replyCmt.sNb}')"><a><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
							</div>
							<div class="triR">&nbsp;</div>
							<div class="M_comR" title="클릭해서 수정하기" onclick="javascript:textareaClick(this);">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
							<div class="M_comRinTA" style="display:none;"><div class="repEdit"><textarea onkeyup="resizeTextarea(this)" onclick="resizeTextarea(this)" id="memoarea${memoStatus.count}" style="min-height:40px">${replyCmt.comment}</textarea></div></div>
							<c:if test="${replyCmt.sttsCd!='00002'}"><div style="float:right;color:red;width:14px;font-weight:bold;">1</div></c:if>
						</div>
						<%-- 파일첨부 --%>
						<div style="cursor:pointer;">
							<c:if test="${not empty replyCmt.realNm}"><c:choose><c:when test="${fn:indexOf(replyCmt.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(replyCmt.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(replyCmt.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(replyCmt.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${replyCmt.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${replyCmt.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${replyCmt.realNm}</span></c:otherwise></c:choose></c:if>
						</div>
						<%-- 파일첨부 --%>
						<div style="clear:both;height:5px;"></div>
						<%-- 본인이 작성한 댓글 --%>
							</c:when>
							<c:otherwise>
						<%-- 다른사람이 작성한 댓글 --%>
						<div class="M_basicInfoL">${replyCmt.rgNm}<br/>${fn:replace(fn:substring(replyCmt.tmDt,5,10),'-','.') }<div style="font-size:10px;">(${replyCmt.tmDtTime})</div>
						</div>
						<div class="triL">&nbsp;</div>
						<div class="M_comL">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
						<c:if test="${replyCmt.sttsCd!='00002'}"><div style="float:left;color:red;width:14px;font-weight:bold;text-align:right;">1</div></c:if>
						
						<%-- 파일첨부 --%>
						<div style="cursor:pointer;">
						<c:if test="${not empty replyCmt.realNm}">
							<c:choose>
								<c:when test="${fn:indexOf(replyCmt.realNm,'^^^') > 0}">
									<c:set var="imgNm" value="${fn:split(replyCmt.realNm, '^^^')}"/>
									<c:set var="makeNm" value="${fn:split(replyCmt.makeNm, '^^^')}"/>
									<c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt">
										<input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/>
									</c:forEach>
									<c:forEach var="im" items="${imgNm}" varStatus="imSt">
									<c:set var="extension" value="${fn:split(im,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									<img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}">
									<span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:set var="extension" value="${fn:split(replyCmt.realNm,'.')}"/>
									<c:set var="lastDot" value="${fn:length(extension)-1}"/>
									<input type="hidden"  id="mkNames1" value="${replyCmt.makeNm}"/>
									<c:set var="ext" value=""/>
									<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
									<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
									<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
									<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>
									<img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${replyCmt.realNm}">
									<span class="filePosition link" id="titlefile1" style="color:gray;"> ${replyCmt.realNm}</span>
								</c:otherwise>
							</c:choose>
						</c:if>
						</div>
						<%-- 파일첨부 --%>
						
						<div style="clear:both;height:8px;"></div>
						<%-- 다른사람이 작성한 댓글 --%>
							</c:otherwise>
							</c:choose>
					</c:if>
				</c:forEach>
				
				<c:if test="${chkrpl!=0}">
				
					<!-- ============= 내가 답글 달기 :S ============= -->
					<div style="border:1px solid #D4E6F1; background-color:#D4E6F1; margin-left:5px;margin-right:5px; padding-top:5px;padding-bottom:5px;">
				
					<div class="M_basicInfoR">나<br/><small>${fn:replace(fn:substring(replyCmt.tmDt, 5,10),'-','.')}</small>
						<c:if test="${userLoginInfo.name==workVO.name}">
						<span class="btn s green" onclick="reply('${workVO.sNb}','${workVO.mainSnb}','${userLoginInfo.name}',this)"><a>답글달기</a></span>
						<span class="btn s gold" onclick="reply('${workVO.sNb}','${workVO.mainSnb}','${userLoginInfo.name}',this, null, 'Y')"><a>읽음확인</a></span>
						<div><label><input type="checkbox" onclick="chkSmsSendClick(this);" style="padding: 2px 0px 2px 0px;"><b>SMS</b></label></div>
						</c:if>
					</div>
					
					
					
					<div class="triRn">&nbsp;</div>
					<div class="M_comRinTAn"><div><textarea onkeyup="resizeTextarea(this)" style="min-height:60px" id="memoarea0" placeholder="답장을 입력하세요."></textarea></div></div>
					
					<%-- 파일업로드 --%>
						<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/basic/filesUpload4memo.do' />" method="post" encType="multipart/form-data">
							<input type="hidden" id="m_categoryCd" name="categoryCd" value="00004">
							<input type="hidden" id="m_rtn" name="rtn">
							<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">
						</form>

						<div style="float:left;padding-left:20px;vertical-align:middle;">
							<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../images/file/fileDisk.png' />" align="absmiddle">File</a>
							<div><table id="file_list"></table></div>
						</div>
					<%-- 파일업로드 --%>
					
					<div style="clear:both;height:1px;"></div>
					
					</div>
					<!-- ============= 내가 답글 달기 :E ============= -->
					
				</c:if>
				<%-- <c:if test="${chkrpl!=0 and userLoginInfo.name==workVO.name}"><div class="cent"><span class="btn s red" onclick="chkRPok(this,'${memoStatus.count}')"><a>확인</a></span></div></c:if> --%>
			</c:otherwise>
		<%-- =============================================== 본인이 작성한 메모 :E ====================================================== --%>
			</c:choose>
		</c:when>
	
		<%-- =============================================== 타인의 메모(업무일지에서 다른사람 이름 클릭) :S ================================ --%>
		<c:otherwise>
			<input type="hidden" id="memoSNb${memoStatus.count}" value="${workVO.sNb }">
			
			<!-- <p id="closeTab" name="textR"><span class="closePopUpMenu" title="닫기">ⅹ닫기</span></p>
			<div style="clear:both;height:5px;"></div> -->
			<p id="closeTab" name="textR">
				<span style="display:inline-block;width:350px;padding-right:30px;text-align:center;color:#ffffff;">
					<%-- <c:if test='${workVO.tmDt lt todate}'> --%>일자 : ${workVO.tmDt}<%-- </c:if> --%>
				</span>
				<span class="closePopUpMenu" title="닫기">ⅹ닫기</span>
			</p>
			<div style="clear:both;height:5px;"></div>
			
			
			<%-- 메모유형 --%>
			<c:if test="${workVO.memoType ne '00010'}">
			<div style="padding-left:5px;">
				<span class="cssMemoTypeView">${workVO.memoTypeNm}</span>
			</div>
			</c:if>
			
			<div class="M_basicInfoL Toogle">${workVO.rgNm}<br/>${fn:replace(fn:substring(workVO.rgDt, 5,10),'-','.')}<div style="font-size:10px;">(${workVO.tmDtTime})</div>
				<%--	타인의 메모 삭제 불가(내가 작성자라도)
				<c:if test="${ workVO.rgId==userLoginInfo.id}">
				<span style="margin:3px;" class="hand" onclick="memo_btnDel(this)"><a><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></a></span>
				</c:if> --%>
			</div>
			<div class="triL<c:if test='${workVO.priv == "Y"}'>org</c:if>">&nbsp;</div>
			<div class="M_comL clr${workVO.importance}" style="<c:if test='${workVO.priv == "Y"}'>background:#FAAC58;</c:if>">${fn:replace(fn:replace(workVO.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
			<div style="clear:both;height:0px;"></div>
		<%-- 파일첨부 --%>
			<div style="cursor:pointer;">
			<c:if test="${not empty workVO.realNm}"><c:choose><c:when test="${fn:indexOf(workVO.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(workVO.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(workVO.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(workVO.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${workVO.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${workVO.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${workVO.realNm}</span></c:otherwise></c:choose></c:if>
			</div>
		<%-- 파일첨부 --%>
			<div style="clear:both;height:5px;"></div>
			
			
			<!-- ======================== 댓글 :S ======================== -->
			<c:if test="${fn:length(cmntStaffNmList) gt 0}">
				<div style="color:navy;font-size:11px;width:480px;">
					<div style="float:left;height:15px;">&nbsp;&nbsp;참조인:&nbsp;</div>
					<div>
					<c:forEach var="cmnt" items="${cmntStaffNmList}" varStatus="cmntS"><c:if test="${cmntS.count gt 1}">,</c:if> ${cmnt.name}</c:forEach>
					</div>
				</div>
			</c:if>
				
			<c:if test="${not empty cmntStaffNm}"><div style="clear:both;height:5px;"></div></c:if>
			<c:forEach var="replyCmt" items="${replyList}" varStatus="rpS">
				<%-- <c:if test="${workVO.mainSnb eq replyCmt.mainSnb}"> --%>
					
				
					<%-- <c:if test="${replyCmt.repSnb == '0'}"> --%>
				<div class="M_basicInfoL Toogle">${replyCmt.rgNm}<br/>${fn:replace(fn:substring(replyCmt.tmDt,5,10),'-','.') }<div style="font-size:10px;">(${replyCmt.tmDtTime})</div></div>
				<div class="triL">&nbsp;</div>
				<div class="M_comL">${fn:replace(fn:replace(replyCmt.comment, lf,"<br/>"),sp,"&nbsp; ")}</div>
				<c:if test="${replyCmt.sttsCd!='00002'}"><div style="float:left;color:red;width:14px;font-weight:bold;text-align:right;">1</div></c:if>
				
				<%-- 파일첨부 --%>
				<div style="cursor:pointer;">
				<c:if test="${not empty replyCmt.realNm}"><c:choose><c:when test="${fn:indexOf(replyCmt.realNm,'^^^') > 0}"><c:set var="imgNm" value="${fn:split(replyCmt.realNm, '^^^')}"/><c:set var="makeNm" value="${fn:split(replyCmt.makeNm, '^^^')}"/><c:forEach var="mkNm" items="${makeNm}" varStatus="mkSt"><input type="hidden" id="mkNames${mkSt.count}" value="${mkNm}"/></c:forEach><c:forEach var="im" items="${imgNm}" varStatus="imSt"><c:set var="extension" value="${fn:split(im,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file${imSt.count}" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${im}"><span class="filePosition link" id="titlefile${imSt.count}" style="color:gray;"> ${im}</span></c:forEach></c:when><c:otherwise><c:set var="extension" value="${fn:split(replyCmt.realNm,'.')}"/><c:set var="lastDot" value="${fn:length(extension)-1}"/><input type="hidden"  id="mkNames1" value="${replyCmt.makeNm}"/><c:set var="ext" value=""/><c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if><c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if><c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if><c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if><img class="link filePosition" id="file1" style="padding-left:20px;" <c:choose><c:when test="${empty ext or ext == ''}">src="../images/file/files.png"</c:when><c:otherwise>src="../images/file/${ext}.png"</c:otherwise></c:choose>title="${replyCmt.realNm}"><span class="filePosition link" id="titlefile1" style="color:gray;"> ${replyCmt.realNm}</span></c:otherwise></c:choose></c:if>
				</div>
				<%-- 파일첨부 --%>
				
				<div style="clear:both;height:8px;"></div>
				
					<%-- </c:if> --%>
					
				<%-- </c:if> --%>
			</c:forEach>
			<!-- ======================== 댓글 :E ======================== -->
			
						
		</c:otherwise>
		<%-- =============================================== 타인의 메모(업무일지에서 다른사람 이름 클릭) :E ================================ --%>
		</c:choose>
			<input type="text" id="MM_${fn:substring(workVO.tmDt, 8,10)}_${memoStatus.count}" style="height:0.5px;width:0.5px;border:0px none;padding:0;vertical-align:bottom;">
		</c:forEach>
		
		
		
		
	<%-- 최초 메모 입력 --%>
		<c:if test="${empty memoList}">
			<input type="hidden" id="memoSNb${DAY}">
			<input type="hidden" id="am_majorBsns" value="N">
			<input type="hidden" id="DirectRecord"><script>if($('#rgstId').val()!==$('#s_id').val()) $('#DirectRecord').val("direct");</script>
			<p id="closeTab" name="textR"><span class="closePopUpMenu" title="닫기">ⅹ닫기</span></p>
			<div style="clear:both;height:5px;"></div>
			<div class="M_basicInfoR">나<br/>
				<span style="margin:3px;" class="btn s green" onclick="memo_btnOk(this)"><a>저장</a></span>
				<div style="padding-top:3px;display:none;"><span class="btn s" onclick="javascript:majorBsns(this);"><a>주업무</a></span></div><!-- 숨김처리 -->
				<div style="padding:1px;border-radius:5px;border:1px solid gray;margin:5px 0px;">
					중요도<br/>
					<select id="importance${memoStatus.count}">
						<option value="0" <c:if test="${workVO.importance == 0}">selected</c:if>>-</option>
						<option value="1" <c:if test="${workVO.importance == 1}">selected</c:if>>하</option>
						<option value="2" <c:if test="${workVO.importance == 2}">selected</c:if>>중</option>
						<option value="3" <c:if test="${workVO.importance == 2}">selected</c:if>>상</option>
					</select>
				</div>
				<div style="padding:1px;border-radius:5px;border:1px solid gray;margin-bottom:3px;">
					비밀<br/>
					<select id="priv${memoStatus.count}">
						<option value="N" <c:if test="${workVO.priv == 'N'}">selected</c:if>>N</option>
						<option value="Y" <c:if test="${workVO.priv == 'Y'}">selected</c:if>>Y</option>
					</select>
				</div>
				<label><input type="checkbox" id="chkSmsSendGo" onclick="chkSmsSendClick(this);" style="padding: 2px 0px 2px 0px;"><b>SMS</b></label>
				<div style="padding-top:3px;"><span id="btnReceiver" class="btn s" onclick="javascript:viewNhide2('staffList',$(this),event);"><a>참조인</a></span></div>
			</div>
			
			<%-- 메모유형 변경 버튼 --%>
			<div style="padding-left:5px;">
				<input type="hidden" id="memoTypeNew" value="00010">	<!-- 기본값 : 전달 00010 -->
				<span id="memoTypeViewNew" class="cssMemoTypeView" style="visibility:hidden;">${cdMemoTypeList[0].cdNm}</span>				
				<span style="display:inline-block;width:5px;"><%-- ▶ --%></span>
				<span id="memoTypeBtnListNew">
					<c:forEach var="typ" items="${cdMemoTypeList}" varStatus="stts">		<!-- 각 유형 -->
						<span class="cssMemoTypeBtn" onclick="javascript:chngMemoTypeNew('${typ.dTailCd}','${typ.cdNm}',this);">${typ.cdDc}</span>							
					</c:forEach>
				</span>
				<%-- 
				<span style="float:right;display:inline-block;width:140px;">
					<label><input type="checkbox" value="00040" onclick="chngRequestWork();" name="requestWork" id="requestWork">업무요청(참조인)</input></label>
				</span>
				--%>
			</div>
			
			<div class="triRn">&nbsp;</div>
			<div class="M_comRinTAn"><div><textarea onkeyup="resizeTextarea(this)" id="memoarea0" placeholder="내용을 입력하세요."></textarea></div></div>

		<%-- 파일업로드 --%>
			<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/basic/filesUpload4memo.do' />" method="post" encType="multipart/form-data">
				<input type="hidden" id="m_categoryCd" name="categoryCd" value="00004">
				<input type="hidden" id="m_rtn" name="rtn">
				<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">
			</form>

			<div style="float:left;padding-left:20px;vertical-align:middle;">
				<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../images/file/fileDisk.png' />" align="absmiddle">File</a>
				<div><table id="file_list"></table></div>
			</div>
		<%-- 파일업로드 --%>

			<div id="selectUser" style="clear:both;margin:8px;padding:3px;color:blue;"></div> 	<!-- height:7px; -->
		</c:if>
	<%-- 최초 메모 입력 --%>
	</div>
<%-- 메모 --%>

<%-- 직원 플로팅 div (신규, 추가) :S --%>
	<div class="popUpMenu" id="staffList" style="width:320px;">
		<input type="hidden" id="staffListMode" value="NEW">		<!-- NEW:신규, UPDATE:수정 -->
		<input type="hidden" id="staffListAddMemoSNb" value="">		<!-- 추가하려는 업무보고 s_nb -->
		<input type="hidden" id="staffListAddMemoMainSnb" value="">	<!-- 추가하려는 업무보고 main_snb -->
		
		<div class="staff_header" style="padding-left:300px;padding-bottom:3px;margin-bottom:3px;background:#323232;"><i class="axi axi-close2" onclick="javascript:$('#staffList').hide();" style="font-size:17px;color:white;cursor:pointer;"></i></div>
			<div class="btn_tab">
				<button id="btn_pop_1" type="button" style="cursor:pointer;margin-left:3px;" onclick="getDivListPop('1');"><i class="axi axi-sitemap"></i> 부서별</button>
				<button id="btn_pop_2" type="button" style="cursor:pointer;" onclick="getDivListPop('2');"><i class="axi axi-ion-person-stalker"></i> 직원별</button>
			</div>	
			<div id="divisionDivPop"></div>
		<br/>
		<p class="bsnsR_btn" style="margin:0px;">			
			<span class="btn s green" id="btnStaffAdd" onclick="javascript:putStaffNames(this);"><a style="display:inline-block;width:40px;">확인</a></span>
			<label><input type="checkbox" id="chkSmsSend"><b>SMS발송</b></label>
			<!-- 닫기 -->
			<span class="staff_header" style="padding-left:306px;padding-top:3px;background:#323232;"><i class="axi axi-close2" onclick="javascript:$('#staffList').hide();" style="font-size:17px;color:white;cursor:pointer;"></i></span>
		</p>
	</div>
<%-- 직원 플로팅 div (신규, 추가) :E --%>


<%-- 직원 추가 :S 
<form name="addStaffForm" action="<c:url value='/work/insertMemo.do' />" method="post" onSubmit="chkval(this)">
 
	<input type="hidden" name="focus" id="focus" value="${focus}">
	<input type="hidden" name="tmpId" value="${tmpId}">
	<input type="hidden" name="name" id="name" value="${name}">
	<input type="hidden" name="comment" id="comment">
	<input type="hidden" name="day" id="memoDay">
	<input type="hidden" name="sttsCd" id="sttsCd">
	<input type="hidden" name="SMSTitle" id="SMSTitle">
	<input type="hidden" name="priv" id="privateYN" value="N">
	<input type="hidden" name="choice_month" id="choice_month" value="${choice_month}">
	<input type="hidden" name="choice_year" id="cc_year" value="${choice_year}">

	 
	<input type="hidden" name="addStaffNmList" id="addStaffNmList">
	<input type="hidden" name="smsSendAddStaff" id="smsSendAddStaff">
	
	<!-- <input type="hidden" id="am_SMSTitle">
	<input type="hidden" id="staffNmForSms"> -->
</form>
--%>
<%-- 직원 추가 :E --%>