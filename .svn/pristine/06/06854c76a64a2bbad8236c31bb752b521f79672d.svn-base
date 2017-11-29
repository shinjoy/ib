<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지출 등록/수정</title>
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/n_typography.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/card.js?ver=0.2'/>" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sp/synergy_util.js?ver=0.1" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<style type="text/css">
.btn_div{
	margin: 20px 5px 20px 5px;
	text-align:center;
}
.btn_div .btn_span{
	 display:inline-block;
}
.btn_calendar {
    background: url(../images/common/board/btn_board_collection.gif) no-repeat;
    width: 18px;
    height: 18px;
    display: inline-block;
    vertical-align: middle;
    background-position: -27px 3px;
    padding: 5px 8px 5px 0px;
    font-size: 11px;
}
.btn_standard{
	border-radius:2px;
	padding:5px 20px 5px 20px;
	margin-left:7px;
}
.btn_inner{
	border-radius:2px;
	padding:2px 10px 2px 10px;
}
.division_style{
	background: #d1dae8;
    border: 1px dotted #a3a4ad;
    padding:3px 3px 3px 0px;
}
.user_dt {
	margin-top: 5px;
	color:#929ca5;
	
}
.user_dd {
	padding-bottom: 5px;
	border-bottom: 1px dotted #cbcfd6;
}
.user_dl{
	margin-bottom:7px;
}
input[type="checkbox"] {
	margin: 0px 3px 0px 0px !important;vertical-align: middle !important;
}
.schedule_table{
	border-top:2px solid #c7c9cc;
	background:white;
	width:100%;
}
.schedule_table tr{
	border-bottom:1px solid #c7c9cc;
}
.schedule_table tr td{
	border-left:1px solid #c7c9cc;
}

.supplie_table{
	border-top:2px solid #c7c9cc;
	border-right:1px solid #c7c9cc;
	width: 90%;
}
.supplie_table tr{
	border-bottom:1px solid #c7c9cc;
}
.supplie_table tr td{
	border-left:1px solid #c7c9cc;
	text-align:center;
}
.dv_notice{
	border-top:2px solid #c7c9cc;
	border-right:1px solid #c7c9cc;
	border-left:1px solid #c7c9cc;
	width: 90%;
	margin : 20px;
}
.dv_notice tr{
	border-bottom:1px solid #c7c9cc;
	background:#ffffff;
}
.dv_notice tr th{
	background:#eceef3;
	border-bottom:1px solid #c7c9cc;
}
.dv_notice tr td{
	border-left:1px solid #c7c9cc;
	background:#ffffff;
}
.dv_notice tr td table tr{
	border-bottom:1px solid #c7c9cc;
}
.dv_notice tr td table tr th{
	background:#ffffff;
}
.schedule_table tr.click_tr {font-weight:bold; }

</style> 

</head>
<!--========== 스케쥴 DIV : S ==========-->
<div style="display:none; position:absolute; width:70%;  height: expression( this.scrollHeight > 99 ? 200px : auto );/* expression( this.scrollwidth > 99 ? 200px : auto );  */ border:2px solid rgb(81, 84, 97);  background-color:white; z-index:1;" id="scheListArea" >
	<div id="listDiv" style="background:#4d4f52;"></div>
</div>
<!--=========== 스케쥴 DIV : E ==========-->
<!--====== 일정 등록 iframe 표시 DIV =======-->
<div id="ViewDiv" style="display:none;border-radius:10px;border:5px solid #DADADA;"></div>
<!--====== 도움말 항목 : S =======-->
<div id="balloon" style="display:none;position:absolute;left:910px;top:110px;width:500px;height:630px;background-color:rgb(255, 249, 221);padding-left:10px;border-radius:20px;border:1px dotted rgb(7, 14, 119);">
<table class="dv_notice">
	<colgroup>
	  <col width="15%"/> 
	  <col width="101px"/> 
      <col width="*"/> 
    </colgroup>
	<tr>
		<th style="border-right:1px solid #c7c9cc;">대분류</th>
		<th style="border-right:1px solid #c7c9cc;">소분류</th>
		<th>내용</th>
	</tr>
	<tr>
		<th>영업</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>점심업무</th>
					<td>업무 관계자와 점심식사</td>
				</tr>
				<tr>
					<th>저녁업무</th>
					<td> 업무 관계자와 저녁식사</td>
				</tr>
				<tr>
					<th>회식업무</th>
					<td>업무 관계자와 저녁 회식 -저녁식사외 별도인 경우</td>
				</tr>
				<tr>
					<th>커피업무</th>
					<td>업무 관계자와 식사외 비용 - 간식 포함</td>
				</tr>
				<tr>
					<th><font style="color:red;">기타업무</font></th>
					<td>고객 방문시 접대 선물 및 기타 물품 구매용</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>복리후생</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>저녁야근</th>
					<td>본사 야근시 저녁 식사비용</td>
				</tr>
				<tr>
					<th>부서회식</th>
					<td>부서 회식비 </td>
				</tr>
				<tr>
					<th>워크샵식비</th>
					<td>워크샵 비용중 식대 관련 비용-식사,커피,간식 </td>
				</tr>
				<tr>
					<th>워크샵회식</th>
					<td>워크샵 비용중 회식 관련 비용 </td>
				</tr>
				<tr>
					<th><font style="color:red;">점심-직원</font></th>
					<td>고객과의 점심이 아닌 일상적인 점심 </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>교통비</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>여비교통비</th>
					<td>택시,지하철,버스 이용시 및 출장(숙박)이용시 - 업무</td>
				</tr>
				<tr>
					<th>야근교통비</th>
					<td>야근후 택시,지하철,버스 이용시 - 업무</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>차량유지</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>주유비</th>
					<td>업무용 차량 및 본인 차량 운행시 - 워크샵 등 </td>
				</tr>
				<tr>
					<th>주차비</th>
					<td>업무용 차량 및 본인 차량 운행시</td>
				</tr>
				<tr>
					<th>세차비</th>
					<td>업무용 차량</td>
				</tr>
				<tr>
					<th>엔진오일</th>
					<td>업무용 차량</td>
				</tr>
				<tr>
					<th>정비비</th>
					<td>업무용 차량</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>운반비</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>택배비</th>
					<td>우편물, 택배 비용 </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>구입비</th>
		<td colspan="2">
			<table style="width:100%;">
				<colgroup>
				  <col width="100px"/> 
			      <col width="*"/> 
    			</colgroup>
				<tr>
					<th>소모품비</th>
					<td>사무용품 구입 비용 </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div>
