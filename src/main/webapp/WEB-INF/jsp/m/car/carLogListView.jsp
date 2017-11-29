<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
	<div class="con_pdst01">		
		<h2 class="pop_h2_title">${fn:replace(useDate,'-','/')}<em class="blue">${carName}</em></h2>
		<!--서브-->
		<table class="pop_tb_basic2" id="SGridTarget" summary="운행기록작성">
			<caption> 차량 운행일지</caption>
			<colgroup>
				<col width="16%"/>
				<col width="15%"/>
				<col width="23%"/>
				<col width="23%"/>
				<col width="*"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="row">날짜</th>
					<th scope="row">사용자</th>
					<th scope="row">주행 전</th>
					<th scope="row">주행 후</th>
					<th scope="row">거리</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	  	<!--//서브//-->
		<div class="btn_pop_basic">
			<button type="button" class="btn_pop_white01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
		</div>
	</div>
</body>



<script type="text/javascript">



//Global variables :S ---------------

//공통코드

var myGridsub = new SGrid();					   // instance		new sjs
	

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
var subfnObj = {
	
//선로딩코드
	preloadCode: function(){
		
		
	},


	//화면세팅
    pageStart: function(){
    			
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj =  {
	    		
	    		targetID : "SGridTarget",		//두번째  
	    		columnCountForEmpty : 5, 
	    		//그리드 컬럼 정보
	    		colGroup : [ 
	    		{key:"userId",    formatter:function(obj){
								   var styleStr="";
						           if(obj.item.userId==sNb){
						        	   styleStr=' style=" font-weight:bold;" ';
						           }
						           return styleStr;
				}},
	            {key:"startTime", formatter:function(obj){return obj.item.startTime.replace(/-/g, ".").substring(2);}},
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
	    	
    	var rowHtmlStr = '<tr #[0]>';
    	rowHtmlStr +=	 '<td>#[1]</td>';
    	rowHtmlStr +=	 '<td>#[2]</td>';
    	rowHtmlStr +=	 '<td class="txt_right">#[3]</td>';
    	rowHtmlStr +=	 '<td class="txt_right">#[4]</td>';				
    	rowHtmlStr +=	 '<td class="txt_right">#[5]</td>';	
   		rowHtmlStr +=	 '</tr>';
		
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	
    	
    	configObj.rowHtmlStr = rowHtmlStr; 
        myGridsub.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
     
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    	//차량 아이디와 날짜
    	var carId ="${carId}";
    	var selectDay="${useDate}";
    	
    	
    	
    	var url = contextRoot + "/m/car/getCarLogList.do";
    	var param = {
		    			carId	 :carId.length>0 ? carId : '',
		    			limitCount:10
    				};
    	
    	if(selectDay.length > 7) param.selectDay = selectDay;
    	else param.selectMonth = selectDay;
    	   	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		myGridsub.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list		//그리드 테이터
							   });
    	
    	};
    	
    	
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    }//end doSearch
  
 
   
};//end fnObj.

/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
		subfnObj.preloadCode();		//선코딩
		subfnObj.pageStart();
		subfnObj.doSearch();
});
</script>