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
<title>알림 등록/수정</title>
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<script type="text/javascript">


</script>
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
</style> 

</head>

<body>
	<div style="margin:20px 30px;">
		<div><font style="font-size:20px;font-weight:bold;">*알림 ${alarmId == 0 ? '등록' : '수정'}</font></div>
		<table id="SGridTarget" class="net_table_apply"  style="margin-top:5px;" summary="알림등록">
		       <caption>
		         	알림등록
		       </caption>
		       <colgroup>
		       		<col width="20%"/> 
                    <col width="*"/> 
               </colgroup>
              	<tr>
           	 		<th>알림 날짜</th>
         		 	<td>
         		 		<input type="text" id="alarmStart" class="applyinput_B w_st06" style="width:90px;" readonly="readonly"/>
						<a href="#" onclick="$('#alarmStart').datepicker('show');return false;" class="btn_calendar" style="margin-top:10px;"></a>
         		 		~
         		 		<input type="text" id="alarmEnd" class="applyinput_B w_st06" style="width:90px;" readonly="readonly"/>
						<a href="#" onclick="$('#alarmEnd').datepicker('show');return false;" class="btn_calendar" style="margin-top:10px;"></a>
         		 	</td>
         		 </tr>
         		 <tr>
           	 		<th>분류</th>
         		 	<td>
         		 		<select id="alarmTarget" class="mgl6" style="height:22px;width:100px;" onchange="fnObj.divisionList();">
							<option value="B_CARD">법인카드</option>
							<option value="NOTICE">전체공지</option>
							<!-- <option value="DIRECTOR">임원</option> -->
							<option value="MANAGER">팀장</option>
							<option value="DEPART">부서</option>
						</select>
         		 	</td>
         		 </tr>
         		 <tr>
           	 		<th>사원선택</th>
         		 	<td>
         		 		<div id="divisionDiv"></div>
         		 	</td>
         		 </tr>
         		 <tr>
           	 		<th>알림타입</th>
         		 	<td>
         		 		<select id="alarmType" class="mgl6" style="height:22px;width:100px;">
							<option value="POPUP">팝업</option>
						</select>
         		 	</td>
         		 </tr>
         		 <tr>
           	 		<th>내용</th>
         		 	<td>
         		 		<textarea rows="15" style="width:330px;" id="alarmText"></textarea>
         		 	</td>
         		 </tr>
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
	</div>
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();		// instance		new sjs

var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division='${userLoginInfo.division}';
var alarmId='${alarmId}';					  //알림 시퀀스
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