<b>#영업관련 지출 등록시!!</b> <br> 점심업무 : 해당일의 점심일정 필수 <br>  저녁 or 회식 업무 : 해당일의 저녁일정 필수 / 커피업무,기타: 일정 필수 <br/> 
<b>#교통비,부서회식 지출 등록시!!</b> <br>대중교통비: 해당일의 일정 필수,부서회식 : 해당 일정 필수 <br/> 
<b>#저녁야근 지출 등록시!!</b> <br> 퇴근 시간 9시 이후일 경우 야근 인정, 야근식대 1인당 1만원 이하 지원  <br/> 
<b>#소모품 지출 등록시!!</b> <br> 구입품목 개별 입력(영수증 내역과 동일할 경우 인정)   <br/> 
<br/>
</div> 
</div>
<!--====== 도움말 항목 : E =======-->
<body>
	<input type="hidden" id="cstSnb" value="0">	<!-- 고객ID -->
	<input type="hidden" id="schSeq" value="0">	<!-- 스케쥴seq -->
	<input type="hidden" id="dv2">	<!-- dv2 -->
	<input type="hidden" id="cardSnb" value="${cardSnb}"> <!-- param cardSnb (0:신규등록, else:수정) -->
	<div style="margin:20px 30px;">
		<div><font style="font-size:20px;font-weight:bold;">*지출 ${cardSnb == 0 ? '등록' : '수정'}</font></div>
		<table id="SGridTarget" class="net_table_apply"  style="margin-top:5px;" summary="지출등록">
	       <caption>
	         	지출등록
	       </caption>
	       <colgroup>
	       		<col width="20%"/> 
	                  <col width="*"/> 
	            </colgroup>
            	  <tr>
         	 		<th><span id="tmDtSpan" style="color:red;font-weight:bold;">* </span>일자</th>
       		 		<td>
       		 			<input type="text" id="tmDt" class="applyinput_B w_st06" style="width:100px;" readonly="readonly"/>
						<a id="tmdtCalendar" href="#" onclick="fnObj.setEleSchedule(); $('#tmDt').datepicker('show');return false;" class="btn_calendar" style="margin-top:5px;padding: 3px 8px 5px 0px;"></a>
       		 		</td>
	       		 </tr>
	       		 <tr>
	         	 	<th><span id="dvSpan" style="color:red;font-weight:bold;">* </span>항목</th>
	       		 	<td>
	       		 		<span id="dvSelect"></span>		<!-- 항목선택 SELECT -->
	       		 		<span id="dvTxtArea"></span>	<!-- 항목선택 -->
	       		 		<span style="vertical-align: middle;padding-left:30px;font-size:15px;"><i id="qNa" class="axi axi-json-undefined3"></i></span>
	       		 	</td>
	       		 </tr>
	       		 <!--=============================항목에 따른 영역 : S================================-->
	       		 <tr id="carTr" style="display:none;">
		    		<th><span id="carSpan" style="color:red;font-weight:bold;">* </span>차량선택</th>
		    	 	<td>
		    	 		<div id="carDiv"></div>	
		    	 	</td>
		    	 </tr>
	       		 <tr id="scheduleTr" style="display:none;">
		    		<th><span id="scheduleSpan" style="color:red;font-weight:bold;">* </span>일정</th> 
		    		<td>
		    			<div id="noticeDiv" style="margin-bottom:4px;color:red;">*영업관련 지출 등록시 해당 일정이 필요합니다.*</div>
		    			<input type="text" id="scheTitle" placeholder="일 정 선 택" class="applyinput_B w_st06" style="width:70%;" readonly="readonly" onclick="fnObj.getScheduleList(this);"/>
		    			<i class="axi axi-refresh" onclick="fnObj.setEleSchedule();" style="font-size:20px;vertical-align: middle;cursor:pointer;"></i>
		    		</td>
	    	 	 </tr>
	    	 	 
	    	 	 
		    	 <tr id="companyTr" style="display:none;">
		    		<th><span id="companySpan"  style="color:red;font-weight:bold;">* </span>회사/고객</th>
		    	 	<td>
		    	 		<input type = "hidden"  id = "cstListCnt" value = "${cstList.length}"> <!-- 추가한 회사/고객 수 -->
		    	 		<input type = "hidden"  id = "selKeyNum" value = "0"> <!-- 선택한 id의 key 값(숫자) -->
		    	 		<!-- <button name="reg_btn" class="btn_inner" onclick="popUp('0','card');" style="border:1px solid #a3a5a9; background-color:#d0d3d8;"><span id="sltCpn"></span>  <span id="sltNm">대상자</span></button>
		    	 		<span id = "delRegCst" style="display:none;font-weight:bold;color:red;cursor:pointer;" onclick="delRegCst(this);" >   <a> X </a> </span> -->
	    	 		    <div id = "addRegCstDiv"></div>
		    	 		<span id = "addRegCst" style="font-weight:bold;cursor:pointer;" onclick="popUp('1','card', this);" >
		    	 			<a><i class="axi-ion-android-add-contact" style="font-size:18px;cursor:pointer;"></i></a><!-- 추가버튼 -->
		    	 		</span>
		    	 		<!-- <span id="sltCst" style="display:none;">외 <input type="text" id="etcNum" name="etcNum" style="border:1px solid #dad3d3;height:15px;width:14px;" onchange="fnObj.displayEtcName();" value="0"/>명</span>
		    	 		<span id="extraSpan" style="display:none;">
		    	 			<input type="text" id="extraName" placeholder="추가 대상자명을 입력하세요" class="applyinput_B w_st06" style="width:50%;" />
		    	 		</span> -->
		    	 	</td>
		    	 </tr>
		    	 
		    	 
		    	 <tr id="destinationTr" style="display:none;">
		    		<th><span id="destinationSpan" style="color:red;font-weight:bold;">* </span>목적지</th>
		    	 	<td>
		    	 		<span>출발지:
		    	 			<input type="text" id="fromLoc" onchange="fnObj.setArea();" class="applyinput_B w_st06" style="width:90px;"/>
		    			</span>
		    			<span>/ 도착지:
		    			<input type="text" id="toLoc" class="applyinput_B w_st06" style="width:90px;"/>
		    			</span>
		    		</td>
		    	 </tr>
		    <!--================================ 항목에 따른 영역 :E=====================================-->
	       		<tr id="areaTr">
	         	 	<th><span id="areaSpan" style="color:red;font-weight:bold;">* </span>장소</th>
	       		 	<td>
	       		 		<input type="text" id="place" class="applyinput_B w_st06" style="width:150px;"/>	
	       		 	</td>
	       		</tr>
	       		<tr id="priceTr">
	         	 	<th><span id="priceSpan" style="color:red;font-weight:bold;">* </span>금액</th>
	       		 	<td>
	       		 		<input type="text" id="price" name="price" class="applyinput_B w_st06" style="width:150px;" onkeyup="fnObj.setComma('price','');"/>	
	       		 	</td>
	       		</tr>
	       		<tr>
	         	 	<th><span id="noteSpan" style="color:red;font-weight:bold;">* </span>내용</th>
	       		 	<td>
	       		 		<input type="text" id="note" class="applyinput_B w_st06" style="width:500px;"/>
	       		 	</td>
	       		</tr>
	       		<tr class="userTr">
	         	 	<th scope="row" rowspan="2"><span id="userSpan" style="color:black;font-weight:bold;">* </span>사원선택</th>
	       		 	<td>
	       		 		<!-- <div id="divisionDiv"></div> -->
	       		 		<a href="javascript:fnObj.userPop();" class="btn_select_employee" id="IDNAME05"><em>직원선택</em></a>
	       		 	</td>
	       		</tr>
	       		<tr class="dot_line userTr">
	       			<td><div id="userSelectArea"></div></td>
	       		</tr>
	       	<!--================================ 소모품 입력란 :S=====================================-->
	       		<tr id="supplieTr" style="display:none;">
	    			<td colspan="2">
	    	 			<div id="supplieDiv" style="margin-left:10%;margin-top:10px;margin-bottom:15px;"></div>	
	    	 		</td>
	    	 	</tr>
	    	<!--================================ 소모품 입력란 :E=====================================-->
        </table>
        <div class="btn_div">
			<span class="btn_span" id="regBtnSpan">
				<button name="reg_btn" class="btn_standard" onclick="fnObj.doSave();" style="border:1px solid #323b5a; background-color:#59647a;"><span id="regTxtSpan" style="color:white;">등록</span></button>
			</span>
			<span class="btn_span" id="deleteBtnSpan">
				<button name="reg_btn" class="btn_standard" onclick="fnObj.doDelete();" style="border:1px solid #ce1b2d; background-color:#e85a5a;"><span style="color:white;">삭제</span></button>
			</span>
			<span class="btn_span">
				<button name="reg_btn" class="btn_standard" onclick="window.close();" style=" border:1px solid #a0a1a5; background-color:#f1f1f1;">닫기</button>
			</span>
		</div>
   </div>
