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
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->

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

input {
    font-family: 맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;
    font-size: 11px;
    border: 1px solid gray;
    border-radius: 2px;
    /* background: #F8F8F8; */
}

textarea {
    border: 1px solid gray;
    border-radius: 2px;
    font-family:맑은 고딕, Trebuchet MS, Verdana, Geneva, sans-serif;
}

select {
	border:1px solid gray!important;
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
        	<col width="80" />
            <col width="690" />
        </colgroup>
        <tbody>
        	<tr>
                <th scope="row"><span class="star">*</span>종목</th>
                <td>
                	<span id="spanCpnNm"></span>
                </td>
            </tr>
            <tr>
                <th scope="row"><span class="star">*</span>유형</th>
                <td>
                    <span id="cateSelectTag"></span>
                </td>
                    
            </tr>
            <tr>
                <th scope="row"><span class="star">*</span>딜제안자</th>
                <td>
                    <span id="spanRegNm"></span>&nbsp;&nbsp;&nbsp;<font color=silver>(딜 등록자)</font>
                </td>
                    
            </tr>
            <tr>
                <th scope="row"><span class="star">*</span>중개인</th>
                <td>
                	<input type="hidden" id="AP_cstId_0">
                	<span class="btn s blue">
                	<a onclick="popUp('_0','p')" id="AP_cstNm_0" class="c_title" title="이름">인물선택</a></span></nobr>
                </td>
                
                <%--<input type="text" id="cst_nm" value="${cstNm}" style="ime-mode:active;" class="applyinput_B w_st01" /></td> --%>                
            </tr>
            <tr>
                <th scope="row">규모</th>
                <td>
                    <input id="dealPrice" style="width: 70px; text-align: right;">
                </td>
                    
            </tr>
            <tr>
                <th scope="row">내용</th>
                <td>
                    <textarea id="memo" style="width: 720px; height: 250px;"></textarea>
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
		comCodeCateType = getCommonCode('00005', null, 'CD', 'NM', '', '-유형선택-');		//고객구분('00013') 공통코드 (Sync ajax)
		
		//'optionValue','optionText' 프로퍼티를 생성하며 값으로 CD, NM 의 값 할당
		//this.addComCodeArray(comCodeMenuType);
		var colorObj = {};
		var cateSelectTag = createSelectTag('selCategory', comCodeCateType, 'CD', 'NM', '${param.category}', null, colorObj, '');	//'fnObj.clickRdBudget(this);');//radio tag creator 함수 호출 (common.js)		
		$("#cateSelectTag").html(cateSelectTag);
		
		
		//페이지크기 세팅
		//fnObj.setPageSize();
	},
	
	
	//화면세팅
    pageStart: function(){
    	
    	$('#spanCpnNm').html('${param.cpnNm}');		//종목
    	$('#spanRegNm').html('${param.regNm}');		//딜제안자
    	$('#dealPrice').val('${param.price}');		//규모
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//저장
    doSave: function(){
    	
    	var category = $('#selCategory'); 
		if(isEmpty(category.val())){		//유형 (CB, EB, BW, ...)
			alert("유형을 입력하세요!");
			category.focus();
			return;
		}
    	
    	var cstId = $('#AP_cstId_0');
    	if(isEmpty(cstId.val())){			//중개인
			alert("중개인을 입력하세요!");
			return;
		}
    	
    	
    	var dealPrice = $('#dealPrice').val();
    	var memo = $('#memo').val();
    	
    	
		
		//---------- 딜 등록
		
		if(confirm("등록 하시겠습니까?")){
		
			var url = contextRoot + "/recommend/regPropDeal.do";
	    	var param = {
	    			sNb: '${param.oriSnb}',
	    			category: category.val(),
	    			cstId: cstId.val(),
	    			dealPrice: dealPrice,
	    			memo: memo
	    	};
	    	
	    	var callback = function(result){
	    		
	    		var obj = JSON.parse(result);
        		
        		var rsltObj = obj.resultObject;	//결과수
        		
        		if(obj.result == "SUCCESS"){
        			
        			//alertM("등록 되었습니다.");
        			parent.myModal.close();
        			
        			parent.location.reload();
        			
        			parent.toast.push("등록 되었습니다!");
        			
        		}else{
        			//alertMsg();
        		}
        		
        	};
	    	
	    	commonAjax("POST", url, param, callback);
		}//if
		
    }//end doSave
    
    
   
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	//fnObj.doSearch();		//검색
	//fnObj.setTooltip();
});
</script>