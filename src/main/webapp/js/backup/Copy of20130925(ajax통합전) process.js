$(function(){
 if(navigator.userAgent.indexOf('Firefox') >= 0){
  (function(){
   var events = ["mousedown", "mouseover", "mouseout", "mousemove",
                 "mousedrag", "click", "dblclick"];  
   for (var i = 0; i < events.length; i++){
    window.addEventListener(events[i], function(e){
     window.event = e;
    }, true);
   }
  }());
 };
/************************************************ work left start *****************************************************************/
	function left_menu(sUrl){
		parent.mainFrame.location.href = sUrl;
	};
	
	$('#leftWorkC').click(function(){//업무일지 등록
		left_menu("selectWorkC.do");
	});
	$('#leftWorkV').click(function(){//업무일지 열람
		left_menu("selectWorkV.do");
	});
	$('#leftWorkMediateDealS').click(function(){//중개 제안
		left_menu("selectWorkMediateDealS.do");
	});
	$('#leftWorkMediateDealR').click(function(){//중개 제안받은딜
		left_menu("selectWorkMediateDealR.do");
	});
	$('#leftWorkDirectDealS').click(function(){//직접 제안
		left_menu("selectWorkDirectDealS.do");
	});
	$('#leftWorkDirectDealR').click(function(){//직접 제안받은딜
		left_menu("selectWorkDirectDealR.do");
	});
	$('#leftWorkEntrust').click(function(){//일임
		left_menu("selectWorkEntrust.do");
	});
	$('#leftWorkResale').click(function(){//재매각
		left_menu("selectWorkResale.do");
	});
	$('#leftWorkMnA').click(function(){//M&A
		left_menu("selectWorkMnA.do");
	});
	$('#leftWorkFinancing').click(function(){//자금조달
		left_menu("financing.do");
	});
	$('#leftWorkManageMent').click(function(){//자산운용
		left_menu("management.do");
	});
	$('#leftWorkMNA').click(function(){//M&A
		left_menu("mna.do");
	});
	$('#leftWorkEtc').click(function(){//기타
		left_menu("etc.do");
	});
	$('#leftWorkShare').click(function(){//기타
		left_menu("share.do");
	});
/************************************************ work left end *****************************************************************/
/************************************************ car left start *****************************************************************/

	$('#leftCar1').click(function(){//업무일지 등록
		$("#s_Name").val(null);
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftCar2').click(function(){//업무일지 등록
		$("#s_Name").val("6334");
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftCar3').click(function(){//업무일지 등록
		$("#s_Name").val("8213");
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftCar4').click(function(){//업무일지 등록
		$("#s_Name").val("9559");
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftCar5').click(function(){//업무일지 등록
		$("#s_Name").val("3798");
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});

/************************************************ car left end *****************************************************************/
/************************************************ personnel left start *****************************************************************/

	$('#leftHoliday').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="index.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftModifyHoliday').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="modifyHoliday.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftTardiness').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="monthTardiness.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});
	$('#leftModifyTardiness').click(function(){//
		var frm = document.getElementById('cName');//sender form id
			frm.action="modifyTardiness.do"
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});

/************************************************ personnel left end *****************************************************************/
/************************************************ work main start *****************************************************************/
	function displayNdeal(dsp){
//		document.getElementById('info').style.display=dsp;
		$('#info').css('display',dsp);
		$('#price').css('display',dsp);
		$('#invest').css('display',dsp);
		$('#comp1').css('display',dsp);
		$('#name1').css('display',dsp);
		$('#team1').css('display',dsp);

		$('#input4').css('display',dsp);
		$('#input5').css('display',dsp);
		$('#input6').css('display',dsp);
		$('#input7').css('display',dsp);
		$('#input8').css('display',dsp);
	}
	function displayDeal(dsp){
		$('#name0').css('display',dsp);
		$('#team0').css('display',dsp);

		$('#input2').css('display',dsp);
		$('#input3').css('display',dsp);
	}
	$('#workMeet').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workIR').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workVisit').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workAnalysis').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workSurvey').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workDealS').click(function(){
		displayNdeal("");
		displayDeal("none");
	});
	$('#workDealR').click(function(){
		displayNdeal("");
		displayDeal("none");
	});

	$(".offerCd").live("change", function(){
		var obj = $(this);

		//dataVisible(obj);

		switch(obj.val()){
		case "00001":
		case "00002":
		case "00003":
			obj.parent().parent().find('[id^=slctPrsn_]').css('display','');
			obj.parent().parent().find('[id^=slctCpn_]').css('display','none');
			obj.parent().parent().find('[id^=CateCd_]').css('display','none');
			obj.parent().parent().find('[id^=AP_price]').css('display','none');
			obj.parent().parent().find('[id^=textTmp_]').css('display','none');
			obj.parent().parent().find('[id^=KP_title_]').css('display','');
			obj.parent().parent().find('[id^=KP_slct_]').css('display','');
			break;
		case "00004":
		case "00005":
			obj.parent().parent().find('[id^=slctCpn_]').css('display','');
			obj.parent().parent().find('[id^=slctPrsn_]').css('display','none');
			//obj.parent().find('span').css('display','none');
			obj.parent().parent().find('[id^=CateCd_]').css('display','none');
			obj.parent().parent().find('[id^=AP_price]').css('display','none');
			obj.parent().parent().find('[id^=textTmp_]').css('display','none');
			obj.parent().parent().find('[id^=KP_title_]').css('display','');
			obj.parent().parent().find('[id^=KP_slct_]').css('display','');
			break;
		case "00006":
		case "00007":
			obj.parent().parent().find('[id^=slctCpn_]').css('display','');
			obj.parent().parent().find('[id^=slctPrsn_]').css('display','');
			//obj.parent().find('span').css('display','');
			obj.parent().parent().find('[id^=CateCd_]').css('display','');
			obj.parent().parent().find('[id^=AP_price]').css('display','');
			obj.parent().parent().find('[id^=textTmp_]').css('display','');
			obj.parent().parent().find('[id^=KP_title_]').css('display','none');
			obj.parent().parent().find('[id^=KP_slct_]').css('display','none');
			break;
		}

	});

	// 업무내용 타이틀 클릭시 내용 보이기
