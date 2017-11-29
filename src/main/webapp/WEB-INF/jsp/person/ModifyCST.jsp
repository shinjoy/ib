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
<title>인물수정</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>


<base target="_self">
</head>
<body>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<form id="personName" name="personName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="cstNm">
</form>
<form id="modifyCst" name="modifyCst" action="<c:url value='/person/modifyCst.do' />" method="post">
	<input type="hidden" id="m_Name" name="sNb">
</form>
<script>
if(${empty cstList}) {
	$("#m_Name").val(Request('snb'));
	$("#modifyCst").submit();
};

// 고객 수정페이지 정보 수정후 저장 클릭시
/* $(document).on("click",".modiCst_btnOk", function(){
	var cateCd = 0;
	var snb   = $('#cstSnb');
	var cstNm = $('#cst_nm');
	var cpnId = $('#AP_cpnId_0');
	var pst   = $('#position');
	var email = $('#email');
	var phn1   = $('#phn_1');
	var phn2   = $('#phn_2');
	var phn3   = $('#phn_3');
	
	var i = 1;
	$('input[class=categoryCd]').each(function(){
		if($('input[class=categoryCd]:checked').length!=0 && this.checked)
			cateCd+=parseInt($('#categoryCd'+i).val());
		i++;
	});
	if(cstNm.val().is_null()){
		alert("이름을 입력하세요.");
		cstNm.focus();
		return;
	}
	if(pst.val().is_null()){
		alert("직급을 입력하세요.");
		pst.focus();
		return;
	}
	if(email.val().is_null()){
		alert("email을 입력하세요.");
		email.focus();
		return;
	}
	if(phn1.val().is_null()){
		alert("전화번호를 입력하세요.");
		phn1.focus();
		return;
	}

	
	if(!isPhoneNumberSimple(phn1.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
		phn1.focus();
		phn1.css('background-color','#A9F5BC');
		alert("유효한 전화번호를 입력하세요.");return;
	}
	if(!phn2.val().is_null() && !isPhoneNumberSimple(phn2.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
		phn2.focus();
		phn2.css('background-color','#A9F5BC');
		alert("유효한 전화번호를 입력하세요.");return;
	}
	if(!phn3.val().is_null() && !isPhoneNumberSimple(phn3.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
		phn3.focus();
		phn3.css('background-color','#A9F5BC');
		alert("유효한 전화번호를 입력하세요.");return;
	}
	
	
	if(confirm("적용하시겠습니까?")){
		$.ajax({
			type:"POST",        //POST GET
			url:"../person/updateCst.do",     //PAGEURL
			data : ({
				sNb: snb.val(),
				categoryPSCd: "0000"+cateCd,
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
				rVal.f = Request('f');
				rVal.snb = snb.val();
				rVal.nm = cstNm.val();

				if("modifyCstPopUp" == $('#choose_popMain').val()){
					if(cpnId.val().is_null()) {
						alert("회사를 선택하지 않으셨습니다.");
						return;
					} else {
						if (window.opener) window.opener.returnPopUp(rVal);
						window.close();
					}
				}
			},
			error: function whenError(x,e){    //ERROR FUNCTION
				ajaxErrorAlert(x,e);
			}
		});
	}
}); */
</script>

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


<input type="hidden" id="choose_popMain" value="${choose_popMain}">


