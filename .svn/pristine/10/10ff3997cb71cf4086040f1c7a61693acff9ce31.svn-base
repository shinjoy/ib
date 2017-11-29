<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 


<!-- -------- each page css :S -------- -->
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<!-- -------- each page css :E -------- -->
<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>

<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>" ></script>

<script type="text/javascript">
CalAddCss();

$(function(){
	//항목 선택시 항목 그룹핑 정보 입력
	$("select[name='dv']").change(function(){
		var dv = $(this).val();
		var dv2 = null;
		if(dv != ""){
			if(dv > 0 && dv <= 50){
				dv2 = "1000";
			}else if(dv > 50 && dv < 100){
				dv2 = "2000";
			}else if(dv == 100){
				dv2 = "3000";
			}else if(dv > 100 && dv < 160){
				dv2 = "4000";
			}else if(dv == 160){
				dv2 = "5000";
			}else if(dv == 170){
				dv2 = "6000";
			}
			$("#dv2").val(dv2);
		}
	});
});

/**
 * trim
 */
String.prototype.trim = function(){
	    return this.replace(/(^\s*)|(\s*$)/gi, "");
};


function cardSubmitUpdate(th){
	
	$("input").css('background-color','');
	var obj = $(th).parent().parent().parent();
	var tmdt = obj.find("[id^=tmDt]");
	var cstSnb = obj.find("[id^=cstSnb]");
	var place = obj.find("[id^=place]");
	var dv = obj.find("[id^=dv]");
	var dv2 = obj.find("[id^=dv2]");
	var price = obj.find("[id^=price]");
	
	if(tmdt.val().is_null()){
		alert("일자를 선택하세요.");
		return 0;
	}
	if(cstSnb.val().is_null()){
		alert("대상자를 선택하세요.");return 0;
	}

	var len = $("input[name=memoSndName]:checkbox:checked").length;
	if(len<1){
		alert("시너지 참석자를 선택하세요.");return 0;
	}

	if(place.val().is_null()){
		place.focus();
		place.css('background-color','#A9F5BC');
		alert("장소를 입력하세요.");return 0;
	}
	if(dv.val().is_null()){
		dv.focus();
		dv.css('background-color','#A9F5BC');
		alert("항목을 선택하세요.");return 0;
	}
	
	/*
	if((dv.val()=='1'||dv.val()=='2'||dv.val()=='3'||dv.val()=='4') && dv2.val().is_null()){	//20150713 업태 구분추가(식사 >> 점심, 저녁 구분)
		dv2.focus();
		dv2.css('background-color','#A9F5BC');
		alert("식사구분을 선택하세요.");return 0;
	} */
	if(price.val().is_null()){
		price.focus();
		price.css('background-color','#A9F5BC');
		alert("금액을 입력하세요.");return 0;
	}
	$(th).hide();
		
	var frm = document.getElementById('insertCard');//sender form id
	frm.action = "updateUsed.do";//target frame name
	frm.target = "_parent";
	frm.submit();
}
</script>

</head>
<body style="padding:5px; background-color:white;">