</body>
</html>

<script type="text/javascript">

//일정등록 에서 호출
function LayerClose (flag) {
	$("#ViewDiv").hide();
	$("#scheListArea").css("display","none");
	if(flag == 'Add'){
		setTimeout(function(){
			$("#scheTitle").trigger("click");
		}, 2000); 
	}	
	
}
//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();		// instance		new sjs

var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division='${userLoginInfo.division}';		
var deptId='${userLoginInfo.deptId}';		  //팀 시퀀스	
var cardSnb='${cardSnb}';					  //지출 시퀀스  // cardList.jsp 에서 받은 param (신규:0/수정)
var approvalDate='${tmDt}';					// 카드승인일
var approvalCost='${approvalCost}';			// 카드 승인 금액
var approvalPlace='${placeName}';				//카드 사용장소
var cardCorpSnb='${cardCorpSnb}'==''?0:'${cardCorpSnb}';				//법인카드내역 시퀀스
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

//Global variables :E ---------------
var userList;				//전체 유저리스트
var entryList = [];			//참가자 리스트
var scheduleList;			//스케쥴 리스트
var g_rowId = 0;				//동적 table tr 고유 ID 
var mroList;				//소모품 리스트
var cardObj = {};			//지출 내역
var dv2List = [];				//dv2 리스트
var dvList = [];				//dv 리스트
var cstList= [];				// 지출등록 회사/고객 리스트
var cstListStr = "";			// 지출등록 회사/고객 str
var regCstList = [];			// 지출등록 회사/고객 리스트






/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	//선로딩코드
	preloadCode: function(){
		//공통코드
		//캘린더 세팅		
		fnObj.setDatepicker('tmDt');
		cstList = [];  // 회사/고객 초기화
		cstListStr = "";
		/*================ 항목 SELECT :S ===============*/ 
		// 공통코드 조회
		dv2List = getCommonCode('00024', '', 'CD', 'NM', null, '', '');		//dv2의 메뉴cd 00024
		dvList = getCommonCode('00025', '', 'CD', 'NM', null, '', '');			//dv의 메뉴cd 00025
		
		var beforeDtailCd ='';
		var str = '<select id="dv" style="height:22px;width:100px;" onchange="fnObj.divSetting();">';
		str+='<option value="">선택</option>';
		for(var i=0; i< dv2List.length; i++){
			if(beforeDtailCd != dv2List[i].dtailCd){
				if(i!=0){
					str += '</optgroup>';
				}
				str += '<optgroup label="'+dv2List[i].cdNm+'">';
			}
			for(var k=0; k<dvList.length; k++){
				if(dv2List[i].dtailCd == dvList[k].cdSort){
					str += '<option value="'+parseInt(dvList[k].dtailCd)+'">'+dvList[k].cdNm+'</option>';
				}
			}
			beforeDtailCd = dv2List[i].dtailCd;
		}
		$("#dvSelect").html(str);
		/*================ 항목 SELECT :E ===============*/ 
		
		/*================ 차량리스트 :S ===============*/ 
		var carList = getCodeInfo(null,'','',null, null, null,'/car2/carList.do',{sNb : sNb , enable : 'Y'});  // 차량 조회
		carList=sortByKey(carList, 'owned', 'ASC');			//개인차량을 아래로
		
		var beforOwned='';
		//var str='<select id="carSelect" onchange="fnObj.carChage();">';
		var str='<select id="carSelect" >';
		for(var i=0; i<carList.length; i++){
			
			if(beforOwned !=carList[i].owned){
				if(i!=0){
					str += '</optgroup>';
				}
				var type = '';
				if(carList[i].owned == 'B'){
					type = '법인';
				}else if(carList[i].owned == 'P'){
					type = '개인';
				}
				str += '<optgroup label="'+type+'차량">';
			}
			str += '<option value="'+carList[i].carId+'">'+''+carList[i].owned+'&nbsp;'+carList[i].carNumber + '&nbsp;-' + carList[i].carModel+'</option>';
			//carList[i].carModel = carList[i].carNumber + '&nbsp;-' + carList[i].carModel; 
			beforOwned = carList[i].owned;
		}
		str += '</optgroup>';
		str += '</select>';
		console.log(str);
		//var cstSelectTag = createSelectTag('carSelect', carList, 'carId', 'carModel','${userLoginInfo.cusId}', 'fnObj.carChage();', '', 150, 'selUserStyle1');		
		$("#carDiv").html(str);
		$("#carSelect").append('<option value="0">=====차량선택====</option>');
		$("#carSelect").css('height','22px');
		/*================ 차량리스트 :E ===============*/ 
		
		if(cardSnb == 0){	//등록일떄 기본 날짜 오늘 세팅.
			var nowDate = new Date();
			$("#tmDt").val(new Date().yyyy_mm_dd());
		}
		var obj = $("#qNa").offset();	//물음표 버튼 위치
		//도움말 말풍선
		$("#dv").mouseover(function(){
			$("#balloon").show();		//도움말풍선
			$("#balloon").css("left",obj.left);	
		});
		$("#qNa").mouseover(function(){
			$("#balloon").show();		//도움말풍선
			$("#balloon").css("left",obj.left);	
		});
	 	$("#dv").mouseout(function(){
			$("#balloon").hide();		//도움말풍선
		});
	 	$("#qNa").mouseout(function(){
			$("#balloon").hide();		//도움말풍선
		});
	 	 	
	},
	//화면세팅
    pageStart: function(){
    	if(cardSnb != 0){	 	 //수정
    		fnObj.getCardUse();							//수정일때 지출 데이터 조회
    		$("#regTxtSpan").html("수정");				//글씨 바꾸기
    	}else{				 //등록
    		$("#cstListCnt").val('0');   // 등록된 회사/고객 초기화
    		$("#deleteBtnSpan").css("display","none");	//삭제버튼 감추기
    		// 법인카드 조회내역의 날짜, 금액, 장소를 자동기입한다
        	// 날짜와 금액은 수정 불가능하도록 막는다.
        	if( approvalDate != '' ){
        		$("#tmDt").val(approvalDate);		//날짜세팅
        		$("#tmdtCalendar").hide();		
        	}
    		if( approvalCost != '' ){
    			$("#price").val(StringWithComma(approvalCost));		// 금액셋팅
    			$("#price").prop('readonly', true);					// 셋팅된 금액 수정 불가
    		}
    		if( approvalPlace != '' ){
    			$("#place").val(approvalPlace);			// 장소 셋팅, 
    			$("#place").prop("readonly",true);		// 장소 수정불가
    		}
    		
    	}
    	//$("#userSelectArea").empty();
    	//fnObj.divisionList();
    },//end pageStart.
    //검색
    doSearch: function(page){ 
    },//end doSearch
    
