function viewPer(th,sep){
	var url = "";
	if(sep===2) url = "mainNetInfo.do";
	else url = "selectStaffNetwork.do";
	document.switc.action = url;
	document.switc.submit();
}
function selectStaff4NetInfo(cstId,th){
	var url = "../network/selectNetCD.do";
	$.ajax({
		type:"POST",        //POST GET
		url:url,     //PAGEURL
		data : ({
			usrId: cstId
		}),
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //���ѽð� ����
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			// alert("data:"+arg);
			$("#cmmCD").html(arg);
			if(th!=null & th!=''){
				$('.t_skin04_cstNcpn tr.LK1st').css('background-color','');
				$('.t_skin04_cstNcpn tr.LK1st').css('color','black');
				$(th).css('background-color','#75c5de');
				$(th).css('color','white');
				$("#slctID").val(cstId);
			}
		},
		error: function whenError(x,e){    //ERROR FUNCTION
			ajaxErrorAlert(x,e);
		}
	});
}
function selectNet(netCd,th){
	var URL = "../network/selectNetInfo.do";
	$.ajax({
		type:"POST",        //POST GET
		url:URL,     //PAGEURL
		data : ({
			 usrId: $("#slctID").val()
			,netCd: netCd
		}),
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			$("#netInfoL").html(arg);
			if(th!=null & th!=''){
				$('.t_skin04_cstNcpn tr.LK2nd').css('background-color','');
				$('.t_skin04_cstNcpn tr.LK2nd').css('color','black');
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
	frm.action="../person/main.do";
	frm.target = "netInfoFrame";//target frame name
	frm.submit();

	$('.t_skin04_cstNcpn tr.LK3rd').css('background-color','');
	$('.t_skin04_cstNcpn tr.LK3rd').css('color','black');
	$(th).parent().css('background-color','#75c5de');
	$(th).parent().css('color','white');

	resize_iframe();
}