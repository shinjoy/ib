<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css">

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.1'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<style>
.selUserStyle{
	height:25px;
	font-size:12px;
}

.net_table_apply {
    border-top: #a0a7b3 solid 0px;
    border-left: #b9c1ce solid 0px;
    border-right: #b9c1ce solid 1px;
    border-bottom: #b9c1ce solid 1px;
    width: 100%;
    vertical-align: middle;
    line-height: 16px;
    font-size: 12px;
    letter-spacing: -0.8px;    
    margin-top: 1px;
    margin-right: 50px;
}
.net_table_apply tbody th {    
    border-left: #b9c1ce solid 0px;    
}
</style>


<script>
$(document).ready(function(){
	$('#cst_nm').focus();
	
});
function clkPosition(txt){
	if(txt=='ceo'){
		$("#position").val('대표이사');
	}else{
		$("#chkCeo").removeAttr('checked');
		$("#position").val('');
	}
}
</script>
</head>
<base target="_self">
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<form id="searchCst" name="searchCst" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="nameSearch" name="cstNm">
</form>

<form id="personLeft" name="personLeft" action="<c:url value='/person/selectLeft.do' />" method="post"></form>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="tmpTak" value="${page}">
<input type="hidden" id="cst_snb" value="">
<input type="hidden" id="rtn" value="">

<input type="hidden" id="fromMain" value="${fromMain}"> <!-- 메인페이지 위젯 추가를 통해 등록하는 것인지 체크 ...fromMain=='y' -->

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>

<form name="rgstForm">

	<table class="net_table_apply" summary="인물정보입력(구분,이름,소속회사,부서,직급,연락처,이메일,친밀도,이력 등)">
        <caption>
            인물정보입력
        </caption>
        <colgroup>
        	<col width="110" />
            <col width="610" />
        </colgroup>
        <tbody>
        	<tr style="display:none;">
				<th class="tbColor inputLine" width="120px">인물구분</th>
				<td>
					<input class="categoryCd" type="checkbox" id="categoryCd1" value="1"> <label for="categoryCd1">심사역</label>
					<input class="categoryCd" type="checkbox" id="categoryCd2" value="2"> <label for="categoryCd2">운용인재</label>
				</td>
			</tr>
            <tr>
                <th scope="row"><span class="star">*</span>인물구분</th>
                <td>
                    <span id="cstRadioTag"></span>
                </td>
                    
            </tr>
            <tr class="point">
                <th scope="row"><label for="cst_nm"><span class="star">*</span>이름</label></th>
                <td><input type="text" id="cst_nm" value="${cstNm}" style="ime-mode:active;" class="applyinput_B w_st01" /></td>                
            </tr>
            <tr>
                <th scope="row">회사</th>
                <td>
                	<input class="regist" type="hidden" id="AP_cpnId_0" value="${workVO.cpnId }"/>
					<a onclick="popUp('0','c')" id="AP_cpnNm_0" class="c_title" title="이름">회사선택</a>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="IDName05"><span class="star">*</span>직급</label></th>
                <td>
                	<MIDDLE>※ "CEO, 대표, 대표이사" 등의 직급은 모두 <font color="orangered">"대표이사"</font> 선택, 나머지 직급은 직접 입력해주세요.</MIDDLE><br/>
					<label><input type="radio" id="chkCeo" onclick="clkPosition('ceo');"> 대표이사</label> | 
					<input class="applyinput_B w_st01" type="text" id="position" onclick="clkPosition();" style="ime-mode:active;" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="email"><span class="star">*</span>e-mail</label></th>
                <td>
                	<input type="text" class="applyinput_B w_st01" id="email" style="ime-mode:inactive;" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="phn_1"><span class="star">*</span>핸드폰</label></th>
                <td>
                	<input type="text" class="applyinput_B w_st01" id="phn_1" style="ime-mode:inactive;" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="phn_2">직통전화</label></th>
                <td>
                    <input type="text" class="applyinput_B w_st01" id="phn_2" style="ime-mode:inactive;" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="phn_3">내선전화</label></th>
                <td>
                	<input type="text" class="applyinput_B w_st01" id="phn_3" style="ime-mode:inactive;" />
                </td>
            </tr>
            <tr><th colspan=2 height=5 style="background-color:white;"></th></tr>
            <tr>
                <th scope="row"><label for="IDName16"><span class="star">*</span>담당자(직원)</label></th>
                <td>
                	<span id="userSelectTag" style="float:left;"></span>
						
					<span><div style="float:left;font-size:12px;margin-left:2px;margin-top:5px;margin-right:3px;">과의 <b>친밀도</b></div>
						<div id="relDeg1" onclick="fnObj.chkRelationDegree(this,1);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;background-color:pink;"></div>
						<div id="relDeg2" onclick="fnObj.chkRelationDegree(this,2);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg3" onclick="fnObj.chkRelationDegree(this,3);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg4" onclick="fnObj.chkRelationDegree(this,4);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg5" onclick="fnObj.chkRelationDegree(this,5);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<input type="hidden" name="relDegV" id="relDegV" value="00001"><!-- default value 1 -->
						
						<div style="float:left;font-size:12px;margin-left:7px;margin-top:5px;margin-right:4px;"><b>관계메모</b></div>
						<div><input type="text" name="relMemo" id="relMemo" style="margin-top:3px;width:270px;" class="applyinput_B w_st01" /></div>
					</span>
                </td>
            </tr>
            
        </tbody>
    </table>
	
	<div class="table_btnZone"><a href="javascript:fnObj.doSave();"><img src="<c:url value='/images/network/btn_save.gif'/>" alt="저장" /></a></div>
	
