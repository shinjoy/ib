$(function(){
	
	$('#logout').click(function () {			//로그아웃
		leftIframeOFF();
		top_menu("logout.do", $(this), "mainFrame");
	});
	$('#modifyUsrInfo').click(function () {		//개인정보수정
		leftIframeOFF();
		top_menu("login/modifyUsrInfo.do", $(this), "mainFrame");
	});
	
});


//메뉴 열기
function top_menu(sUrl, ori_obj, frame) {
	/*jQuery.each($(document).find('[class]'), function () {
		var sub_obj = $(this);
		var name = sub_obj.attr('class');
		if(name === "current") {
			sub_obj.removeAttr('class');
		}
	});*/
	if($(window).width()<760){
		$('.navbar-toggle').addClass('collapsed');
		$('.navbar-collapse').removeClass('in');
		$('.navbar-collapse').css('height','1px');
	}	
	//ori_obj.addClass('current');
	
	//해당 프레임
	if(frame=="mainFrame"){
		mainFrame.location.href = sUrl;
	}else if(frame == "leftFrame"){
		leftFrame.location.href = sUrl;
	}
}


//left iframe ... 숨기기
function leftIframeOFF() {
	$("#left").css('display', 'none');
	$("#main").css('margin-left', '0px');
	$("#main").css('padding-top', '5px');
}


//left iframe ... 보이도록
function leftIframeON() {
	$("#left").css('display', '');
	$("#main").css('margin-left', '220px');
	$("#main").css('padding-top', '5px');
}