/*=======================================================기본세팅 관련 func : S ============================================== */    
    
    //항목에 따른 표시
    divSetting : function(){  // 항목 변경 시 event
    	fnObj.eleDisplay();				//tr display 기본 초기화.
    	fnObj.setEleSchedule();			//
    	var dv = $("#dv").val();
    	var dv2 = 0;
    	var dvInfo = getRowObjectWithValue(dvList, 'dtailCd', fillzero(dv,5));		//리스트에서 해당 dv에 대한 공통코드 추출.
    	dv2 = parseInt(dvInfo.cdSort);
    	$("#dv2").val(dv2);	//그룹핑
    	$("#noticeDiv").html("*영업관련 지출 등록시 해당 일정이 필요합니다.*");
    	$("#scheduleSpan").css("color","red");
		$("#companySpan").css("color","red");
		
    	if(dv2 == "1000" || dv2 == "3000" || dv=="70"){ //영업관련 + 대중교통(100) + 부서회식 
    		$("#scheduleTr").css("display","");
    		if(dv!="70" && dv!="105"){					//부서회식이 아니고 야근교통비(105)도 아니면 대상자 보이기
    			$("#companyTr").css("display","");
    		}else{										//부서회식일 경우 해당 부서 사람들 체크 
    			/* if(dv != cardObj.dv){	
    				$("#"+division+'_deptAry'+deptId).trigger("click");
    			} */
    		}
    		if(dv2 == "3000"){
    			$("#destinationTr").css("display","");
    			//$("#scheduleSpan").css("color","black");
    			if(dv=="105")  // 야근교통비
    				$('#areaTr').css("display","none");
    		}
    	}else if(dv2 == "4000"){	//차량유지관련
    		$("#scheduleTr").css("display","");
    		$("#companyTr").css("display","");
    		$("#carTr").css("display","");
    		$("#noticeDiv").html("*차량관련 등록시 일정은 필수 항목이 아닙니다.*");
    		$(".userTr").css("display","none");
    		$("#scheduleSpan").css("color","black");
    		$("#companySpan").css("color","black");
    	}else if(dv2 == "5000" || dv2 == "6000" ){	//택배비,소모품비
    		$(".userTr").css("display","none");
    		$("#areaTr").css("display","none");
    		if(dv2 == "6000"){//소모품일때
    			g_rowId =0;		// tr Id초기화
    			fnObj.supplieDivSet();
    			$("#priceTr").css("display","none");
    		}
    	}
    },
    
    //tr display 기본 초기화.
    eleDisplay : function(){
    	//$("#scheduleSpan").css("color","red");
    	$("#scheduleTr").css("display","none");
    	$("#destinationTr").css("display","none"); 
    	$("#companyTr").css("display","none"); 
    	$("#carTr").css("display","none"); 
    	$(".userTr").css("display",""); 
    	$("#areaTr").css("display","");
    	$("#supplieTr").css("display","none");
    	$("#priceTr").css("display","");
    	
    	//value 초기화.
    	fnObj.setEleSchedule(); 	//일정관련 
    	$("#fromLoc").val('');
    	$("#toLoc").val('');
    	$("#carSelect").val('0');
    	$("#place").val(approvalPlace!=''?approvalPlace:'');
    	if( approvalPlace!='' ){
    		$("#place").val(approvalPlace);
    	}
    	$("#price").val(approvalCost!=''?approvalCost:'');
    	$("#note").val('');
    	
    	$("#addRegCstDiv").empty();  // 회사/고객 empty 
    	$("#userSelectArea").empty();
    	
    	//fnObj.divisionList();
	},
	
	//datepicker 설정
    setDatepicker : function(obj){		
		$('#'+obj).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			showOn: "button",
			maxDate: new Date(),
			yearRange: 'c-7:c+7',
		 	monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
		    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
		    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], // 요일 텍스트 설정
		    dayNamesShort: ['일','월','화','수','목','금','토'], // 요일 텍스트 축약 설정    
		    dayNamesMin: ['일','월','화','수','목','금','토'], // 요일 최소 축약 텍스트 설정
		    showButtonPanel: false,
			isRTL: false,
		    buttonImageOnly: true,
		    buttonText: ""
		});	
    },
    
    //출발지 입력시 장소 자동 입력
    setArea : function(){
    	if(!$("#place").attr("readonly")){			//장소 불가 처리일때
    		 $("#place").val($("#fromLoc").val());
    	}
	  
    },
    
  /*   //차량 변경시 메모 자동입력
    carChage : function(){
       $("#note").val('['+$("#carSelect option:selected").text()+']');
    }, */
    
    //외 몇 명 이름 세팅
    /* displayEtcName : function(){
    	var etcNum = $("#etcNum").val();
    	if(strInNum(etcNum)){
	    	if(etcNum>0){
	    		$("#extraSpan").css("display","");
	    		$("#extraName").focus();
	    	}else{
	    		$("#extraSpan").css("display","none");
	    	}
    	}else{
    		alert("숫자만 입력 가능합니다.");
    		$("#etcNum").val("0");
    		$("#etcNum").focus();
    	}
    }, */
      
    
/*=======================================================기본세팅 관련 func : E ============================================== */  



/*=======================================================회사/고객 관련 func : E ============================================== */ 
	setCstList : function(regCstList){  // 수정시 지출등록 회사/고객 세팅
		var str = '';
		
		for(var i = 0; i < regCstList.length; i++){   // 조회된 대상자만큼 세팅
			str += '<span id="addCstSnb_'+i+'" name="addCstSnbSpan"><input type="hidden" id="cstSnb_'+ i +'" name = "regCstSnb" value="'+regCstList[i].cstSnb+'">';  // cst_snb 값
			str += '<input type="hidden" id="cstSnb_'+ i +'" name = "regSnb" value="'+regCstList[i].sNb+'">';   // card_s_nb(s_nb) 값
			str += '<button id="addCstSnb_'+i+'" name="reg_btn" class="btn_inner" onclick="popUp(\'0\',\'card\',this);" style="border:1px solid #a3a5a9; background-color:#d0d3d8;"><span id="sltCpn_' + i + '">'+regCstList[i].cpnNm+'</span>   <span id="sltNm_'+ i +'">'+regCstList[i].cstNm+'</span></button>' ;
			str += '<span id = "delRegCst_'+i+'" style="font-weight:bold;color:red;cursor:pointer;" onclick="delRegCst(this);"><a><i class="fa fa-times"></i></a>&nbsp;</span>' ;
			str += '</span>';
		}
	
		$("#cstListCnt").val(regCstList.length);	        // 등록된 회사/고객 수 
		$("#addRegCstDiv").html(str);						// div에 표시
	},
	
/*=======================================================회사/고객 관련 func : E ============================================== */ 	
	
	

/*=======================================================사원선택 관련 func : S ============================================== */
 	
    //유저선택 공통 팝업
    userPop : function(){
    	
    	var userStr ='';
    	var arr =[];
    	var selectUserList =$("input[name=selectUserId]");
    	
    	for(var i=0;i<selectUserList.length;i++){
    		arr.push(selectUserList[i].value);
  		}
    	//alert('${userLoginInfo.staffSnb}');
    	if(arr.length == 0) arr.push('${userLoginInfo.staffSnb}');
    		
    	userStr = arr.join(',');
    	
    	var paramList = [];
        var paramObj ={ name : 'userList'   ,value : userStr};
        paramList.push(paramObj);
        paramObj ={ name : 'isOneOrg' ,value : 'Y'};
        paramList.push(paramObj);
        paramObj ={ name : 'isAllOrgSelect' ,value : 'N'};
        paramList.push(paramObj);
    
        userSelectPopCall(paramList);		//공통 선택 팝업 호출 
    	
 	
 	},
 	
 	//직원 선택 
  	getResult : function(resultList){
  		var str ='';
  		var seqArr =[];
  		var selectList = [];
  	
		var brCnt = 1;
  		
  		for(var i=0;i<resultList.length;i++){
  			
  			str +='<span class="employee_list" id="userOneArea_'+resultList[i].userId+'" style="display:inline-block;width:140px;"><span>'+resultList[i].userName+'</span><em>(';
  			str +=resultList[i].position+')</em><a onclick="javascript:fnObj.deleteUser('+resultList[i].userId+');" class="btn_delete_employee"><em>삭제</em></a>';
  			str +='<input type="hidden" name="selectUserId" value="'+resultList[i].userId+'"/>';
  			str +='<input type="hidden" name="selectUserSabun" value="'+resultList[i].sabun+'"/>';
  			if(i<resultList.length-1){
    				str+=',';
    		}
  			str+='</span>';
  			brCnt++;
  			//if(brCnt%6 ==1) str+='<br/>';
  			
  			
    	}
  		$("#userSelectArea").html(str);					//참여자 이름
  		
  	},
  	
 	//삭제버튼 클릭
 	deleteUser : function(userId){
 		$("#userOneArea_"+userId).remove();
 	},
 
