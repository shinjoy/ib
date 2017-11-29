<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="con_pdst01">
	<table class="pop_tb_input_st" summary="딜검색상세옵션 (기간, 진행상태, 등록자, 투자심의)">
		<caption>딜 검색 상세</caption>
		<colgroup>
            <col width="24%">
            <col width="*">
        </colgroup>
		<tbody>
			<tr>
				<th scope="row" class="valign">기간</th>
				<td class="itemlist">
					<div class="section_deal_Period">
						<input type="date" id="inputSearchStartDate"/> <span class="dash">~</span> <input type="date" id="inputSearchEndDate"/>
					</div>	
				</td>
			</tr>
			<tr id="mezzaStatus">
				<th scope="row" class="valign">진행상태</th>
				<td id="dealStatusCheckArea"></td>
			</tr>
			<tr id="mnaStatus">
				<th scope="row" class="valign">진행상태 <em>(M&A)</em></th>
				<td id="dealMnaStatusCheckArea"></td>
			</tr>
			<tr>
				<th scope="row" class="valign">등록자</th>
				<td class="pd0">
					<div class="labelwrp">
						<label><input type="radio" name="dealSearchRegRadio" value=""  onclick="detailDealObj.setSearchReg();" checked="checked"/><span>전체</span></label>
						<label><input type="radio" name="dealSearchRegRadio" value="my" onclick="detailDealObj.setSearchReg();"/><span>내것만</span></label>
						<label><input type="radio" name="dealSearchRegRadio" value="selectPerson" onclick="detailDealObj.setSearchReg();"/><span>직접선택</span></label>
					</div>
					<div class="dotline" id="userSelectDotArea" style="display:none;">
						<button type="button" id="userSelectBtn" class="btn_3dst_basic"  style="display:none;" onclick="detailDealObj.selectUserPop();">등록자선택</button>
						<ul class="join_memberlist"  id="dealSearchPersonArea"></ul>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="valign">투자심의</th>
				<td>
					<input type="text" class="input_basic w_setday" id="inputDealAnalStartPrice"/> 이상 ~ <input type="text" class="input_basic w_setday" id="inputDealAnalEndPrice"/> 이하 (5이하)
				</td>
			</tr>
			<!-- <tr>
				<th scope="row" class="valign">투자금액</th>
				<td>
					<input type="text" style="width:3.5rem;" id="inputDealInvestStartPrice"/>이상 ~ <input type="text" style="width:3.5rem;" id="inputDealInvestEndPrice"/>이하 (억)
				</td>
			</tr> -->

		</tbody>
	</table>
	<div class="btn_pop_basic">
		<button type="button" class="btn_pop_white01" onclick="$('.modal-close-btn').trigger('click');">취소</button>
		<button type="button" class="btn_pop_gray01" onclick="javascript:detailDealObj.finishDealDetailSet();">확인</button>
	</div>
</div>


<script type="text/javascript">

//직원 공통 팝업 리턴 값
function selectUserPopGetResult(resultList, g_parentKey){

	$("#dealSearchPersonArea").html('');
	g_selectUserList = new Array();
	var str = '';
	for(var i=0;i<resultList.length;i++){

		g_selectUserList.push(resultList[i]);

		//-- 이름 세팅
		str +=' <li id="li_'+resultList[i].sabun+'"><span>' ;

		if('${userLoginInfo.sabun}' == resultList[i].sabun) str+='<strong>'+resultList[i].userNm+'</strong>';
		else str +=resultList[i].userNm;

		str +='</span><button type="button" id ="btn_'+resultList[i].sabun+'" onclick="deleteUser(\''+resultList[i].sabun+'\');" ><span><em>삭제</em></span></button>';
		str +=' <input type="hidden" name="selectUserId" value="'+resultList[i].sabun+'"/>';
		str +=' <input type="hidden" name="selectLoginId" value="'+resultList[i].usrId+'"/>';
		str +=' </li>';

	}

	$("#dealSearchPersonArea").append(str);

}

function deleteUser(sabun){

	$("#li_"+sabun).remove();
	var idx = getRowIndexWithValue(g_selectUserList, 'sabun', sabun);

	if(idx > -1){
		g_selectUserList.remove(idx);
	}

}



