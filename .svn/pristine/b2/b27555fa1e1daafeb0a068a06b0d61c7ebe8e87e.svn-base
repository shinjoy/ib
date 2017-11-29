<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="tmpTak" value="popUpReg">

	
	
<div class="con_pdst01">
	<table class="tb_input_basic02" summary="회사등록(구분, 코드, 회사명)">
		<caption>회사등록</caption>
		<colgroup>
                  <col width="28%">
                  <col width="*">
              </colgroup>
		<tbody>
			<tr>
				<th scope="row" class="valign">회사구분<span class="redstar">*</span></th>
				<td class="itemlist">
					<label><input type="radio" name="rdo_offer" id="offerListed" value="offerListed"><span>상장</span></label>
					<label><input type="radio" name="rdo_offer" id="offerNlisted" value="offerNlisted" checked="checked"><span>비상장</span></label>
				</td>
			</tr>
			<tr>
				<th scope="row" class="valign"><label for="cpn_id">코드</label><span class="redstar">*</span></th>
				<td>
					<span id="cpn_id">${maxSeq}</span>
					<span id="cpn__idA" style="display:none;">${maxASeq}
					<span id="cpn_a_str" style="display:none;"><font color="gray">(임의코드)</font></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="valign"><label for="cpn_nm">회사명</label><span class="redstar">*</span></th>
				<td colspan="1">
					<input type="text" id="cpn_nm" class="input_basic w100pro" value="${cpnNm}"/>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="btn_pop_basic">
		<button type="button"  class="btn_pop_gray01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
		<button type="button"  class="btn_pop_white01" onclick="javascript:fnObjCom.doSave2();">저장</button>
	</div>
</div>


<script type="text/javascript">


var fnObjCom = {
	

	//선로딩코드
	preloadCode: function(){
		
		fnObjCom.clickItem();
		
	},
	
	//화면세팅
    pageStart: function(){
    	
    },
    
    doSave2 : function(){
    
    	var chkRdo = $('input:radio[name=rdo_offer]:checked').val();	
    	
    	var listedYn = (chkRdo=='offerListed') ? 'Y' : 'N';		//상장 비상장 여부
    	
		var cpnId = (chkRdo=='offerListed') ? $("#cpn__idA").html() : $("#cpn__id").html();
		
		var cpnNm = $("#cpn_nm").val();
		var cstId = 0;

		var page = 0;
		if("popUpReg" == $('#tmpTak').val()){
			page = 1;
		}
	
		if(cpnNm == null || cpnNm == 'null' || cpnNm == ''){
			$("#cpn_nm").focus();
			$("#cpn_nm").css('background-color','#A9F5BC');
			swal("회사명을 입력하세요.");
			return;
		}
		
		if(cstId == null || cstId == 'null' || cstId == ''){
			cstId=0;
		}
		
		swal({
			  title: "",
			  text: "적용 하시겠습니까?",
			  
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  
			  cancelButtonText: '취소',
			  confirmButtonText: '저장'
		  },
		  
		  function(isConfirm){
			  
			  if(isConfirm){
				  
				  $.ajax({
						type:"POST",        //POST GET
						url: contextRoot+"/company/insertCpnAjax.do",     //PAGEURL
						data : ({
							cpnId		: cpnId,
							cpnNm		: cpnNm,
							ceoId		: cstId,
							rgId		: $('#rgstId').val(),
							listedYn 	: listedYn
							}),
						timeout : 30000,       //제한시간 지정
						cache : false,        //true, false
						success: function whenSuccess(result){  //SUCCESS FUNCTION
							
							var obj = JSON.parse(result);
				    		var rsltObj = obj.resultObject;	//결과수
				    		
							var cpnId = rsltObj.cpnId;	
							
							if($("#modalFlag").val() == 'iPc'){		//인물등록에서 open
								
								var rVal = new Object();
								rVal.nm = cpnNm;
								rVal.snb = cpnId;
								$('.modal-close-btn').trigger('click');
								returnReg(rVal);
								
							}else{
								$('#nameSearch2').val(cpnNm);
								getPagingList('',1,'0','c');
								$('.modal-close-btn').trigger('click');
							}
							
						},
						error: function whenError(x,e){    //ERROR FUNCTION
							swal("서버에러");
						}
					});
					  
			  }
		  });
		
		
		
		
		
    },
    
    clickItem :function(){
    	$('#offerListed').click(function(){
    		$('#offerNlisted').attr('checked',null);
    		$(this).attr('checked', 'checked');
    		
    		$('#cpn_id').hide();
    		$('#cpn__idA').show();
    		$('#cpn_a_str').show();
    		
    	});
    	$('#offerNlisted').click(function(){
    		$('#offerListed').attr('checked',null);
    		$(this).attr('checked', 'checked');
    		
    		$('#cpn_id').show();
    		$('#cpn__idA').hide();
    		$('#cpn_a_str').hide();
    	});
    }
    
};


$(function(){
	fnObjCom.preloadCode();	
	fnObjCom.pageStart();		
	
});

</script>