/* =====================================================사원선택 관련 func : E ============================================== */	

/* =====================================================소모품 관련 func : S ================================================ */
	
	//소모품 세팅영역
	supplieDivSet :function(){
		var str = '<span style="color:#a5a4a4;font-weight:bold;">*구매내역을 입력해 주세요.</span>';
		str += '<table id="supplieAll" class="supplie_table">';
		str += '<colgroup>';
		str += '<col width="5%">';
	    str += '<col width="*%">';
	    str += '<col width="20%">';
	    str += '<col width="10%">';
	    str += '<col width="20%">';
	    str += '<col width="15%">';
	    str += '</colgroup>';
	    str += '<tr>';
	    str += '<td style="text-align:center;"></td>';
	    str += '<td style="text-align:center;"><b>목록</b></td>';
	    str += '<td style="text-align:center;"><b>단가</b></td>';
	    str += '<td style="text-align:center;"><b>수량</b></td>';
	    str += '<td style="text-align:center;"><b>금액</b></td>';
	    str += '<td style="text-align:center;"><b>관리</b></td>';
	    str += '</tr>';
	   
		/*======================== 합계======================= */
	    str += '<tr>';
	    str += '<td colspan="3" style="text-align:center;"><b>합   계</b></td>';
	    str += '<td colspan="3" style="text-align:center;"><span id="sumDiv"></span></td>';
	    str += '</tr>';
	    /*======================== 합계======================= */
	    str += '</table>';
	    $("#supplieDiv").html(str);
	    $("#supplieTr").css("display","");
	    if(cardSnb!=0 && cardObj.dv == 170){		//소모품에서 수정일때
		    for(var i=0; i<mroList.length;i++){	//소모품 리스트 
		    	fnObj.appendTr(mroList[i].mroName,mroList[i].price,mroList[i].qty,mroList[i].price*mroList[i].qty);	//tr세팅
	    	}
		    fnObj.priceTotalCal();
	    }else{			//등록일때
	    	fnObj.appendTr('',0,1,0,0);	//첫번째 row 생성
	    }
	},
	
	//추가 버튼 클릭시 
	appendTr : function(name,price,qty,totalPrice){
		var table = document.getElementById("supplieAll");
		var rowIndex = table.rows.length-1;      // 테이블(TR) row 개수 행의 idx 를 찾을때 사용. 
		newTr = table.insertRow(rowIndex);
		newTr.id = "newTr" + g_rowId;			 //g_rowId -> 전역변수로 세팅 tr 생성시마다 1증가. (고유 아이디값을 주어 삭제시 삭제하기위해) 이후, 삭제시 해당 tr 삭제.
		newTd=newTr.insertCell(0);
		newTd.style = "text-align:center";
		newTd.innerHTML= '<span name="plusBtn" id="addBtn_'+g_rowId+'"><b><i class="axi axi-square-plus" style="cursor:pointer;font-size: 15px;" title="추가" onclick="fnObj.appendTr(\'\',0,1,0);"></i></b></span>';
		newTd=newTr.insertCell(1);
		newTd.style = "text-align:center";
		newTd.innerHTML= '<input type="text" name="supplieName"  id="supplieName_'+g_rowId+'" onchange="fnObj.chkEqName(\''+(g_rowId)+'\');"   class="applyinput_B w_st06" style="width:150px;" value="'+name+'"/>';
		newTd=newTr.insertCell(2);
		newTd.style = "text-align:center";
		newTd.innerHTML= '<input type="text" name="supplieUnitPrice" id="supplieUnitPrice_'+g_rowId+'" onkeyup="fnObj.priceOneCal(\'supplieUnitPrice_\',\''+(g_rowId)+'\');" class="applyinput_B w_st06" style="width:80px;" value="'+Number(price).toLocaleString()+'"/>';
		newTd=newTr.insertCell(3);
		newTd.style = "text-align:center";
		newTd.innerHTML= '<input type="text" name="supplieCount" id="supplieCount_'+g_rowId+'" onkeyup="fnObj.priceOneCal(\'supplieCount_\',\''+(g_rowId)+'\');" class="applyinput_B w_st06" style="width:30px;" value="'+Number(qty).toLocaleString()+'"/>';
		newTd=newTr.insertCell(4);
		newTd.style = "text-align:center";
		newTd.innerHTML= '<input type="text" name="suppliePrice" id="suppliePrice_'+g_rowId+'" class="applyinput_B w_st06" style="width:80px;" readonly value="'+Number(totalPrice).toLocaleString()+'"/>';
		newTd=newTr.insertCell(5);
		newTd.style = "text-align:center";
		if(rowIndex>1){								//첫번째 제외 삭제버튼 세팅
			newTd.innerHTML= '<button name="reg_btn" class="btn_inner" onclick="fnObj.deleteTr('+g_rowId+');" style=" border:1px solid #ef2929; background-color:#f36e6e;color:white;">삭제</button>';
		}
		g_rowId =g_rowId+1;
		fnObj.resetPlusBtn();						//추가버튼리셋(마지막에만)
	},
	
	//삭제버튼 클릭시
	deleteTr : function(g_rowId){		
		$("#newTr"+g_rowId).remove();				//g_rowId -> 전역변수로 세팅 tr 생성시마다 1증가. 이후, 삭제시 해당 tr 삭제.
		fnObj.resetPlusBtn();						//추가버튼리셋(마지막에만)
		fnObj.priceTotalCal();
	},
	
	//추가버튼리셋(마지막에만)
	resetPlusBtn: function(){
		var plusList =$('span[name=plusBtn]');		
		for(var i=0; i<plusList.length;i++){
			$(plusList[i]).hide();
			if(i == plusList.length-1){				//마지막 버튼만 보이게
				$(plusList[i]).show();
			}
		}
	},
	
	//콤마생성.
	setComma : function(obj,g_rowId) {
		var setValue = $("#"+obj+g_rowId).val();
		var p = setValue;
		if(setValue.length>3){
			 p =setValue.match(/\d+/g).join('');
		}
		
		var reg = /(^[+-]?\d+)(\d{3})/;  
		p += '';  
		while (reg.test(p)) p = p.replace(reg, '$1' + ',' + '$2');
		//valueList[idx].value = p;
		$("#"+obj+g_rowId).val(p);
	},
	
	//소모품 한개 계산.
	priceOneCal : function(obj,g_rowId){
		fnObj.setComma(obj,g_rowId);	//콤마생성
		var supplieUnitPrice =$("#supplieUnitPrice_"+g_rowId).val(); 		//g_rowId(고유값) 단가
		var supplieCount 	 =$("#supplieCount_"+g_rowId).val();			//g_rowId(고유값) 수량
		var suppliePrice	 =$("#suppliePrice_"+g_rowId).val(); 			//g_rowId(고유값) 금액 
		var total = '0';
		if(supplieUnitPrice != '' && supplieCount != ''){
			var reg = /(^[+-]?\d+)(\d{3})/;  
			//계산
			total = parseInt(supplieUnitPrice.replace(/,/g,'')) * parseInt(supplieCount.replace(/,/g,''));
			//계산 값 콤마 생성 
			total+='';
			while (reg.test(total)) total = total.replace(reg, '$1' + ',' + '$2');
		}
		$("#suppliePrice_"+g_rowId).val(total);								//개별 금액 세팅(한개row)
		fnObj.priceTotalCal();												//전체 금액 세팅(전체row)
	},
	
	//소모품 합계.
	priceTotalCal : function(){
		var supplieUnitPriceList = $('input[name=supplieUnitPrice]');	//단가 리스트
		var supplieCountList 	 = $('input[name=supplieCount]');		//수량 리스트
		var total = 0;
		for(var i =0; i<supplieUnitPriceList.length;i++){
			var supplieUnitPrice = supplieUnitPriceList[i].value.replace(/,/g,'');		//idx 단가(row)
			var supplieCount = supplieCountList[i].value.replace(/,/g,'');				//idx 수량(row)
			if(supplieUnitPrice!='' && supplieCount!=''){								//둘다 값이 있을때 계산
				total+=  parseInt(supplieUnitPrice)*parseInt(supplieCount);
			}
		}
		$("#price").val(total);
		$("#sumDiv").html(Number(total).toLocaleString());
	},
	
	//이름 체크
	chkEqName :function(g_rowId){
		var supplieNameList = $('input[name=supplieName]');				//이름 리스트
		var cnt =0;														//동일한 이름 카운트
		var idx =-1;													//동일한 이름 idx
		var lastIdx =0;
		for(var i=0;i<supplieNameList.length;i++){
			var supplieName = supplieNameList[i].value;					//idx 이름(row)
			if(supplieName ==  $("#supplieName_"+g_rowId).val()){
				cnt ++;
				if(idx==-1){idx = i;}			//제일 처음 idx 세팅
				else if(idx==0){idx = 0;}		//이미 idx 세팅되있지만, 첫번째 행일때
				lastIdx = i;					//마지막 값 세팅
			}
		}
		if(cnt>1){																//동일한 이름이 지금 입력 +1 이면,
			if(confirm("동일한 이름이 존재합니다.동일 내역에 입력하시겠습니까?")){
				supplieNameList[idx].focus();									//처음 동일이름 focus
				if(g_rowId!=0){fnObj.deleteTr(g_rowId);}						//방금 입력한 행 삭제.(첫번째 행이 아닐때)
				else{															//첫번째 행을 일때
				 	var supplieNameId = $(supplieNameList[lastIdx]).attr('id'); //동일 이름의 마지막 아이디를 가져와
				 	var rowIdx = supplieNameId.split("_")[1];					//번호
				 	fnObj.deleteTr(rowIdx);
				}
			}
		}
	},