<form name="rgstForm">


	<section>
		<article>
		<c:forEach var="cst" items="${cstList}">
		<input type="hidden" id="cstSnb" value="${cst.sNb}"/>
			<table class="net_table_apply">
				<colgroup>
		          <col width="24%">
		          <col width="*">
	       		</colgroup>
        		<tbody>
					<tr style="display:none;">
						<th scope="row"><span class="star">*</span>인물구분</th>
						<td>
							<input class="categoryCd" type="checkbox" id="categoryCd1" value="1" <c:if test="${cst.categoryPSCd == '00001' || cst.categoryPSCd == '00003'}">checked</c:if>/> <label for="categoryCd1">심사역</label>
							<input class="categoryCd" type="checkbox" id="categoryCd2" value="2" <c:if test="${cst.categoryPSCd == '00002' || cst.categoryPSCd == '00003'}">checked</c:if>/> <label for="categoryCd2">운용인재</label>
						</td>
					</tr>
					<tr  class="point"> 
						<th scope="row"><span class="star">*</span>인물구분</th>
						<td>
							<span id="cstRadioTag"></span>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="cst_nm"><span class="star">*</span>이름</label></th>
						<td><input type="text" id="cst_nm" class="applyinput_B w_st01" value="${cst.cstNm}"/></td>
					</tr>
					<tr>
						<th scope="row">회사</th>
						<td>
							<input type="hidden" id="AP_cpnId_0" value="${cst.cpnId }"/>
							<a onclick="popUp('0','c')" id="AP_cpnNm_0" class="c_title" title="회사선택"><c:if test="${empty cst.cpnNm}">회사선택</c:if>${cst.cpnNm}</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="IDName05"><span class="star">*</span>직급</label></th>
						<td><input type="text" id="position" value="${cst.position}" class="applyinput_B w_st01" /></td>
					</tr>
					<tr>
						<th cscope="row"><label for="email"><span class="star">*</span>e-mail</label></th>
						<td><input type="text" id="email" value="${cst.email}" class="applyinput_B w_st01"/></td>
					</tr>
					<tr>
						<th scope="row"><label for="phn_1"><span class="star">*</span>휴대전화</label></th>
						<td><input type="text" id="phn_1" class="applyinput_B w_st01" value="${cst.phn1}" style="<c:if test="${userLoginInfo.staffSnb ne cst.managerId and userLoginInfo.permission lt '00017' and userLoginInfo.permission ne '00014'}">display:none</c:if>" /></td>
					</tr>
					<tr>
						<th scope="row"><label for="phn_2">직통전화</label></th>
						<td><input type="text" id="phn_2" class="applyinput_B w_st01" value="${cst.phn2}" /></td>
					</tr>
					<tr>
						<th scope="row"><label for="phn_3">내선전화</label></th>
						<td><input type="text" id="phn_3" class="applyinput_B w_st01" value="${cst.phn3}" /></td>
					</tr>
				</tbody>
			</table>
			<div class="table_btnZone">
				<a href="javascript:fnObj.doSave();"><img src="<c:url value='/images/network/btn_save.gif'/>" alt="저장" /></a>
			</div>
		</c:forEach>
		</article>
	</section>
	
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
		var cstRadioTag = createRadioTag('rdCstType', comCodeCstType, 'CD', 'NM', '${cstList[0].categoryPSCd}', 15, 5, null);	//'fnObj.clickRdBudget(this);');//radio tag creator 함수 호출 (common.js)		
		$("#cstRadioTag").html(cstRadioTag);
		
		
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
    	
    	var cateCd = 0;
    	var snb   = $('#cstSnb');
    	var cstNm = $('#cst_nm');
    	var cpnId = $('#AP_cpnId_0');
    	var pst   = $('#position');
    	var email = $('#email');
    	var phn1   = $('#phn_1');
    	var phn2   = $('#phn_2');
    	var phn3   = $('#phn_3');
    	var cpnNm = $('#AP_cpnNm_0').text();//수정시 회사명 text 형태로 가져온다. 
    	
    	/* var i = 1;
    	$('input[class=categoryCd]').each(function(){
    		if($('input[class=categoryCd]:checked').length!=0 && this.checked)
    			cateCd+=parseInt($('#categoryCd'+i).val());
    		i++;
    	}); */
    	
    	var cstType = $('input:radio[name=rdCstType]:checked').val();	//document.rgstForm.rdCstType;	//.value;
    	if(isEmpty(cstType)){		//인물구분
			alert("인물구분을 입력하세요!");
			return;
		}
    	
    	if(cstNm.val().is_null()){
    		alert("이름을 입력하세요.");
    		cstNm.focus();
    		return;
    	}
    	/*if(cpnId.val().is_null()){
    		alert("회사를 선택하세요.");
    		cpnId.focus();
    		return;
    	}*/
    	if(pst.val().is_null()){
    		alert("직급을 입력하세요.");
    		pst.focus();
    		return;
    	}
    	if(email.val().is_null()){
    		alert("email을 입력하세요.");
    		email.focus();
    		return;
    	}
    	if(phn1.val().is_null()){
    		alert("전화번호를 입력하세요.");
    		phn1.focus();
    		return;
    	}

    	/* 
    	if(!isPhoneNumberSimple(phn1.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
    		phn1.focus();
    		phn1.css('background-color','#A9F5BC');
    		alert("유효한 전화번호를 입력하세요.");return;
    	} */
    	if(!phn2.val().is_null() && !isPhoneNumberSimple(phn2.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
    		phn2.focus();
    		phn2.css('background-color','#A9F5BC');
    		alert("유효한 전화번호를 입력하세요.");return;
    	}
    	if(!phn3.val().is_null() && !isPhoneNumberSimple(phn3.val())){		//전화번호로 유효한지 (숫자와 - 만 체크하는 약식체크)
    		phn3.focus();
    		phn3.css('background-color','#A9F5BC');
    		alert("유효한 전화번호를 입력하세요.");return;
    	}
    
    	if(confirm("적용하시겠습니까?")){
    		$.ajax({
    			type:"POST",        //POST GET
    			url:"../person/updateCst.do",     //PAGEURL
    			data : ({
    				sNb: snb.val(),
    				//categoryPSCd: "0000"+cateCd,
    				categoryPSCd: cstType,				//인물구분 
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
    				rVal.f = Request('f');
    				rVal.snb = snb.val();
    				rVal.nm = cstNm.val();
    				rVal.cpnNm = cpnNm; //수정시 회사명 
    				rVal.cpnId = cpnId.val(); //아이디값
    			
    				if("modifyCstPopUp" == $('#choose_popMain').val()){
    					if(cpnId.val().is_null()) {
    						alert("회사를 선택하지 않으셨습니다.");
    						return;
    					} else {
    						if (window.opener) window.opener.returnPopUp(rVal);
    						window.close();
    					}
    				}
    			},
    			error: function whenError(x,e){    //ERROR FUNCTION
    				ajaxErrorAlert(x,e);
    			}
    		});
    	}
    	
    },//end doSave
    
    
    
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