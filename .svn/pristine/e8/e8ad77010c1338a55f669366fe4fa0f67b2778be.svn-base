$(function(){
	$(document).on("click","#chkId", function(){
		var Id = $('#usrId');
		if(Id.val().length==0) {
			alert("아이디를 입력하세요.");
			$('#usrId').focus();
			return;
		}else {
			if(!check_id(Id)){
				Id.focus();
				return;
			}
		}
		$.ajax({
			type:"POST",        //POST GET
			url:"../login/checkUsrId.do",     //PAGEURL
			data : ({usrId: Id.val()}),
			timeout : 30000,       //제한시간 지정
			cache : false,        //true, false
			success: function whenSuccess(arg){  //SUCCESS FUNCTION
				if(arg=="1") alert( "\""+ Id.val() +"\"는 존재하는 아이디입니다. 다른 아이디를 입력하세요.");
				else alert("\""+ Id.val() +"\"사용할 수 있는 아이디입니다.");
				Id.attr('disabled','true');
				$('#passwd').focus();
			},
			error: function whenError(e){    //ERROR FUNCTION
				alert("code : " + e.status + "\r\nmessage : " + e.responseText);
			}
		});
	});

	String.prototype.trim = function() {
	    return this.replace(/(^\s*)|(\s*$)/gi, "");
	};

	Object.defineProperty(Object.prototype, "is_null", {
		value: function(){
			if (this === null || String(this).trim() === "") return true;
			else return false;
		}
	});
	$('.modifyUsr_btnOk').click(function(){
		var snb = $('#snb');
		var preId = $('#id');
		var Id = $('#usrId');
		var pw1 = $('#passwd');
		var pw2 = $('#passwd2');
		var name = $('#usrNm');
		var email = $('#email');
		var emailId = $('#emailId');
		var emailPasswd = $('#emailPasswd');
		var phn1 = $('#phn_1');
		var phn2 = $('#phn_2');
		var phn3 = $('#phn_3');

		if(pw1.val().is_null()){
			alert("비밀번호를 입력하세요.");
			pw1.focus();
			return;
		}
		if(pw1.val()!=pw2.val()){
			alert("비밀번호가 일치하지 않습니다.");
			pw2.focus();
			return;
		}
/*
		if(!CheckPassWord(pw1.val())) {
			pw1.focus();
			return;
		}
*/

		if(Id.val().is_null()){
			Id.val(preId.val());
		}

		if(confirm("적용하시겠습니까?")){
			$.ajax({
				type:"POST",        //POST GET
				url:"../login/updateUsrInfo.do",     //PAGEURL
				data : ({
					sNb: snb.val(),
					usrId: Id.val(),
					usrPw: pw1.val(),
					usrNm: name.val(),
					email: email.val(),
					emailId: emailId.val(),
					emailPasswd: emailPasswd.val(),
					phn1: phn1.val(),
					phn2: phn2.val(),
					phn3: phn3.val()
					}),
				timeout : 30000,       //제한시간 지정
				cache : false,        //true, false
				success: function whenSuccess(arg){  //SUCCESS FUNCTION
					//document.modifyRec.action = "mainLogo.do";
					//document.modifyRec.submit();
					
					parent.document.location.reload();
					//parent.document.location.href = 'http://106.250.177.91:8180/IBsystem/';
					
				},
				error: function whenError(e){    //ERROR FUNCTION
					alert("code : " + e.status + "\r\nmessage : " + e.responseText);
				}
			});
		}
	});
});