/* ===================================================소모품 관련 func : E ================================================ */

/* ===================================================일정 관련 func : S ================================================ */
   
   //해당 사람 스케쥴 리스트
   getScheduleList : function(th){
	  
		//var url = contextRoot + "/car2/popUpmemoAjax.do";
		var url = contextRoot + "/card/getScheduleForCard.do";
		
		var selectDate = $("#tmDt").val();
		var scheduleType = $("#dv").val();
		var param = { date: selectDate , sabun:'${userLoginInfo.sabun}' , scheduleType: scheduleType};
	   	var callback = function(result){
	   		
	   		var obj = JSON.parse(result);
	   		var cnt = obj.resultVal;		//결과수
	   		var list = obj.resultList;		//결과데이터JSON */
	   		scheduleList = list;
	   		
	   		if(list.length>0){				//등록된 일정이 있을때, 
	   			var left = $(th).offset().left;
	    		var top = $(th).position().top + $(th).height(); 
		    	$("#scheListArea").css({display:"",left:left,top:top});
		   		fnObj.divScheduleSet();		//스케쥴 레이어 팝업 세팅
	   		}else{
	   			var txt="";
	   			if(scheduleType == '20' || scheduleType == '30'){
	   				txt ="저녁";
	   			}else if(scheduleType == '10'){
	   				txt ="점심";
	   			}
	   			if(confirm("등록된 "+txt+"일정이 없습니다.일정을 등록하시겠습니까?")){
	   				fnObj.scheAdd();		//일정 등록 iframe 
	   			}
	   		}
	   		
	   	};
	   	commonAjax("POST", url, param, callback, false, null, null);
   },
   
   //스케쥴 div 세팅
   divScheduleSet : function(){
	   var str ='<div style="text-align:right;font-weight:bold;cursor:pointer;color:white;padding:3px;border-bottom: 2px solid #2d2f4a;" onclick=\'$("#scheListArea").css("display","none");\'><p style="padding-right:10px;">x닫기</p> </div>';
	   str += '<div style="background: white;"><p style="padding:5px 5px;text-align:right;"><span class="btn_inner" style="border:1px solid #525e71;background:#7888af;color:white;cursor:pointer;" onclick="fnObj.scheAdd();">일정등록</span></p>';
	   str += '<table class="schedule_table">';
	   str += '<colgroup>';
	   str += '<col width="20%">';
	   str += '<col width="20%">';
	   str += '<col width="*%">';
	   str += '</colgroup>';
       str += '<tr>';
	   str += '<td style="text-align:center;background:#dde1ea;">날짜</td>';
	   str += '<td style="text-align:center;background:#dde1ea;">시간</td>';
	   str += '<td style="text-align:center;background:#dde1ea;">내용</td>';
	   str += '</tr>';
	   for(var i=0;i<scheduleList.length;i++){
		   str += '<tr id="schedule_'+i+'" style="cursor:pointer;" onclick="fnObj.setSchedule(this,\''+scheduleList[i].ScheSeq+'\',\''+scheduleList[i].ScheTitle+'\',\''+scheduleList[i].companyNm+'\',\''+scheduleList[i].customer+'\',\''+scheduleList[i].customerId+'\');">';
		   str += '	<td style="text-align:center;">'+scheduleList[i].ScheEMonth+'/'+scheduleList[i].ScheEDay+'</td>';
		   str += '	<td style="text-align:center;">'+scheduleList[i].ScheETimeAMPM+' '+scheduleList[i].ScheETime+'</td>';
		   str += '	<td>'+scheduleList[i].orgScheTitle+'</td>';
		   str += '</tr>';
	   }
	   str += '</table></div>';
	   $("#listDiv").html(str);
	   $("#scheListArea").css("display","");
   },
   
      
   //일정 영역(회사/고객/일정) 세팅
	setSchedule : function(th,schSeq,scheTitle,companyNm,customer,customerId){	//스케쥴 시퀀스,내용,회사명,고객명,고객아이디
		var dv = $("#dv").val();
		var dv2 = $("#dv2").val();
		$(".click_tr").removeClass();
		if(th != ''){
			$(th).addClass('click_tr');
	   	}
		$("#scheTitle").val(scheTitle);
		$("#note").val(scheTitle);
		$("#schSeq").val(schSeq);						//선택 스케쥴 시퀀스
		$("#extraSpan").css('display','none');			//추가 대상자
		$("#etcNum").val('0');							//~명 초기화
		$("#extraName").val('');						//추가 대상자 초기화
		// $("#sltCst").css('display','');				//~외 ~명 
		if(dv2 != "4000" && dv != "70" && (customer == '' || companyNm == '')){ //대상자가 없을때(복리후생 부서회식,차량관련 제외)
			$("#sltNm").html('대상자');				//이름
   			$("#sltCpn").html('');					//회사
			alert("등록된 일정에 대상자가 없습니다. 직접 등록하여 주세요.");
   			
		}else{
			var i = 0;
   			var str = '';
   			
   		  	if(customerId != '0' && customerId != ''){  	//
	   			//$("#sltNm").html(customer);				//이름
		    	//$("#sltCpn").html(companyNm);				//회사
		    	//$("#cstSnb").val(customerId);				//고객아이디
		    	
		    	str += '<span id="addCstSnb_'+i+'" name="addCstSnbSpan"><input type="hidden" id="cstSnb_'+ i +'" name = "regCstSnb" value="'+customerId+'">';  // cst_snb 값
				str += '<input type="hidden" id="cstSnb_'+ i +'" name = "regSnb" value="'+customerId+'">';   // card_s_nb(s_nb) 값   regCstList[i].sNb
				str += '<button id="addCstSnb_'+i+'" name="reg_btn" class="btn_inner" onclick="popUp(\'0\',\'card\',this);" style="border:1px solid #a3a5a9; background-color:#d0d3d8;"><span id="sltCpn_' + i + '">'+customer+'</span>   <span id="sltNm_'+ i +'">'+companyNm+'</span></button>' ;
				str += '<span id = "delRegCst_'+i+'" style="font-weight:bold;color:red;cursor:pointer;" onclick="delRegCst(this);"><a><i class="fa fa-times"></i></a>&nbsp;</span>' ;
				str += '</span>'; 
		    			
				 $("#cstListCnt").val('1');	        // 등록된 회사/고객 수 
				$("#addRegCstDiv").html(str);						// div에 표시
   		  	}
	   }
   	   $("#scheListArea").css("display","none");
 	},
	
	//일정 영역(회사/고객/일정) 초기화
	setEleSchedule : function(){	
	   $("#scheListArea").css("display","none");	//일정 div 숨기기 
	   $("#scheTitle").val('');
	   $("#note").val('');
 	   $("#sltNm").html('대상자');				//이름
       $("#sltCpn").html('');					//회사
       $("#sltCst").css('display','none');		// ~외 ~명 
       $("#extraSpan").css('display','none');	// 추가 대상자
       $("#schSeq").val('0');					//선택 스케쥴 시퀀스
       $("#cstSnb").val('0');					//히든값 초기화
       $("#cstListCnt").val('0');
       $("#etcNum").val('0');					//~명 초기화
       $("#extraName").val('');					//추가 대상자 초기화
    },
    
	//일정 등록
    scheAdd : function() {
    	$('body').height('900');
    	$('<div id="BackDiv" onclick="LayerClose();"></div>').css('opacity',0.3).appendTo('body');
    	$('#BackDiv').css({'top':'0', 'width':'100%', 'height':'900'});
    	$('#ViewDiv').css({'top':50, 'left':50, 'z-index':'100', 'width':'770', 'height':'830', 'position':'absolute'}).fadeIn(300);
    	var SelDate =$("#tmDt").val();
    	var LayerCon = "<iframe id='ScheduleProc' src='<c:url value='/ScheduleProc.do?EventType=Add&ParentPage=card&ScheSDate="+SelDate+"'/>' frameborder='0' width='100%' height='100%' scrolling='yes' style='border-radius:10px;'/>";
       $('#ViewDiv').html(LayerCon);
 	},
 	
