<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="tmpTak" value="popUpReg">
<input type="hidden" id="flag" name="modalFlag" value="${MDf}">
<input type="hidden" id="num" name="modalNum" value="${MDn}">

<body>

<!-- 
<div id="wrap"> -->
	 	<!--고정서브navi-->
	 	<div class="sub_fixWrap">
			<div class="mb_pop_location">
				<span>인물 등록</span>
				<a href="javascript:closeInnerBox('searchPersonArea','regPersonArea,searchCompanyInnerArea');" class="btn_left">취소</a>
				<a href="javascript:regPerSonPopObj.doSaveOrUpdate();" class="btn_right">저장</a>
			</div>
		</div>	


		<div id="pop_iP" class="scrollArea schedulewrap con_pdst01">
		<form name="rgstForm">	
			<div style="display:none;">
				<input class="categoryCd" type="checkbox" id="categoryCd1" value="1"> <label for="categoryCd1">심사역</label>
				<input class="categoryCd" type="checkbox" id="categoryCd2" value="2"> <label for="categoryCd2">운용인재</label>
			</div>
			<input type="hidden" name="sNb" id="sNb" value="${result.sNb}">
		
			<div>
				<table class="tb_input_basic02">
					<caption>인물등록</caption>
	                <colgroup>
	                    <col width="24%">
	                    <col width="*">
	                </colgroup>
					
					<tbody>
						<tr>	
							<th scope="row" class="valign"><label for="rdCstType">인물구분</label><span class="redstar">*</span></th>
							<td>
								<span id="cstRadioTag"></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="valign"><label for="cst_nm">이름</label><span class="redstar">*</span></th>
							<td><input type="text" id="cst_nm" class="input_basic w100pro" value="${result.cstNm == '' ? cstNm : result.cstNm}"/></td>
						</tr>
						<tr>
							<th scope="row" class="valign"><label>회사</label></th>
							<td>
								<input type="hidden" id="AP_cpnId_0" value="${result.cpnId }"/>
								<input type="text" class="input_basic w100pro nameInput" placeholder="회사선택" readonly="readonly" onclick="commonPopAllObj.commonComORCusPop(1,'0','iPc','searchCompany')" title="회사선택" />
							</td>
						</tr>  
						<tr>
							<th scope="row" class="valign"><label for="position">직급</label><span class="redstar">*</span></th>
							<td>
								<p class="p_notice mgb05rem">* <strong>CEO, 대표, 대표이사</strong>는<span class="redpoint">"CEO"</span>선택, 나머지 직급은 직접 입력해주세요.</p>
								<div class="wrap_b_box">
									<div class="fl_w2"><label><input type="radio" id="chkCeo" onclick="regPerSonPopObj.clkPosition('ceo');" ${result.position == 'ceo' ? 'checked="checked"' : '' } /> <span>CEO</span></label></div> 
									<div class="fr_auto"><input type="text" class="input_basic w100" id="position" onclick="regPerSonPopObj.clkPosition();" style="ime-mode:active;" value="${result.position}" placeholder="직접입력" title="직급입력" /></div>
									
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="valign"><label for="email">e-mail</label><span class="redstar">*</span></th>
							<td><input type="text" id="email" class="input_basic w100pro" value="${result.email }"  /></td>
						</tr>
						<tr>
							<th scope="row" class="valign"><label for="phn_1">휴대전화</label><span class="redstar">*</span></th>
							<td>
								<c:if test="${result.sNb eq ''||(userLoginInfo.staffSnb eq result.managerId || userLoginInfo.permission > 00019 || userLoginInfo.permission eq 00014)}">
									<input type="number" pattern="[0-9]*"  min="0"  maxlength="11" oninput="regPerSonPopObj.maxLengthCheck(this);" id="phn_1" class="input_basic w100" value="${fn:replace(result.phn1,'-','') }"/>
								</c:if>
							</td>
						</tr>
						<c:if test="${result.sNb eq ''}">
						<tr>
							<th scope="row" class="valign"><label for="selStaff">담당자<br/>(직원)</label><span class="redstar">*</span></th>
							<td>
								<span id="userSelectTag"></span><span class="mgl03rem">과의 친밀도</span>
								<p class="relation_mark mgt05rem">
									<em id="relDeg1" onclick="regPerSonPopObj.chkRelationDegree(this,1);"></em>
	                                <em id="relDeg2" onclick="regPerSonPopObj.chkRelationDegree(this,2);"></em>
	                                <em id="relDeg3" onclick="regPerSonPopObj.chkRelationDegree(this,3);"></em>
	                                <em id="relDeg4" onclick="regPerSonPopObj.chkRelationDegree(this,4);"></em>
	                                <em id="relDeg5" onclick="regPerSonPopObj.chkRelationDegree(this,5);"></em>
	                                <span id="degreeArea" class="bluepoint mgl03rem">(5.0)</span>
									<input type="hidden" name="relDegV" id="relDegV" value="00001"><!-- default value 1 -->
								</p>
								<div class="wrap_b_box mgt05rem">
	                            	<div class="fr_auto"><input type="text" name="relMemo" id="relMemo" placeholder="관계를 입력해주세요" class="input_basic w100pro"></div>
	                            </div>
							</td>
						</tr>
						</c:if>
					 </tbody>
				</table>
					
				<div class="btn_pop_basic">
					<button type="button" class="btn_pop_gray01" onclick="closeInnerBox('searchPersonArea','regPersonArea,searchCompanyInnerArea');" id="regPersonPopCanBtn" >뒤로</button>
					<button type="button" class="btn_pop_white01" onclick="regPerSonPopObj.doSaveOrUpdate();">저장</button>
				</div>
			</div>
			
		</form>
		</div>	
