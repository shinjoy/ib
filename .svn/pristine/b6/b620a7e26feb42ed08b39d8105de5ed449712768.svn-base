$(function () {
//	(function () { if (!/*@cc_on!@*/0) return; var e = new Array("abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output,progress,section,time,video"),i=0,length=e.length; while(i<length) { document.createElement(e[i++]); } })();
//	(function () {
//		if (!/*@cc_on!@*/0) return;
//		var e = "abbr,article,aside,audio,canvas,datagrid,datalist,details,dialog, " +
//		"eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output, " +
//		"progress,section,time,video".split(', '),i=0,length=e.length;
//		while(i<length) {
//			document.createElement(e[i++]);
//		}
//	})();

///////// main top menu /////////////////////////////////////////////////////////////////////////

	
	$('#login').click(function () {
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("login/ibLoginUsr.do", $(this), "content");
	});
	$('#logout').click(function () {
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("logout.do", $(this), "content");
	});
	$('#modifyUsrInfo').click(function () {
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("login/modifyUsrInfo.do", $(this), "content");
	});
	$('#mainHome').click(function () {//HOME
		top_menu("basic/selectLeft.do", $(this), "leftFrame");
		top_menu("basic/selectContent.do", $(this), "content");
	});

	$('#mainWork').click(function () {//업무일지
		leftIframeOFF();
		alert('업무일지');
		//top_menu("work/selectLeft.do", $(this), "leftFrame");
		top_menu("work/selectPrivateWorkV.do", $(this), "content");
		// top_menu("work/selectWorkV.do", $(this), "content");
	});
	$('#mainCompany').click(function () {//회사
		leftIframeOFF();
		//top_menu("company/selectLeft.do", $(this), "leftFrame");
		top_menu("company/index.do", $(this), "content");
	});
	$('#mainPerson').click(function () {//person
		leftIframeON();
		top_menu("person/selectLeft.do", $(this), "leftFrame");
		top_menu("person/index.do", $(this), "content");
	});
	$('#mainStaffNet').click(function () {//직원인맥
		// top_menu("stockFirmManage/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("network/selectStaffNetwork.do", $(this), "content");
	});
	$('#mainIBManage').click(function () {//증권사IB
		leftIframeON();
		top_menu("stockFirmManage/selectLeft.do", $(this), "leftFrame");
		top_menu("stockFirmManage/selectStaffNstockIB.do", $(this), "content");
	});
	$('#mainStats').click(function () {//통계
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("stats/index.do", $(this), "content");
	});
	$('#mainCard').click(function () {//지출
		leftIframeON();
		top_menu("card/selectLeft.do", $(this), "leftFrame");
		top_menu("card/index.do", $(this), "content");
	});
	$('#mainCar').click(function () {//차량
		leftIframeON();
		top_menu("car/selectLeft.do", $(this), "leftFrame");
		top_menu("car/index.do", $(this), "content");
	});
	$('#mainPersonnel').click(function () {//근태
		leftIframeON();
		top_menu("personnel/selectLeft.do", $(this), "leftFrame");
		top_menu("personnel/index.do", $(this), "content");
	});
	$('#mainBsnsPlan').click(function () {//업무계획
		leftIframeON();
		top_menu("bsnsPlan/selectLeft.do", $(this), "leftFrame");
		top_menu("bsnsPlan/index.do", $(this), "content");
	});
	$('#mainPersonnelManagement').click(function () {//인사관리
		leftIframeON();
		top_menu("personnel/management/selectLeft.do", $(this), "leftFrame");
		top_menu("personnel/management/index.do", $(this), "content");
	});
	$('#mainNetwork').click(function () {//네트워크
		top_menu("basic/selectLeft.do", $(this), "leftFrame");
		top_menu("network/main.do", $(this), "content");
	});
	$('#mainRecommend').click(function () {//추천
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("recommend/index.do", $(this), "content");
	});
	$('#mainAllDeal').click(function () {//추천
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("work/selectWorkAllDeal.do", $(this), "content");
	});
	$('#selfImprovement').click(function () {//자기개발
		leftIframeON();
		top_menu("selfImprovement/selectLeft.do", $(this), "leftFrame");
		top_menu("selfImprovement/index.do", $(this), "content");
	});
	$('#mainBook').click(function () {//추천도서
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("book/index.do", $(this), "content");
	});
	$('#mainIdea').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("idea/index.do", $(this), "content");
	});
	$('#mainFile').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("control/mainFile.do", $(this), "content");
	});
	$('#mainLog').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("control/mainLog.do", $(this), "content");
	});
	$('#mainLogGraph').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("control/mainLogGraph.do", $(this), "content");
	});
	$('#userControl').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		top_menu("control/userControl.do", $(this), "content");
	});
	$('#mainMonthly').click(function () {//
		// top_menu("basic/selectLeft.do", $(this), "leftFrame");
		leftIframeOFF();
		widthAuto();
		top_menu("work/selectMonthlyV.do", $(this), "content");
	});
	$('#mainNetwork').click(function () {//
		leftIframeON();
		top_menu("network/selectLeft.do", $(this), "leftFrame");
		top_menu("network/integratedSearch.do", $(this), "content");
	});
});
	function top_menu(sUrl, ori_obj, frame) {
		jQuery.each($(document).find('[class]'), function () {
			var sub_obj = $(this);
			var name = sub_obj.attr('class');
			// var name = sub_obj.attr('name')
			if (name === "current") {
				sub_obj.removeAttr('class');
			}
		});
		if($(window).width()<760){
			$('.navbar-toggle').addClass('collapsed');
			$('.navbar-collapse').removeClass('in');
			$('.navbar-collapse').css('height','1px');
		}
		ori_obj.addClass('current');
		if (frame=="content") {
			content.location.href = sUrl;
		}else if (frame == "leftFrame") {
			leftFrame.location.href = sUrl;
		}
	}
	function leftIframeOFF() {
		$("#left").css('display', 'none');
		$("#main").css('margin-left', '0px');
		$("#main").css('padding-top', '5px');
	}

	function leftIframeON() {
		$("#left").css('display', '');
		$("#main").css('margin-left', '220px');
		$("#main").css('padding-top', '5px');
	}

