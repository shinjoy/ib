<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	
 <div class="con_pdst01">
	
	<div class="con_pdst03 section_to_review">
	    <span class="title">${cpnNm}</span>
		
		<div class="etc_box">
		<span id="investPointArea" class="mediation total"></span>
		<span id="investPeronCntArea" class="mediation report">${personCnt}</span>
		</div>
	</div>
	
	<div class="con_pdst00 review pa0 he_70"> 
 
	<table class="pop_tb_basic " id="dealOpinionTb" summary="회사등록(구분, 코드, 회사명)">
		<caption>투자심의</caption>
		<colgroup>
	        <col width="20%">
	        <col width="*">
	        <col width="25%">
        </colgroup>
       	<thead>
        	<tr>
        		<th>투심인</th>
        		<th>분석의견</th>
        		<th>등록일</th>
        	</tr>
        </thead>  
		<tbody class=""></tbody>
	</table>
	
   </div>
   
    <div class="btn_pop_basic">
		<button type="button"  class="btn_pop_gray01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
	</div>
	
 </div> 


<script type="text/javascript">


var dealOpinionObj = {
	

	//선로딩코드
	preloadCode: function(){
		
		
	},
	
	//화면세팅
    pageStart : function(){
    	
    	
    	
    },
    
    doSearch : function(){
    	
    	var url = contextRoot + "/work/getInvestInfo.do";
    	var param = {
    			offerSnb: '${searchDealOpinionSnb}'
    	};
    	
    	var callback = function(result){
    		
			var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON	
    		
    		var str ='';
    		
    		for(var i=0; i<list.length; i++){
    			str +='<tr>';
    			str +='<td>'+list[i].staffNm+'</td>';
    			str +='<td>'
    			
    			if(list[i].review != null){ 
    				
    				var  starlength =parseInt(list[i].review);
    				 //if (list[0].offerCd =='00004')   {
    					
    					str += '<ul class="small_relationGrade">';
    					for( var k=0 ; k < starlength ; k++){
    						
    						str +='<li><a href="javascript:;" name="important" class="on"><em>+1</em></a></li>';
    					}
    					
    					for( var k=0 ; k < 5-starlength ; k++){
    						
    						str +='<li><a href="javascript:;" name="important" ><em>+1</em></a></li>';
    					}
    					str += '</ul>';
    				//}
    			}
    			
    			
    			str +='<p class="reviewtext">'+list[i].reviewMemo+'</p></td>';
    			str +='<td>'+(list[i].createDt).replace(/-/gi,'/')+'</td>';
    			str +='</tr>';
    		}
    		
    		
    		
    		$("#dealOpinionTb tbody").html(str);
    		
    		//---- 투심종합 :S -----
			
			var sum = 0;
			for(var i=0; i<list.length; i++){
				sum += 1 * list[i].review;
			}
			
			var avrTxtArr = ['','투자불가','부정적','중립','긍정적','적극투자'];
			var avrClassArr = ['','poi_color05','poi_color04','poi_color03','poi_color02','poi_color01'];
			
			var avr = (cnt > 0 ?  (Math.round(sum/cnt * 10) / 10) : 0.0);
			var avrTxt = avrTxtArr[parseInt(avr)];
			var avrClassTxt = avrClassArr[parseInt(avr)];
			
			$('#investPointArea').html('총점 <em class="'+avrClassTxt+'">'+avr.toFixed(1) + '('+avrTxt+')'+'</em>');		//투심 평균 (소숫점 1자리 반올림)
			//---- 투심종합 :E -----
    		
    	};
    	
    	commonAjax("POST", url, param, callback);
    	
    }
    
    
};


$(function(){
	
	dealOpinionObj.preloadCode();
	dealOpinionObj.pageStart();
	dealOpinionObj.doSearch();
	
});

</script>
