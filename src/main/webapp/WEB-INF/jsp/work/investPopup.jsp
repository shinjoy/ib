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

<script type="text/JavaScript" src="<c:url value='/js/work.js?ver=0.1'/>" ></script>


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
    border-top: #b9c1ce solid 1px;
    border-left: #b9c1ce solid 0px;
    border-right: #b9c1ce solid 0px;
    border-bottom: #b9c1ce solid 1px;
    width: 100%;
    vertical-align: middle;
    line-height: 16px;
    font-size: 12px;
    letter-spacing: -0.8px;    
    margin-top: 1px;    
}
.net_table_apply thead th {
    background: #dfe3e8;
    font-weight: normal;
    color: #33383f;
    line-height: 1.4;
    padding: 3px 3px 3px;
    text-align: center;
    border-right: #f0f0f0 solid 1px;
    border-bottom: #b1b5ba solid 1px;
    font-size: 13px;
    vertical-align: middle;
    letter-spacing: -0.05em;
    font-family: "돋움";
    font-weight: bold;
}
.net_table_apply tbody th {    
    border-left: #b9c1ce solid 0px;
    border-top: #d8dadd solid 1px;
    background: #fff;    
}
.net_table_apply tbody td {    
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

.title_icon_count {
    padding: 0px 4px 0px 4px;
    border: #c0c5c9 solid 1px;
    border-radius: 2px;
    font-size: 11px!important;
    color: gray;
    vertical-align: middle;
    overflow: hidden;
    display: inline-block;
    margin-right: 0px;
    line-height: 15px;
    font-style: normal;
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
<div style="line-height:5px;">&nbsp;</div>
<span style="padding-left:200px;"><img src="../images/figure/star_y.png" style="width:16px;height:16px;"/> 1-투자불가&nbsp; 2-부정적&nbsp; 3-중립&nbsp; 4-긍정적&nbsp; 5-적극투자</span>
<form name="rgstForm">

	<table id="SGridTarget" class="net_table_apply" summary="인물정보입력(구분,이름,소속회사,부서,직급,연락처,이메일,친밀도,이력 등)">
        <caption>
            투심정보
        </caption>
        <colgroup>
        	<col width="80" />
            <col width="*" />
            <col width="75" />
        </colgroup>
        <thead>
        	<tr>
        		<th scope="col">투심인</th>
        		<th scope="col">내용</th>
        		<th scope="col">등록일</th>
        	</tr>
        </thead>
        <tbody>
        	<%--
        	<tr>
                <th scope="row">분석자명</th>
                <td>
                	<span id="spanCpnNm"></span>
                </td>
            </tr>
             --%>
        </tbody>
    </table>
    <br/>
    
    <%-- =============== 투심종합 ============== --%>
    <div style="padding-left:250px;">
    	<span style="font-family:돋움;font-weight: bold;">종합 : &nbsp; </span><em class="title_icon_count"><i class="axi axi-person"></i><span id="investCnt">0</span></em>
    	&nbsp;&nbsp;
    	<span id="averVal" style="padding-left:10px;font-size:15px;font-weight:bold;"><span id="investAver">0.0</span></span> &nbsp;/<span style="">5</span>
    	
    	
    </div>
    
    <br/>
    
    <!-- 진행중 인 건에대해 투자심의 권한이 있는자('A','M','F') -->
    <c:if test="${param.progressCd == '00001' && (userLoginInfo.reviewLevel eq 'A' || userLoginInfo.reviewLevel eq 'M' || userLoginInfo.reviewLevel eq 'F')}">	
    <table class="net_table_apply" style="background-color:#f9f9f9;border-bottom: #b9c1ce solid 0px;">
    	<%--<thead>
    		<tr style="border-top:#b1b5ba solid 1px;border-bottom:#b9c1ce solid 1px;"><th>입력하기</th></tr>
    	</thead> --%>
        <tbody>
            <tr>
                <td style="border-bottom:#fff dotted 0px!important;">
                	<b>입력하기</b>&nbsp;&nbsp;
                	<input type="hidden" id="chkStar" value="0">
                    <c:forEach var="starC" begin="0" end="4" varStatus="starCS"><img class="hand" id="file${starCS.count}" src="../images/figure/star_g.png" style="width:16px;height:16px;vertical-align:middle;" onmousedown="javascript:slctStar(this);" />
					</c:forEach>
					<%--<span style="padding-left:17px;">( 1-투자불가 2-부정적 3-중립 4-긍정적 5-적극투자 )</span> --%>
                </td>
            </tr>
            <tr>	<%-- style="background-color:#e9edf0;" --%>
                <td style="border-top:#fff dotted 0px!important;">
                    <textarea id="reviewMemo" style="width:670px; height:60px; min-height:60px;" placeholder="투자의견을 입력하세요."></textarea>
                </td>
            </tr>
        </tbody>
    </table>
	
	<div class="table_btnZone"><a href="javascript:fnObj.doSave();"><img src="<c:url value='/images/network/btn_save.gif'/>" alt="저장" /></a></div>
	</c:if>
	
</form>
	
</body>
</html>


<!-- ---------------------------- 분석의견 말풍선 :S --------------------------------- -->
<div id="balloon" style="display:none;position:absolute;width:450px;background-color:#FFF0F0;padding-left:10px;padding-right:10px;padding-top:10px;padding-bottom:10px;border-radius:10px;border:1px solid #CCCCFF;">
<table width="100%">
<tr><td width="100%" bgcolor="#FFF0F0"><span id="balloonCon"></span></td>
	<td width="100%" align="right" valign="top"><a href="javascript:fnObj.hideBalloon();"><i class="axi axi-close2" style="font-size:17px;;"></i></a></td>
</tr>
</table>
</div>
<!-- ---------------------------- 분석의견 말풍선 :E --------------------------------- -->


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
    	
    	<%--
    	<img class="filePosition" id="file${starC}" src="../images/figure/star_y.png" style="width:16px;height:16px;"/>
    	<img class="filePosition" id="file${starC}" src="../images/figure/star_g.png" style="width:16px;height:16px;"/>
    	 --%>
    	
    	 
    	//-------------------------- 그리드 설정 :S ----------------------------
     	/* 그리드 설정정보 */
     	var configObj = {
     		
     		targetID : "SGridTarget",		//그리드의 id
     		
     		//emptyOfList : false,			//빈 데이터 삽입 여부 (empty of list) 디폴드 true
     		
     		//그리드 컬럼 정보
     		colGroup : [    		
             	{key:"staffNm", 	formatter:function(obj){
             							var colorStr = '';
             							if(obj.item.reviewLevel=='M') colorStr = 'FF9944';
             							if(obj.item.reviewLevel=='F') colorStr = 'FF4444';
             							return '<font color="#' + colorStr + '"<i class="axi axi-person"></i></font> ' + obj.value;
             						}
             	},
             	{key:"info",		formatter:function(obj){
										var star = obj.item.review;		//별갯수
										var noStar = 5 - star;			//더미갯수
										
										var starStr = '';
										for(var i=1; i<=5; i++){
											starStr += '<img src="../images/figure/';
											if(i<=star){
												starStr += 'star_y.png';
											}else{
												starStr += 'star_g.png';
											}
											starStr += '" style="width:16px;height:16px;"/>';
										}
										
										var memo = obj.item.reviewMemo;										 
										var memoLen = memo.length;
										
										
										if(obj.item.isDealReview=='N'){		//분석의견 을 불러온 것일때
											memo = memo.substr(0, 35); 
											memo = '<font color="#1111FF">[분석의견]</font> ' + memo;
											if(memoLen > 35){
												memo += '<a href="#" onclick="fnObj.viewMemo(event, ' + obj.index + ');return false;">..<i class="axi axi-pageview" style="color:#9999FF;font-size:14px;"></i></a>';
											}
											
										}else{
											memo = memo.substr(0, 43);
											if(memoLen > 43){
												memo += '<a href="#" onclick="fnObj.viewMemo(event, ' + obj.index + ');return false;">..<i class="axi axi-pageview" style="color:#9999FF;font-size:14px;"></i></a>';
											}
										}
										
										memo = '<span title="' + obj.item.reviewMemo + '">' + memo + '</span>';
										
														//	<span style="color:blue;font-size:10px;">..more</span>
										
             							return starStr + ' ' + memo;		
             						}
             	},
             	{key:"createDt",	formatter:function(obj){
             							return obj.value;
             						}
             	}
             ],
             
             body : {
                 onclick: function(obj, e){
                 	/* ***** obj *****
                 		obj.c 		- column index,
 						obj.index 	- row index,
 						obj.item 	- row data object,
 						obj.list 	- grid data object
                 	*/
                 	
                 }
             }
             
     	};
     	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
     	var rowHtmlStr = '<tr>';
     	rowHtmlStr +=	 '<th scope="row" style="text-align:center;border-right: #f0f0f0 solid 1px;">#[0]</th>';	//		<td class="checkinput"><label>#[0]<em>선택</em></label></td>';
     	rowHtmlStr +=	 '<td style="padding: 5px 8px 5px 7px!important;">#[1]</td>';
     	rowHtmlStr +=	 '<td style="font-size:11px;font-family:명조;">#[2]</td>';
     	rowHtmlStr +=	 '</tr>';
     	configObj.rowHtmlStr = rowHtmlStr; 
        
     	/*
     	<tr>
                <th scope="row">분석자명</th>
                <td>
                	<span id="spanCpnNm"></span>
                </td>
            </tr>
     	*/
     	
     	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
     	//-------------------------- 그리드 설정 :E ----------------------------
    	 
    	
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
    setInvestInfo: function(){
    	
    	//----------------------------- 투자심의 정보 세팅 :S ---------------------------------
    	var url = contextRoot + "/work/getInvestInfo.do";
    	var param = {
    			offerSnb: '${param.sNb}'
    	};
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		
    		if(obj.result == "SUCCESS"){
				
    			//////////////// 화면 세팅 /////////////////
    			
    			myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
					list: list		//그리드 테이터
					//,page: pageObj	//페이징 데이터
				});
				
				//전체 건수 세팅
				//$('#total_count').html(cnt);

				
				//---- 투심종합 :S -----
				$('#investCnt').html(cnt);			//투심인 수
				var sum = 0;
				for(var i=0; i<list.length; i++){
					sum += 1 * list[i].review;
				}
				var avr = (cnt > 0 ? '' + (Math.round(sum/cnt * 10) / 10) : '0.0');
				$('#investAver').html(avr);		//투심 평균 (소숫점 1자리 반올림)
				//---- 투심종합 :E -----
				
				
				parent.myModal.resize();		//화면 리사이징.
				
    		}else{
    			//alertMsg();
    		}
    		
    	};
    	
    	commonAjax("POST", url, param, callback);
    	//----------------------------- 투자심의 정보 세팅 :E ---------------------------------
    	
    	
    },
    
    
    //분석의견 full 보기
    viewMemo: function(e, idx){
    	$('#balloon').show();
    	$('#balloonCon').html(myGrid.getList()[idx].reviewMemo);
    	$('#balloon').offset({left:15,top:e.pageY + 15});
    	
    	parent.myModal.resize();		//화면 리사이징.
    },
    
    
  	//저장
    doSave: function(){
    	
    	var chkStar = $('#chkStar'); 
		if(isEmpty(chkStar.val()) || chkStar.val() == 0){		//별점 평가
			alert("별점을 입력하세요!");			
			return;
		}
    	
    	var reviewMemo = $('#reviewMemo');
    	if(isEmpty(reviewMemo.val())){			//투자의견
			alert("투자의견을 입력하세요!");
			reviewMemo.focus();
			return;
		}
    	
    	
		
		//---------- 투자심의 등록
		
		if(confirm("등록 하시겠습니까?")){
		
			var url = contextRoot + "/work/regMyInvest.do";
	    	var param = {
	    			sNb: '${param.sNb}',
	    			chkStar: chkStar.val(),
	    			reviewMemo: reviewMemo.val()
	    	};
	    	
	    	var callback = function(result){
	    		
	    		var obj = JSON.parse(result);
        		
        		var rsltObj = obj.resultObject;	//결과
        		
        		if(obj.result == "SUCCESS"){
        			
        			//parent.myModal.close();
        			
        			//parent.toast.push("등록 되었습니다!");
        			location.reload();
        			toast.push("등록 되었습니다!");
        			parent.location.reload();
        			
        		}else{
        			//alertMsg();
        		}
        		
        	};
	    	
	    	commonAjax("POST", url, param, callback);
		}//if
		
    },//end doSave
    
    
    //투심의견 말풍선 숨기기
    hideBalloon : function(){
    	$('#balloon').hide();
    }
       
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//공통코드 or 각종선로딩코드
	fnObj.pageStart();			//화면세팅
	fnObj.setInvestInfo();		//투심정보 검색 세팅
	//fnObj.setTooltip();
});
</script>