</form>
	
</body>
</html>





<script type="text/javascript">

//Global variables :S ---------------

//공통코드
//var comCodeRoleCd;				//권한코드
//var comCodeMenuType;			//메뉴타입
var comCodeCstType;			//고객구분

//var myModal = new AXModal();	// instance
var division ="${userLoginInfo.division}";
var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs


//div popup 방식을 위한 글쓰기,수정 위한 변수
var mode;						//"new", "view", "update" 

//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		//공통코드
		comCodeCstType = getCommonCode('00013', null, 'CD', 'NM');		//고객구분('00013') 공통코드 (Sync ajax)
		
		//'optionValue','optionText' 프로퍼티를 생성하며 값으로 CD, NM 의 값 할당
		//this.addComCodeArray(comCodeMenuType);
		var cstRadioTag = createRadioTag('rdCstType', comCodeCstType, 'CD', 'NM', '', 15, 5, null);	//'fnObj.clickRdBudget(this);');//radio tag creator 함수 호출 (common.js)		
		$("#cstRadioTag").html(cstRadioTag);
		
		
		//담당자(직원)		
		var staffListObj = getCodeInfo(null, 'cusId', 'usrNm', null, null, null, '/common/getStaffListNameSort.do',{division:division});
		
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		var userSelectTag = createSelectTag('selStaff', staffListObj, 'cusId', 'usrNm', '${userLoginInfo.cusId}', null, colorObj, 90, 'selUserStyle');	//select tag creator 함수 호출 (common.js)
		$("#userSelectTag").html(userSelectTag);


		
		//페이지크기 세팅
		//fnObj.setPageSize();
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//저장
    doSave: function(){
    	
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
		
		var cstType = $('input:radio[name=rdCstType]:checked').val();		//document.rgstForm.rdCstType.value; 
		if(isEmpty(cstType)){		//인물구분
			alert("인물구분을 입력하세요!");
			return;
		}
		
		
		if(cstNm.val().is_null()){
			cstNm.focus();
			cstNm.css('background-color','#A9F5BC');
			alert("이름을 입력하세요!");return;
		}
		/*if(cpnId.val().is_null()){
			alert("회사를 선택하세요.");
			cpnId.focus();
			return;
		}*/
		if(pst.val().is_null()){
			pst.focus();
			pst.css('background-color','#A9F5BC');
			alert("직급을 입력하세요.");return;
		}
		if(email.val().is_null()){
			email.focus();
			email.css('background-color','#A9F5BC');
			alert("email을 입력하세요.");return;
		}
		if(phn1.val().is_null()){
			phn1.focus();
			phn1.css('background-color','#A9F5BC');
			alert("전화번호를 입력하세요.");return;
		}
	
		//if(expo.is(":checked")==true) phn1 = '[N]'+phn1.val();
		//else phn1 = phn1.val();
	
		
		
		//---------- 해당 이름 존재 여부 체크
		
		var url = contextRoot + "/person/getCustomerName.do";
    	var param = {
    			cstNm: cstNm.val()
    	};
    	
    	var callback = function(result){
    			
    		var obj = JSON.parse(result);
    		
    		var rsltObj = obj.resultObject;	//결과수
    		
    		if(obj.result == "SUCCESS"){
    			
    			//alert(rsltObj.cstNm);
    			
    			//alert(rsltObj.isExist=='Y'?'존재':'등록해도되');
    			
    			
    			//------------------- 등록 프로세스 :S --------------------
    			
    			var msg = '';
    			if(rsltObj.isExist=='Y'){
    				msg = '요청하신 이름 \'' + cstNm.val() + '\' 이 존재하여\n';
    				msg += '[' + rsltObj.cstNm + '] 로 등록합니다.\n\n';    				
    			}
    			
    			msg += '등록 하시겠습니까?\n';
    			
    			
    	    	if(confirm(msg)){
    	    		
    	    		var url = contextRoot + "/person/regCustomer.do";
    	        	var param = {
    	        			cstNm: (rsltObj.isExist=='Y'? rsltObj.cstNm : cstNm.val()),
    						//categoryPSCd: "0000"+cateCd,
    						categoryPSCd: cstType,				//인물구분 
    						cpnId: cpnId.val(),
    						position: pst.val(),
    						email: email.val(),
    						phn1: phn1.val(),
    						phn2: phn2.val(),
    						phn3: phn3.val(),
    						rgId: $('#rgstId').val(),
    						
    						usrCusId: $('#selStaff').val(),		//담당자 cusId
    						relDegree: $('#relDegV').val(),		//담당자 와의 친밀도
    						relMemo: $('#relMemo').val()
    	        	};
    	        	
    	        	var callback = function(result){
    	        			
    	        		var obj = JSON.parse(result);
    	        		
    	        		var rsltObj = obj.resultObject;	//결과수
    	        		
    	        		if(obj.result == "SUCCESS"){
    	        			
    	        			//alertM("등록 되었습니다.");
    	        			parent.myModal.close();
    	        			
    	        			$('#srchCustNm', parent.document).val(rsltObj.cstNm);		//등록한 이름으로 검색
    	        			parent.fnObj.doSearch();
    	        			
    	        			parent.toast.push("등록 되었습니다!");
    	        			
    	        		}else{
    	        			//alertMsg();
    	        		}
    	        		
    	        	};
    	        	
    	        	//alert(JSON.stringify(param));
    	        	//return;
    	        	
    	        	commonAjax("POST", url, param, callback);
    	    	}
    			
    			//------------------- 등록 프로세스 :E --------------------
    			
    			
    		}else{
    			//alertMsg();
    		}
    		
    	};
    	
    	
    	commonAjax("POST", url, param, callback);
		
		
    },//end doSave
    
    
    //친밀도 체크
    chkRelationDegree: function(th, val){
    	var end = false;	//체크 완료
    	var colV = 'pink';
    	for(var i=1; i<=5; i++){
    		
    		$('#relDeg'+i).css('background-color', colV);
    		
    		if(i == val){
    			end = true;
    			colV = 'white';
    			$('#relDegV').val('0000'+i);		//친밀도 세팅
    		}
    	}
    }
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	//fnObj.pageStart();		//화면세팅
	//fnObj.doSearch();		//검색
	//fnObj.setTooltip();
});
</script>