//메뉴 클릭
function slctMainMenu(cd,th,uId){
	switch(parseInt(cd)){
		case  1:								//업무일지
			if($(window).width()<1010 || uId == 'shk'){ leftIframeOFF(); }
			else{ leftIframeON(); }
			top_menu("work/selectLeft.do", $(th), "leftFrame");
			top_menu("work/selectPrivateWorkV.do", $(th), "mainFrame");
		break;
		/*case  2:
			leftIframeON();
			top_menu("bsnsPlan/selectLeft.do", $(th), "leftFrame");
			top_menu("bsnsPlan/index.do", $(th), "mainFrame");
		break;*/
		case  3:								//딜
			leftIframeOFF();
			top_menu("work/selectLeft.do?deal=Y", $(th), "leftFrame");
			top_menu("work/selectWorkAllDeal.do", $(th), "mainFrame");
		break;
		case  4:								//통계
			leftIframeOFF();
			top_menu("stats/index.do", $(th), "mainFrame");
		break;
		case  5:								//회사
			leftIframeON();
			top_menu("company/selectLeft.do", $(th), "leftFrame");
			top_menu("company/index.do", $(th), "mainFrame");
		break;
		case  6:								//인물
			leftIframeON();
			top_menu("person/selectLeft.do", $(th), "leftFrame");
			top_menu("person/index.do", $(th), "mainFrame");
		break;
		/*case  7:
			leftIframeON();
			top_menu("stockFirmManage/selectLeft.do", $(th), "leftFrame");
			top_menu("stockFirmManage/selectStaffNstockIB.do", $(th), "mainFrame");
		break;
		case  8:
			leftIframeOFF();
			top_menu("network/selectStaffNetwork.do", $(th), "mainFrame");
		break;*/
		case  9:								//지출
			leftIframeOFF();	
			top_menu("card/cardCorpIndex.do", $(th), "mainFrame");
		break;
		case 10:								//차량일지
			leftIframeOFF();		
			top_menu("car2/index.do", $(th), "mainFrame");
		break;
		/*case 11:
			leftIframeON();
			top_menu("personnel/management/selectLeft.do", $(th), "leftFrame");
			top_menu("personnel/management/index.do", $(th), "mainFrame");
		break;
		case 12:
			leftIframeOFF();
			top_menu("idea/index.do", $(th), "mainFrame");
		break;*/
		case 13:								//자료
			leftIframeOFF();
			top_menu("control/mainFile.do", $(th), "mainFrame");
		break;
		
		case 14:								//관리 > 사용자관리
			leftIframeOFF();
			top_menu("control/userControl.do", $(th), "mainFrame");
		break;

		//20160705 일정 (인사이드 일정 카피)
		case 15:								//일정
			leftIframeON();
			top_menu("schedule/selectLeft.do?type=schedule", $(th), "leftFrame");			
			top_menu("ScheduleCal.do", $(th), "mainFrame");
		break;
		
		//20160307	네트워크
		case 16:								//네트워크
			leftIframeOFF();		
			top_menu("person/personMgmt.do", $(th), "mainFrame");
		break;
		
		//운행관리
		case 17:								//운행관리
			leftIframeOFF();		
			top_menu("car2/carMgmt.do", $(th), "mainFrame");
		break;
		
		//20151208 EIS추가
		case 18:								//EIS
			leftIframeOFF();
			top_menu("stats/eisSummary.do", $(th), "mainFrame");
		break;
		
		//메일플러그 메인화면
		case 19:
			leftIframeOFF();
			top_menu("basic/mailIndex.do", $(th), "mainFrame");
		break;
		
		//관계사
		case 20:								//관계사
			leftIframeOFF();
			top_menu("pass/work.do", $(th), "mainFrame");
		break;
		
		
		//회의실예약
		case 21:
			leftIframeOFF();
			top_menu("meetingRoom/meetingRoomMgmt.do", $(th), "mainFrame");
		break;
		
		//게시판
		case 22:
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=3", $(th), "leftFrame");	
			top_menu("BoardList.do?GrpCd=3", $(th), "mainFrame");
		break;
		
		
		case 23:								//관리 > 게시판관리
			leftIframeON();
			top_menu("board/selectLeft.do", $(th), "leftFrame");	
			top_menu("AdminMng.do", $(th), "mainFrame");
		break;
		
		//보고서
		/*
		case 24:
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=1", $(th), "leftFrame");	
			top_menu("BoardList.do?GrpCd=1", $(th), "mainFrame");
		break;
		*/
		
		//주간회의록
		case 25:
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=4", $(th), "leftFrame");	
			top_menu("BoardList.do?GrpCd=4", $(th), "mainFrame");
		break;
		
		
		//개인성과 > 설정
		case 26:
			leftIframeOFF();		
			top_menu("stats/psConfig.do", $(this), "mainFrame");
		break;
		
		
		//개인성과 > 개인성과
		case 27:
			alert('개인성과 > 개인성과');
		break;

		
		//업무목록
		case 28:
			leftIframeOFF();		
			top_menu("workType/workTypeList.do", $(this), "mainFrame");
		break;
		
		
		//성과관리 > 설정
		case 29:
			leftIframeOFF();
			top_menu("stats/psSet.do", $(this), "mainFrame");
		break;
		
		
		case 30:								//관리 > 회의실관리
			leftIframeOFF();				
			top_menu("meetingRoom/meetingRoomReg.do", $(th), "mainFrame");
		break;
		
		
		//성과관리 > 성과
		case 31:
			leftIframeOFF();
			top_menu("stats/psPage.do", $(this), "mainFrame");
		break;
		
		
		//관리 > 공지등록관리
		case 32:
			leftIframeOFF();
			top_menu("alarm/index.do", $(this), "mainFrame");
		break;
		
		
		
		//20160412	메모함  		
		case 101:				//101.. 1(업무일지) 의 서브..?
			//leftIframeOFF();			
			var workMenu = $('#dCode00001 > a');		//업무일지 메뉴 버튼 a tag			
			top_menu("memoBox.do", workMenu, "mainFrame");
		break;
	
		
		case 100:				//보고서
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=1", $(th), "leftFrame");					
		//	var workMenu = $('#dCode00001 > a');		//업무일지 메뉴 버튼 a tag		LeftMenu_CusMain	
			top_menu("BoardList.do?GrpCd=1",  $(th), "mainFrame");
		break;

		case 110:				//회의록
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=4", $(th), "leftFrame");					
		//	var workMenu = $('#dCode00001 > a');		//업무일지 메뉴 버튼 a tag		LeftMenu_CusMain	
			top_menu("BoardList.do?GrpCd=4",  $(th), "mainFrame");
		break;
		
	/*	case 120:				//출근부
			leftIframeON();
			top_menu("schedule/selectLeft.do?type=workholi", $(th), "leftFrame");					
		//	var workMenu = $('#dCode00001 > a');		//업무일지 메뉴 버튼 a tag		LeftMenu_CusMain	
			top_menu("WorkHoliMng.do?ParentPage=Today",  $(th), "mainFrame");
		break;*/
		
		// 시스템 개선요청
		case 130:
			leftIframeON();
			top_menu("board/selectLeft.do?GrpCd=5", $(th), "leftFrame");	
			top_menu("BoardList.do?GrpCd=5", $(th), "mainFrame");
		break;	
	}
}


