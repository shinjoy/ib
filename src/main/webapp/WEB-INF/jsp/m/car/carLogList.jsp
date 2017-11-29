<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %>

<style>
.tb_input_basic01 td{font-size:1.1rem;}
.tb_input_basic01 th{font-size:1.1rem;}
</style>
</head>

<body>
<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
	<div id="wrap">
    	<div class="mb_sub_location">
    		<button type="button" class="back" onclick='history.back(-1);'><em>이전</em></button>
    		<a href="#;" class="depth01">차량운행</a><a href="#;" class="depth02"><span id="topTitle">운행일지</span></a>
    	</div>
        <!--서브-->
        <div class="containerWrap"> 
        	<!--서브컨텐츠-->
            <section class="contentsWrap">
                <!--차량로그리스트-->
                <article class="con_pdst01">
                    <h1 class="sub_main_title">차량 운행일지 <div id="carName" style="margin-top:10px; text-align: right;"></div></h1>
                    <table class="tb_list_basic01" id="SGridTarget" summary="운행기록작성" style="margin-top:10px;">
                        <caption>차량 운행일지</caption>
                         <thead>
                        <tr>
                            <th scope="row"><label for="inputUseDate">날짜</label></th>
                        	<th scope="row"><label for="carSelect">사용자</label></th>
                            <th scope="row"><label for="totalDistance">주행전</label></th>
                          	<th scope="row"><label for="IDNAME04">주행후</label></th>
                         	<th scope="row"><label for="IDNAME04">거리</label></th>
                        </tr>
                        </thead>
                         <tbody>
                         </tbody>
                      </table>
                </article>
            </section>
              <!--//서브컨텐츠//-->
            
        </div>
        <!--//서브//-->
        <!--퀵메뉴-->
       	 <%@ include file ="../includeJSP/quickmenu.jsp" %> 
        
        <!--//퀵메뉴//-->
    </div>
</body>
</html>


<script type="text/javascript">



//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();					   // instance		new sjs
	

var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var sabun='${userLoginInfo.sabun}'; 		  //로그인 유저의 사번 
var scheSeq=0;
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------
var carList;
var scheList;
var inputDate;
var worklogId="${workId}";

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
//선로딩코드
	preloadCode: function(){
		
		
	},


	//화면세팅
    pageStart: function(){
    			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//두번째  
    		columnCountForEmpty : 5, 
    		//그리드 컬럼 정보
    		colGroup : [ 
    		{key:"userId",    formatter:function(obj){
							   var styleStr="";
					           if(obj.item.userId==sNb && obj.item.worklogId==worklogId){
					        	   styleStr=' style=" background-color:#e4e8f1;" ';
					           }
					           return styleStr;
			}},
            {key:"startTime", formatter:function(obj){return obj.item.startTime.replace(/-/g, "/").substring(2);}},
            {key:"userNm"},
           	{key:"beMileage", formatter:function(obj){return Number(obj.item.beMileage).toLocaleString();}},
            {key:"afMileage", formatter:function(obj){return Number(obj.item.afMileage).toLocaleString();}},	
            {key:"gap" , formatter:function(obj){return Number(obj.item.afMileage-obj.item.beMileage).toLocaleString();}},
       
            ],
            
            body : {
                onclick: function(obj, e){
                
                }
    		}
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr #[0]>';
    	rowHtmlStr +=	 '<td >#[1]</td>';
    	rowHtmlStr +=	 '<td style="text-align:center;">#[2]</td>';
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[3]</td>';
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[4]  </td>';				
    	rowHtmlStr +=	 '<td style="text-align:right;padding-right:20px!important;">#[5] </td>';	
   		rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
    	$("#beforePage").attr('onclick', '').click(function(){
    		location.href="${pageContext.request.contextPath}/m/car/carRecord.do";
    	});
    	
    	$("#topTitle").html("운행일지");
     
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    	//차량 아이디와 날짜
    	var carId ="${carId}";
    	
    	var url = contextRoot + "/m/car/getCarLogList.do";
    	var param = {
		    			carId	 :carId,
		    			limitCount:10
    				};
    	
    	
    		    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list		//그리드 테이터
							   });
    		$("#carName").html("${carName}");
    	};
    	
    	
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    },//end doSearch
	divShow : function(){
		$("#logListArea").css("display","none");
		$(".firstDiv").css("display","");
	}
   
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();
	fnObj.doSearch();
});
</script>