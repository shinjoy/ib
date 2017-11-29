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

<form name="rgstForm">

	<table class="net_table_apply" summary="공시정보(주주변경) 관련 등록 페이지">
        <caption>
            공시정보
        </caption>
        <colgroup>
        	<col width="110" />
            <col width="610" />
        </colgroup>
        <tbody>
        	<tr>
                <th scope="row"  style="width:100px;"><span class="star">*</span>회사</th>
                <td>
                	<input class="regist" type="hidden" id="AP_cpnId_0" value="${NOTICE.cpnId}"/>
					<a onclick="popUp('0','c')" id="AP_cpnNm_0" class="c_title" title="이름" value="${NOTICE.cpnNm}" }>
					<c:choose>
					<c:when test="${NOTICE.cpnNm !='' && NOTICE.cpnNm ne null}">${NOTICE.cpnNm}</c:when>
					<c:otherwise>회사선택</c:otherwise>
					</c:choose>
					</a>
                </td>
            </tr>
            <tr>                
                <th scope="row"><span class="star">*</span>공시일자</th>
                <td>
                    <input type="text" id="tmDt" value="${NOTICE.tmDt}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>
            </tr>            
            <tr >
                <th scope="row" >채무자</th>
                <td >
                    <input type="text" id="debtor" value="${NOTICE.debtor}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">담보제공자</th>
                <td>
                    <input type="text" id="majorSh" value="${NOTICE.majorSh}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">내역</th>
                <td>
                    <input type="text" id="totalCount" value="${NOTICE.totalCount}" style="ime-mode:active;width:100px;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">채권자(담보권자)</th>
                <td>
                    <input type="text" id="creditor" value="${NOTICE.creditor}" style="ime-mode:active;width:300px;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">담보설정금액</th>
                <td>
                    <input type="text" id="securityAmount" value="${NOTICE.securityAmount}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">담보권종류</th>
                <td>
                    <input type="text" id="securityType" value="${NOTICE.securityType}" style="ime-mode:active;width:300px;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">담보제공주식수</th>
                <td>
                    <input type="text" id="securityShareCnt" value="${NOTICE.securityShareCnt}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">보호예수</th>
                <td>
                    <input type="text" id="keepYn" value="${NOTICE.keepYn}" style="ime-mode:active;width:100px;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">담보제공기간</th>
                <td>
                    <input type="text" id="securityDt" value="${NOTICE.securityDt}" style="ime-mode:active;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            <tr>
                <th scope="row">기타</th>
                <td>
                    <input type="text" id="comment" value="${NOTICE.comment}" style="ime-mode:active;width:500px;" class="applyinput_B w_st01" />
                </td>                    
            </tr>
            
            
            
            <!-- 
            <tr class="point">
                <th scope="row"><label for="cst_nm"><span class="star">*</span>이름</label></th>
                <td><input type="text" id="cst_nm" value="${cstNm}" style="ime-mode:active;" class="applyinput_B w_st01" /></td>                
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
						<!-- 
						
						<div style="float:left;font-size:12px;margin-left:7px;margin-top:5px;margin-right:4px;"><b>관계메모</b></div>
						<div><input type="text" name="relMemo" id="relMemo" style="margin-top:3px;width:270px;" class="applyinput_B w_st01" /></div>
					</span>
                </td>
            </tr>
             -->
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
var mode = '${mode}';						//"new", "view", "update" 
var sNb =  '${NOTICE.sNb}';

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
		var staffListObj = getCodeInfo(null, 'cusId', 'usrNm', null, null, null, '/common/getStaffListNameSort.do');
		
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
    	var url;
    	
    	if( $('#AP_cpnId_0').val() == '' || $('#AP_cpnId_0').val() == null) 
    	{
    		alert('회사정보를 선택해주세요.');
    		return;
    	}
    	
    	if( $('#tmDt').val() == '' || $('#tmDt').val() == null) 
    	{
    		alert('공시일자를 입력해주세요.');
    		return;
    	}
    	
    	if (fnObj.js_DateCheck($('#tmDt').val()) == false) {
    		alert('공시일자 날짜 형식을 확인해주세요.');
    		return;
    	}
    	
    	if( mode == 'edit' ){
    		url = contextRoot + "/work/modifyPublicNoticeSh.do";
    	}
    	else{
    		url = contextRoot + "/work/insertPublicNoticeSh.do";
    	}    		
    	    	
    	var param = {
    		sNb:					sNb
   			,tmDt: 					$('#tmDt').val()
   			,cpnId: 				$('#AP_cpnId_0').val()
   			,debtor: 				$('#debtor').val()			
   			,majorSh: 				$('#majorSh').val()
   			,totalCount: 			$('#totalCount').val()
   			,creditor: 				$('#creditor').val()
   			,securityAmount: 		$('#securityAmount').val()
   			,securityType: 			$('#securityType').val()
   			,securityShareCnt: 		$('#securityShareCnt').val()
   			,keepYn: 				$('#keepYn').val()
   			,securityDt: 			$('#securityDt').val()
   			,comment: 				$('#comment').val()
   			,rgId: 					$("#rgstId").val()
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
		
    },//end doSave
    
    js_DateCheck :function(iDate) {
		if( iDate.length != 10 ) {			
   		    return false;
		}
   		   
		oDate = new Date();
		oDate.setFullYear(iDate.substring(0, 4));
		oDate.setMonth(parseInt(iDate.substring(5, 7)) - 1);
		oDate.setDate(iDate.substring(8));
		if( oDate.getFullYear()     != iDate.substring(0, 4) 
		    || oDate.getMonth() + 1 != iDate.substring(5, 7) 
		    || oDate.getDate()      != iDate.substring(8) ) {			
		  	return false;
		}
		
		return true;
    }

  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	//fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	//fnObj.pageStart();		//화면세팅
	//fnObj.doSearch();		//검색
	//fnObj.setTooltip();
});
</script>