<!-- </div> -->



<script type="text/javascript">

function returnReg(rVal){ //등록화면에서 회사 선택시 리턴 .
	var tmpSpan = document.createElement("span");
	tmpSpan.innerHTML = rVal.nm;
	
	var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다. <font> 제거를 위함.
	$("#AP_cpnId_0").val(rVal.snb);
	$(".nameInput").val(cpnNm);
	
	closeInnerBox('regPersonArea','searchCompanyInnerArea');
	//closeBottomBox('searchCompanyPop','onlyCompany');
	//backPanel('searchPersonPop','regPersonArea','');
}


var comCodeCstType;			//고객구분

var division ="${userLoginInfo.division}";

var staffList;


var regPerSonPopObj = {
	
	
	//선로딩코드
	preloadCode: function(){
		
		$('#cst_nm').focus();
		
		//공통코드
		comCodeCstType = getCommonCode('00013', null, 'CD', 'NM');		//고객구분('00013') 공통코드 (Sync ajax)
		var colorObj = {};
		var cstSelectTag = createSelectTag('rdCstType', comCodeCstType, 'CD', 'NM','${result.categoryPSCd}', '', colorObj, '', 'select_basic w100pro');		
			
		$("#cstRadioTag").html(cstSelectTag);
		
		
		//담당자(직원)		
		staffList = getCodeInfo(null, 'cusId', 'usrNm', null, null, null, '/common/getStaffListNameSort.do',{division : division});
		
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	var str=' <select name="selStaff" id="selStaff" class="select_basic">';
		
		for(var i=0;i<staffList.length;i++){
    		var chk="";
    			if(staffList[i].cusId == "${userLoginInfo.cusId}"){
    				chk=' selected="selected"';
    			}
    			str+='<option value='+staffList[i].cusId+chk+'>'+staffList[i].usrNm+'</option>'
    		
    	}

		str+=' </select>';
		
		$("#userSelectTag").html(str);
		
    },//end pageStart.
    
    
    //저장인지 수정인지 판별
    doSaveOrUpdate : function(){
    	//$("#regPersonArea").css('-webkit-transform','translate3d(0,0,0); ');
    	
    	//setTimeout(function(){
    		
    		if('${result.sNb}' != '') regPerSonPopObj.doUpdate();
        	else regPerSonPopObj.doSave();
    		
    		//},100);
    	
    	
    	
    },
    
    
  	//저장
    doSave: function(){
    	
      	var t = escape($('#email').val());
   
    	var cateCd = 0
		,cstNm = $('#cst_nm')
		,cpnId = $('#AP_cpnId_0')
		,pst   = $('#position')
		,email = $('#email')
		,phn1   = $('#phn_1')
		,phn2   = $('#phn_2')
		,phn3   = $('#phn_3')
		,expo   = $('#exposure');

		var i = 1;
		$('input[class=categoryCd]').each(function(){
			if($('input[class=categoryCd]:checked').length!=0 && this.checked)
				cateCd+=parseInt($('#categoryCd'+i).val());
			i++;
		});
		var page = 0;
		if("popUpReg" == $('#tmpTak').val()){
			page = 1;
		}
		$("input").css('background-color','');
		var cstType = $('#rdCstType').val();	
	
	  
	    	
		  
		if(cstNm.val() == null || cstNm.val() == 'null' || cstNm.val() == ''){
		
			swal("이름을 입력하세요!");
			return false;
		}
		
		if(pst.val() == null || pst.val() == 'null' || pst.val() == ''){
		
			swal("직급을 입력하세요.");
			return false;
		}
		if(email.val() == null || email.val() == 'null' || email.val() == ''){
		
			swal("email을 입력하세요.");
			return false;
		}
		if(phn1.val() == null || phn1.val() == 'null' || phn1.val() == ''){
		
			swal("전화번호를 입력하세요.");
			return false;
		}
		
		if(t.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null && t.match(/^(\w+)@(\w+)[.](\w+)[.](\w+)$/ig) == null){
  		    
			swal("이메일을 올바르게 입력해 주세요.");
  	    	return;
  	  	}else if( $('#phn_1').val().length < 10) {
  			
  	  		swal("휴대폰 번호 입력자리를  확인해 주세요 !");
  		  	return;
  	  	} 
		
		////////등록
		//---------- 해당 이름 존재 여부 체크
		
		var url = contextRoot + "/person/getCustomerName.do";
    	var param = {
    			cstNm: cstNm.val()
    	};
    	
    	var callback = function(result){
    			
    		var obj = JSON.parse(result);
    		
    		var rsltObj = obj.resultObject;	//결과수
    		
    		if(obj.result == "SUCCESS"){
    			    			
    			//------------------- 등록 프로세스 :S --------------------
    			
    			var msg = '';
    			if(rsltObj.isExist=='Y'){
    				msg = '요청하신 이름 \'' + cstNm.val() + '\' 이 존재하여\n';
    				msg += '[' + rsltObj.cstNm + '] 로 등록합니다.\n\n';    				
    			}
    			
    			msg += '등록 하시겠습니까?\n';
    			
    			
    			swal({
					  title: "",
					  text: msg,
					  
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  
					  cancelButtonText: '취소',
					  confirmButtonText: '저장'
				  },
				  
				  function(isConfirm){
					  
					  if(isConfirm){
					  
						  if(rsltObj.isExist=='Y')
			    	    		cstNm.val(rsltObj.cstNm);		//새로운 이름으로 세팅
			    	    		
						  $.ajax({
								type:"POST",        //POST GET
								url:contextRoot+"/person/insertCst.do",     //PAGEURL
								data : ({
									cstNm: cstNm.val(),
									//categoryPSCd: "0000"+cateCd,
									categoryPSCd: cstType,				//인물구분 
									cpnId: cpnId.val(),
									position: pst.val(),
									email: email.val(),
									phn1: phn1.val(),
								
									rgId: $('#rgstId').val(),
									
									usrCusId: $('#selStaff').val(),		//담당자 cusId
									relDegree: $('#relDegV').val(),		//담당자 와의 친밀도
									relMemo: $('#relMemo').val()
									
									}),
								timeout : 30000,       //제한시간 지정
								cache : false,        //true, false
								success: function whenSuccess(arg){  //SUCCESS FUNCTION
									
									closeInnerBox('searchPersonArea','regPersonArea,searchCompanyInnerArea');
									
									$('#nameSearch').val(cstNm.val());
									getPagingList('',1,'0','iP');
								},
								error: function whenError(x,e){    //ERROR FUNCTION
									swal("서버에러");
								}
							});
					  
					  
					  }
					  
				  });
    			
    		}//if success
    		
    	};//callback
    	
		commonAjax("POST", url, param, callback);
    	
    },//end doSave
    
    doUpdate : function(){
  
    	var cateCd = 0;
    	var snb   = $('#sNb');
    	var cstNm = $('#cst_nm');
    	var cpnId = $('#AP_cpnId_0');
    	var pst   = $('#position');
    	var email = $('#email');
    	var phn1   = $('#phn_1');

    	var phn1Value;

    	var cstType = $('#rdCstType').val();	
    	
    	if(isEmpty(cstType)){		//인물구분
    		swal("인물구분을 입력하세요!");
			return;
		}
    	
    	if(cstNm.val() == ''){
    		swal("이름을 입력하세요.");
    		cstNm.focus();
    		return;
    	}
    	
    	if(pst.val() == ''){
    		swal("직급을 입력하세요.");
    		pst.focus();
    		return;
    	}
    	if(email.val() == ''){
    		swal("email을 입력하세요.");
    		email.focus();
    		return;
    	}
    	if(phn1.length == '0'){
    		phn1Value = '${result.phn1}';
    	}else{
    		if(phn1.val() == ''){
        		swal("전화번호를 입력하세요.");
        		phn1.focus();
        		return;
        	}
    	}
    	
    	
    	if(cpnId.val() == '') {
    		swal("회사를 선택하지 않으셨습니다.");
			return;
    	}
    	    	
    	
    		$.ajax({
    			type:"POST",        //POST GET
    			url: contextRoot+"/person/updateCst.do",     //PAGEURL
    			data : ({
    				sNb: snb.val(),
    				categoryPSCd: cstType,				//인물구분 
    				cstNm: cstNm.val(),
    				cpnId: cpnId.val(),
    				position: pst.val(),
    				email: email.val(),
    				phn1: phn1Value,
    				phn2: '${result.phn2}',
    				phn3: '${result.phn3}',
    			
    			}),
    			timeout : 30000,       //제한시간 지정
    			cache : false,        //true, false
    			success: function whenSuccess(arg){  //SUCCESS FUNCTION

    				closeInnerBox('searchPersonArea','regPersonArea,searchCompanyInnerArea');
					$('#nameSearch').val(cstNm.val());
					getPagingList('',1,'0','iP');
    				
    			},
    			error: function whenError(x,e){    //ERROR FUNCTION
    				swal("서버에러");
    			}
    		});
    	
    },
    
    
  	//친밀도 체크
    chkRelationDegree: function(th, val){
    	var end = false;	//체크 완료
    	var colV = '#ffd359';
    	for(var i=1; i<=5; i++){
    		
    		$('#relDeg'+i).css('background-color', colV);
    		
    		if(i == val){
    			end = true;
    			colV = 'white';
    			$('#relDegV').val('0000'+i);		//친밀도 세팅
    		}
    	}
    	
    	$("#degreeArea").html('('+val+'.0)');
    },
    
    clkPosition : function (txt){
    	if(txt=='ceo'){
    		$("#position").val('대표이사');
    	}else{
    		$("#chkCeo").removeAttr('checked');
    		$("#position").val('');
    	}
    },
    
    maxLengthCheck : function(object){
	    if (object.value.length > object.maxLength){
	        object.value = object.value.slice(0, object.maxLength);
	    }    
	}
    
	 
   
};

/* $(document).on ('blur', 'input, textarea', function () { 
	setTimeout (function () { 
	window.scrollTo(document.body.scrollLeft, document.body.scrollTop);}, 0); 
});
 */
$(function(){
	regPerSonPopObj.preloadCode();	
	regPerSonPopObj.pageStart();	
	



});
</script>