<!-- ---------------------------- 항목말풍선 :S --------------------------------- -->
<div id="balloon" style="display:none;position:absolute;left:910px;top:130px;width:400px;height:480px;background-color:#BEEFFF;padding-left:10px;border-radius:20px;border:0px;">
<table><tr><td width="100%" bgcolor="#BEEFFF">
<br>
----------- 영업 관련 -------------------------------------<br>
점심-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 점심식사 )<br>
저녁-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 저녁식사 )<br>
회식-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 저녁 회식 - 저녁식사외 별도인 경우 )<br>
커피-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 식사외 비용 - 간식 포함)<br>
기타-업무&nbsp;&nbsp;&nbsp;  ( 업무 관계자와 위 사항 외 지출 비용)<br>
<br>
----------- 복리후생 관련 ---------------------------------</br>
점심-직원&nbsp;&nbsp;&nbsp;  ( 일상적인 직원 점심 )</br> 
저녁-야근&nbsp;&nbsp;&nbsp;  ( 본사 야근시 저녁 식사비용)</br> 
부서회식&nbsp;&nbsp;&nbsp;&nbsp;    ( 부서 회식비 )</br>
워크샵-식비 ( 워크샵 비용중 식대 관련 비용-식사,커피,간식 )</br>
워크샵-회식 ( 워크샵 비용중 회식 관련 비용 )</br>
<br>
----------- 교통비 관련 -----------------------------------<br>
대중교통비&nbsp; ( 택시,지하철,버스 이용시-업무 )<br>
<br>
----------- 차량 유지 관련 --------------------------------<br>
주유비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 및 본인 차량 운행시 - 워크샵 등 )<br>
주차비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 및 본인 차량 운행시 )<br>
세차비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
엔진오일&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
정비비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ( 업무용 차량 )<br>
<br>
---------- 운반비 관련 ------------------------------------<br>
택배비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     ( 택배 비용 )<br>
<br>
---------- 구입비 관련 ------------------------------------<br>
소모품비&nbsp;&nbsp;&nbsp;     ( 사무용품 구입 비용 )<br>
<br>
<%------------ 기타 --------------------------------------------<br>
기타&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       ( 위 사항에 포함되지 않는경우, 상세 설명 기록 )<br> --%>
</td></tr></table> 
</div>
<!-- ---------------------------- 항목말풍선 :E --------------------------------- -->


	<div style="padding:0px;">
	<form name="insertCard" id="insertCard" method="post">
	<input type="hidden" id="cardD" value="card">
	<input type="hidden" id="cardSnb" name="cardSnb" value="${snb}">
	<div class="popUpMenu" id="test" style="font-size: 1em;">
		<p class="closePopUpMenu">ⅹ닫기</p>
			<div id="userListDiv"></div>
		
		<p class=bsnsR_btn>
			<span class="memo_btnSnd btn s green"><a onclick="selectStaff()">선택</a></span>
		</p>
	</div>
	
	<table id="excelContentHeader" class="t_skinR00" style="width:100%;margin-top:25px;padding-right:5px;">
		<colgroup>
	        <col width="76">
	        <col width="57">
	        <col width="112">
	        <col width="112">
	        <col width="166">
	        <col width="175">
	        <col width="108">
	        <col width="87">
	        <col>
	        <col width="130">
	    </colgroup>
		<thead>
			<tr>
				<th rowspan="2" class="hand bgYlw" style="padding:5px 0;">일자</th>
				<th rowspan="2" class="hand bgYlw">입력자</th>
				<th colspan="2" class="bgYlw">대상자</th>
				<th rowspan="2" class="bgYlw">시너지<br/>참석자</th>
				<th rowspan="2" class="bgYlw">장소</th>
				<th rowspan="2" class="bgYlw">항목</th>
				<th rowspan="2" class="bgYlw">금액</th>
				<th rowspan="2" class="bgYlw"><nobr>지출</nobr><br/>목적</th>
				<th rowspan="2" class="bgYlw">승인<br/>피드백</th>
			</tr>
			<tr>
				<th class="bgYlw">회사</th>
				<th onclick="sortTable(2)" class="hand bgYlw">이름</th>
			</tr>
			<tr style="height:1px;"></tr>
		</thead>
		<tbody>
			<tr>
				<input type="hidden" name="cstSnb" id="cstSnb">
				<input type="hidden" name="tmDt" id="tmDt">
				<input type="hidden" name="dv2" id="dv2">
				<td class="cent bgRed" style="padding:5px 0;">
					<span id="cardDate">&nbsp;</span>
					<div id='CaliCal0Icon' style="padding-top: 1px;">
						<img id='CaliCal0IconImg' class='calImg' src='../images/calendar.gif'>
					</div>
					
					<input type="hidden" id="iCal0"/>
					<script>initCal({id:"iCal0",type:"day",today:"y"});</script>
				</td>
				<td class="cent bgRed"><span id="staffNm"></span><%--${userLoginInfo.name } --%></td>
				<td class="cent bgRed" id="sltCpn"></td>
				<td class="cent bgRed"><span class="btn s blue"><a onclick="popUp('','card')" id="sltNm">대상자</a></span><span id="sltCst" >외 <input type="text" name="etcNum" style="border:0;height:15px;width:14px;" onclick="if (this.value == this.defaultValue) {this.value='';}" value="0"/>명</span>
				</td>
				<!-- <td class="cent bgRed" id="sltPst"></td> -->
				<!-- <td class="cent bgRed"><span class="btn s orange"><button type="button" class="pass2P" id="0_0_staff_0">직원</button></span></td> -->
				<td class="cent bgRed"><span class="btn s orange"><input type="button" class="pass2P" id="0_0_staff_0" value="직원"/></span></td>
				<td class="cent bgRed"><input type="text" name="place" id="place" class="w96 pd0"></td>
				<td class="cent bgRed">
					<select name="dv" id="dv" class="pd0">
						<option value="">선택</option>
						<optgroup label="영업 관련">
						<!-- dv2 : 1000 -->
						<option value="10">점심-업무</option>
						<option value="20">저녁-업무</option>
						<option value="30">회식-업무</option>
						<option value="40">커피-업무</option>
						<option value="50">기타-업무</option>
						</optgroup>
						<optgroup label="복리후생 관련">
						<!-- dv2 : 2000 -->
						<option value="55">점심-직원</option>
						<option value="60">저녁-야근</option>
						<option value="70">부서회식</option>
						<option value="80">워크샵-식비</option>
						<option value="90">워크샵-회식</option>
						</optgroup>
						<optgroup label="교통비 관련">
						<!-- dv2 : 3000 -->
						<option value="100">대중교통비</option>
						</optgroup>
						<optgroup label="차량 유지 관련">
						<!-- dv2 : 4000 -->
						<option value="110">주유비</option>
						<option value="120">주차비</option>
						<option value="130">세차비</option>
						<option value="140">엔진오일</option>
						<option value="150">정비비</option>
						</optgroup>
						<optgroup label="운반비 관련">
						<!-- dv2 : 5000 -->
						<option value="160">택배비</option>
						</optgroup>
						<optgroup label="구입비 관련">
						<!-- dv2 : 6000 -->
						<option value="170">소모품비</option>
						</optgroup>
						<%--<optgroup label="기타">
						<option value="200">기타</option>
						</optgroup> --%>							
					</select>
					<%--<select name="dv2" id="dv2" class="pd0" style="width:60px;display:none;padding-top:3px;background-color:#eeeeee;">
						<option value="">구분</option>
						<option value="1">점심</option>
						<option value="2">저녁</option>
					</select> --%>
				</td>
				<td class="cent bgRed"><input type="text" name="price" id="price" class="w96 pd0 intNum" onKeyPress="return numbersonly(event, false)"></td>
				<td class="cent bgRed"><input type="text" name="note" id="note" class="w96 pd0"></td>
				<td class="cent bgRed"><span class="btn s green"><a onclick="cardSubmitUpdate(this);">저장</a></span></td>
			</tr>
			
		</tbody>
	</table>
	
	</form>
	</div>
