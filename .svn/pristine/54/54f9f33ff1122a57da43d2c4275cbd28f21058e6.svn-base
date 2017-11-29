function selectStockFirmIb(cstName,th,menu,usrId){
	var url = "../stockFirmManage/selectStockFirmIB.do";
	if("B"==menu) url = "../stockFirmManage/selectStockFirmIBofStaff.do";
	if("C"==menu) url = "../stockFirmManage/selectStockFirmIBofStaffNew.do";
	
	$.ajax({
		type:"POST",        //POST GET
		url:url,     //PAGEURL
		data : ({
			cstNm: cstName,
			usrId: usrId
		}),		
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		timeout : 30000,       //���ѽð� ����
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
		error: function whenError(x,e){    //ERROR FUNCTION
			ajaxErrorAlert(x,e);
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