var detailDealObj = {


	//선로딩코드
	preloadCode: function(){


		//진행상태 세팅(메자닌)
		var list = g_statusCodeList;
		var str ='<ul class="dealtype_ck"><li><label for="allStatusChk"><input type="checkbox" id="allStatusChk" value="" onclick="detailDealObj.setAllStaus(\'\');" class="dty_toggle all" /><span class="dicon">전체</span></label></li>';

		for(var i=0; i<list.length; i++){
			str += '<li><label for="dealStatus_'+list[i].code+'">' ;
			str += '<input type="checkbox" name="dealStatusCheck" id="dealStatus_'+list[i].code+'" class="dealStatus_'+list[i].code+' dty_toggle"  value="'+list[i].code+'" onclick="detailDealObj.setStaus(\'\');" /><span class="dicon">';
			str += list[i].cdNm+'</span></label></li>' ;
		}
		str += '</ul>' ;

		//진행상태 세팅(mna)
		var list2 = g_mnaStatusCodeList;

		var str2 ='<ul class="dealtype_ck"><li><label for="allMNAStatusChk"><input type="checkbox" id="allMNAStatusChk" value="" onclick="detailDealObj.setAllStaus(\'MNA\');" class="dty_toggle all" /><span class="micon">전체</span></label></li>';

		for(var i=0; i<list2.length; i++){
			str2 += '<li><label for="dealMNAStatus_'+list2[i].code+'">' ;
			str2 += '<input type="checkbox" name="dealMNAStatusCheck" id="dealMNAStatus_'+list2[i].code+'"  class="dealMNAStatus_'+list2[i].code+' dty_toggle" value="'+list2[i].code+'" onclick="detailDealObj.setStaus(\'MNA\');" /><span class="micon">';
			str2 += list2[i].cdNm+'</span></label></li>' ;
		}
		str += '</ul>' ;

		$("#dealStatusCheckArea").html(str);
		$("#dealMnaStatusCheckArea").html(str2);

		//진행상태 tr 표시
		if(g_selectTabValue != '00000' && g_selectTabValue != '00007' ) $("#mnaStatus").hide();
		if(g_selectTabValue == '00007' ) $("#mezzaStatus").hide();

	},

	//화면세팅
    pageStart: function(){

    	var dealSearchStartDate	 = $("#dealSearchStartDate").val();
    	var dealSearchEndDate	 = $("#dealSearchEndDate").val();

    	var dealSearchStatus 	 = $("#dealSearchStatus").val();
    	var dealMNASearchStatus  = $("#dealMNASearchStatus").val();

    	var dealAnalStartPrice 	 = $("#dealAnalStartPrice").val();
    	var dealAnalEndPrice 	 = $("#dealAnalEndPrice").val();
    	var dealInvestStartPrice = $("#dealInvestStartPrice").val();
    	var dealInvestEndPrice 	 = $("#dealInvestEndPrice").val();


    	$("#inputSearchStartDate").val(dealSearchStartDate);
    	$("#inputSearchEndDate").val(dealSearchEndDate);

    	//딜 상태
    	if(dealSearchStatus != ''){

    		var statusArr = dealSearchStatus.split(',');
    		for(var i=0; i<statusArr.length; i++){
    			$("#dealStatus_"+statusArr[i]).trigger('click');
    		}
    	}else{
    		$("#allStatusChk").prop('checked',true);
    		detailDealObj.setAllStaus('');
    	}

    	//딜 상태 (MNA)
		if(dealMNASearchStatus != ''){

    		var statusArr = dealMNASearchStatus.split(',');
    		for(var i=0; i<statusArr.length; i++){
    			$("#dealMNAStatus_"+statusArr[i]).trigger('click');
    		}
    	}else{
    		$("#allMNAStatusChk").prop('checked',true);
    		detailDealObj.setAllStaus('MNA');
    	}


    	//직원 값
    	if($("#dealSearchPerson").val() != ''){


    		if(g_selectUserList.length == 0 && $("#dealSearchPerson").val() == '${userLoginInfo.id}'){

    			$("input:radio[name=dealSearchRegRadio][value=my]").prop("checked",true);
    		}else{

    			$("input:radio[name=dealSearchRegRadio][value=selectPerson]").prop("checked",true);
    			detailDealObj.setSearchReg();
    			selectUserPopGetResult(g_selectUserList, '');

    		}
    	}

    	$("#inputDealAnalStartPrice").val(dealAnalStartPrice);
    	$("#inputDealAnalEndPrice").val(dealAnalEndPrice);

    /* 	$("#inputDealInvestStartPrice").val(dealInvestStartPrice);
    	$("#inputDealInvestEndPrice").val(dealInvestEndPrice); */


    },

    //------------체크박스 이벤트

    //전체선택
    setAllStaus : function(type){

    	if($('#all'+type+'StatusChk').is(":checked")){
    		$('input:checkbox[name=deal'+type+'StatusCheck]').prop("checked",true);
    	}else $('input:checkbox[name=deal'+type+'StatusCheck]').prop("checked",false);
    },

    //개별
    setStaus : function(type){

    	if($('input:checkbox[name=deal'+type+'StatusCheck]').length
    			== $('input:checkbox[name=deal'+type+'StatusCheck]:checked').length){
    		$('#all'+type+'StatusChk').prop("checked",true);
    	}else $('#all'+type+'StatusChk').prop("checked",false);
    },

    //등록자 선택 팝업 띄우기
    selectUserPop : function(){
    	$("#modal-window").css("z-index","9996");

    	var selectList = [];
		var arr =$("input[name=selectUserId]");

		for(var i=0;i<arr.length;i++){
			selectList.push(arr[i].value);
		}

  		var param ={

  				userList 	   : selectList.join(','),
  				isCheckDisable : 'N',				//disable 상위 부서에 조작에 따른 선택여부
  				g_parentKey	   : 'userSelectPop'

  		};

    	commonPopAllObj.openUserSelectPop(param);
    },

    //등록자 선택 옵션
    setSearchReg : function(){
    	var searchPersonType = $("input:radio[name=dealSearchRegRadio]:checked").val();

    	if(searchPersonType != 'selectPerson'){
    		$("#dealSearchPersonArea").empty();
    		$("#userSelectBtn").hide();
    		$("#userSelectDotArea").hide();
    		
    	}else{
    		$("#userSelectBtn").show();
    		$("#userSelectDotArea").show();
    	}
    },

    //확인버튼
    finishDealDetailSet : function(){

    	var searchPersonType = $("input:radio[name=dealSearchRegRadio]:checked").val();
    	var userObj = $("input[name=selectLoginId]");
    	var dealAnalStartPrice = $("#inputDealAnalStartPrice").val();
    	var dealAnalEndPrice = $("#inputDealAnalEndPrice").val();

    	//------------------validation : S

    	//진행상태 validation
    	if($("#allStatusChk").not(":checked") && ($("input:checkbox[name='dealStatusCheck']:checked").length == 0)){
    		swal('진행상태를 선택해 주세요');
    		return false;
    	}
    	//등록자 valudation
    	if(searchPersonType == 'selectPerson' && userObj.length == 0){
    		swal('등록자를 선택해 주세요');
    		return false;
    	}

    	//투심 valudation
    	if(dealAnalEndPrice != '' && dealAnalEndPrice >5){
    		swal('투자심의 시작점수는 5이하로 설정해주세요');
    		return false;
    	}

		//진행상태 valudation
    	if(g_selectTabValue != '00007' && $('input:checkbox[name=dealStatusCheck]:checked').length == 0){
    		swal('진행상태를 선택해주세요.');
    		return false;
    	}

    	//진행상태(M&A) valudation
    	if((g_selectTabValue == '00007' || g_selectTabValue == '00000') && $('input:checkbox[name=dealMNAStatusCheck]:checked').length == 0){
    		swal('M&A 진행상태를 선택해주세요.');
    		return false;
    	}

    	//------------------validation : E

    	//기간
    	$("#dealSearchStartDate").val($("#inputSearchStartDate").val());
    	$("#dealSearchEndDate").val($("#inputSearchEndDate").val());

    	$("#dealChoiceYear").val(($("#inputSearchStartDate").val()).substring(0,4));

    	//진행상태

    	detailDealObj.dealStatusSetting('');
    	detailDealObj.dealStatusSetting('MNA');

    	//등록자 세팅
    	if(searchPersonType == '') $("#dealSearchPerson").val('');
    	else if(searchPersonType == 'my'){
    		$("#dealSearchPerson").val('${userLoginInfo.id}');
    		g_selectUserList = new Array();

    	}else{

    		var userArr = [];
    		for(var i=0; i<userObj.length; i++){
    			userArr.push($(userObj[i]).val());
    		}

    		$("#dealSearchPerson").val(userArr.join(','));

    	}

    	//투심점수
    	$("#dealAnalStartPrice").val(dealAnalStartPrice);
    	$("#dealAnalEndPrice").val(dealAnalEndPrice);

    	//투자금액
    /* 	$("#dealInvestStartPrice").val($("#inputDealInvestStartPrice").val());
    	$("#dealInvestEndPrice").val($("#inputDealInvestEndPrice").val()); */

    	dealListObj.doSearch();

    	$('.modal-close-btn').trigger('click');

    },

    //딜 진행상태 세팅
    dealStatusSetting :function(type){

    	if($('#all'+type+'StatusChk').is(":checked")){
    		$('#deal'+type+'SearchStatus').val('');

    	}else{
    		var checkObj = $('input:checkbox[name=deal'+type+'StatusCheck]');

    		var valueArr = [];
    		for(var i=0; i<checkObj.length; i++){
    			if($(checkObj[i]).is(':checked')) valueArr.push($(checkObj[i]).val());
    		}
    		$('#deal'+type+'SearchStatus').val(valueArr.join(','));

    	}
    }



};


$(function(){

	detailDealObj.preloadCode();
	detailDealObj.pageStart();
});

</script>