<br/><br/><br/><br/><br/>
</body>
</html>



<script type="text/javascript">

//Global variables :S --------------- 

//공통코드
var comCodeMenuType;				//메뉴타입

var inputTitleBorder;				//제목 border style
var contentBorder;					//내용 border style

var cardSnb = '${snb}';						//카드 테이블 id

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//사람들 이름 보이기
		$(document).on("click",".pass2P", function(){
			var t_num = $(this).attr('id').split('_');
			var dId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+'memoPr'+ t_num[2];
			$('#memoDay').val(parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0]);
			$('#comment').val($("#"+dId).find('textarea').val());
			divId = 'test';
			divShow($(this));
			$("#PM_0").focus();
			
			parent.myModal.resize();	//본 팝업 리사이징
		});
		//닫기 클릭시
		$(document).on("click",".closePopUpMenu",function(event){
			$(this).parent().hide();
			$("#selectstaffname").hide();
		});
		function divShow(obj){
			var objId = obj.attr('id');
			object = objId;
			divPosition(objId,divId);
			$("#"+divId).css('display','block');
			$("#"+divId).show();

		}
		
		function divPosition(target,id){
			
			var browserWidth = document.documentElement.clientWidth;
			var tInput  = $("#" + target).offset();
			var tHeight = $("#" + target).outerHeight();
			var tWidth 	= $("#" + target).outerWidth();
			var calWidth 	= $("#" + id).outerWidth();

			if( tInput != null){				
				$("#" + id).css({"top":tInput.top+15 , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});
			}
		}
		
		$("#dv").mouseover(function(){
			$("#balloon").show();		//도움말풍선
			$("#balloon").css("left",270);	//$("#note").offset().left);
		
			parent.myModal.resize();	//본 팝업 리사이징
		});
		$("#dv").change(function(){
			$("#balloon").hide();		//도움말풍선
		});
		$("#dv").mouseout(function(){
			$("#balloon").hide();		//도움말풍선
		});
		
		//시너지참석자 리스트 가져오기
		fnObj.getUserList();
		
    	//fnObj.getUserList2();
		//공통코드
		//comCodeMenuType = getCommonCode('MENU_TYPE', lang, 'CD', 'NM');		//메뉴타입 공통코드 (Sync ajax)
		
		
		//var menuTypeRadioTag = createRadioTag('rdMenuType', comCodeMenuType, 'CD', 'NM', 'TREE');	//radio tag creator 함수 호출 (common.js)
		//$("#menuTypeRadioTag").html(menuTypeRadioTag);
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	/* if(mode=="new")		//신규일때 삭제버튼 hide
    		$('#btnDel').hide(); */
    	
    	
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
        
  	//저장
    doSave: function(){ 
    	
    	//-------------------- validation :S --------------------
    	//var frm = document.insertCard;
    	
    	if(isEmpty(frm.menuEng.value)){			//코드명
    		dialog.push({body:"<b>확인!</b> 코드명을 입력해주세요!", type:"", onConfirm:function(){frm.menuEng.focus();}});
    		return;
    	}
    	if(isEmpty(frm.menuKor.value)){			//한글명
    		dialog.push({body:"<b>확인!</b> 한글명을 입력해주세요!", type:"", onConfirm:function(){frm.menuKor.focus();}});
    		return;
    	}
    	if(isEmpty(frm.menuDesc.value)){		//설명
    		dialog.push({body:"<b>확인!</b> 설명을 입력해주세요!", type:"", onConfirm:function(){frm.menuDesc.focus();}});
    		return;
    	}
    	if(isEmpty(frm.menuTitleKor.value)){	//메뉴제목한글
    		dialog.push({body:"<b>확인!</b> 메뉴제목한글을 입력해주세요!", type:"", onConfirm:function(){frm.menuTitleKor.focus();}});
    		return;
    	}
    	if(isEmpty(frm.menuTitleEng.value)){	//메뉴제목영문
    		dialog.push({body:"<b>확인!</b> 메뉴제목영문을 입력해주세요!", type:"", onConfirm:function(){frm.menuTitleEng.focus();}});
    		return;
    	}
    	
    	//----- 코드명이 존재하는 코드명인지
		var menuCode = frm.menuEng.value.toUpperCase();		//등록하려는 코드명
    	var codeListArr = codeList.split(',');
    	for(var i=0; i<codeListArr.length; i++){
    		if(codeListArr[i] == menuCode){		//기 등록 코드명이면
    			dialog.push({body:"<b>확인!</b> 이미 등록된 코드명입니다! <br><br> 다른 코드명을 입력해주세요!", type:"", onConfirm:function(){frm.menuEng.select();}});
        		return;
    		}
    	}
    	
    	//-------------------- validation :E --------------------
    	
    	    	
    	var url = contextRoot + "/system/doSaveMenu.do";
    	var param = {
    			mode: mode,			//화면 모드 mode : "new", "update"
    			menuId: frm.menuId.value,
    			menuType: frm.rdMenuType.value,
    			menuClass: 'WHOLE',					//임시!!!!!!!!!!!!!!!!!!!!!!!!!!바꾸자!!!!!!어케할지!!!!!!!!!!!!!!!!!!!!!!!!
    			menuKor: frm.menuKor.value,
    			menuEng: frm.menuEng.value,
    			menuDesc: frm.menuDesc.value,
    			menuPath: frm.menuPath.value,
    			menuTitleKor: frm.menuTitleKor.value,
    			menuTitleEng: frm.menuTitleEng.value,
    			enable: frm.enable.value,
    	}
    	var callback = function(result){
    			
    		var obj = JSON.parse(result);
    		
    		//세션로그아웃 >> 재로그인
    		if(obj.result=='FAIL' && obj.resultVal=='SESSION'){
    			window.open('<c:url value="/login/loginPop.do" />', 'loginPop', 'width=500 height=200');
    		}
    		
    		var cnt = obj.resultVal;	//결과수
    		
    		if(obj.result == "SUCCESS"){
    			
    			parent.fnObj.doSearch(parent.curPageNo);	//목록화면 재조회 호출.
    			parent.myModal.close();						//글쓰기 창 닫기.
    			//parent.dialog.push("등록OK!");	
    			parent.toast.push("저장OK!");
    		}else{
    			//alertMsg();
    		}
    		
    	};
    	
    	commonAjax("POST", url, param, callback);
    },//end doSave
    
    getUserList : function (){
    	var url = contextRoot + "/work/selectuserList.do";
    	var param = {division : 'SYNERGY'};

    	    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    	
    		var str=" ";
    		if(list.length>0){
    			//str+=' <p style="background-color:white; text-align:center;"> <b>SYNERGY </b></p>';
    			for(var i=0 ; i<list.length ;i++){
    				str+=' <input type="checkbox" id="chbox'+i+'" name="memoSndName" value="'+list[i].usrNm+'"> ';
    				str+='<label for="chbox'+i+'" class="checkR">'+list[i].usrNm+' </label>';
    				if(i%2==1){
    					str+='<br/>';
    				}
    			}
    		}
    		$("#userListDiv").html(str);
    		
    		fnObj.setCardInfo();

    	};
    	commonAjax("POST", url, param, callback, true, null, null);
    },
    /* 
    getUserList2 : function(){
   	var url = contextRoot + "/work/selectuserList.do";
   	var param = {division : 'FIDES'};

   	    	    	
   	var callback = function(result){
   		var obj = JSON.parse(result);
   		var cnt = obj.resultVal;		//결과수
   		var list = obj.resultList;		//결과데이터JSON
   		console.log(list);
   	
   		var str=" ";
   		if(list.length>0){
   			str+='<p style="background-color:white; text-align:center;"><b> FIDES </b></p> ';
   			for(var i=0 ; i<list.length ;i++){
   				
   				str+=' <input type="checkbox" id="chbox'+i+'" name="memoSndName" value="'+list[i].usrNm+'"> ';
   				
   				str+='<label for="chbox'+i+'" class="checkR">'+list[i].usrNm+' </label>';
   				if(i%2==1){
   					str+='<br/>';
   				}
   			}
   		}
   		$("#userListDivFides").html(str);

   	};
   	commonAjax("POST", url, param, callback, true, null, null);
   }, */

  	//카드 정보 불러와 세팅
    setCardInfo: function(){
    	var frm = document.insertCard;    	
    	
    	var url = "<c:url value='/card/getCardInfo.do'/>";
    	var param = {
    					snb : cardSnb
    				};
    	
    	var callback = function(result){
		
    		var obj = JSON.parse(result);
    		 
    		var list = obj.resultList;
    		
    		if(obj.result == "SUCCESS"){
    			
    	    	//----- 내용뿌리기 :S -----
    	    	var cardObj = list[0];
    	    	$('#cardDate').html(cardObj.tmDt);		//일자
    	    	frm.tmDt.value = cardObj.tmDt;			//일자    	    	
    	    	$('#staffNm').html(cardObj.staffNm);	//입력자
    	    	$('#sltCpn').html(cardObj.cstCpnNm);	//대상자 - 회사
    	    	$('#sltNm').html(cardObj.cstNm);		//대상자 - 이름
    	    	frm.cstSnb.value = cardObj.cstSnb;		//대상자 id
    	    	frm.etcNum.value = cardObj.etcNum;		//대상자 - 명
    	    	//$('#sltNm').html(cardObj.staffNm);		//대상자 - 명
    	    	$('#0_0_staff_0').val(cardObj.staff);	//시너지참석자
    	    	frm.place.value = cardObj.place;		//장소
    	    	frm.dv.value = cardObj.dv;				//항목
    	    	frm.price.value = cardObj.price;		//금액
    	    	frm.note.value = cardObj.note;			//지출목적
    	    	frm.dv2.value = cardObj.dv2;    		//항목 그룹핑 
    	    	    	    	
    	    	//시너지 참석자
    	    	var sList = $('#0_0_staff_0').val().split(',');
    	        	    	
    	    	var staffList = document.getElementsByName('memoSndName');
    	    	for(var i=0; i<staffList.length; i++){
    	    		for(var k=0; k<sList.length; k++){
    	    			if(sList[k].trim() == staffList[i].value){
    	    				staffList[i].checked = true;
    	    			}
    	    		}
    	    	}
    	    	
    		}else{
    			//alertMsg();
    		}
    		
    	};
    	
    	commonAjax("POST", url, param, callback);
    	
    }//setCardInfo   
  	//################# else function :E #################
};//end fnObj.



/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	//fnObj.pageStart();		//화면세팅
	
	
	//카드 내용가져오기
	//fnObj.setCardInfo();
	
});

</script>