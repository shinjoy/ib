<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>소모품내역</title>
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<script type="text/javascript">

</script>
<style type="text/css">
.btn_div{
	margin: 20px 5px 20px 5px;
	text-align:center;
}
.btn_div .btn_span{
	 display:inline-block;
}

.btn_standard{
	border-radius:2px;
	padding:5px 20px 5px 20px;
	margin-left:7px;
}
.net_table_apply thead tr th{
	background:#eef1fb;
	border-right:#b9c1ce solid 1px;
}
.net_table_apply td{
	border-right:#b9c1ce solid 1px;
}
</style> 

</head>

<body>
	<div style="margin:20px 30px;">
		<div><font style="font-size:20px;font-weight:bold;">*소모품내역</font></div>
		<table id="SGridTarget" class="net_table_apply"  style="margin-top:5px;" summary="지출등록">
		<colgroup>
             <col width="120" />  	<!--소모품명-->                            
             <col width="50" /> 	<!--수량-->
             <col width="80" /> 	<!--단가-->
             <col width="100" /> 	<!--총금액-->
		</colgroup>
		<thead>
		   <tr id="tblHeaderPart" style="height:25px;">
		   		<th>소모품명</th>
		   		<th>수량</th>
		   		<th>단가</th>
		   		<th>총 금액</th>
		   </tr>
		</thead>     
		<tbody></tbody>
		</table>
		<table class="net_table_apply" summary="지출등록">
		<colgroup>
             <col width="120" /> 	<!--항목-->
             <col width="80" /> 	<!--금액-->
		</colgroup>
		<tbody>
			<tr>
				<td style="text-align:right;border-right:1px solid #ccc7c7;background:#d7d8dc;" colspan="3"><b>합계</b></td>
				<td style="text-align:right;"><div id="totalPrice" style="font-weight:bold;"></div></td>
			</tr>
		</tbody>
		</table>
        <div class="btn_div">
			<span class="btn_span">
				<button name="reg_btn" class="btn_standard" onclick="window.close();" style=" border:1px solid #a0a1a5; background-color:#f1f1f1;">닫기</button>
			</span>
		</div>
    </div>
	</div>
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();		// instance		new sjs

var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division='${userLoginInfo.division}';
var cardSnb='${cardSnb}';					  		  //지출 시퀀스
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)

//Global variables :E ---------------

var mroList ;
var cardObj = {};
/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		
	},
	//화면세팅
    pageStart: function(){
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"mroName" },																		//항목이름
            {key:"qty",formatter:function(obj){return Number(obj.item.qty).toLocaleString();}},     //수량       																//수량
            {key:"price", formatter:function(obj){return Number(obj.item.price).toLocaleString();}},//단가
            {key:"rowTotal", formatter:function(obj){
            									  var total = obj.item.price*obj.item.qty;		
            									  return Number(total).toLocaleString();}}			//개당 총 금액
            ],
            
            body : {
               
            }
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr class="excelContentRow">';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[0]</td>';				//항목이름
    	rowHtmlStr +=	 '<td style="text-align:center;">#[1]</td>';				//수량
    	rowHtmlStr +=	 '<td style="text-align:right;">#[2] 원</td>';				//단가
    	rowHtmlStr +=	 '<td style="text-align:right;">#[3] 원</td>';				//개당 총 금액
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    },//end pageStart.
    //검색
    doSearch: function(){ 
    	var url = contextRoot + "/card/getCardDetail.do";
    	var param = {sNb : cardSnb};
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var mroList = obj.mroList;
    		var cardObj = obj.card;
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
				list: mroList					//그리드 테이터
			});
			g_gridListStr = result;				//따로 전역변수에 넣어둔다
    		$("#totalPrice").html(Number(cardObj.price).toLocaleString()+' 원');
			
    	};
    	commonAjax("POST", url, param, callback, false, null, null);
    },//end doSearch
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//선코딩
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch();		//화면세팅
});




</script>