/* ===================================================일정 관련 func : E ================================================ */
	
	//원본 검색
    getCardUse: function(){   // 지출 데이터 조회

    	var url = contextRoot + "/card/getCardDetail.do";
    	var param = {sNb : cardSnb};
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		entryList= obj.userList;		
    		cardObj = obj.card;		
    		mroList = obj.mroList;
    		regCstList = obj.cstList;
    		if(cardObj != null){
    			fnObj.setDataCard();  	//수정시 데이터 세팅
    		}
    		
    		fnObj.setCstList(regCstList);   // 수정시 지출등록 회사/고객 세팅
    		fnObj.getResult(entryList);  // 직원 이름 set
    	};
    	commonAjax("POST", url, param, callback, false, null, null);
    },//end getAlarm
   
   	//수정시 데이터 세팅
    setDataCard : function (){
	   	$("#tmDt").val(cardObj.tmDt);		//날짜세팅
		$("#dv").val(cardObj.dv);			//항목세팅
		fnObj.divSetting();					//div 세팅
		$("#price").val(Number(cardObj.price).toLocaleString());	//금액세팅
		fnObj.setSchedule('',cardObj.schSeq,cardObj.scheTitle,cardObj.cstCpnNm,cardObj.cstNm,cardObj.cstSnb);//일정 부분 세팅
		$("#note").val(cardObj.note);		//내용세팅
		$("#place").val(cardObj.place);		//장소세팅
		$("#etcNum").val(cardObj.etcNum);	//인원세팅
		$("#fromLoc").val(cardObj.fromLoc);	//출발지세팅
		$("#toLoc").val(cardObj.toLoc);		//도착지세팅
		$("#carSelect").val(cardObj.carId);	//차량세팅
		/* if(cardObj.etcNum != 0 && cardObj.schSeq != 0){	//추가 대상자 세팅
			$("#extraName").val(cardObj.extraName);	
			$("#extraSpan").css('display','');	
		} */
		
		$("#delRegCst").css('display','');	// X 
		$("#addRegCst").css('display','');	// [+]
		//$("#addRegCstDiv").html();
		
		if(cardObj.corpYn == '1') {
			$("#place").prop("readonly",true);		//장소수정불가
			$("#price").prop("readonly",true);		//금액수정불가
			//$("#dv").hide();						//항목수정불가
			$("#tmdtCalendar").hide();
			//$("#dvTxtArea").html($("#dv option:selected").text());
			approvalPlace= cardObj.place;
	    	approvalCost=cardObj.price;
		}
		
		
    },
	
	//등록 및 수정
    doSave : function(){  
	    var tmDt = $("#tmDt").val();
	    var type = $("#dv").val();
	    var cstSnb = $("#cstSnb").val();
	    var place = $("#place").val();
	    var dv = $("#dv").val();
	    var dv2 = $("#dv2").val();
	    var price = $("#price").val().replace(/,/g,'');
	    var note = $("#note").val();
	    ///추가
	    var schSeq = $("#schSeq").val();
	    var extraName = $("#extraName").val();
	    var scheTitle = $("#scheTitle").val();
	    var etcNum = $("#etcNum").val();
	    var fromLoc = $("#fromLoc").val();
	    var toLoc = $("#toLoc").val();
	    var carId = $("#carSelect").val();
	    var supplies ='';
	    var userList = [];				//선택한 유저리스트
	    var userListStr = '';			//선택한 유저리스트String
	    var selCstList = [];			//선택한 회사/고객 리스트
	    var selCstListStr = '';			//선택한 회사/고객 리스트String
	    var beforeDv = '';
	    var feedback='';
	    var year ='';
	    var month='';
	    /*======================================== 유효성 검사 : S================================== */
	    
	    /* ============유효성 공통=============== */
	    if(tmDt == ''){
	    	alert("날짜를 선택해주세요.");
	    	$("#tmDt").focus();
	    	return false;
	    }
	    if(dv == ''){
	    	alert("항목을 선택해주세요.");
	    	$("#dv").focus();
	    	return false;
	    }
	    if(price == '' ){
	    	alert("금액을 입력해주세요");
	    	$("#price").focus();
	    	return false;
	    }
	    if(!strInNum(price)){
	    	alert("금액을 숫자로 입력해주세요");
	    	$("#price").focus();
	    	return false;
	    }
	    if(note == ''){
	    	alert("내용을 입력해주세요.");
	    	$("#note").focus();
	    	return false;
	    }
	    if(place == '' && (type != 170 && type != 160)){
	    	alert("장소를 입력해주세요.");
	    	$("#place").focus();
	    	return false;
	    }
	    /* if(dv2 == "1000" || dv2 == "3000"){
		    if(etcNum>0 && extraName ==''){
		    	alert("추가 대상자명을 입력해주세요.");
		    	//$("#extraName").focus();
		    	return false;
		    }
	    } */
	    /* ============유효성 항목 분류=============== */
	    
	    if(dv2 == "1000" || dv2 == "3000" || dv == "70"){ 			//영업관련 + 대중교통(100) + 부서회식(70)
    		if(schSeq == '0'){
    			alert("일정을 선택해주세요.");
    	    	$("#scheTitle").focus();
    	    	return false;
    		}
	    
	    	if(dv != "70" && $("#cstListCnt").val() == '0' && dv != "105"){        // 부서회식, 야근교통비, 대상자 0 아닐때
    			alert("대상자를 선택해주세요.");
    	    	return false;
    		}
	    	if(dv2 == "3000"){
	    		if(fromLoc == '' || toLoc == ''){
	    	    	alert("목적지를 입력해주세요.");
	    	    	$("#fromLoc").focus();
	    	    	return false;
	    	    }
    		}
    	}else if(dv2 == "4000"){	//차량유지관련
    		if(carId == '0'){
    			alert("차량을 선택해주세요.");
    	    	$("#carSelect").focus();
    	    	return false;
    	    }else{
	    		note = note + '['+$("#carSelect option:selected").text()+']';
	    	}
    	}else if(dv2 == "6000"){//소모품일때
    		var table = document.getElementById("supplieAll");
    		var rowIndex = table.rows.length-2;      						// 테이블(TR) row 개수 행의 idx 를 찾을때 사용. 
    		var supplieNameList = $('input[name=supplieName]');				//이름 리스트
			var supplieUnitPriceList = $('input[name=supplieUnitPrice]');	//단가 리스트
			var supplieCountList = $('input[name=supplieCount]');			//수량 리스트
			var suppliePriceList = $('input[name=suppliePrice]');			//금액 리스트
    		var jArray = new Array();										//obj를 담을 Array
    		for(var i=0;i<supplieNameList.length;i++){
    			var supplieName = supplieNameList[i].value;									//idx 이름(row)
    			var supplieUnitPrice = supplieUnitPriceList[i].value.replace(/,/g,'');		//idx 단가(row)
    			var supplieCount = supplieCountList[i].value.replace(/,/g,'');				//idx 수량(row)
    			var suppliePrice = suppliePriceList[i].value.replace(/,/g,'');				//idx 금액(row)
    			if(supplieUnitPrice!='' && supplieCount!='' && supplieName!=''   
    				&& supplieUnitPrice!=0 && supplieCount!=0 && supplieName!=0){			//유효한 값일때.
    				if(!strInNum(supplieUnitPrice)){
    					alert("단가 혹은 수량은 숫자만 가능합니다.");
    					supplieCountList[i].focus();
    					return false;
    				}else if(!strInNum(supplieCount)){
    					alert("단가 혹은 수량은 숫자만 가능합니다.");
    					supplieCountList[i].focus();
    					return false;
    				}else{																	//유효값
    					var jobj = new Object();
        				jobj.code='';
        				jobj.name=supplieName;
        				jobj.count=supplieCount;
        				jobj.price=supplieUnitPrice;
        				jArray.push(jobj);
    				}
    			}else{
    				alert("구매내역 입력칸을 확인해주세요.");
    				if(supplieName=='' || supplieName==0 ){
    					supplieNameList[i].focus();
    				}else if(supplieUnitPrice=='' || supplieUnitPrice==0 ){
    					supplieUnitPriceList[i].focus();
    				}else if(supplieCount=='' || supplieCount==0 ){
    					supplieCountList[i].focus();
    				} 
    				return false;
    			}
    		}
    		var totalObj = new Object();
    		totalObj.items=jArray;					//items 란 키값으로 totalObj에 jobj를 담은 jArray를 세팅
    		supplies = JSON.stringify(totalObj);	//totalObj 를 string 변환 
    	}
	    /*======================================== 유효성 검사 : E================================== */
	    
	    // 회사/고객 리스트
		$('input[name="regCstSnb"]').each(function(){   // cst_s_nb 값 찾기
			selCstList.push($(this).val());    //선택한 회사/고객 리스트 
		});
	    if(selCstList.length > 0 ){   // 찾은 cst_s_nb 값 str 생성
	    	selCstListStr = selCstList.join(',');
	    }
	    
	    //유저리스트
	    $('input[name="selectUserSabun"]').each(function(){
	    	userList.push($(this).val());
		});
	    if(userList.length>0 ){
	    	userListStr = userList.join(',');
	    }else{
	    	userListStr ='${userLoginInfo.sabun}';
	    }
	    //부서회식일 경우 대상자 시퀀스 0(필수가 아니기때문에)
	    if(dv == "70"){cstSnb = 0;}
	    
	    year = tmDt.split("-")[0];
	    month = tmDt.split("-")[1];
	    
	 	var url = contextRoot + "/card/regCardUse.do";
	   	var param = {
	   					sNb			: cardSnb,		//지출 시퀀스
	   					tmDt		: tmDt,			//사용일
	   					year		: year,			//사용년도
	   					month		: month,		//사용월
	   					dv			: type,			//항목
	   					dv2			: dv2,			//항목 그룹핑
	   					cstSnb  	: cstSnb,		//고객번호       -----  > cst_snb 
	   					place 		: place,		//장소
	   					price 		: price,		//금액
	   					note 		: note,			//내용
	   					schSeq 		: schSeq,		//일정시퀀스
	   					selCstListStr  	: selCstListStr,		//대상자 str     -----  > card_s_nb (다중)
	   					//etcNum    : etcNum
	   					//extraName	: extraName,	//추가대상자 명   -----  > 삭제
	   					fromLoc		: fromLoc,		//출발지
	   					toLoc  		: toLoc,		//도착지
	   					carId 		: carId,		//차량번호	
	   					supplies 	: supplies,		//소모품 (jsonString)
	   					userListStr : userListStr,	//선택 유저 리스트  
	   					progress	: 'SUBMIT',		//진행 상태 'SUBMIT' 승인요청 , 'APPROVE' 승인완료 'REJECT' 반려
	   					status		: '',			//정상여부  'W' 경고 , 'Y' 정상 
	   					cardCorpSnb : cardCorpSnb,	//법인카드 ID값. 0보다 클 경우 법인카드사용내역 업데이트
	   				}; 
	   	var callback = function(result){
	   		var obj = JSON.parse(result);
	   		var chk = obj.resultVal;
	   		if(chk>0){
		   		alert("완료되었습니다.");
		   		var dateArr = tmDt.split('-');
		   		if( cardCorpSnb > 0 ){
		   			opener.fnObj.doSearch();
		   		}
		   		else{
		   			opener.fnObj.monthClick(parseInt(dateArr[1]));
		   		}
		   		//opener.fnObj.doSearch();
		   		window.close();
	   		}else{
	   			alert("서버오류!!!.");
	   		}
		};
   		commonAjax("POST", url, param, callback, false, null, null); 
    },//end doSave
  	
    //삭제
    doDelete: function(){ 
		if(confirm("삭제하시겠습니까?")){
		   	var url = contextRoot + "/card/deleteCardUse.do";
		   	var param = {sNb : cardSnb};
		   	var callback = function(result){
		   		var obj = JSON.parse(result);
		   		var chk = obj.resultVal;
		   		if(chk>0){
		   			alert("삭제되었습니다.");
		   			opener.fnObj.doSearch();
			   		window.close();
		   		}else{
		   			alert("서버오류!!!.");
		   		}
		   	};
			commonAjax("POST", url, param, callback, false, null, null);
		}
     }//end doDelete
 
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//선코딩
	fnObj.pageStart();		//화면세팅
});




</script>