//Global variables :E ---------------
var orgAlarmTarget =''; //DB에 저장되있는 타겟
var userList ;			//전체 유저리스트
var entryList ;			//타겟 리스트
/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		//캘린더 세팅 
		fnObj.setDatepicker('alarmStart');
		fnObj.setDatepicker('alarmEnd');
		if(alarmId == 0){	//등록일떄 기본 날짜 오늘 ~오늘+4일 세팅.
			var nowDate = new Date();
			nowDate.setDate(nowDate.getDate()+4);
			$("#alarmStart").val(new Date().yyyy_mm_dd());
			$("#alarmEnd").val(nowDate.yyyy_mm_dd());
		}
	},

	//화면세팅
    pageStart: function(){
    	if(alarmId != 0){	 //수정
    		fnObj.getAlarm();							//수정일때 알림 데이터 가져오기
    		$("#regTxtSpan").html("수정");				//글씨 바꾸기
    	}else{				 //등록
    		$("#deleteBtnSpan").css("display","none");	//삭제버튼 감추기
    	}
    	fnObj.divisionList();
    },//end pageStart.
    
    //검색
    doSearch: function(page){ 
    },//end doSearch
    
    //원본 검색
    getAlarm: function(){ 

    	var url = contextRoot + "/alarm/getAlarmDetail.do";
    	var param = {alarmId : alarmId};
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON */
    		for(var i=0;i<list.length;i++){
    			//데이터 세팅
    			orgAlarmTarget = list[i].alarmTarget; 	//DB에 기록된 Target
    			$("#alarmStart").val(list[i].alarmStart);
    			$("#alarmEnd").val(list[i].alarmEnd);
    			$("#alarmTarget").val(list[i].alarmTarget);
    			$("#alarmType").val(list[i].alarmType);
    			$("#alarmText").val(list[i].alarmText);
    		}
    		fnObj.getAlarmTargetList();					//targetList 가져오기
    	};
    	
    	commonAjax("POST", url, param, callback, false, null, null);
   },//end getAlarm
   //알림을 받는 target(유저)리스트
   getAlarmTargetList : function(){
		var url = contextRoot + "/alarm/getAlarmTargetList.do";
	   	var param = {alarmId : alarmId};
	   	var callback = function(result){
	   		
	   		var obj = JSON.parse(result);
	   		var cnt = obj.resultVal;		//결과수
	   		var list = obj.resultList;		//결과데이터JSON */
	   		entryList =list;
	   	};
	   	commonAjax("POST", url, param, callback, false, null, null);
   },
   //divisionList
   divisionList : function(){
	    var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",{enable :'Y',userCountChk:'Y'});
		$("#divisionDiv").empty();
		for(var i=0;i<divisionList.length;i++){
			var str="";
			str='<div id="'+divisionList[i].divCode+'List"></div>'
			$("#divisionDiv").append(str);
			fnObj.getUserList(divisionList[i].divCode,divisionList[i].divName,i); 
		} 
	},
   //division에 따른 유저리스트
   getUserList : function(divCode,divName,i){
	    var profileYn ='N';
	    var searchType='';	
	    var alarmTarget=$("#alarmTarget").val();	
	    if(alarmTarget == 'B_CARD'){	//법인카드일때 카드사용관리 여부 Y 아니면 빈값.
	    	///법인카드 알림 조건 -> b_card_yn(y) , b_card_control(y) [법인카드소지여부,관리대상여부]
	    	profileYn ='Y';
	    	searchType ='card';			//card:bs_user_profile 법인카드소지여부,관리대상여부
	    }
	    if(alarmTarget == 'MANAGER'){
	    	searchType ='manager';		//manager:팀장만
	    }
	    var url = contextRoot+"/work/selectuserList.do";
		var param = {
				profileYn	: profileYn,	//bs_user_profile 조인여부
				searchType	: searchType,	//검색 타입 (B_CARD,MANAGER -법인카드,팀장)	
				division 	: divCode,
				deptOrder	: 'Y'
			};
		var callback = function(result){
			
			var obj = JSON.parse(result);
			var cnt = obj.resultVal;		//결과수
			var list = obj.resultList;		//결과데이터JSON
			userList = list;
			fnObj.setcheckUser(divCode,divName,i);//유저 체크박스 세팅	
		}
		commonAjax("POST", url, param, callback, false, null, null);
   },
   //유저 체크박스 세팅	
   setcheckUser :function(divCode,divName,idx){
	   var alarmTarget=$("#alarmTarget").val();
	   var pTagClass ='';
	   if(alarmTarget == "NOTICE" || alarmTarget == "DEPART" ){
		   pTagClass= 'class="division_style"';
	   }
	   var str = '<p '+pTagClass+'>';
	   var deptSeq = '';		//부서 시퀀스
	   var deptChk = false;		//부서별로 나누어야 하는지 여부.
	   var checkYn ='';			//부서 팀 체크 여부
	   var userCheckYn =''; 	//사원 체크여부
	   var displayYn =''; 		//사원 체크박스 숨기기
	   var styleDisplay =""; 	//처음 디스플레이 세팅
	   var onclickSet ="" ; 	//onclick 세팅
	   var classSet = "";		//버튼 클래스 세팅 
	   var userCnt = 0;	 		//화면에 뿌려지는 사원 숫자
	   if(alarmTarget == 'DEPART'){
		   displayYn="display:none;";	//사원 체크박스 숨기기
	   }
	   //division 감추고 펼치기 세팅
	   if(divCode == "${userLoginInfo.division}" ){
			onclickSet= 'fnObj.hiddenDiv(\''+divCode+'\')' ;
			classSet  = 'axi-keyboard-arrow-up';
	   }else{
		    onclickSet= 'fnObj.openDiv(\''+divCode+'\')' ;
			styleDisplay = 'style="display:none;" ' ;
			classSet  = 'axi-keyboard-arrow-down';
	   }
	   
	   if(alarmTarget != 'B_CARD' && alarmTarget != 'MANAGER'){
		   deptChk = true;
		   str+='<label for="Entry'+idx+'">';
		   str+='<input type="checkbox" name="Entry" id="Entry'+idx+'" class="Entry_'+divCode+'" onclick="fnObj.selCompany(this.name, ' + idx + ', \'' + divCode + '\');" '+checkYn+'><em><b>전체선택('+divName+')</b></em>'; 
		   str+='</label>'; 
		   str+='<span id="span_'+divCode+'" style="float:right;cursor:pointer;" onclick="'+onclickSet+'"><i id="btn_'+divCode+'" class="axi '+classSet+'" style="font-size:20px;"></i></span></p>'; 
		   str+='<dl class="user_dl" id="dl_'+divCode+'" '+ styleDisplay +'>';
	   }else{
		   str+='</p>';
		   str+='<dl>';
	   }
	 
	   for(var i=0;i<userList.length;i++){
		   userCheckYn ='';
		   if(alarmId == 0){	//신규면
			  if(divCode == division){
				  userCheckYn='checked="checked"';	//개별 체크여부
			  }
		   }else if(alarmId!= 0 && alarmTarget == orgAlarmTarget){	//신규가 아니고 분류 셀렉트 박스를 안바꾸었을때만.즉,DB에 기록된 Target일때
			   for(var k=0;k<entryList.length;k++){
				   if(userList[i].staffSnb == entryList[k].userId){	//속해있는 사람이면 
					   userCheckYn='checked="checked"';	//체크여부
				   }
			   }
		   }
		   if(deptChk && userList[i].deptSeq != deptSeq){	//새로운 부서 이면
	   			/* ========부서선택 체크박스======== */
	   			deptSeq = userList[i].deptSeq;		//부서 시퀀스 담아둔다
	   			userCnt =0;
	   			str+= '<dt class="user_dt">';
	   			str+= '<label for="'+divCode+'_deptAry'+deptSeq+'"><input type="checkbox" name="'+divCode+'deptAry"  id="'+divCode+'_deptAry'+deptSeq+'" class="'+divCode+'"  onclick="fnObj.selDept(this.id);" '+checkYn+'><em><b>'+userList[i].deptNm+'</b></em></label></dt>' ;	
	   			str+= '<dd class="user_dd" style="'+displayYn+' margin-left: -5px;">';
				
		   }
		   userCnt++;
		   str += '<span style="padding-left:5px;"><label for="EntryAry'+divCode+i+'">';
		   str += '<input type="checkbox" name="selectUser" id="EntryAry'+divCode+i+'" class="'+divCode+'_deptAry'+deptSeq+'" value="'+userList[i].staffSnb+'" '+userCheckYn+'><em>'+userList[i].usrNm;
		   str += '</em></label></span>';
		   if(!deptChk && (i+1)%5 == 0){
			   str += '<br/>';
		   }else if(deptChk && userCnt%5 == 0 ){		//줄바꿈처리
			   str += '<br/>';
		   }
		   if(deptChk &&userList[i].deptSeq != deptSeq){//줄바꿈처리
				str += '</dd>';
		   }
	   }
	  
	   str +='</dl>';
	   $("#"+divCode+"List").html(str);
	   fnObj.setCheck(divCode,idx);
	},
   //회사 선택 
   selCompany : function(Obj, idx, divCd) {			//idx ... division list index ... 0:'SYNERGY', 1:'FIDES'		divCd...  'SYNERGY', 'FIDES'
  		var All = $($('input:checkbox[name='+Obj+']')[idx]); //회사선택 체크박스
	  	var ChkList = $('input[name='+divCd+'deptAry]'); //부서선택 체크박스
	  	if(!All.is(':checked')) {// 전체선택 체크박스가 해제되었다면
	  		for(var i=0; i<ChkList.length; i++) {
	  			ChkList[i].checked = false;
	  			fnObj.selDept($(ChkList[i]).attr('id')); //부서선택으로
	  		}
	  	}
	  	else { // 그게 아니라면
	  		for(var i=0; i<ChkList.length; i++) {
	  			ChkList[i].checked = true;
	  			fnObj.selDept($(ChkList[i]).attr('id'));//부서선택으로
	  		}
	  	}
   },
   //부서선택 
   selDept : function (obj) {		
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
   },
   //사원선택에 따른 전체선택 세팅
   setCheck: function(divCode,idx){
	   var chkCnt =0
	   var deptSeq = '';	//부서 시퀀스
	   for(var i=0;i<userList.length;i++){
		   ///부서 체크 선택 박스 체크 판단
		   var obj=divCode+'_deptAry'+userList[i].deptSeq;	//부서판별 
		   if($("input[class="+obj+"]").length == $("input[class="+obj+"]:checked").length){	 // 부서전체인원이 선택되있으면 부서선택체크
				  $("#"+obj).prop("checked",true);
		   }
		   if($("input[class="+obj+"]:checked").length>0){	//하나라도 선택되있으면 해당 div open 
			   fnObj.openDiv(divCode);
		   }
	   }
	   if($("input[class="+divCode+"]").length == $("input[class="+divCode+"]:checked").length){ // 부서가 전부 선택되있으면 회사 체크 
		   $("#Entry"+idx).prop("checked",true);
	   }
   },
   //등록 및 수정
   doSave : function(){  
	    var alarmStart =$("#alarmStart").val();
	    var alarmEnd   =$("#alarmEnd").val();
	    var alarmTarget=$("#alarmTarget").val();
	    var alarmType  =$("#alarmType").val();
	    var alarmText  =$("#alarmText").val();
	    var targetList = [];				//선택한 유저리스트
	    $('input:checkbox[name="selectUser"]:checked').each(function(){
	    	targetList.push($(this).val());
		});
	    if(alarmStart=='' || alarmEnd==''){
	    	alert("알림일을 선택해주세요.");
	    	$("#alarmStart").focus();
	    	return false;
	    }
	    if(alarmStart>alarmEnd){
	    	alert("알림시작일이 종료일보다 큽니다.");
	    	$("#alarmStart").focus();
	    	return false;
	    }
	    if(targetList.length == 0){	//선택된 사원이 없을때.
	    	alert("알림을 보낼 사원을 선택해주세요.");
	    	return false;
	    } 
	    if(alarmText==''){
	    	alert("내용을 입력해주세요.");
	    	$("#alarmText").focus();
	    	return false;
	    }
	   	var url = contextRoot + "/alarm/saveAlarm.do";
	   	var param = {
	   					alarmId		: alarmId,
			   			alarmStart  : alarmStart,
			   			alarmEnd 	: alarmEnd,
			   			alarmTarget : alarmTarget,
			   			alarmType 	: alarmType,
			   			alarmText 	: alarmText,
			   			targetList  : targetList.join(',')	//선택 유저리스트 (보낼)
			    	};
	   	var callback = function(result){
	   		var obj = JSON.parse(result);
	   		var chk = obj.resultVal;
	   		if(chk>0){
		   		alert("완료되었습니다.");
		   		window.opener.location.reload();
		   		window.close();
	   		}else{
	   			alert("서버오류!!!.");
	   		}
		};
   	commonAjax("POST", url, param, callback, false, null, null);
  },//end doSave
  doDelete: function(){ 
		if(confirm("삭제하시겠습니까?")){
		   	var url = contextRoot + "/alarm/deleteAlarm.do";
		   	var param = {
		   					alarmId		: alarmId,
				   			alarmStart  : '1988-01-01',
				   			alarmEnd 	: '1988-01-01',
				   		};
		   	var callback = function(result){
		   		var obj = JSON.parse(result);
		   		var chk = obj.resultVal;
		   		if(chk>0){
		   			alert("삭제되었습니다.");
			   		window.opener.location.reload();
			   		window.close();
		   		}else{
		   			alert("서버오류!!!.");
		   		}
		   		
		   	};
			commonAjax("POST", url, param, callback, false, null, null);
		}
   },//end doDelete
   setDatepicker : function(obj){		//datepicker 설정
		$('#'+obj).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			showOn: "button",
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
   ///선택시 check open 
   openDiv : function(divCode){
		 $("#dl_"+divCode).css("display",""); 
		 $("#span_"+divCode).attr('onclick','fnObj.hiddenDiv(\''+divCode+'\')');
		 $("#btn_"+divCode).attr('class','axi-keyboard-arrow-up');
   },
	///선택시 check hidden 
   hiddenDiv : function(divCode){
		 $("#dl_"+divCode).css("display","none");
		 $("#span_"+divCode).attr('onclick','fnObj.openDiv(\''+divCode+'\')');
		 $("#btn_"+divCode).attr('class','axi-keyboard-arrow-down');
	}
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		fnObj.preloadCode();	//선코딩
		fnObj.pageStart();		//화면세팅
});




</script>