//	$('.title').click(function(){
//		$(this).parent().find('[class=note]').show();
//	});

	var object = '';
	var divId = '';
	var oldDivId = '';


	//업무일지 제목 클릭시 내용
	$(".title").live("click", function(){
//		$(".title").click(function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert((parseInt(t_num)<100?("0"+t_num):t_num));
		divId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+'workPr'+ t_num[2];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
		$("#BN_"+t_num[0]+"_"+t_num[2]).focus();
	});
	//정보정리 회사이름 클릭시 내용
	$(".cpnNm").live("click", function(){
//		$(".title").click(function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert((parseInt(t_num)<100?("0"+t_num):t_num));
		divId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+'offerPr'+ t_num[2];
		$("#"+oldDivId).hide();
		divShow($(this));//alert(divId)
		oldDivId=divId;
		$("#foCus_"+t_num[0]+"_"+t_num[2]).focus();
	});
	$(".netPnt").live("click", function(){
//		$(".title").click(function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert((parseInt(t_num)<100?("0"+t_num):t_num));
		divId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+t_num[1]+ t_num[2];
		$("#"+oldDivId).hide();
		divShow($(this));//alert(divId)
		oldDivId=divId;
		$("#foCus_"+t_num[0]+"_"+t_num[2]).focus();
	});
	$(".offerCnt").live("click", function(){
//		$(".title").click(function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert((parseInt(t_num)<100?("0"+t_num):t_num));
		divId = t_num[0]+'offerPr'+ t_num[2];
		$("#"+oldDivId).hide();
		divShow($(this));//alert(divId)
		oldDivId=divId;
	});

	//업무일지 닫기 클릭시
	$('.closePopUpMenu').live("click",function(event){
		$(this).parent().hide();
	});

	//업무일지 내용수정 확인
	$('.bsnsR_btnOk').click(function(){
//		alert($(this).parent().parent().find('[id^=txtarea]').val());
//		alert($(this).parent().parent().attr('id'))

		// if(confirm("적용하시겠습니까?")){
			var obj = $(this).parent().parent();
			if(obj.find('[id^=txt]').val()==null||obj.find('[id^=txt]').val().length==0){
				alert("제목을 입력하지 않았습니다.\n제목을 입력하세요.");
				return;
			}
			obj.hide();
			var NOtE = obj.find('[id^=txtarea]').val();
			if(NOtE=='일지를 입력하세요.') NOtE = '';

			var fn = function(){
				document.modifyRec.action = "selectPrivateWorkV.do";
				document.modifyRec.submit();
			};
			if(obj.find('[id^=bsnsRecSNb]').val()==""){//새로 입력하기

				var day = obj.find('[id^=bsnsRecSNb]').attr('id').split('b');
				day = parseInt(day[2])<10?('0'+day[2]):day[2];
				var DATA = {name: $('#loginName').val(),
							title: obj.find('[id^=txt]').val(),
							note: NOtE,
							choice_year: $('#choice_year').val(),
							choice_month: $('#choice_month').val(),
							day: day,
							rgId: $('#rgstId').val()
							};
				var url = "../work/insertBusinessRecord.do";
				ajaxModule(DATA,url,fn);
				/* $.ajax({
					type:"POST",        //POST GET
					url:"../work/insertBusinessRecord.do",     //PAGEURL
					data : ({name: $('#loginName').val(),
							title: obj.find('[id^=txt]').val(),
							note: NOtE,
							choice_year: $('#choice_year').val(),
							choice_month: $('#choice_month').val(),
							day: day,
							rgId: $('#rgstId').val()
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
//						$(obj).hide();
						document.modifyRec.action = "selectPrivateWorkV.do";
						document.modifyRec.submit();
					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				}); */
			}else{//입력된 내용 수정하기
				var DATA = {sNb: obj.find('[id^=bsnsRecSNb]').val(),
							title: obj.find('[id^=txt]').val(),
							note: NOtE,
							rgId: $('#rgstId').val()
							};
				var url = "../work/modifyBusinessRecord.do";
				ajaxModule(DATA,url,fn);
				/* $.ajax({
					type:"POST",        //POST GET
					url:"../work/modifyBusinessRecord.do",     //PAGEURL
					//  dataType: "html",       //HTML XML SCRIPT JSON

					data : ({sNb: obj.find('[id^=bsnsRecSNb]').val(),
							title: obj.find('[id^=txt]').val(),
							note: NOtE,
							rgId: $('#rgstId').val()
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//					alert(<c:out value='${message}'/>);
						document.modifyRec.action = "selectPrivateWorkV.do";
						document.modifyRec.submit();

					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				}); */
			}
		// }
//		else {
//			$(this).parent().parent().hide();
//		}
	});

	//정보정리 핵심체크에서 체크박스 클릭시
	$('.input_chk').click(function(){
		var obj = $(this);
		var num = obj.attr('id').split('0');
		// alert(obj.attr('id'));
		// alert(obj.parent().parent().find('[id^=kyPoint0]').val());
		if(obj.is(':checked') == true){
			jQuery.each('', function(){
				obj.attr('checked','checked');
				// $('#kyPoint0'+num[1]).attr('disabled','disabled');
			});
		} else {
			jQuery.each('', function(){
				obj.attr('checked','');
				// $('#kyPoint0'+num[1]).attr('disabled','');
				obj.parent().parent().find('[id^=kyPoint0]').attr('disabled','');
			});
				// $('#kyPoint0'+num[1]).attr('disabled','');
		}
	});


	//정보정리 내용 수정
	$('.offerR_btnOk').click(function(){
//		alert($(this).parent().parent().find('[id^=txtarea]').val());
//		alert($(this).parent().parent().attr('id'))
		var obj = $(this).parent().parent();
		var getSnb = obj.find('[id^=offerSnb]').val();
		var middleoffercd = obj.find('[id^=middleOfferCd]').val();
		var getOffercd = obj.find('[id^=offerCd]').val();
		var getCpnName = obj.find('[id^=AP_cpnNm]').html();
		var getCstId = obj.find('[id^=AP_cstId]').val();
		var getCpnId = obj.find('[id^=AP_cpnId]').val();
		var getPrice = obj.find('[id^=AP_price]').val();
		var getInvestPrice = obj.find('[id^=AP_investPrice]').val();
		var getInfoprovider = obj.find('[id^=AP_infoProviderId]').val();
		var getCoworker = obj.find('[id^=AP_coworkerId]').val();
		var getSupporter = obj.find('[id^=AP_supporterId]').val();
		var getSupporterText = obj.find('[id^=AP_supporterText]').val();
		var notNullSupporter = (getSupporter==null|getSupporter=='')?0:getSupporter;
		var getCategoryCd = obj.find('[id^=categoryCd]').val();
		var getRcmderSnb = obj.find('[id^=rcmderSnb]').val();

		// if((getOffercd>00003 && getOffercd<00006)||getOffercd==00013){
			// if(""==getCpnName || "회사선택"==getCpnName) {alert("회사/사람을 선택하지 않았습니다.\n선택 후 저장하세요.");return;}

		// } else if(getOffercd<00004||getOffercd>00005){
			// if(0==getCstId) {alert("회사/사람을 선택하지 않았습니다.\n선택 후 저장하세요.");return;}

		// }
		switch(getOffercd){
			case '00002':
			case '00003':
			case '00008':
			case '00009':
				if(0==getCstId) {alert("사람을 선택해 주세요.");return;}
			break;


			case '00006':
				if(""==getCategoryCd){alert("유형을 선택해주세요.");return;}
				if(""==getRcmderSnb){alert("추천인을 (지정 or 지정취소) 해주세요.");return;}
			case '00004':
			case '00005':
			case '00013':
				if(""==getCpnName || "회사선택"==getCpnName) {alert("회사를 선택해 주세요.");return;}
			break;


			case '00007':
				if(""==getCategoryCd){alert("유형을 선택해주세요.");return;}
			case '00001':
				if(0==getCstId & (""==getCpnName || "회사선택"==getCpnName)) {alert("회사/인물을 선택해 주세요.");return;}
			break;
		}
		if(""==getRcmderSnb) getRcmderSnb=0;


		switch(middleoffercd){
			case '00011':
				var getEntrust = obj.find('[name^=NnI]:checked').val();
				var getCpnCst = obj.find('[name^=CnP]:checked').val();
			case '00012':
				if(0==getCstId) {alert("인물을 선택해 주세요.");return;}
			break;
		}

		var price = "";
		var investPrice = "";
		if(getPrice!="발행규모"&getPrice!=" 발행규모 : ") price = getPrice;
		if(getInvestPrice!="투자규모"&getInvestPrice!=" 투자규모 : ") investPrice = getInvestPrice;

		// if((obj.find('[id^=chk01_]').is(':checked')==false)&(obj.find('[id^=chk02_]').is(':checked')==false)&(obj.find('[id^=chk03_]').is(':checked')==false)&(obj.find('[id^=chk04_]').is(':checked')==false)) alert("핵심사항체크 및 내용을 입력하세요."); return;

		if(confirm("적용하시겠습니까?")){
			//var obj = $(this).parent().parent();
			obj.hide();//ajax 보내면서 delay발생으로 저장을 여러번 클릭하는 문제로 div 화면상에서 hide
			var keyPfinancing = "";
			var keyPmanagement = "";
			var keyPmna = "";
			var keyPetc = "";
			var keyPshare = "";

			if(obj.find('[id^=chk01_]').is(':checked') == true) keyPfinancing  = (obj.find('[id^=kyPoint01_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint01_]').val());
			if(obj.find('[id^=chk02_]').is(':checked') == true) keyPmanagement = (obj.find('[id^=kyPoint02_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint02_]').val());
			if(obj.find('[id^=chk03_]').is(':checked') == true) keyPmna        = (obj.find('[id^=kyPoint03_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint03_]').val());
			if(obj.find('[id^=chk04_]').is(':checked') == true) keyPetc        = (obj.find('[id^=kyPoint04_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint04_]').val());
			if(obj.find('[id^=chk05_]').is(':checked') == true) keyPshare      = (obj.find('[id^=kyPoint05_]').val()=='NEEDS 내용'?'':obj.find('[id^=kyPoint05_]').val());
			// alert(obj.find('[id^=chk0'+i+'_]').is(':checked'));

			if(getSnb==""){//새로 입력하기

				var day = obj.find('[id^=offerSnb]').attr('id').split('b');
				day = parseInt(day[1])<10?('0'+day[1]):day[1];
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/insertDeal.do",     //PAGEURL
					data : ({
							cpnId: getCpnId,
							//cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							cstId: getCstId,
							cstNm: obj.find('[id^=AP_cstNm]').html(),
							price: price,
							investPrice: investPrice,
							entrust: getEntrust,
							cpnCst: getCpnCst,
							memo: obj.find('[id^=txtarea]').val(),
							middleOfferCd: middleoffercd,
							offerCd: getOffercd,
							categoryCd: getCategoryCd,
							choice_year: $('#choice_year').val(),
							choice_month: $('#choice_month').val(),
							day: day,
							rgId: $('#rgstId').val(),
							rgNm: $('#loginName').val(),
							financing: keyPfinancing,
							management: keyPmanagement,
							mna: keyPmna,
							etc: keyPetc,
							share: keyPshare,
							coworker: getCoworker,
							infoProvider: getInfoprovider,
							rcmdSnb: getRcmderSnb,
							supporter: notNullSupporter,
							supporterText: getSupporterText
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
//						$(obj).hide();
						document.modifyRec.action = "selectPrivateWorkV.do";
						document.modifyRec.submit();
					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				});
			}else{//입력된 내용 수정하기
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/modifyDeal.do",     //PAGEURL
					//  dataType: "html",       //HTML XML SCRIPT JSON

					data : ({sNb: getSnb,
							cpnId: getCpnId,
							cpnSnb: obj.find('[id^=AP_cpnSnb]').val(),
							//cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							cstId: getCstId,
							cstNm: obj.find('[id^=AP_cstNm]').html() +" ; "+ obj.find('[id^=AP_cstNm]').attr('title'),
							price: price,
							investPrice: investPrice,
							entrust: getEntrust,
							cpnCst: getCpnCst,
							prevCpnCst: obj.find('[id^=prevCpnCst]').val(),
							memo: obj.find('[id^=txtarea]').val(),
							middleOfferCd: middleoffercd,
							offerCd: getOffercd,
							categoryCd: getCategoryCd,
							rgId: $('#rgstId').val(),
							rgNm: $('#loginName').val(),
							snbFinancing: obj.find('[id^=snbFinancing]').val(),
							snbManagement: obj.find('[id^=snbManagement]').val(),
							snbMna: obj.find('[id^=snbMna]').val(),
							snbEtc: obj.find('[id^=snbEtc]').val(),
							snbShare: obj.find('[id^=snbShare]').val(),
							financing: keyPfinancing,
							management: keyPmanagement,
							mna: keyPmna,
							etc: keyPetc,
							share: keyPshare,
							infoProvider: getInfoprovider,
							coworker: getCoworker,
							//rcmdSnb: getRcmderSnb,
							supporter: notNullSupporter,
							supporterText: getSupporterText
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//					alert(<c:out value='${message}'/>);
						document.modifyRec.action = "selectPrivateWorkV.do";
						document.modifyRec.submit();

					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				});
			}
		}
//		else {
//			$(this).parent().parent().hide();
//		}
	});


	//업무일지 내용 삭제
	$('.offerR_btnDel').live("click",function(event){
		if(confirm("DB에서 완전삭제 처리됩니다. \n삭제하시겠습니까?")){
			var obj = $(this).parent().parent();
			$.ajax({
				type:"POST",        //POST GET
				url:"../work/deleteOffer.do",     //PAGEURL
				//  dataType: "html",       //HTML XML SCRIPT JSON
				data : ({
					sNb: obj.find('[id^=offerSnb]').val()
					,cstId: obj.find('[id^=AP_cstId]').val()
					,entrust: obj.find('[name^=NnI]:checked').val()
				}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					alert("<c:out value='${message}'/>");
					document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		} else {
			$(this).parent().parent().hide();
		}
	});

	//업무일지 내용 삭제
	$('.bsnsR_btnDel').live("click",function(event){

		if(confirm("DB에서 완전삭제 처리됩니다. \n삭제하시겠습니까?")){
			var obj = $(this).parent().parent();
			$.ajax({
				type:"POST",        //POST GET
				url:"../work/deleteBusinessRecord.do",     //PAGEURL
				//  dataType: "html",       //HTML XML SCRIPT JSON
				data : ({sNb: obj.find('[id^=bsnsRecSNb]').val()}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					alert("<c:out value='${message}'/>");
					document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		} else {
			$(this).parent().parent().hide();
		}
	});

	//메모 클릭시 내용 보이기
	$(".memo_n").live("click", function(){
//		$(".title").click(function(){
		var t_num = $(this).attr('id').split('_');
		var date = parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0];
		divId = date+'memoPr'+ t_num[2];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
		$("#MM_"+date+"_"+t_num[2]).focus();
	});
	$(".memo_m").live("click", function(){
//		$(".title").click(function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'memoPr'+ t_num[1];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
		$("#RM_"+ t_num[1]).focus();
		document.getElementById('RM_'+ t_num[1]).focus();
	});
	$(".result_m").live("click", function(){
//		$(".title").click(function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'resultPr'+ t_num[1];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
	});
	
	$(".opinion_m").live("click", function(){
//		$(".title").click(function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'opinionPr'+ t_num[1];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
	});

	//전달 버튼 클릭시 사람들 이름 보이기
	$(".pass2P").live("click", function(){
		var t_num = $(this).attr('id').split('_');
		var dId = (parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0])+'memoPr'+ t_num[2];
		$('#memoDay').val(parseInt(t_num[0])<10?("0"+t_num[0]):t_num[0]);
		$('#comment').val($("#"+dId).find('textarea').val());
		divId = 'test';
		divShow($(this));
		$("#PM_0").focus();
	});

	$(".pass2pe").live("click", function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'test_'+t_num[1];
		divShow($(this));
	});

	//메모확인 클릭시
 	$(".chkOk").live("click", function(){
		var obj = $(this).parent().parent();

		$.ajax({
			type:"POST",        //POST GET
			url:"../work/checkMemo.do",     //PAGEURL
			//  dataType: "html",       //HTML XML SCRIPT JSON

			data : ({
				memoSNb: obj.find('[id^=memoSNb]').val(),
				sttsCd: '00002',
				rgId: $('#rgstId').val(),
				importance: obj.find('[id^=importance]').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION

				$(obj).hide();

				document.modifyRec.action = "selectPrivateWorkV.do";
				document.modifyRec.submit();
				// var num0 = obj.find('input:eq(1)').attr("id").split('_');
				// var Did = parseInt(num0[1])+"image"+num0[2];

//				$("."+Did+" font").css('background-color','navy');
				// $("#"+Did).attr('src',"../images/accept.png");
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	});


	//메모 내용수정 확인
	$('.memo_btnOk').live("click", function(){
	// if(confirm("적용하시겠습니까?")){
		$(".popUpMenu").hide();
		var obj = $(this).parent().parent();
		if(obj.find('[id^=memoSNb]').val()==""){

			var day = obj.find('[id^=memoSNb]').attr('id').split('b');
			day = parseInt(day[1])<10?('0'+day[1]):day[1];

			$.ajax({
				type:"POST",        //POST GET
				url:"../work/insertMemo.do",     //PAGEURL
				data : ({memoSndName: $('#loginName').val(),
					comment: obj.find('[id^=memoarea]').val(),
					choice_year: $('#choice_year').val(),
					choice_month: $('#choice_month').val(),
					day: day,
					rgId: $('#rgstId').val(),
					subMemo: "N",
					importance: obj.find('[id^=importance]').val()
					}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					$(obj).hide();
					document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}else{
			var OLDcomment = obj.find('[id^=oldMemoComment]').val().split('(');
			$.ajax({
				type:"POST",        //POST GET
				url:"../work/modifyMemo.do",     //PAGEURL
				data : ({memoSNb: obj.find('[id^=memoSNb]').val(),
					comment: obj.find('[id^=memoarea]').val(),
					rgId: $('#rgstId').val(),
					oldcomment: OLDcomment[0],
					tmDt: obj.find('[id^=oldMemoTmdt]').val(),
					subMemo: "N",
					importance: obj.find('[id^=importance]').val()
					}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					$(obj).hide();
					document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
	// }
//	else {
//		$(this).parent().parent().hide();
//	}
});

	//메모 내용 삭제
	$('.memo_btnDel').live("click",function(event){

		if(confirm("DB에서 완전삭제 처리됩니다. \n삭제하시겠습니까?")){
			var obj = $(this).parent().parent();
			var DATA = {memoSNb: obj.find('[id^=memoSNb]').val()};
			var url = "../work/deleteMemo.do";
			var fn = function(){
				document.modifyRec.action = "selectPrivateWorkV.do";
				document.modifyRec.submit();
			};
			ajaxModule(DATA, url, fn);
			/* $.ajax({
				type:"POST",        //POST GET
				url:"../work/deleteMemo.do",     //PAGEURL
				//  dataType: "html",       //HTML XML SCRIPT JSON
				data : ({memoSNb: obj.find('[id^=memoSNb]').val()}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					alert("<c:out value='${message}'/>");
					document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			}); */
		} else {
			$(this).parent().parent().hide();
		}
	});

	// 추가 버튼 클릭시
	$(".addItemBtn").click(function(){
		// item 의 최대번호 구하기
		var obj = $(this);
		var tmp_arr = obj.attr('name').split('_');
		var idx = tmp_arr[tmp_arr.length-1];

		var id_div = '#dynamicDIV' +idx;
		var lastItemNo0 = $(id_div+" ul:last").attr("class").replace(idx+"_item_", "");
		var newitem0 = $(id_div+" ul:eq(0)").clone();
		newitem0.removeClass();
//		newitem0.find("li:eq(0)").attr("rowspan", "1");
		newitem0.addClass(idx+"_item_"+(parseInt(lastItemNo0)+1));
		newitem0.find("a:eq(0)").attr("id",idx+"_btnPass_"+(parseInt(lastItemNo0)+1));
		newitem0.find("a:eq(1)").attr("id",idx+"_memo_"+(parseInt(lastItemNo0)+1));

		var num_00 = (parseInt(idx)<10?("0"+idx):idx);
		var memoDiv = $("#"+num_00+"memoPr0");
		var newMemoDiv = $(memoDiv).clone();
		newMemoDiv.attr("id",num_00+"memoPr"+(parseInt(lastItemNo0)+1));
		newMemoDiv.find("input").attr("value","");

		$(id_div).append(newitem0);
		$(memoDiv).parent().append(newMemoDiv);

		var c_dbody = "#dbody"+idx;
		$(c_dbody).css('padding-bottom','+=20px');
//		alert($(c_dbody+" li:last").attr("class"));
		$(c_dbody+" li").css('height','+=20px');
		$(".memoLine").css('height','20px');
//		$(id_div).parent('li').parent('ul').parent('div').find('[class=dbody]').css('padding-bottom','+=26px');
	});


	//진행결과 클릭시 셀렉트 태그 나오고, 버튼없어짐
	$('.processResultBtn').click(function(){
		var obj = $(this).parent();
		obj.parent().find('select').css('display','');
		obj.css('display','none');
	});

	$(".processResult").live("change", function(){
		var obj = $(this);
		var Id = obj.attr('id');
		var snb = Id.split('_');
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/updatePrecessResult.do",     //PAGEURL
			//  dataType: "html",       //HTML XML SCRIPT JSON

			data : ({sNb: snb[2],
				process: $('#'+Id).val()
			}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//	alert(<c:out value='${message}'/>);
				document.modifyRec.action = "selectPrivateWorkV.do";
				document.modifyRec.submit();

			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	});

	//파일 다운로드
	$('.filePosition').live("click",function(){
		var obj = $(this).parent();
		// var frm = document.getElementById('modifyRec');//sender form id
		// frm.action = "downloadProcess.do";//target frame name
		// frm.submit();
		var obj_id = $(this).attr('id');
		var num = obj_id.split('ile');
		$("#makeName").val(obj.find('[id^=mkNames'+num[1]+']').val());
		// document.downName.submit();
		$("#downName").submit();
		// alert("업로드까지는 완료 되었습니다.\n다운로드는 빠른시일내로 완료하겠습니다.");
	});

	//핵심체크 view
	$('.viewKeyP').click(function(){
		var obj = $(this);
		var id = obj.attr('id');
		var num = id.split('_');

		$('#KP_slct_'+num[1]).css('display','');
		$('#'+id).css('display','none');
	});

	//핵심체크사항 약속자 선택
	$('.slctCoworker').live("click",function(){
		var obj = $(this).parent().parent().parent();
		var num = obj.attr('id').split('_');

		$("#snb").val($("#snb"+num[1]).val());
		// document.modifyRec.action="coworkerKPC.do";
		// document.modifyRec.submit();
		var frm = document.getElementById('modifyRec');//sender form id
			frm.target = "mainFrame";//target frame name
			frm.submit();
	});

	$('.processKPC').live("change",function(){
		var obj = $(this);
		var num = obj.attr('id').split('_')

		var frm = document.getElementById('procKPC'+num[1]);//sender form id
		frm.target = "mainFrame";//target frame name
		frm.submit();
	});



/************************************************ work main end *****************************************************************/
/************************************************ work deal start *****************************************************************/
	$("#feedback").live("change",function(){
		var obj = $(this).parent().parent();
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/changeFeedback.do",     //PAGEURL
			//  dataType: "html",       //HTML XML SCRIPT JSON

			data : ({sNb: obj.find('[id^=offerSnb]').val(),
				feedback: $(this).val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				if($("#SendReceive").val() == 'MR'){
					document.modifyRec.action = "selectWorkMediateDealR.do";}
				else if($("#SendReceive").val() == 'DS'){
					document.modifyRec.action = "selectWorkDirectDealS.do";}
				else if($("#SendReceive").val() == 'M'){
					document.modifyRec.action = "selectWorkMnA.do";}
				else if($("#SendReceive").val() == 'E'){
					document.modifyRec.action = "selectWorkEntrust.do";}
				else if($("#SendReceive").val() == 'RS'){
					document.modifyRec.action = "selectWorkResale.do";}
				else {
					document.modifyRec.action = "selectWorkDirectDealS.do";}
				document.modifyRec.submit();
//				$(obj).hide();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	});
	$("#progressCd").live("change",function(){
		var obj = $(this).parent().parent();
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/changeprogressCd.do",     //PAGEURL
			//  dataType: "html",       //HTML XML SCRIPT JSON

			data : ({
				sNb: obj.find('[id^=offerSnb]').val(),
				cstId: obj.find('[id^=cstSnb]').val(),
				progressCd: $(this).val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				if($("#SendReceive").val() == 'MR'){
					document.modifyRec.action = "selectWorkMediateDealR.do";}
				else if($("#SendReceive").val() == 'DS'){
					document.modifyRec.action = "selectWorkDirectDealS.do";}
				else if($("#SendReceive").val() == 'M'){
					document.modifyRec.action = "selectWorkMnA.do";}
				else if($("#SendReceive").val() == 'E'){
					document.modifyRec.action = "selectWorkEntrust.do";}
				else if($("#SendReceive").val() == 'RS'){
					document.modifyRec.action = "selectWorkResale.do";}
				else {
					document.modifyRec.action = "selectWorkDirectDealS.do";}
				document.modifyRec.submit();
//				$(obj).hide();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	});

	//제안현황에 메모 내용수정 확인
	$('.dealMemo_btnOk').live("click", function(){
	if(confirm("적용하시겠습니까?")){
		var obj = $(this).parent().parent();
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/modifyDealMemo.do",     //PAGEURL
			data : ({sNb: obj.find('[id^=dealMemoSNb]').val(),
				// cstNm: obj.find
				cstId: obj.find('[id^=dealResultCstId]').val(),
				memo: obj.find('[id^=memoarea]').val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					$(obj).hide();
				if($("#SendReceive").val() == 'MR'){
					document.modifyRec.action = "selectWorkMediateDealR.do";}
				else if($("#SendReceive").val() == 'DS'){
					document.modifyRec.action = "selectWorkDirectDealS.do";}
				else if($("#SendReceive").val() == 'M'){
					document.modifyRec.action = "selectWorkMnA.do";}
				else if($("#SendReceive").val() == 'E'){
					document.modifyRec.action = "selectWorkEntrust.do";}
				else if($("#SendReceive").val() == 'RS'){
					document.modifyRec.action = "selectWorkResale.do";}
				else {
					document.modifyRec.action = "selectWorkDealS.do";}
				document.modifyRec.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
//	else {
//		$(this).parent().parent().hide();
//	}
});
	//제안현황에 성과 내용수정 확인
	$('.dealResult_btnOk').live("click", function(){
		if(confirm("적용하시겠습니까?")){
			var obj = $(this).parent().parent();
			var idStr = obj.attr('id').split('Pr');
			var DATA = null, snb = '', rslt = '', rgId = $('#rgstId').val();
			
			if(idStr[0] == 'opinion'){
				DATA = {
					sNb: obj.find('[id^=dealOpinionSNb]').val()
					,opinion: obj.find('[id^=opinionarea]').val()
					,rgId: rgId
				};
			}else{
				DATA = {
					sNb: obj.find('[id^=dealResultSNb]').val()
					,result: obj.find('[id^=resultarea]').val()
					,rgId: rgId
				};
			}
			$.ajax({
				type:"POST",        //POST GET
				url:"../work/modifyDealResult.do",     //PAGEURL
				data : DATA,
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
//					$(obj).hide();
					if($("#SendReceive").val() == 'MR'){
						document.modifyRec.action = "selectWorkMediateDealR.do";}
					else if($("#SendReceive").val() == 'DS'){
						document.modifyRec.action = "selectWorkDirectDealS.do";}
					else if($("#SendReceive").val() == 'M'){
						document.modifyRec.action = "selectWorkMnA.do";}
					else if($("#SendReceive").val() == 'E'){
						document.modifyRec.action = "selectWorkEntrust.do";}
					else if($("#SendReceive").val() == 'RS'){
						document.modifyRec.action = "selectWorkResale.do";}
					else {
						document.modifyRec.action = "selectWorkDealS.do";}
					document.modifyRec.submit();
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
//	else {
//		$(this).parent().parent().hide();
//	}
	});

	$(".comment_m").live("click", function(){
		var t_num = $(this).attr('id').split('_');
		divId = 'commentPr'+ t_num[1];
		$("#TMP"+t_num[1]).val(t_num[2]);
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
	});

//	Mna
	$('.mna_btnOk').click(function(){
//		alert($(this).parent().parent().find('[id^=txtarea]').val());
//		alert($(this).parent().parent().attr('id'))

		if(confirm("적용하시겠습니까?")){
			var obj = $(this).parent().parent();
			var num = obj.find('[id^=TMP]').val();
//			alert(num+";;;;"+$('#offerTmDt'+num).val());
			if(obj.find('[id^=commentSNb]').val()==""){//새로 입력하기
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/insertCommentMna.do",     //PAGEURL
					data : ({
							offerId: $('#offerSnb'+num).val(),
							//cpnId: obj.find('[id^=AP_cpnId]').val(),
							cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							//cstId: obj.find('[id^=AP_cstId]').val(),
							cstNm: obj.find('[id^=AP_cstNm]').html(),
							progressCd: obj.find('[id^=progressCd]').val(),
							categoryCd: obj.find('[id^=categoryCd]').val(),
							tmDt: $('#offerTmDt'+num).val(),
							rgId: $('#rgstId').val()
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
//						$(obj).hide();
						document.modifyRec.action = "selectWorkMnA.do";
						document.modifyRec.submit();
					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				});
			}else{//입력된 내용 수정하기
				$.ajax({
					type:"POST",        //POST GET
					url:"../work/updateCommentMna.do",     //PAGEURL
					//  dataType: "html",       //HTML XML SCRIPT JSON

					data : ({sNb: obj.find('[id^=commentSNb]').val(),
							cpnNm: obj.find('[id^=AP_cpnNm]').html(),
							cstNm: obj.find('[id^=AP_cstNm]').html(),
							progressCd: obj.find('[id^=progressCd]').val(),
							categoryCd: obj.find('[id^=categoryCd]').val(),
							tmDt: $('#offerTmDt'+num).val(),
							rgId: $('#rgstId').val()
							}),
					timeout : 30000,       //제한시간 지정
					cache : false,        //true, false
					success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//					alert(<c:out value='${message}'/>);
						document.modifyRec.action = "selectWorkMnA.do";
						document.modifyRec.submit();

					},
					error: function whenError(e){    //ERROR FUNCTION
						alert("code : " + e.status + "\r\nmessage : " + e.responseText);
					}
				});
			}
		}
//		else {
//			$(this).parent().parent().hide();
//		}
	});


	$('#deal_select_year').live("change", function(){
		 $("#dayForm").submit();
	});


/************************************************ work deal end *****************************************************************/

///////// work main menu /////////////////////////////////////////////////////////////////////////
/************************************************ company main start *****************************************************************/
	$('#offerListed').click(function(){
		$('#offerNlisted').attr('checked',null);
		$(this).attr('checked', 'checked');
		$('#cpn_id').focus();
		$('#cpn_id').css('display','');
		$('#cpn__id').css('display','none');
	});
	$('#offerNlisted').click(function(){
		$('#offerListed').attr('checked',null);
		$(this).attr('checked', 'checked');
		$('#cpn__id').css('display','');
		$('#cpn_id').css('display','none');
	});

	// 회사 추가하기
	$('.newCst_btnOk').click(function(){
		var obj = $(this).parent().parent().parent().parent().parent();
		var chkRdo = obj.find('[checked=checked]').attr('id');
		// var cpnId = (chkRdo=='offerListed')?obj.find('[id^=cpn_id]').val():obj.find('[id^=cpn__id]').html();
		// var cpnNm = obj.find('[id^=cpn_nm]').val();
		// var cstId = obj.find('[id^=AP_cstId]').val();
		var cpnId = (chkRdo=='offerListed')?$("#cpn_id").val():$("#cpn__id").html();
		var cpnNm = $("#cpn_nm").val();
		var cstId = $("#cpn_id").val();

		var page = 0;
		if("popUpReg" == $('#tmpTak').val()){
			page = 1;
		}
		$("input").css('background-color','');
		if(cpnId==''||cpnId==null){
			$("#cpn_id").css('background-color','#A9F5BC');
			alert("상장코드를 입력하세요.");
			// (chkRdo=='offerListed')?obj.find('[id^=cpn_id]').focus():obj.find('[id^=cpn__id]').focus();
			(chkRdo=='offerListed')?$("#cpn_id").focus():$("#cpn__id").focus();
			return;
		}
		if(cpnNm==''||cpnNm==null){
			$("#cpn_nm").focus();
			$("#cpn_nm").css('background-color','#A9F5BC');
			alert("회사명을 입력하세요.");
			// obj.find('[id^=cpn_nm]').focus();
			return;
		}
		if(cstId==''||cstId==null){
			//alert("대표이사를 선택하세요.");
			//obj.find('[id^=AP_cstId]').focus();
			//return;
			cstId=0;
		}
		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../company/insertCpn.do",     //PAGEURL
				data : ({
					cpnId: cpnId,
					cpnNm: cpnNm,
					ceoId: cstId,
					rgId: $('#rgstId').val()
					}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//						$(obj).hide();
					$('#c_Name').val(cpnId);
					if(page != 1){
						var frm = document.getElementById('companyName');//sender form id
						frm.target = "mainFrame";//target frame name
						frm.submit();
						frm = document.getElementById('companyLeft');//sender form id
						frm.target = "leftFrame";//target frame name
						frm.submit();
					}else{
						End(cpnId,cpnNm);
					}

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}

	});
	$('.excel_btnOk').click(function(){
		var fileUrl = $('#fileCpn').val();
		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../company/ExcelProcess.do",     //PAGEURL
				data : ({
					fileUrl: fileUrl
				}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
					//						$(obj).hide();
					$('#c_Name').val(cpnId);
					var frm = document.getElementById('companyName');//sender form id
					frm.target = "mainFrame";//target frame name
					frm.submit();
					frm = document.getElementById('companyLeft');//sender form id
					frm.target = "leftFrame";//target frame name
					frm.submit();

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}

	});
/************************************************ company main end *****************************************************************/
/************************************************ person main start *****************************************************************/
	// 고객 추가하기
	$('.newCpn_btnOk').click(function(){
/*		var obj = $(this).parent().parent().parent().parent().parent();
		var cstNm = obj.find('[id^=cst_nm]');
		var cpnId = obj.find('[id^=AP_cpnId]');
		var pst = obj.find('[id^=position]');
		var email = obj.find('[id^=email]');
		var phn = obj.find('[id^=phn_1]');
		var phn = obj.find('[id^=phn_2]');
		var phn = obj.find('[id^=phn_3]');
*/
		var cstNm = $('#cst_nm');
		var cpnId = $('#AP_cpnId_0');
		var pst   = $('#position');
		var email = $('#email');
		var phn1   = $('#phn_1');
		var phn2   = $('#phn_2');
		var phn3   = $('#phn_3');

		var page = 0;
		if("popUpReg" == $('#tmpTak').val()){
			page = 1;
		}
		$("input").css('background-color','');
		if(cstNm.val()==''||cstNm.val()==null){
			cstNm.focus();
			cstNm.css('background-color','#A9F5BC');
			alert("이름을 입력하세요.");return;
		}
		/*if(cpnId.val()==''||cpnId.val()==null){
			alert("회사를 선택하세요.");
			cpnId.focus();
			return;
		}*/
		if(pst.val()==''||pst.val()==null){
			pst.focus();
			pst.css('background-color','#A9F5BC');
			alert("직급을 입력하세요.");return;
		}
		if(email.val()==''||email.val()==null){
			email.focus();
			email.css('background-color','#A9F5BC');
			alert("email을 입력하세요.");return;
		}
		if(phn1.val()==''||phn1.val()==null){
			phn1.focus();
			phn1.css('background-color','#A9F5BC');
			alert("전화번호를 입력하세요.");return;
		}

		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../person/insertCst.do",     //PAGEURL
				data : ({
					cstNm: cstNm.val(),
					cpnId: cpnId.val(),
					position: pst.val(),
					email: email.val(),
					phn1: phn1.val(),
					phn2: phn2.val(),
					phn3: phn3.val(),
					rgId: $('#rgstId').val()
					}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
	//						$(obj).hide();
					if(page == 1){
						$('#nameSearch').val(cstNm.val());
						var frm = document.getElementById('searchCst');
						frm.action = "popUpCst.do";
						frm.submit();

					}else{
							$('#nameSearch').val(cstNm.val());
							var frm = document.getElementById('searchCst');//sender form id
							frm.target = "mainFrame";//target frame name
							frm.submit();
							frm = document.getElementById('personLeft');//sender form id
							frm.target = "leftFrame";//target frame name
							frm.submit();
					}

				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}

	});

	//네트워크 추가 팝업에서 사람클릭 시 메모창 float
	$(".popUpCstNm").live("click", function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert(t_num);
		divId = 'popUpCstPr'+ t_num[1];

		$('#sNb2nd').val($('#sNb2_'+t_num[2]).val());
		$('#name2nd').val($('#name2_'+t_num[2]).val());

		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
	});


	//이력/정보 추가 클릭 시 메모창 float
	$(".addNote").live("click", function(){
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert(t_num);
		divId = 'addNotePr'+ t_num[1];
		$("#"+oldDivId).hide();
		divShow($(this));
		oldDivId=divId;
		// $('#rtn').val("2");
	});
	//이력/정보 추가 클릭 시 메모창 float
	$(".addNote1").live("click", function(){
		// var rtn = check_personInput();
		// if(rtn==0) return;
		var obj = $(this);
		var t_num = obj.attr('id').split('_');//alert(t_num);
		divId = 'addNotePr'+ t_num[1];
		$("#"+oldDivId).hide();

 		var newDiv = $("#"+divId).clone();
		newDiv.attr("id", "addNotePr"+(parseInt(t_num[1])+1));
		newDiv.find("input").attr("id", "txt"+(parseInt(t_num[1])+1));
		newDiv.find("textarea").attr("id", "resultarea"+(parseInt(t_num[1])+1));
		$("#cloneDiv").append(newDiv);

		divShow($(this));
		oldDivId=divId;
		// if(rtn==2) $('#rtn').val("2");

	});

	//이력/정보 메모창 저장 클릭시 db insert
	$(".nt_btnOk").live("click", function(){
		var title = $('#txt0').val();
		if("이력/정보 제목"==$('#txt0').val()|""==$('#txt0').val()) title = "무제";
		var note = $('#resultarea0').val();
//		alert($('#rgstId').val());return;
		if(confirm("적용하시겠습니까?")){
			if(title==null || title.length==0){
				alert("제목을 입력하지 않았습니다.\n제목을 입력하세요.");
				return;
			}
			$.ajax({
				type:"POST",        //POST GET
				url:"../person/insertNote.do",     //PAGEURL
				data : ({
					cstSnb: $('#cst_snb').val(),
					title: title,
					note: note,
					rgId: $('#rgstId').val()
				}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION

						$('#s_Name').val($('#cst_snb').val());
						var frm = document.getElementById('customerName');//sender form id

						if($("#rtn").val()!='popUp'){
							var target = "mainFrame";
							if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
							frm.target = target;//target frame name
						}
						frm.submit();
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
	});


	// 고객 수정페이지 정보 수정후 저장 클릭시
	$(".modiCst_btnOk").live("click", function(){
		var snb   = $('#cstSnb');
		var cstNm = $('#cst_nm');
		var cpnId = $('#AP_cpnId_0');
		var pst   = $('#position');
		var email = $('#email');
		var phn1   = $('#phn_1');
		var phn2   = $('#phn_2');
		var phn3   = $('#phn_3');

		if(cstNm.val()==''||cstNm.val()==null){
			alert("이름을 입력하세요.");
			cstNm.focus();
			return;
		}
		/*if(cpnId.val()==''||cpnId.val()==null){
			alert("회사를 선택하세요.");
			cpnId.focus();
			return;
		}*/
		if(pst.val()==''||pst.val()==null){
			alert("직급을 입력하세요.");
			pst.focus();
			return;
		}
		if(email.val()==''||email.val()==null){
			alert("email을 입력하세요.");
			email.focus();
			return;
		}
		if(phn1.val()==''||phn1.val()==null){
			alert("전화번호를 입력하세요.");
			phn1.focus();
			return;
		}

		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../person/updateCst.do",     //PAGEURL
				data : ({
					sNb: snb.val(),
					cstNm: cstNm.val(),
					cpnId: cpnId.val(),
					position: pst.val(),
					email: email.val(),
					phn1: phn1.val(),
					phn2: phn2.val(),
					phn3: phn3.val()
				}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION

					var rVal = new Object();
					rVal.snb = snb.val();
					rVal.nm = cstNm.val();

					if("modifyCstPopUp" == $('#choose_popMain').val()){
						if(cpnId.val()==null|cpnId.val()=="") {
							alert("회사를 선택하지 않으셨습니다.");
							return;
						} else {
							if (window.opener) window.opener.returnValue = rVal; //크롬브라우저 대응
							window.returnValue=rVal;
							window.close();
						}
					}
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
	});

	//이력/정보 메모창 저장
	$(".cloneOk").live("click", function(){
		var obj = $(this);
		var num = obj.parent().parent().attr('id').split('Pr');

		var title = $("#txt"+num[1]).val();
		var text = $("#resultarea"+num[1]).val();

		//clone info to td
		var td = $("#cloneSpan1");
		var newInfo = $("#info"+num[1]).clone();
		newInfo.attr("id", "info"+(parseInt(num[1])+1));
		td.append(newInfo);

		$("#info"+num[1]).html(title+":"+text);

		$("#addNote_"+num[1]).attr("id", "addNote_"+(parseInt(num[1])+1));
		$("#"+oldDivId).hide();
	});


	$("#excelDown").live("click", function(){
		var frm = document.getElementById('excelDownload');//sender form id
		frm.action = "test.do";//target frame name
		frm.submit();
	});
/************************************************ person main end *****************************************************************/
/************************************************ stats main start *****************************************************************/
	$('#choice_monthS').live("change", function(){
		var frm = document.getElementById('dayForm');//sender form id
		//frm.action = "popRgstCst.do";//target frame name
		frm.submit();
	});
	$('#totSum').live("click", function(){
		$('#choice_month').val($('#cur_month').val());
		$('#total').val('tot');
		var frm = document.getElementById('dayForm');//sender form id
		//frm.action = "popRgstCst.do";//target frame name
		frm.submit();
	});
	$('#carTotSum').live("click", function(){
		$('#total').val('tot');
		var frm = document.getElementById('dayForm');//sender form id
		//frm.action = "popRgstCst.do";//target frame name
		frm.submit();
	});
/************************************************ stats main end *****************************************************************/
/************************************************ personnel main start *****************************************************************/

	$('.savePersonnel').click(function(){//
		var frm = document.getElementById('personnel');//sender form id
			frm.action="insertPersonnelUse.do"
			// frm.target = "mainFrame";//target frame name
			frm.submit();
	});

	$('.bgClr').click(function(){//
		$('td').css('background-color','#ffffff');

		var obj = $(this).parent();
		var objId = obj.attr("id");
		var objArr = objId.split("_");
		obj.parent().find('[id^='+objArr[0]+'_'+'view'+']').css('background-color','#A9F5BC');
		$('#'+objArr[0]+'_late').css('background-color','#A9F5BC');
		$('#'+objArr[0]+'_sum').css('background-color','#A9F5BC');

		$('.D'+objArr[2]).css('background-color','#F6CECE');
		// alert($('.D'+objArr[2]).attr('id'));
	});

	$('.saveOverH').click(function(){//
		var frm = document.getElementById('overUsed');//sender form id
			frm.action="insertPersonnelOverUse.do"
			frm.submit();

	});
/************************************************ personnel main end *****************************************************************/
/************************************************ bsnsPlan main start *****************************************************************/
		// 추가 버튼 클릭시
		$("#addTblBtn").click(function(){
			// tbl 의 최대번호 구하기
			var lastItemNo = $(".dnTbl:last").attr("class").replace("tbl", "");

			var newitem = $("#dynamicTbl .dnTbl:eq(-1)").clone();
			newitem.removeClass();
			// newitem.find("td:eq(0)").val("");
			newitem.find("td input:text").val("");
			var num = parseInt(lastItemNo)+1;
			// newitem.find("[id^=monL]").attr("id","monL"+num);
			// newitem.find("[id^=monH]").attr("id","monH"+num);
			newitem.find("[name^=monLH]").attr("name","monLH"+num);
			newitem.find("[name^=ARrdo]").attr("id","ARrdoID"+num);
			newitem.addClass("tbl"+num);
			newitem.addClass("dnTbl");
			newitem.find("input:button").attr("onclick","downup("+num+",-1)");
			newitem.find("span a").attr("onclick","downup("+num+",1)");

			$("#dynamicTbl").append(newitem);
		});
		//바 클릭시
		$(".barClick").live("click",function(){
			var obj = $(this);
			var clickNo = obj.attr("id").replace("bar","");
			var barB = obj.parent().find(".barClick");
			var barTd = obj.parent().find("td:first");
			barB.removeClass("bgOrg");

			if(obj.parent().find("input").val()==clickNo){
				obj.parent().find("input").val(0);
				return;
			}
			for(var i=1;i<=clickNo;i++) {
				barTd.addClass("bgOrg");
				barTd = barTd.next();
			}
			obj.parent().find("input").val(clickNo);
		});
		//업무계획 저장 클릭시
		$("#saveBsnsPlan").live("click",function(){
		var frm = document.getElementById('planForm');//sender form id
			frm.action="insertBsnsPlan.do";
			frm.submit();
		});
		//라디오 버튼 클릭시
		$(".rdoLH").live("click",function(){
			var obj = $(this);
			var radioName = obj.attr('name');
			radioName = radioName.split('LH');
			$("#ARrdoID"+radioName[1]).val(obj.val());
		});

		//메모 버튼 클릭시
		$(".memoBtn").live("click",function(){
			var t_num = $(this).attr('id').split('_');
			divId = 'bsnsPmemo_'+ t_num[1];
			$("#"+oldDivId).hide();
			divShow($(this));
			oldDivId=divId;
		});

		//업무내용 첫번째 셀렉트 박스
		$(".1stSelect").live("change",function(){
			var obj = $(this);

			var parentObj = obj.parent().next();//bsns2nd
			var parentObj2 = parentObj.next();//detail
			var parentObj3 = parentObj2.next();//goal
			parentObj.find('select').css('display', 'none');
			parentObj2.find('select, input').css('display', 'none');
			//parentObj2.find('input:eq(0)').val('00000');

			if('00001' == obj.val()) {
				parentObj.find('select:eq(0)').css('display', 'block');
				obj.parent().find('input').val('00001');

				parentObj2.find('select:eq(0)').css('display', 'block');
				parentObj3.find('input:eq(0)').css('display', 'none');
				parentObj3.find('span').css('display', 'block');

			} else if('00002' == obj.val()) {
				parentObj.find('select:eq(1)').css('display', 'block');
				obj.parent().find('input').val('00011');

				parentObj2.find('select:eq(1)').css('display', 'block');
				parentObj3.find('input:eq(0)').css('display', 'none');
				parentObj3.find('span').css('display', 'block');

			} else if('00003' == obj.val()) {
				parentObj.find('select:eq(2)').css('display', 'block');
				obj.parent().find('input').val('00021');

				parentObj2.find('input').val('');
				parentObj2.find('input').css('display', 'block');
				parentObj3.find('input:eq(0)').css('display', 'block');
				parentObj3.find('span').css('display', 'none');

			} else if('00004' == obj.val()) {
				parentObj.find('select:eq(3)').css('display', 'block');
				obj.parent().find('input').val('00031');

				parentObj2.find('input').val('');
				parentObj2.find('input').css('display', 'block');
				parentObj3.find('input:eq(0)').css('display', 'block');
				parentObj3.find('span').css('display', 'none');

			} else if('00005' == obj.val()) {
				obj.parent().find('input').val('00041');

				parentObj2.find('input').val('');
				parentObj2.find('input').css('display', 'block');
				parentObj3.find('input:eq(0)').css('display', 'block');
				parentObj3.find('span').css('display', 'none');
			}
		});

		//업무내용 두번째 셀렉트 박스
		$(".2ndSelect").live("change",function(){
			var obj = $(this);
			var parentObj = obj.parent().prev();
			var parentObj3 = obj.parent().next();
			parentObj3.find('select').css('display', 'none');

			if('00001' == obj.val()) {
				parentObj3.find('select:eq(0)').css('display','block');
			} else if('00002' == obj.val()) {
				parentObj3.find('select:eq(1)').css('display','block');
			} else if('00011' == obj.val() || '00012' == obj.val()) {
				parentObj3.find('select:eq(1)').css('display','block');
			} else {
				parentObj3.find('input').css('display', 'block');
			}
			parentObj.find('input').val(obj.val());
		});

		$(".3rdSelect").live("change",function(){
			var obj = $(this);
			obj.parent().find('input:eq(0)').val(obj.val());
		});

/************************************************ bsnsPlan main end *****************************************************************/
/************************************************ management main start *****************************************************************/
	$(".subTab").live("click",function(){
		var cls = $(".subTabon").attr("class");//선택전 클래스형식으로 초기화
		$(".subTabon").attr("class",cls.replace("subTabon","subTab"));
		var eq = $(".subTab").index(this);//눌러진 클래스의 번호
		var leng = $(".subTab").length;
		for(var i=0; i<leng;i++){
			if("block"==$(".tabMenu:eq("+i+")").css("display")){
				AjaxTabSubmit(i);
			}

			if(i==eq) {
				var cls = $(".subTab:eq("+i+")").attr("class");
				$(".subTab:eq("+i+")").attr("class",cls.replace("subTab","subTabon"));
				$(".tabMenu:eq("+i+")").show();
			} else {
				$(".tabMenu:eq("+i+")").hide();
			}
		}
	});

	$(".fixIntNum").live("click",function(){
		var obj = $(this);
		for(i=0;i<2;i++){
			obj.val(obj.val().replace('-',''));
		}

	});

/************************************************ management main end *****************************************************************/

	$('#select_year').live("change", function(){
		 var frm = document.modifyRec;
		 $('#choice_year').val($('#select_year').val());
		 $('#choice_month').val(null);
		 frm.action = "index.do";
		 frm.submit();
	});
	$('#select_year2').live("change", function(){
		 var frm = document.modifyRec;
		 $('#choice_year').val($('#select_year').val());
		 $('#choice_month').val(null);
		 frm.action = "viewIndex.do";
		 frm.submit();
	});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////// div table /////////////////////////////////////////////////////////////////////////

	function divShow(obj){
		var objId = obj.attr('id');
		object = objId;
		divPosition(objId,divId);
		$("#"+divId).css('display','block');
		$("#"+divId).show();

	}

/*	// 외부 화면 클릭시 전달감추기
	$(document).live("click",function(event){
//		alert("oldDivId:"+oldDivId);alert("divId:"+divId);
		if(event.target.id != (oldDivId==null?object:oldDivId) && event.target.name != 'textR' && event.target.name != 'checkR'){
			$("#"+oldDivId).hide();
		}
		oldDivId =(oldDivId==divId? null: divId);
	});*/

	function divPosition(target,id){
		var browserWidth = document.documentElement.clientWidth;
		var tInput  = $("#" + target).offset();
		var tHeight = $("#" + target).outerHeight();
		var tWidth 	= $("#" + target).outerWidth();
//		alert(target+":"+id+":"+tInput+":"+tHeight+":"+tWidth);
		var calWidth 	= $("#" + id).outerWidth();

		if( tInput != null){
			$("#" + id).css({"top":tInput.top+15 , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});
			// $("#" + id).css({"top":tInput.top+tHeight , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});

//			$("#" + id + "Icon").css({"top":tInput.top+3,"left":tInput.left+tWidth+2});
//			$("#" + target).css({"top":tInput.top+3,"left":tInput.left+tWidth+2});
		}
	}
///////// div table /////////////////////////////////////////////////////////////////////////

///////// dynamic div table /////////////////////////////////////////////////////////////////////////

	// 삭제버튼 클릭시
	$(".delBtn").live("click", function(){
		var clickedRow = $(this).parent().parent().parent();
		var clickedHeight = clickedRow.parent().parent().parent() + " li";
		clickedRow.parent().parent().parent().css('padding-bottom','-=20px');
//		clickedHeight.css('height','-=20px');
		clickedRow.remove();

	});

///////// dynamic div table /////////////////////////////////////////////////////////////////////////

///////// jquery ajax searching left menu /////////////////////////////////////////////////////////////////////////
/*
	$('#nameSearch').keypress(function(){

    	  $.ajax({
    	   type:"POST",        //POST GET
    	   url:"../company/searchName.do",     //PAGEURL
		   //  dataType: "html",       //HTML XML SCRIPT JSON
    	   data : ({cpnNm: $("#nameSearch").val()}),
    	   timeout : 30000,       //제한시간 지정
    	   cache : false,        //true, false
    	   success: function whenSuccess(args){  //SUCCESS FUNCTION
    	    $("#idchk_commit").val("");
    	    switch(args){
    	     case("true"):
    	      show_args="<font color='blue'>사용 가능합니다.</font>";
    	      $("#idchk_commit").val("Y");
    	     break;
    	     case("false"):
    	      show_args="<font color='red'>이미 사용중인 아이디 입니다.</font>";
    	     break;
    	     default:
    	     case("none"):
    	      show_args="<font color='red'>아이디를 입력 해주세요.</font>";
    	     break;
    	     case("short"):
    	      show_args="<font color='red'>아이디는 4자 이상으로 입력 해주세요.</font>";
    	     break;
    	     case("long"):
    	      show_args="<font color='red'>아이디는 16자 미만으로 입력 해주세요.</font>";
    	     break;
    	    }
    	    $('#resultDIV').html(show_args);
    	   },
    	   error: function whenError(e){    //ERROR FUNCTION
    	    alert("code : " + e.status + "\r\nmessage : " + e.responseText);
    	   }
    	  });
    	 });*/

	mozilaAjax =  function(){
		  $.ajax({
		   type:"POST",        //POST GET
		   url:"../company/searchName.do",     //PAGEURL
			   //  dataType: "html",       //HTML XML SCRIPT JSON
		   data : ({cpnNm: $("#nameSearch").val()}),
		   timeout : 30000,       //제한시간 지정
		   cache : false,        //true, false
		   success: function whenSuccess(args){  //SUCCESS FUNCTION
			$("#idchk_commit").val(args);
		   },
		   error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		   }
		  });
	};
///////// jquery ajax searching left menu /////////////////////////////////////////////////////////////////////////


});


/**
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
	function start 함수
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
**/


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

function divPosition(target,id){
	var browserWidth = document.documentElement.clientWidth;
	var tInput  = $("#" + target).offset();
	// var tHeight = $("#" + target).outerHeight();
	// var tWidth 	= $("#" + target).outerWidth();
	var calWidth 	= $("#" + id).outerWidth();

	if( tInput != null){
		$("#" + id).css({"top":tInput.top+15 , "left":(tInput.left+calWidth<browserWidth?tInput.left:browserWidth-(calWidth+8))});
	}
}

function divShow(obj,divId){//function 에서 사용 obj:this, divId는 열리게될 div id
	var objId = obj.attr('id');
	divPosition(objId,divId);
	$("#"+divId).css('display','block');
	$("#"+divId).show();
}



function popUp(num,flag,nm,snb){
// popUp 규격
	var w = '740px';
	var h = '740px';
	var ah = screen.availHeight - 30;
	var aw = screen.availWidth - 10;
	var xc = (aw - w) / 2;
	var yc = (ah - h) / 2;
	var option = "left:" + xc + "; " +
				"top:" + yc + "; " +
				"menu:no; " +
				"status:no; " +
				"toolbar:no; " +
				"location:no; " +
				"scrollbars:no; " +
				"resizable:yes; " +
				"dialogWidth:" + w + ";" +
				"dialogHeight:" + h;
// popUp 규격

	var sUrl = '';
	var rtn = '';
	var val = new Object();
	val.cstNm = $("#AP_cpnNm_"+num).html();

	if(flag=='c') sUrl = "../work/popUpCpn.do";
	else if(flag=='ceo' | flag=='p'  | flag=='workNetp' | flag=='card' | flag=='iP') sUrl = "../work/popUpCst.do";
	// else if(flag=='p') sUrl = "../work/popUpCst.do";
	// else if(flag=='card') sUrl = "../work/popUpCst.do";
	else if(flag=='C'||flag=='workNetC') {
		sUrl = "../person/popUpCst.do";
		val.nm = nm;
		val.snb = snb;
	}
	else if(flag=='PersonCPN'||flag=='PersonCPNnet'||flag=='workNetPersonCPN'||flag=='workNetPersonCPNnet') {
		sUrl = "../person/popUpCpn.do";
		val.nm = nm;
		val.snb = snb;
		if(flag=='PersonCPNnet'||flag=='workNetPersonCPNnet') val.net = "Y";
		else val.net = "N";
	}
	else if(flag=='modiCst') {// 고객 main 페이지 수정  클릭시
		sUrl = "../person/modifyCst.do";
		val.nm = nm;
		val.snb = snb;
		// $('#m_Name').val($('#cst_snb').val());
		// var frm = document.getElementById('modifyCst');//sender form id
		// frm.target = "mainFrame";//target frame name
		// frm.submit();
	}
	else if(flag=='CC'||flag=='DD') {
		rtn = check_personInput();
		if(rtn==0)return;
		sUrl = "../person/popUpCst.do";
		val.nm = nm;
		val.snb = snb;
	}
	else if(flag=='cExcel') sUrl = "../company/popUpExcel.do";
	else if(flag=='cstExcel') sUrl = "../person/popUpExcel.do";
	else if(flag=='files') {
		var numb = (parseInt(num)<10?('0'+num):num);
		//alert("다중 업로드 기능 작업 중입니다.");
		day = $('#choice_year').val()+ $('#choice_month').val()+ numb;
		sUrl = "../work/multiUpload.do";
		val.day = day;
		val.snb = $("#offerSnb"+num).val();
		if($("#reportYN_"+num+" input:checkbox").is(":checked")==true) val.report = "Y";
		else val.report = "N";
	}
	else if(flag=='rcmdCpn'){
		sUrl = "../company/main.do";
		val.snb = snb;
	}
	else if(flag=='rcmdCst'){
		sUrl = "../person/main.do";
		val.snb = snb;
	}
	else if(flag=='rcmdComment'){
		sUrl = "../recommend/comment.do";
		val.snb = snb;
		var tmDate = num.split('-');
		val.year = tmDate[0];
		val.mon = tmDate[1];
		val.day = tmDate[2];
	}
	else if(flag=='rcmdWork'){
		sUrl = "../work/popUpRecommend.do";
		w='500px';
		h='300px';
		val.snb = snb;
	}

///**//
	//showModelessDialog showModalDialog
	var rVal = window.showModalDialog(sUrl, val, option);
	if (rVal == undefined) rVal = window.returnValue; //크롬브라우저 대응
///**//

	if(flag=='rcmdComment')	;//parent.mainFrame.location.href = "index.do";
	else if(rVal==null) return;
	else if(flag=='c'){
		$("#AP"+num).focus();
		if(rVal.nm != null) $("#AP_cpnNm_"+num).html(rVal.nm);
		if(rVal.snb != null) {
			$("#AP_cpnId_"+num).val(rVal.snb);
			if($("#rcmdWorkSpan_"+num).parent().find('[class^=work-2ndSelect]').val()=='00002'){
				$("#rcmdWork_"+num).attr('onclick',"popUp('"+num+"','rcmdWork','','"+rVal.snb+"')");
				popUp(num,'rcmdWork','',rVal.snb);
			}
		}
		// $(nm).parent().parent().parent().parent().find('[id^=slctPrsn]').css('display','none');

	}else if(flag=='card'){
		$("#cstSnb").val(rVal.snb);
		$("#sltNm").html(rVal.nm);
		$("#sltCpn").html(rVal.cpnNm);
		$("#sltPst").html(rVal.position);
		$("#sltCst").css('display','');
		// $("#sltCst").html("외 <input type=\"text\" name=\"etcNum\" style=\"height:15px;width:14px;\"/>명");

	}else if(flag=='p'){
		if(rVal.nm != null) $("#AP_cstNm"+num).html(rVal.cpnNm+" : "+rVal.nm);
		if(rVal.snb != null) $("#AP_cstId"+num).val(rVal.snb);
		if(rVal.snb != null) $("#AP_cpnSnb"+num).val(rVal.cpnSnb);
		if($("#offerCd"+num).val() != '00006' && $("#offerCd"+num).val() != '00007'){
		// tmpPoint = $(nm).parent().parent().parent().parent();
		// tmpPoint.find('[id^=slctCpn]').css('display','none');
		// tmpPoint.find('[id^=cstTitle5]').css('display','');
		// tmpPoint.find('[id^=cstTitle4]').css('display','');
			//$("#AP_cpnId"+num).val('');
			//if(rVal.cpnId != null) $("#AP_cpnId"+num).val(rVal.cpnId);
			//if(rVal.cpnNm != null) $("#AP_cpnNm"+num).html(rVal.cpnNm);
		}

	}else if(flag=='workNetp'){//업무일지->인물정보->인물선택
		if(rVal.nm != null) {
			$("#sltPerNetName"+num).html(rVal.cpnNm+" : "+rVal.nm);
			$("#perNetName"+num).val(rVal.nm);
		}
		if(rVal.snb != null) {
			$("#perNetSnb"+num).val(rVal.snb);
			popUp('','rcmdCst','',rVal.snb);
		}return;
		/*
		if(rVal.nm != null & rVal.snb != null){

			btnObj = $("#sltPerNet"+num);
			onclk = btnObj.attr('class');
			btnObj.attr('onclick',"popUp('"+num+"','"+onclk+"','"+rVal.nm+"','"+rVal.snb+"'); return false;");

			btnObj = $("#sltCopNet"+num);
			onclk = btnObj.attr('class');
			btnObj.attr('onclick',"popUp('"+num+"','"+onclk+"','"+rVal.nm+"','"+rVal.snb+"'); return false;");

			btnObj = $("#sltDealNet"+num);
			onclk = btnObj.attr('class');
			btnObj.attr('onclick',"popUp('"+num+"','"+onclk+"','"+rVal.nm+"','"+rVal.snb+"'); return false;");
		}
		*/

	}else if(flag=='iP'){
		if(rVal.nm != null) $("#AP_infoProviderNm"+num).html(rVal.cpnNm+" : "+rVal.nm);
		if(rVal.snb != null) $("#AP_infoProviderId"+num).val(rVal.snb);

	}else if(flag=='C'||flag=='PersonCPN'||flag=='PersonCPNnet'){
		$('#s_Name').val(rVal.snb);
		var frm = document.getElementById('customerName');//sender form id

		if($("#rtn").val()!='popUp'){
			var target = "mainFrame";
			if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
			frm.target = target;//target frame name
		}
		frm.submit();

	}else if(flag=='workNetC'||flag=='workNetPersonCPN'||flag=='workNetPersonCPNnet'){
		if(rVal.cpNcsNm != null) {
			if(flag=='workNetC') $("#prtPerNet"+num).html(rVal.cpNcsNm+"<br/>"+rVal.note);
			if(flag=='workNetPersonCPNnet') $("#prtCopNet"+num).html(rVal.cpNcsNm+"<br/>"+rVal.note);
			if(flag=='workNetPersonCPN') $("#prtDealNet"+num).html(rVal.cpNcsNm+"<br/>"+rVal.note);
		}

	}else if(flag=='modiCst') {// 고객 main 페이지 저장
		if(rVal.snb != null) {
			alert("저장되었습니다.");
			$("#s_Name").val(rVal.snb);
			$("#customerName").submit();
		}

	}else if(flag=='CC'){
		if(rtn==2){
			$('#s_Name').val(rVal.snb);
			var frm = document.getElementById('customerName');//sender form id
			frm.target = "mainFrame";//target frame name
			frm.submit();
		}
	}else if(flag=='rcmdWork'){
		if(rVal.snb != null) $('#rcmderSnb_'+num).val(rVal.snb);
		if(rVal.nm  != null) $('#rcmdWork_'+num).html(rVal.nm);
		
	}else if(flag=='DD'){

		// var td = $("#cloneSpan1");
		// var newInfo = $("#info"+num[1]).clone();
		// newInfo.attr("id", "info"+(parseInt(num[1])+1));
		// td.append(newInfo);
	}else if(flag=='files'){
		var name = null, img = null;
		var leng = rVal.status;

		if(nm=='recommend') {
			$("#dayForm").action = 'index.do';
			$("#dayForm").submit();
		}

		if(rVal.snb != null) $('#offerSnb'+num).val(rVal.snb);
		//alert(rVal.snb+"/"+rVal.name1+"/"+rVal.path)

		if(rVal.path != null & rVal.name1 != null){
			for(k=1;k<parseInt(leng)+1;k++){//최대 업로드 파일 5개
				var nm = null,dot = null;
				if(k==1) nm = rVal.name1;
				else if(k==2) nm = rVal.name2;
				else if(k==3) nm = rVal.name3;
				else if(k==4) nm = rVal.name4;
				else if(k==5) nm = rVal.name5;

				if(nm != null) name = nm;
				dot = name.split('.');
				var extention = dot.length-1;
				if(dot[extention] == 'doc'||dot[extention] == 'docx')	img = 'doc';
				else if(dot[extention] == 'xls'||dot[extention] == 'xlsx') img = 'xls';
				else if(dot[extention] == 'ppt'||dot[extention] == 'pptx') img = 'ppt';
				else if(dot[extention] == 'pdf') img = 'pdf';
				else img = 'files';

				$('#file'+k+'_'+num).attr('title', name);//floating 되는 파일이름
				$('#file'+k+'_'+num).attr('src', '../images/file/'+img+'.png');//확장자에 따른 이미지
				if(rVal.path != null) $('#'+num).attr(rVal.path + name);//파일을 불러오기위한 경로

			}
			$('#fileAdd_'+num).attr('style', 'display:none');//파일첨부 후 버튼 없애기
		}

	}else if(flag=='ceo'){
		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../company/updateCpn.do",     //PAGEURL
				data : ({
					cpnId: snb,//회사 아이디 snb에 받음
					ceoId: rVal.snb//선택된 고객의 snb
				}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
					$('#i_Name').val(snb);//snb, cpnId 두개 모두 가능
					var frm = document.getElementById('companyName');//sender form id
					frm.target = "mainFrame";//target frame name
					frm.submit();
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
	}
	// $("input[id^=foCus"+num+"]").focus();
}
///////// work left menu /////////////////////////////////////////////////////////////////////////
function sortUser(staffName,staffId){

	$('#s_Name').val(staffName);
	$('#s_Id').val(staffId);
	$(this).parent().html("<b>"+staffName+"</b>");
	var frm = document.getElementById('staffName');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}

function hiddenView(targetId){
	var stat = $("#"+targetId).css('display');
	if(stat == 'none') $("#"+targetId).css('display','');
	else $("#"+targetId).css('display','none');
}
///////// work left menu /////////////////////////////////////////////////////////////////////////

///////// work main menu /////////////////////////////////////////////////////////////////////////
function month(mon,url){//월 선택
	 var frm = document.modifyRec;
	 $('#choice_month').val(mon);
	 frm.action = url;
	 frm.submit();
}
function viewNote(){
//	$('.t_note').css('display','block');
	$('#s_month').val($('#choice_month').val());
	$('#s_year').val($('#choice_year').val());

	var frm = document.getElementById('staffName');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}
function chkval(n) {//check된 staff 이름 배열로 묶어주기
	var nnum = n.checkbox;
	var vchk = false;
	for(var i=0;i<nnum.length;i++){
		vchk = vchk || nnum[i].checked;
	}
	return vchk;
}
function memoSnd(url,th,sms){// 메모 전달하기
	if(confirm("전달하시겠습니까?")){
		$(th).parent().parent().parent().hide();
		$("#sttsCd").val('00001');
		$("#SMSTitle").val(sms);
		var frm = document.modifyRec;
		frm.action = url;
		frm.submit();
	}
}
function getWeekday(sDate) {//해당 날짜의 요일구하기

    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);

    var d = new Date(yy,mm - 1, dd);
    var weekday=new Array(7);
    weekday[0]="일";
    weekday[1]="월";
    weekday[2]="화";
    weekday[3]="수";
    weekday[4]="목";
    weekday[5]="금";
    weekday[6]="토";

    return weekday[d.getDay()];
}

function dataVisible(obj) {
	switch(obj.val()){
	case "00001":
	case "00002":
	case "00003":
		obj.parent().parent().find('[id^=slctPrsn_]').css('display','');
		obj.parent().parent().find('[id^=slctCpn_]').css('display','none');
		obj.parent().parent().find('[id^=CateCd_]').css('display','none');
		obj.parent().parent().find('[id^=AP_price]').css('display','none');
		obj.parent().parent().find('[id^=textTmp_]').css('display','none');
		obj.parent().parent().find('[id^=KP_title_]').css('display','');
		obj.parent().parent().find('[id^=KP_slct_]').css('display','');
		break;
	case "00004":
	case "00005":
		obj.parent().parent().find('[id^=slctCpn_]').css('display','');
		obj.parent().parent().find('[id^=slctPrsn_]').css('display','none');
		//obj.parent().find('span').css('display','none');
		obj.parent().parent().find('[id^=CateCd_]').css('display','none');
		obj.parent().parent().find('[id^=AP_price]').css('display','none');
		obj.parent().parent().find('[id^=textTmp_]').css('display','none');
		obj.parent().parent().find('[id^=KP_title_]').css('display','');
		obj.parent().parent().find('[id^=KP_slct_]').css('display','');
		break;
	case "00006":
	case "00007":
		obj.parent().parent().find('[id^=slctCpn_]').css('display','');
		obj.parent().parent().find('[id^=slctPrsn_]').css('display','');
		//obj.parent().find('span').css('display','');
		obj.parent().parent().find('[id^=CateCd_]').css('display','');
		obj.parent().parent().find('[id^=AP_price]').css('display','');
		obj.parent().parent().find('[id^=textTmp_]').css('display','');
		obj.parent().parent().find('[id^=KP_title_]').css('display','none');
		obj.parent().parent().find('[id^=KP_slct_]').css('display','none');
		break;
	}
}

//메모에서 전체체크
function selectAllforSndMemo(num){
	var obj = $(this);
	var checkboxs = $('.popUpMenu input:checkbox');
	var allCheck = $('.popUpMenu .allCheck a');
	if(num==0) {
		checkboxs.attr('checked',true);
		allCheck.attr('onclick','selectAllforSndMemo("1")');
	} else if(num==1) {
		checkboxs.attr('checked',false);
		allCheck.attr('onclick','selectAllforSndMemo("0")');
	}
}

function send_AJAX_SMS(){
	$.ajax({
		type:"POST",        //POST GET
		url:"http://biz.moashot.com/EXT/URLASP/mssendUTF.asp",     //PAGEURL
		data : ({
			uid: $("#uid").val(),
			pwd: $("#pwd").val(),
			returnUrl: $("#returnUrl").val(),
			sendType: $("#sendType").val(),
			toNumber: $("#toNumber").val(),
			contents: $("#contents").val(),
			fromNumber: $("#fromNumber").val(),
			startTime: $("#startTime").val(),
			indexCode: $("#indexCode").val(),
			returnType: "1",
			nType: "2"
		}),
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			alert("문자를 보냈습니다.");
		},
		error: function whenError(e){    //ERROR FUNCTION
			//alert("문자를 보냈습니다.");
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}


//추천현황에 메모 내용수정 확인
function recommendSubMemo(th,cpnName,rgName,rgName2,prgressCd){
	if(confirm("적용하시겠습니까?")){
		var obj = $(th).parent().parent();
		var tmpNumber = "";
		if(rgName2.length > 0) tmpNumber = "rcmdSendMemo";
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/modifyDealMemo.do",     //PAGEURL
			data : ({sNb: obj.find('[id^=dealMemoSNb]').val()
				,subMemo: obj.find('[id^=memoarea]').val()
				,tmpNum1: tmpNumber
				,cpnNm: cpnName
				,rgNm: rgName2
				,progressCd: prgressCd
				,rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				document.modifyRec.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}
//제안현황에 메모 내용수정 확인
function subMemo(th){
	if(confirm("적용하시겠습니까?")){
		var obj = $(th).parent().parent();
		$.ajax({
			type:"POST",        //POST GET
			url:"../work/modifyDealMemo.do",     //PAGEURL
			data : ({sNb: obj.find('[id^=dealMemoSNb]').val(),
				subMemo: obj.find('[id^=memoarea]').val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				if($("#SendReceive").val() == 'financing') 			document.modifyRec.action = "financing.do";
				else if($("#SendReceive").val() == 'management') 	document.modifyRec.action = "management.do";
				else if($("#SendReceive").val() == 'mna') 			document.modifyRec.action = "mna.do";
				else if($("#SendReceive").val() == 'etc') 			document.modifyRec.action = "etc.do";
				else  ;//document.modifyRec.action = "selectWorkDealS.do";
				document.modifyRec.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}



function totalView(flag){
	if(flag == 'total') $("#total").val(flag);
	document.dayForm.submit();
}

function sortTable(flag){
	if(flag == 'total') $("#total").val(flag);
	else $("#sorting").val(flag);
	document.modifyRec.submit();
}

function selectLv(lv, snb, frmNm){
	var lvcd = "0000"+lv;

	$.ajax({
		type:"POST",        //POST GET
		url:"../work/saveLv.do",     //PAGEURL
		data : ({
			sNb:snb,
			lvCd:lvcd
		}),
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			// window.close();
			$("#"+frmNm).submit();
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});

}
///////// work main menu /////////////////////////////////////////////////////////////////////////

///////// company left menu /////////////////////////////////////////////////////////////////////////
function slctCpn(snb,stock){
	$('#c_Name').val(snb);//snb, cpnId 두개 모두 가능
	var target = "mainFrame";
	if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
	var frm = document.getElementById('companyName');//sender form id
	frm.target = target;//target frame name
	frm.submit();
}
function rgstCpn(){
	$('#c_Name').val($('#nameSearch').val());
	var frm = document.getElementById('rgstCpnNm');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}
function popRgstCpn(){
	var frm = document.getElementById('insertCpn');//sender form id
	frm.action = "popRgstCpn.do";//target frame name
	frm.submit();
}

///////// company left menu /////////////////////////////////////////////////////////////////////////
///////// person left menu /////////////////////////////////////////////////////////////////////////
function slctCst(sNb){
	if($(".popUpBtn").css("display")=="none") return;
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.target = "mainFrame";//target frame name
		if("Y"==parent.insertStockFirmIbYN()) frm.target = "stockCstFrame";
	frm.submit();
}
function rgstCst(cnt){
	if(cnt==0) cnt='';
	$('#s_Name').val($('#nameSearch').val()+cnt);
	$('#s_Name2').val($('#nameSearch').val()+cnt);
	var frm = document.getElementById('rgstCstNm');//sender form id
	frm.target = "mainFrame";//target frame name
	frm.submit();
}
function popRgstCst(cnt){
	if(cnt==0) cnt='';
	$('#s_Name').val($('#nameSearch').val()+cnt);
	$('#s_Name2').val($('#nameSearch').val()+cnt);
	var frm = document.getElementById('insertCst');//sender form id
	frm.action = "popRgstCst.do";//target frame name
	frm.submit();
}
///////// person left menu /////////////////////////////////////////////////////////////////////////
///////// person main menu /////////////////////////////////////////////////////////////////////////
function check_personInput(){
	var cstNm = $('#cst_nm');
	var cpnId = $('#AP_cpnId_0');
	var pst   = $('#position');
	var email = $('#email');
	var phn1   = $('#phn_1');
	var phn2   = $('#phn_2');
	var phn3   = $('#phn_3');

	if(cstNm.val()==''||cstNm.val()==null){
		alert("이름을 입력하세요.");
		cstNm.focus();
		return 0;
	}
	/*if(cpnId.val()==''||cpnId.val()==null){
		alert("회사를 선택하세요.");
		cpnId.focus();
		return;
	}*/
	if(pst.val()==''||pst.val()==null){
		alert("직급을 입력하세요.");
		pst.focus();
		return 0;
	}
	if(email.val()==''||email.val()==null){
		alert("email을 입력하세요.");
		email.focus();
		return 0;
	}
	if(phn1.val()==''||phn1.val()==null){
		alert("전화번호를 입력하세요.");
		phn1.focus();
		return 0;
	}
	if($('#cst_snb').val().length!=0) return 2;

		$.ajax({
			type:"POST",        //POST GET
			url:"../person/AjaxInsertCst.do",     //PAGEURL
			//url:"../person/test.do",     //PAGEURL
			data : ({
				cstNm: cstNm.val(),
				cpnId: cpnId.val(),
				position: pst.val(),
				email: email.val(),
				phn1: phn1.val(),
				phn2: phn2.val(),
				phn3: phn3.val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				var arr = arg.split('_');
				var name = arr[0];
				var num = arr[1];
//				alert(name+num)
				$('#cst_snb').val(num);
				$('#addNtw').attr('onclick',"popUp('_0','CC','"+name+"','"+num+"'); return false;");

				/*
				if(page == 1){
					$('#nameSearch').val(cstNm.val());
					var frm = document.getElementById('searchCst');
					frm.action = "popUpCst.do";
					frm.submit();

				}else{
						$('#nameSearch').val(cstNm.val());
						var frm = document.getElementById('searchCst');//sender form id
						frm.target = "mainFrame";//target frame name
						frm.submit();
						frm = document.getElementById('personLeft');//sender form id
						frm.target = "leftFrame";//target frame name
						frm.submit();
				}
				*/
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	return 1;
}
function test(){
		$.ajax({
			type:"POST",        //POST GET
			url:"../person/test.do",     //PAGEURL
			data : ({test: "test"}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				alert(arg);
				alert($('#AP_cstNm_1').attr('onclick'));
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
}

function ntwk_btnOK(cstORcpn){
	var rVal = new Object();
	var name = $("#TMname").val();
	var snb = $("#TMsnb").val();
	var cpNcsNm = $("#name2nd").val();
	var note = $("#resultarea0").val();
	if(note == "메모사항..") note = null;
	if('cst' == cstORcpn) URL = "../person/insertNetwork.do";
	else if('cpn' == cstORcpn) URL = "../person/insertCstDealInfo.do";

	if(confirm("적용하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url: URL,     //PAGEURL
			data : ({
				sNb1st: snb,
				sNb2nd: $('#sNb2nd').val(),
				netYN: $('#netYN').val(),
				note: $('#resultarea0').val(),
				rgId: $('#rgstId').val()
				}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(ar){  //SUCCESS FUNCTION
//						$(obj).hide();
				rVal.nm = name;
				rVal.snb = snb;
				rVal.cpNcsNm = cpNcsNm;
				rVal.note = note;

				window.returnValue=rVal;
				window.close();

			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}

function deleteNet(snb,netSnb,cate){
	var DATA = {sNb: netSnb, cate:cate};

	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url: "../person/deleteNetwork.do",     //PAGEURL
			data : DATA,
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				$('#s_Name').val(snb);
				var frm = document.getElementById('customerName');//sender form id

				if($("#rtn").val()!='popUp'){
					var target = "mainFrame";
					if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
					frm.target = target;//target frame name
				}
				frm.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}

//회사 - 노트 클릭시 내용
function modifyNet(th, cnt, snb,netSnb,cate){

	$(".popUpMenu").hide();
	$('#s_Name').val(snb);

	if('cstNet'==cate) 		div = 'netPr';
	else if('cpnNet'==cate) div = 'cpnNetPr';
	else if('dealNet'==cate)div = 'cstDealPr';
	else if('info'==cate) 	div = 'infoPr';

	divShow($(th), div+cnt);
}

function saveNoteOFnet(cate, cnt){
	$(".popUpMenu").hide();
	var DATA = {
		sNb: $("#"+cate+"Snb"+cnt).val(),
		cate:cate,
		note: $("#"+cate+"Area"+cnt).val(),
		title: $("#"+cate+"Title"+cnt).val()
		};
	$.ajax({
		type:"POST",        //POST GET
		url: "../person/modifyNetwork.do",     //PAGEURL
		data : DATA,
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			if($(".popUpBtn").css("display")=="none") return;
			var frm = document.getElementById('customerName');//sender form id

			if($("#rtn").val()!='popUp'){
				var target = "mainFrame";
				if(parent.insertStockFirmIbYN()=="Y") target = "stockCstFrame";
				frm.target = target;//target frame name
			}
			frm.submit();
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});

}
///////// person main menu /////////////////////////////////////////////////////////////////////////


/*
 * 브라우저 종류,버전 체크
 */

function browserCheck(){
	if(navigator.appName == "Netscape"){
		//FF용 코드
		return "FF";
	}else if(navigator.appName == "Microsoft Internet Explorer"){
		//IE용 코드
		if(navigator.appVersion.indexOf("MSIE6") != -1 ||navigator.appVersion.indexOf("MSIE 6") != -1){
			//ie6 용 코드
			return "IE6";
		}else if(navigator.appVersion.indexOf("MSIE7") != -1||navigator.appVersion.indexOf("MSIE 7") != -1){
			//ie7 용 코드
			return "IE7";
		}else if(navigator.appVersion.indexOf("MSIE8") != -1||navigator.appVersion.indexOf("MSIE 8") != -1){
			//ie8 용 코드
			return "IE8";
		}else if(navigator.appVersion.indexOf("MSIE9") != -1||navigator.appVersion.indexOf("MSIE 9") != -1){
			//ie9 용 코드
			return "IE9";
		}else{
			//기타등등
			return navigator.appVersion;
		}
	}else{
		return "else";
	}
}



/*
* 아이디 체크
*/
	function check_id(field){

		if(2 > field.val().length || field.val().length > 12 ){
			alert('ID는 3~12자 사이로해주세요.');
			return false;
		}

		if(/[a-zA-Z]/.test(field.val())||/[0-9]/.test(field.val())){
//			if(/[a-zA-Z]/.test(field.value)||/[0-9]/.test(field.value)){
		 		return true;
		}else{
			alert('ID는 3~12자 영문과 숫자여야 합니다.');
			return false;
		}
	}
	/*
	 * JSNUMM
	 */
	function jsNull(arguments){
		if ( arguments == "" || arguments == null || arguments == "undefined" )
	        return true;
	    else
	        return false;
	}
	/*
   * 입력된 값이 숫자인지 아닌지 체크
   */
	function jsNumeric(arguments){//alert("ttt");
		if ( jsNull(arguments) ) return true;

		for (var i = 0; i < arguments.length; i++){
			if (arguments.charAt(i) < "0" || arguments.charAt(i) > "9" || arguments.charCodeAt(i) > 127 ){
			    return false;
			}
		}
		return true;
	}
	/*
	 * 패스워드 체크
	 */
	 function CheckPassWord(userPassWord){
	 	if(!userPassWord.match(/([a-zA-Z].*[0-9])|([a-zA-Z].*[!,@,#,$,%,^,&,*,?,_,~])|([0-9].*[a-zA-Z])|([0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[0-9])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z])/)){
	 		alert("비밀번호는 문자,숫자,특수문자의 조합으로 10자리까지 입력가능합니다.");
	 		return false;
	 	}

	 	var SamePass_0 = 0; //동일문자 카운트
	 	var SamePass_1 = 0; //연속성+ 카운트
	 	var SamePass_2 = 0; //연속성- 카운트

	 	var chr_pass_0;
	 	var chr_pass_1;

	 	for (var i=0;i<userPassWord.length;i++){
	 		chr_pass_0 = userPassWord.charAt(i);
	 		chr_pass_1 = userPassWord.charAt(i+1);
	 		//동일문자 카운트
	 		if(chr_pass_0 == chr_pass_1){
	 			SamePass_0 = SamePass_0+1;
	 		}
	 		//연속성+카운트
	 		if(chr_pass_0.charCodeAt(0)-chr_pass_1.charCodeAt(0) == -1){
	 			SamePass_1 = SamePass_1 + 1;
	 			if (SamePass_1 > 1){
	 				alert("연속된 문자열 (123 또는 321,abc,cba 등)을 3자 이상 사용할수 없습니다.");
	 		 		return false;
		 		}
	 		}else{
	 			SamePass_1 = 0;
	 		}
	 		//연속성-카운트
	 		if(chr_pass_0.charCodeAt(0)-chr_pass_1.charCodeAt(0) == 1){
	 			SamePass_2 = SamePass_2 + 1;
	 			if (SamePass_2 > 1){
	 				alert("연속된 문자열 (123 또는 321,abc,cba 등)을 3자 이상 사용할수 없습니다.");
	 		 		return false;
		 		}
	 		}else{
	 			SamePass_2 = 0;
	 		}
	 	}
	 	if(SamePass_0 > 1){
	 		alert("동일문자를 3번 이상 사용할수 없습니다.");
	 		return false;
	 	}
		/*
	 	if(SamePass_1 > 1 || SamePass_2 > 1)
	 	{
	 		alert("연속된 문자열 (123 또는 321,abc,cba 등)을 3자 이상 사용할수 없습니다.");
	 		return false;
	 	}
	 	*/
	 	return true;
	 }

	 function ajaxModule(DATA,Url,Fn){
	 	$.ajax({
	 		type:"POST",        //POST GET
	 		url:Url,     //PAGEURL
	 		data : DATA,
	 		timeout : 30000,       //제한시간 지정
	 		cache : false,        //true, false
	 		success: function whenSuccess(arg){  //SUCCESS FUNCTION
	 			Fn();
	 		},
	 		error: function whenError(e){    //ERROR FUNCTION
	 			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
	 		}
	 	});
	 }
/************************************************ car main start *****************************************************************/

	function carSubmit(){
		$("input").css('background-color','');
		if($("#tmDt").val()==''||$("#tmDt").val()==null){
			alert("일자를 선택하세요.");return 0;
		}
		if($("#departurePoint").val()==''||$("#departurePoint").val()==null){
			$("#departurePoint").focus();
			$("#departurePoint").css('background-color','#A9F5BC');
			alert("출발지를 입력하세요.");return 0;
		}
		if($("#departureTime").val()==''||$("#departureTime").val()==null){
			$("#departureTime").focus();
			$("#departureTime").css('background-color','#A9F5BC');
			alert("출발시간을 입력하세요.");return 0;
		}
		if($("#destination").val()==''||$("#destination").val()==null){
			$("#destination").focus();
			$("#destination").css('background-color','#A9F5BC');
			alert("목적지를 입력하세요.");return 0;
		}
		if($("#arriveTime").val()==''||$("#arriveTime").val()==null){
			$("#arriveTime").focus();
			$("#arriveTime").css('background-color','#A9F5BC');
			alert("도착시간을 입력하세요.");return 0;
		}
		if($("#mileage").val()==''||$("#mileage").val()==null){
			$("#mileage").focus();
			$("#mileage").css('background-color','#A9F5BC');
			alert("운행거리를 입력하세요.");return 0;
		}
		if($("#totalDistance").val()==''||$("#totalDistance").val()==null){
			$("#totalDistance").focus();
			$("#totalDistance").css('background-color','#A9F5BC');
			alert("누적거리를 입력하세요.");return 0;
		}
		if($("#floor").val()==''||$("#floor").val()==null){
			$("#floor").focus();
			$("#floor").css('background-color','#A9F5BC');
			alert("주차층을 선택하세요.");return 0;
		}
		if($("#note").val()==''||$("#note").val()==null){
			$("#note").focus();
			$("#note").css('background-color','#A9F5BC');
			alert("미팅내용을 입력하세요.");return 0;
		}
		var frm = document.getElementById('insertCar');//sender form id
		frm.action = "insertCarUsed.do";//target frame name
		frm.submit();
	}
/************************************************ car main end *****************************************************************/
/************************************************ personnel main start *****************************************************************/
	function insertPersonnelData(){
		var objClass = $('.viewPersonnel');
		var objF = $('.viewPersonnel:first');
		var objClassP = $('.viewPass');
		var objFP = $('.viewPass:first');
		var objT = $('.viewTotalTrad');
		var objFT = $('.viewTotalTrad:first');
		var total = 0;
		var tmp = 1;
		var cnt = 1;

		for(var i=0;i<objT.length;i++){
			var objId = objFT.attr("id");
			var arr = objId.split("_");
			var val = $('#'+objId).val();

			if(val!=0 && arr[2]!=0)$('#'+arr[0]+"_totSumCnt").html(val);
			objFT = objFT.next();
		}

		for(var i=0;i<objClassP.length;i++){
			var objId = objFP.attr("id");
			var arr = objId.split("_");
			var passY = parseFloat($('#'+objId).val());
			var fina = parseFloat($('#'+arr[0]+"_supHol").html()-passY);

			$('#'+arr[0]+"_passYear").html(passY);
			$('#'+arr[0]+"_supHol").html(fina);
			$('#'+arr[0]+"_total").html(fina);
			objFP = objFP.next();
		}

		for(var i=0;i<objClass.length;i++){
			var objId = objF.attr("id");
			var objVal = $('#'+objId).val();
			var arr = objId.split("_");

			$('#'+arr[0]+"_view_"+arr[2]).html(objVal);
			if(parseInt(arr[2])==0) $('#'+arr[0]+"_late").html(objVal);
			objF = objF.next();

			if(tmp!=arr[0]){
				var overH = (parseFloat($('#'+tmp+"_total").html()) - parseFloat(total));

				if(overH <=0) {
					$('#'+tmp+"_overH").val(overH);
					if(overH <0) $('#'+tmp+"_total").html('<font style="color:crimson">'+overH+'</font>');
					if(overH ==0) $('#'+tmp+"_total").html(overH);
				} else $('#'+tmp+"_total").html(overH);
				total=0;
				cnt=1;
			}else{ if(arr[2]!=0)cnt++; }

			total = parseFloat(total) + parseFloat(objVal);
			tmp = arr[0];
			$('#'+arr[0]+"_sum").html(total);
			$('#'+arr[0]+"_sumCnt").html(cnt);

			// alert($('#'+totId).val());


		}
		var overH = (parseFloat($('#'+tmp+"_total").html()) - parseFloat(total));
		if(overH <=0) {
			$('#'+tmp+"_overH").val(overH);
			if(overH <0) $('#'+tmp+"_total").html('<font style="color:crimson">'+overH+'</font>');
			if(overH ==0) $('#'+tmp+"_total").html(overH);
		} else $('#'+tmp+"_total").html(overH);
	}

	function insertModifyPagePersonnelData(){
		var objClass = $('.viewPersonnel');
		var objF = $('.viewPersonnel:first');
		var objT = $('.viewTotalTrad');
		var objFT = $('.viewTotalTrad:first');
		var total = 0;
		var tmp = 1;
		var cnt = 1;

		for(var i=0;i<objT.length;i++){
			var objId = objFT.attr("id");
			var arr = objId.split("_");
			var val = $('#'+objId).val();

			if(val!=0 && arr[2]!=0) $('#'+arr[0]+"_totSumCnt").html(val);
			objFT = objFT.next();
		}

		for(var i=0;i<objClass.length;i++){
			var objId = objF.attr("id");
			var objVal = $('#'+objId).val();
			var arr = objId.split("_");
			$('#'+arr[0]+"_view_"+arr[2] +" input").val(objVal);
			if(parseInt(arr[2])==0) $('#'+arr[0]+"_late" +" input").val(objVal);
			objF = objF.next();

			if(tmp!=arr[0]){
				var overH = (parseFloat($('#'+tmp+"_total").html()) - parseFloat(total));
				$('#'+tmp+"_total").html(overH);

				total=0;
				cnt=1;
			}else{ if(arr[2]!=0)cnt++; }

			total = parseFloat(total) + parseFloat(objVal);
			tmp = arr[0];
			$('#'+arr[0]+"_sum").html(total);
			$('#'+arr[0]+"_sumCnt").html(cnt);
			//alert($('#'+objId).val());


		}$('#'+tmp+"_total" +" input").html((parseFloat($('#'+tmp+"_total").html()) - parseFloat(total)));
	}
/************************************************ personnel main end *****************************************************************/
/************************************************ management main start *****************************************************************/
	function insertDate(e,decimal, obj){
		if(!numbersonly(e,decimal)) return false;
		alert("test");
		alert(obj.parent().val());
		alert(obj.child().val());
		if(4==obj.val().length) obj.val(obj.val()+"-");
		else if(6==obj.val().replace("-","").length) obj.val(obj.val()+"-");
	}
	// 추가 버튼 클릭시
	//$("#addUlBtn").click(function(){
	function insertUl(divNm){
		var newitem = $("#"+divNm+" .tbody:eq(-1)").clone();
		// newitem.removeClass();
		newitem.find("li input:text").val("");
		newitem.find("li select").val("");

		$("#"+divNm).append(newitem);
	}


	function saveBasicInfo(formNm,formNm2){
		if(formNm2!=null){
			frm1 = document.getElementById(formNm2);//sender form id
			frm1.target = "uploadIFrame";//target frame name
			if( $("#priv").val() == 'true' ) frm1.submit();
		}
		//var frm = document.getElementById(formNm);//sender form id
		// frm.submit();
		// $("#basicInfo").submit();
		var leng = $(".subTab").length;
		for(var i=0; i<leng+1;i++){
			if("block"==$(".tabMenu:eq("+i+")").css("display")){
				// alert(i);
				AjaxTabSubmit(i);
				location.href ="index.do?usrId="+$("#selectST").val();
			}
		}
	}

	function AjaxTabSubmit(tabNumber){
		var URL = "";
		var DATA = "";
		var selectTabObj = "";
		var flag = false;
		switch(tabNumber){
		case 0:
			URL = "../management/familyInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if( $("#priv").val() == 'false' ) return; 
			break;
		case 1:
			URL = "../management/schoolInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if( $("#priv").val() == 'false' ) return; 
			break;
		case 2:
			URL = "../management/careerInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if( $("#priv").val() == 'false' ) return; 
			break;
		case 3:
			URL = "../management/licenseInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if( $("#priv").val() == 'false' ) return; 
			break;
		case 4:
			URL = "../management/insideCareerInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if($("#per").val()=='true') return;
			flag = true;
			break;
		case 5:
			URL = "../management/justiceInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if($("#per").val()=='true') return;
			flag = true;
			break;
		case 6:
			URL = "../management/salaryInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if($("#per").val()=='true') return;
			flag = true;
			break;
		case 7:
			URL = "../management/assessmentInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if($("#per").val()=='true') return;
			flag = true;
			break;
		case 8:
			URL = "../management/stockOptionInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if($("#per").val()=='true') return;
			flag = true;
			break;
		case 9:
		case 10:
		case 11:
		case 12:
			URL = "../management/problemInfoProcess.do"
			selectTabObj = ".tabMenu:eq("+tabNumber+")";
			if( $("#priv").val() == 'false' ) return; 
			break;
		}
		DATA = $(selectTabObj+" input,"+ selectTabObj+" select,"+ selectTabObj+" textarea").serialize();

		$.ajax({
			type:"POST",        //POST GET
			url:URL,     //PAGEURL
			data : DATA,
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				if(flag) {
					//alert("저장 되었습니다.");
					//location.href ="index.do?usrId="+$("#selectST").val();
				}
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
/************************************************ management main end *****************************************************************/
/************************************************ bsnsPlan main start *****************************************************************/
function downup(num,move){
	var target = $("#dynamicTbl .dnTbl:eq("+(num+move)+")");
	var source = $("#dynamicTbl .dnTbl:eq("+num+")");
	var maxlength = $("#dynamicTbl .dnTbl").length -1;

	if((num+move)==1)
		source.find("input:button").attr("onclick","");
	else
		source.find("input:button").attr("onclick","downup("+(num+move)+",-1)");

	if((num+move) == maxlength)
		source.find("span a").attr("onclick","");
	else
		source.find("span a").attr("onclick","downup("+(num+move)+",1)");

	target.find("input:button").attr("onclick","downup("+num+",-1)");
	target.find("span a").attr("onclick","downup("+num+",1)");
	if(move<0)target.before(source);
	else if(move>0) target.after(source);
}

function removeTr(num){
	var target = $(".tbl"+num);
	if(confirm("삭제하시겠습니까?")){
		target.find("td input, td select").val('');
		//target.find("td").remove();
		var frm = document.getElementById('planForm');//sender form id
		frm.action="insertBsnsPlan.do";
		frm.submit();
	}
}

function bsnsPsave(page, tempNum){
	var obj = $(this);
	var num = tempNum.split('_');
	var pUrl;
	if(page=='bsnsPlan') pUrl = "../bsnsPlan/insertBsnsPlanNote.do";
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

		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}
/************************************************ bsnsPlan main end *****************************************************************/
/************************************************ stats main start *****************************************************************/
function statsOfferdivAjax(rgName, middleCd, th, pgCd, offerCd, infoProvCd, report, sort, supporterCd){
	var DATA;
	if(sort=='100') {
		DATA = {
				choice_year: $("#choice_yearS").val(),
				total: ($("#choice_month").val()<7 ? 'high':'low'),
				rgId: rgName,
				sort_t: sort
		};
	}else{
		DATA = {
				choice_year: $("#choice_yearS").val(),
				total: ($("#choice_month").val()<7 ? 'high':'low'),
				rgNm: rgName,
				middleOfferCd: middleCd,
				progressCd: pgCd,
				offerCd: offerCd,
				infoProvider: infoProvCd,
				reportYN: report,
				sort_t: sort,
				supporter: supporterCd
		};
	}
	$.ajax({
		type:"POST",        //POST GET
		url:"../stats/statsPrivateOffer.do",     //PAGEURL
		data : DATA,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#offerDiv").html(arg);
			divShow($(th), $("#offerPr").attr('id'));//alert(divId)
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}


function statsNetworkAjax(th, cntCst, cntCpn, staffId){
	var DATA = {
		choice_year: $("#choice_yearS").val(),
		total: ($("#choice_month").val()<7 ? 'high':'low'),
		tmpNum1: cntCst,
		tmpNum2: cntCpn,
		rgId: staffId
	};
		
	$.ajax({
		type:"POST",        //POST GET
		url:"../stats/statsNetwork.do",     //PAGEURL
		data : DATA,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#offerDiv").html(arg);
			divShow($(th), $("#offerPr").attr('id'));//alert(divId)
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}


function submitLH(halfYear){
	$("#total").val(halfYear);
	$("#dayForm").submit();
}
/************************************************ stats main end *****************************************************************/
/************************************************ stockFirmManage main start *****************************************************************/
function selectStockFirmIb(cstName,th,menu){
	var URL = "../stockFirmManage/selectStockFirmIB.do";
	if("B"==menu) URL = "../stockFirmManage/selectStockFirmIBofStaff.do"
	$.ajax({
		type:"POST",        //POST GET
		url:URL,     //PAGEURL
		data : ({
			cstNm: cstName
		}),
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			// alert("data:"+arg);
			$("#stockFirmIBs").html(arg);
			if(th!=null & th!=''){
				$('.t_skin04_cstNcpn tr.LK1st').css('background-color','');
				$('.t_skin04_cstNcpn tr.LK1st').css('color','black');
				$(th).css('background-color','#75c5de');
				$(th).css('color','white');
			}
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});
}

function slctIbCst(sNb,th){
	$('#s_Name').val(sNb);
	var frm = document.getElementById('customerName');//sender form id
	frm.target = "stockCstFrame";//target frame name
	frm.submit();

	$('.t_skin04_cstNcpn tr.LK2nd').css('background-color','');
	$('.t_skin04_cstNcpn tr.LK2nd').css('color','black');
	$(th).parent('tr').css('background-color','#75c5de');
	$(th).parent('tr').css('color','white');

	resize_iframe();
}

function selectStockMenu(idx){
	if("A"==idx) parent.mainFrame.location.href = "main.do";
	else if("B"==idx) parent.mainFrame.location.href = "selectStaffNstockIB.do";
}

/************************************************ stockFirmManage main end *****************************************************************/
/************************************************ recommend main start *****************************************************************/
function selectOpinion(th,divId,offerSnb){
	$(".popUpMenu").hide();
	$("#insertOpinionBtn").attr('onclick',"saveOpinion('','"+offerSnb+"');");
	divShow($(th),divId);
	var t_num = divId.split("workPr");
	$("#BN_"+t_num[0]+"_"+t_num[1]).focus();
}

function divUp(th,snb,count){
	var divId = snb+"rcmdDIV"+count;
	$("#updateOpinionBtn"+count).attr('onclick',"saveOpinion('"+count+"','"+snb+"');");
	$("#deleteOpinionBtn"+count).attr('onclick',"saveOpinion('"+count+"');");
	$(".popUpMenu").hide();
	divShow($(th),divId);
	$("#BN_"+snb+"_"+count).focus();
}

function updateRCMD(tag,rslt,snb,cpnNm){
	var DATA;
	if(tag=='rslt') DATA = ({sNb:snb, result:rslt});
	else if(tag=='progress') DATA = ({sNb:snb, progressCd:rslt});
	else if(tag=='proposer') DATA = ({sNb:snb, rcmdProposer: $(".chbox:checked").val(),cpnNm:cpnNm, subMemo: "N"});
	else if(tag=='price') DATA = ({sNb:snb, price:rslt});
	if(confirm("적용하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url:"../recommend/updateResult.do",     //PAGEURL
			data : DATA,
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				document.companyName.action = "index.do";
				document.companyName.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}

function saveOpinion(cnt,offerSnb){
	var DATA;
	if(cnt==''){//insert
		DATA =({ offerSnb:offerSnb, opinion: $('input[name=opinion]:checked').val(), comment: $('#txtarea0').val()});
	}else{
		if(offerSnb!=''){//update
			DATA =({ sNb: $('#OPsNb'+cnt).val(), offerSnb:offerSnb, opinion: $('input[name=opinion'+cnt+']:checked').val(), comment: $('#txtarea'+cnt).val()});
		}else{//delete
			DATA =({ sNb: $('#OPsNb'+cnt).val()});
		}
	}
	if(confirm("적용하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url:"../recommend/saveOpinion.do",     //PAGEURL
			data : DATA,
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				document.companyName.action = "index.do";
				document.companyName.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}
function saveComment(cnt,offerSnb){
	var DATA;
	if(cnt==''){//insert
		DATA =({ offerSnb:offerSnb, comment: $('#toast_comment_text').val()});
	}else{
		if(offerSnb!=''){//update
			DATA =({ sNb: $('#OPsNb'+cnt).val(), offerSnb:offerSnb, comment: $('#toast_comment_text'+cnt).val()});
		}else{//delete
			DATA =({ sNb: $('#OPsNb'+cnt).val()});
		}
	}
	if(confirm("적용하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url:"../recommend/saveOpinion.do",     //PAGEURL
			data : DATA,
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				// window.close();
				document.comment.action = "comment.do";
				document.comment.submit();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	}
}

function staffDiv(th,divId,offerSnb,cpnNm){
	$(".popUpMenu").hide();
	$("#saveBTN").attr('onclick',"updateRCMD('proposer','','"+offerSnb+"','"+cpnNm+"');");
	divShow($(th),divId);
	$("#PM_0").focus();
}

function comment_open(){
	var commentDiv = $(".new_cmt");
	var dsp = commentDiv.css('display');
	if(dsp == "none") commentDiv.css('display','block');
	else commentDiv.css('display','none');
}

function write_cancle(flag,cnt){
	if(flag=='ist'){
		$(".new_cmt").css('display','none');
		$("#toast_comment_text").val('');
	}else if(flag=='mdf'){
		$("#user_text"+cnt).css('display','block');
		$("#modi_textarea"+cnt).css('display','none');
	}
}

function modify_comment(cnt){
	$("#user_text"+cnt).css('display','none');
	$("#modi_textarea"+cnt).css('display','block');
}
/************************************************ recommend main end *****************************************************************/
/************************************************ person main start *****************************************************************/
function selectLvCd(net, cd, snb, frmNm){
	var lvcd = "0000"+cd,
		s_nb = $("#cst_snb").val(),
		flag = net;

	$.ajax({
		type:"POST",        //POST GET
		url:"../person/saveLvCd.do",     //PAGEURL
		data : ({
			sNb:snb,
			lvCd:lvcd,
			flag: flag
		}),
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			// window.close();
			$("#s_Name").val(s_nb);
			$("#c_Name").val(s_nb);
			$("#"+frmNm+"").submit();
		},
		error: function whenError(e){    //ERROR FUNCTION
			alert("code : " + e.status + "\r\nmessage : " + e.responseText);
		}
	});

}
/************************************************ person main end *****************************************************************/