function divPosition(target,id) {
	var browserWidth = document.documentElement.clientWidth;
	var tInput  = $("#" + target).offset();
	// var tHeight = $("#" + target).outerHeight();
	// var tWidth = $("#" + target).outerWidth();
	var calWidth = $("#" + id).outerWidth();

	if ( tInput !== null) {
		$("#" + id).css({"top":tInput.top+15 , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});
	}
}

function divShow(obj,divId) {//function 에서 사용 obj:this, divId는 열리게될 div id
	var objId = obj.attr('id');
	divPosition(objId,divId);
	$("#"+divId).css('display', 'block');
	$("#"+divId).show();
}

//업무일지 닫기 클릭시
function closePopUpMenu(th) {
	$(th).parent().hide();
}

function add_comma(val) {
	var num = val;
	if (num.length <= 3) return num;

	var loop = Math.ceil(num.length / 3);
	var offset = num.length % 3;
	if (offset===0) offset = 3;

	var str = num.substring(0, offset);
	for(var i=1;i<loop;i++) {
		str += ", " + num.substring(offset, offset+3);
		offset += 3;
	}
	return str;
}

function ajaxErrorAlert(x,e) {
	if (x.status===0) {
		alert('code: '+x.status+"\r\nYou are offline!!\r\nPlease Check Your Network.");
	}else if (x.status==404) {
		alert('code: '+x.status+"\r\nRequested URL not found.");
	}else if (x.status==500) {
		alert('code: '+x.status+"\r\nInternel Server Error.");
	}else if (e=='parsererror') {
		alert('code: '+x.status+"\r\nError.nParsing JSON Request failed.");
	}else if (e=='timeout') {
		alert('code: '+x.status+"\r\nRequest Time out.");
	}else {
		alert('code: '+x.status+"\r\nUnknow Error.\r\n"+x.responseText);
	}
}
 function ajaxModule(DATA,Url,Fn) {
	$.ajax({
		type:"POST",        //POST GET
		url:Url,     //PAGEURL
		data : DATA,
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg) {  //SUCCESS FUNCTION
			Fn(arg);
		},
		error: function whenError(x,e) {    //ERROR FUNCTION
			ajaxErrorAlert(x,e);
		}
	});
 }


/**
 * IB >> Inside 이동 버튼
 * 
 * @param th
 * @param flag
 */
function gotoERP(th,flag,ip) {
	var sabun = $("#rgstSabun").val();				//사번을 통해서 IB >> Inside 이동을 위해 erp.erp_per 의 계정을 가져온다.
	
	var id = $("#rgstId").val();
	//var DATA = {usrId:id};
	var DATA = {sabun:sabun};
	var url = "basic/InsideSysInfo.do";
	var fn = function(arg) {						//callback function.
		DATA = "<input type='hidden' name='PerId' value='"+id+"'/>"+
			"<input type='hidden' name='PerPW' value='"+arg+"'/>"+
			//"<input type='hidden' name='flag' value='sideLogin'/>"+
			"<input type='hidden' name='flag' value='ibToinsCusLogin'/>"+			//sideLogin
			"<input type='hidden' name='CMD' value='"+flag+"'/>";
		
		$("#movePage000").html(DATA);
		window.open('', 'erp', '');
		var frm = document.movePage000;
		frm.target = 'erp';
		frm.action = "http://106.250.177.91:8280/SynergyCus/LoginEnd.do";
		if(ip != undefined && ip != null && ip.length > 0){
			frm.action = "http://" + ip + ":8080/SynergyCus/LoginEnd.do";
		}
		//frm.action = "http://localhost:8080/SynergyCus/LoginEnd.do";
		frm.submit();

		//초기화
		$("#movePage000").html("");
		frm.target = "";
		frm.action = "";
	};
	ajaxModule(DATA, url, fn);
}


/**
 * IB >> PASS 이동 버튼
 * 
 * @param th
 * @param flag
 */
function gotoPASS(ibtopass) {
	window.open('http://www.passerp.co.kr/pass/ibPassOpen.do?ibtopass='+ibtopass, '_blank');
	
}
