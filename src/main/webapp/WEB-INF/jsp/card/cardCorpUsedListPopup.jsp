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
<title>법인카드 사용내역 미등록건</title>

<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">

<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/ibB.ico' />" rel="shortcut icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>



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
html{
	height:98%;
}
.net_table_apply th{
    border-right: #b9c1ce solid 1px;
    border-bottom: #b9c1ce solid 1px;
}
.net_table_apply thead tr{
	height : 30px;
	text-align:center;
	background:#dfe3e8;
	border-right: #b9c1ce solid 1px;
}
.net_table_apply td{
    border-right: #b9c1ce solid 1px;
}
#container{
	margin:30px 30px;
}

#container .searchbox{
	float:left;
	margin-top:25px;
	margin-bottom:7px;
	
}
#container .searchButton{
	float:right;
	margin-top:20px;
	margin-bottom:5px;
}
</style> 

</head>

<body>
	<div id="container">
		<div><font style="font-size:20px;font-weight:bold;">법인카드 사용내역 미등록건</font></div>
		<div class="searchbox">			
			<!-- <button name="reg_btn" onclick="fnObj.doSearch();" style="margin-left:5px;padding:5px 20px 5px 20px; border:1px solid #bbbfce;border-radius:2px; background-color:#f1f1f1;">검색</button> -->
		</div>
		<table id="SGridTarget" class="net_table_apply" summary="법인카드 사용내역 미등록건">
		       <caption>
		          법인카드 사용내역 미등록건
		       </caption>
		       <colgroup>
		       		<col width="8%" /> 	<!-- 시퀀스	-->
                    <col width="30%" /> <!-- 일자	-->
                    <col width="35%" /> <!-- 사용처	-->    
               		<col width="20%" /> <!-- 금액	-->
               		<col width="20%" /> <!-- 상태	-->
               </colgroup>
                <thead>
               	 <tr>
           	 		<th>번호</th>
         		 	<th>사용일자</th>
         		 	<th>사용처</th>
         		 	<th>금액</th>
         		 	<th>상태</th>
                 </tr>
              </thead>
		       <tbody>		           
		       </tbody>
		</table>
	   <!--페이징-->
        <div class="memoPageZone">
            <div class="fl_block">
             	<!-- 페이지 목록 -->
                 <div class="btnPageZone" id="btnPageZone">
                     <button type="button" class="pre_end_btn"><em>맨처음 페이지</em></button>
                     <button type="button" class="pre_btn"><em>이전 페이지</em></button>
                     <button type="button" class="next_btn"><em>다음 페이지</em></button>
                     <button type="button" class="next_end_btn"><em>맨마지막 페이지</em></button>
                 </div>
                 <!--/ 페이지 목록 /-->
            </div>
         </div>
       <!--//페이징//-->
    </div>
	</div>
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs

var curPageNo = 1;				//현재페이지번호
var pageSize = 15;				//페이지크기(상수 설정)

var usrId='${param.usrId}'; 		//로그인 유저의 usrId
var g_gridListStr;					//그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	//화면세팅
    pageStart: function(){
    			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	 var configObj = {
    		
    		targetID : "SGridTarget",		//테이블아이디
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            {key:"rnum", formatter:function(obj)
            	{
            		return obj.index+1;
            	}
            },
            {key:"tmDt"},
            {key:"placeName"},
            {key:"approvalCost", formatter:function(obj)
            	{
            		return Number(obj.item.approvalCost).toLocaleString()+'원';
            	}
            },	//금액	
            {key:"statusFlag", formatter:function(obj)
            	{
         		return obj.item.statusFlag=='N'?'미등록':'등록완료';
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

                	window.opener.goMenuCardCorp();
               		window.close();
                }
            }
            
    	};	
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr style="cursor:pointer">';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[0]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[1]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[2]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[3] </td>';				
    	rowHtmlStr +=	 '<td style="text-align:center;">#[4] </td>';	
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj); 
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
    	//-------------------------- 페이징 설정 :S ----------------------------
    	 
    	myPaging.setConfig({				//페이징 설정정보 세팅
    		
			targetID		: "btnPageZone",		//대상 페이징 id ... <div>
			pageSize		: pageSize,				//global variable value 
			
			preEndBtnClass	: 'pre_end_btn',		//맨처음 페이지 	버튼 클래스명
			preBtnClass		: 'pre_btn',			//이전 페이지		버튼 
			nextBtnClass	: 'next_btn',			//다음 페이지		버튼 
			nextEndBtnClass	: 'next_end_btn',		//맨마지막 페이지	버튼 클래스명
			
			curPageNoClass	: 'current',			//현재페이지를 표시해주기위한 style Class name
			clickFnName		: 'fnObj.doSearch'		//페이지 이동 함수명(버튼 클릭)
			
    	});
    	
    	//-------------------------- 페이징 설정 :E ----------------------------
    },//end pageStart.
        
    //검색
    doSearch: function(page){    	
    	
    	if(page==null) page=1;	//현재 페이지 초기값 세팅
    	var url = contextRoot + "/card/getCardCorpUsedList.do";    	
    	var param = {
    					corpNum 		: '',					//법인사업자번호
    					statusFlag		: 'N',					//처리여부 Y:등록완료, N:미등록
    					approvalYn 		: 'Y',					//카드승인여부 Y:승인, N:미승인/취소    					
    					usrId 			: usrId,    					
    				};
    	    	    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		curPageNo = obj.pageNo;			//현재페이지세팅(global variable)    		
    		
    		var pageObj = {						//페이징 데이터
					pageNo : curPageNo,
					pageSize : pageSize,
					pageCount: obj.pageCount
				};
    		
    		myPaging.setPaging(pageObj);		//페이징 데이터 세팅	*** 1 ***
    		
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list,		//그리드 테이터
								page: pageObj	//페이징 데이터
    						});
    		
    		g_gridListStr = result;				//따로 전역변수에 넣어둔다
    	};
    	
    
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    },//end doSearch
    

};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		fnObj.pageStart();		//화면세팅		
		fnObj.doSearch();
});

</script>