function slctMainMenuSis(cd,th, sabun){
	switch(parseInt(cd)){
	case  1:
		leftIframeOFF();
		
		//top_menu("work/selectLeft.do", $(th), "leftFrame");
		top_menu("work/selectPrivateWorkV.do", $(th), "content");
	break;
	case  2:
		leftIframeON();
		top_menu("bsnsPlan/selectLeft.do", $(th), "leftFrame");
		top_menu("bsnsPlan/index.do", $(th), "content");
	break;
	case  3:
		leftIframeOFF();
		top_menu("work/selectWorkAllDeal.do", $(th), "content");
	break;
	case  4:
		leftIframeOFF();
		top_menu("stats/index.do", $(th), "content");
	break;
	case  5:
		leftIframeON();
		top_menu("company/selectLeft.do", $(th), "leftFrame");
		top_menu("company/index.do", $(th), "content");
	break;
	case  6:
		leftIframeON();
		top_menu("person/selectLeft.do", $(th), "leftFrame");
		top_menu("person/index.do", $(th), "content");
	break;
	case  7:
		leftIframeON();
		top_menu("stockFirmManage/selectLeft.do", $(th), "leftFrame");
		top_menu("stockFirmManage/selectStaffNstockIB.do", $(th), "content");
	break;
	case  8:
		leftIframeOFF();
		top_menu("network/selectStaffNetwork.do", $(th), "content");
	break;
	case  9:
		leftIframeON();
		top_menu("card/selectLeft.do", $(th), "leftFrame");
		top_menu("card/index.do", $(th), "content");
	break;
	case 10:
		leftIframeON();
		top_menu("car/selectLeft.do", $(th), "leftFrame");
		top_menu("car/index.do", $(th), "content");
	break;
	case 11:
		leftIframeON();
		top_menu("personnel/management/selectLeft.do", $(th), "leftFrame");
		top_menu("personnel/management/index.do", $(th), "content");
	break;
	case 12:
		leftIframeOFF();
		top_menu("idea/index.do", $(th), "content");
	break;
	case 13:
		leftIframeOFF();
		top_menu("control/mainFile.do", $(th), "content");
	break;
	case 14:
		leftIframeOFF();
		top_menu("control/userControl.do", $(th), "content");
	break;
	// 인사이드 일정을 가져오기 위한 메뉴
	case 15:
		//$('#topmenu').attr('target', 'content').attr('action', "http://106.250.177.91:8280/SynergyCus/ScheduleCal.do").submit();		
		leftIframeOFF();
		// # 로컬
		//top_menu("http://192.168.0.156:8080/SynergyCus/ScheduleCal.do?SearchPerSabun=" + $(sabun), $(th), "content");
		// # 개발
		//top_menu("http://192.168.0.223:8280/SynergyCus/ScheduleCal.do?SearchPerSabun=" + $(sabun), $(th), "content");		
		// # 운영
		top_menu("http://106.250.177.91:8280/SynergyCus/ScheduleCal.do?SearchPerSabun=" + $(sabun), $(th), "content");		
				
		//top_menu("bsnsPlan/selectLeft.do", $(th), "leftFrame");
		//top_menu("bsnsPlan/index.do", $(th), "content");
		
	break;
	//20151208 EIS추가
	case 77:
		leftIframeOFF();
		top_menu("stats/eisSummary.do", $(th), "content");
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
function gotoERP(th,flag) {
	var sabun = $("#rgstSabun").val();				//사번을 통해서 IB >> Inside 이동을 위해 erp.erp_per 의 계정을 가져온다.
	
	var id = $("#rgstId").val();
	//var DATA = {usrId:id};
	var DATA = {sabun:sabun};
	var url = "basic/InsideSysInfo.do";
	var fn = function(arg) {						//callback function.
		DATA = "<input type='hidden' name='PerId' value='"+id+"'/>"+
			"<input type='hidden' name='PerPW' value='"+arg+"'/>"+
			"<input type='hidden' name='flag' value='sideLogin'/>"+
			"<input type='hidden' name='CMD' value='"+flag+"'/>";
		
		$("#movePage000").html(DATA);
		window.open('', 'erp', '');
		var frm = document.movePage000;
		frm.target = 'erp';
		frm.action = "http://106.250.177.91:8280/SynergyCus/LoginEnd.do";
		frm.submit();

		//초기화
		$("#movePage000").html("");
		frm.target = "";
		frm.action = "";
	};
	ajaxModule(DATA, url, fn);
}