function month(mon,url){//월 선택
	 var frm = document.modifyRec;
	 $('#choice_month').val(mon);
	 frm.action = url;
	 frm.submit();
}

String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/gi, "");
};

// 등록
function cardSubmit(th){
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
	}*/
	if(price.val().is_null()){
		price.focus();
		price.css('background-color','#A9F5BC');
		alert("금액을 입력하세요.");return 0;
	}
	$(th).hide();
	var frm = document.getElementById('insertCard');//sender form id
	frm.action = "insertUsed.do";//target frame name
	frm.submit();
}

function numbersonly(e, decimal) {//input박스 숫자만 입력받기
	var key;
	var keychar;

	if (window.event) {
		key = window.event.keyCode;
	} else if (e) {
		key = e.which;
	} else {
		return true;
	}
	keychar = String.fromCharCode(key);

	if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13)
			|| (key == 27)) {
		return true;
	} else if ((("0123456789").indexOf(keychar) > -1)) {
		return true;
	} else if (decimal && (keychar == ".")) {
		return true;
	} else
		return false;
}

function selectStaff(){
	// var obj = $(this).parent().parent();
	var obj = $("input[name=memoSndName]:checkbox:checked");
	var name = "";
	for(var i = 0; i<obj.length ; i++){

		var objN = $("input[name=memoSndName]:checkbox:checked:eq("+i+")");
		// if(objN.is(":checked")==false){i-=1; continue;}
		name += objN.val()+" ";
	}
	$("#test").hide();
	$("#0_0_staff_0").val(name);
}


	//노트 저장 버튼
	/*
$(".bsnsPsave").live("click",function(){
	var obj = $(this);
	var num = obj.attr('id').split('_');
	$.ajax({
		type:"POST",        //POST GET
		url:"../bsnsPlan/insertBsnsPlanNote.do",     //PAGEURL
		data : ({sNb: $('#bsnsPsnb'+num[1]).val(),
				note: $('#memoarea'+num[1]).val(),
				}),
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#bsnsPmemo_"+num[1]).hide();
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
});*/
function bsnsPsave(page, tempNum){
	var obj = $(this);
	var num = tempNum.split('_');
	var pUrl;
	if(page=='bsnsPlan') pUrl = "../bsnsPlan/insertBsnsPlanNote.do";
	else if(page=='card') pUrl = "../card/insertCardFeedback.do";
	$.ajax({
		type:"POST",        //POST GET
		url:pUrl,     //PAGEURL
		data : ({sNb: $('#bsnsPsnb'+num[1]).val(),
				note: $('#memoarea'+num[1]).val(),
				feedback: $('#memoarea'+num[1]).val()
				}),
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#bsnsPmemo_"+num[1]).hide();
			alert("저장되었습니다.");
			window.location.reload();
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}

function delCardUsed(th, cnt){
	var snb = $("#snb"+cnt).val();
	var pUrl = "../card/deleteCardUsed.do";

	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url:pUrl,     //PAGEURL
			data : ({sNb: snb}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				$("#insertCard").submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}


function sortTable(flag){
	$("#sorting").val(flag);
	document.modifyRec.submit();
}


/****************************************************************
 * Name  : popUp
 * Desc  : 팝업 함수 - 지출등록의 회사/고객 대상자 팝업
 * Param : num, flag, cstListCnt
 ****************************************************************/
function popUp(num, flag, th){
		var clickId = $(th).attr('id');
		var cInt ;
		
		var sUrl = "../work/popUpCst.do";
		sUrl+='?f='+flag+'&n='+num; 
		var w = '500';
		var h = '600';
		var ah = screen.availHeight - 30;
		var aw = screen.availWidth - 10;
		var xc = (aw - w) / 2;
		var yc = (ah - h) / 2;
		
		if(num != 1 && typeof clickId != 'undefined' && clickId != null){  // [+] 아닐때
			var jbSplit = clickId.split( '_' );
			cInt = jbSplit[1];
			$("#selKeyNum").val(cInt);	 	// key 값 유지를 위해 hidden 에 저장함	
		}
	
		var option = "left=" + xc
					+",top=" + yc
					+",width=" + w
					+",height=" + h
					+",menubar=no"
					+",status=no"
					+",toolbar=no"
					+",location=no"
					+",scrollbars=yes"
					+",resizable=no"
					;
		window.open(sUrl, "_blank", option);
		//var rVal = showModalDialog(sUrl, val, option);
		
}

//대상자 시너지와의 이력	20150714
function personHistoryPopUp(num,flag,nm,snb){

	// popUp 규격
	var w = '740';
	var h = '740';
	var ah = screen.availHeight - 30;
	var aw = screen.availWidth - 10;


	var val = new Object();
	var sUrl = '';

	if(flag=='personHistoryPop') {		//지출 > 대상자 이름 클릭 ... 시너지와의 이력 팝업
		sUrl = "../person/PersonHistoryPop.do";
		sUrl+='?sNb='+snb;
		w='650',h='600';
	}
	
	h = (ah-40>h?h:ah-40);
	var xc = (aw - w) / 2;
	var yc = (ah - h) / 2;
	var option = "left=" + xc
				+",top=" + yc
				+",width=" + w
				+",height=" + h
				+",menubar=no"
				+",status=no"
				+",toolbar=no"
				+",location=no"
				+",scrollbars=yes"
				+",resizable=no"
				;
	window.open(sUrl, "_blank", option);

	return;
}



/****************************************************************
 * Name  : returnPopUp
 * Desc  : 인물등록 후 setting function 
 * Param : rVal
 ****************************************************************/
function returnPopUp(rVal){	
	var str = '';
	var count = Number($("#cstListCnt").val());  // 등록된 회사/고객 수
	var i = count;

	//if(rVal.f == 'card'){
		if(rVal.n == "1"){  // [+]  - 신규
			i = count+1;
			
			str = '  <span id="addCstSnb_'+i+'" name="addCstSnbSpan"><input type="hidden" id="cstSnb_'+ i +'" name = "regCstSnb" value="'+rVal.snb+'">';  // cst_snb 값
			str = str + '<input type="hidden" id="cstSnb_'+ i +'" name = "regSnb" value="'+rVal.snb+'">';   // card_s_nb(s_nb) 값
			str = str + '<button id="addCstSnb_'+i+'" name="reg_btn" class="btn_inner" onclick="popUp(\'0\',\'card\',this);" style="border:1px solid #a3a5a9; background-color:#d0d3d8;"><span id="sltNm_' + i + '">'+rVal.cpnNm+'</span>   <span id="sltCpn_'+ i +'">'+rVal.nm+'</span></button>' ;
			str = str + '<span id = "delRegCst_'+i+'" style="font-weight:bold;color:red;cursor:pointer;" onclick="delRegCst(this);"><a><i class="fa fa-times"></i></a>&nbsp;</span>' ;
			str = str + '</span>';

			$("#cstListCnt").val(i);	        // 등록된 회사/고객 수 
			$("#addRegCstDiv").append(str);
		} else {
			$("#cstListCnt").val(i);	     // 등록된 회사/고객 수
			
			// 수정일때
			if($("#selKeyNum").val() != null){
				var selKey = $('#selKeyNum').val();				// 선택한 key 값
				$("#cstSnb_" + selKey).val(rVal.snb);			// snb
				$("#sltCpn_" + selKey).html(rVal.cpnNm);		// 회사명
				$("#sltNm_" + selKey).html(rVal.nm);			// 이름
			}else{
			//	$("#cstListCnt").val(i);	     // 등록된 회사/고객 수
				$("#cstSnb").val(rVal.snb);			// snb
				$("#sltCpn").html(rVal.cpnNm);		// 회사명
				$("#sltNm").html(rVal.nm);			// 이름
				
				$("#sltPst").html(rVal.position);	// 직급  > 없는듯
				//$("#sltCst").css('display','');     // 외
			}
			
			$("#delRegCst").css('display','');  // X 보이기
			$("#addRegCst").css('display','');  // [+] 보이기
			
			// $("#sltCst").html("외 <input type=\"text\" name=\"etcNum\" style=\"height:15px;width:14px;\"/>명");
		}
	//}
	// $("input[id^=foCus"+num+"]").focus();
}


/****************************************************************
 * Name  : delRegCst
 * Desc  : 등록된 지출 회사/고객 삭제 function 
 * Param : th
 ****************************************************************/
function delRegCst(th){
	var clickId = $(th).attr('id');
	var selKey = ""; 
	if(clickId != null){
		var jbSplit = clickId.split( '_' );
		selKey = jbSplit[1];
	}

	$("#addCstSnb_"+selKey).remove('');  // span 삭제
	
}
