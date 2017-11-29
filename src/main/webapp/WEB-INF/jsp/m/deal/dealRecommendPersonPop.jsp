<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
	<div class="con_pdst01">
		
		<table class="pop_tb_basic" id="recommendPersonTb" summary="운행기록작성">
			<caption>분석자 지정</caption>
			<colgroup>
				<col width="25%"/>
				<col width="*"/>
				<col width="35%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="row">추천인</th>
					<th scope="row">내용</th>
					<th scope="row">등록일</th>
				</tr>
			</thead>
			<tbody id="recommendPersonTbArea"></tbody>
		</table>
	  	<!--//서브//-->
		<div class="btn_pop_basic">
			<button type="button" class="btn_pop_white01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
		</div>
	</div>
</body>
</html>

<script>


var dealRecommedPersonObj = {
		
	//선로딩코드
	preloadCode : function(){
		
	},
	
	doSearch : function(){
		
		var url = contextRoot + "/m/deal/getRecommendList.do";		//limit 1 걸려있음.
		
		var param = {
				
				cpnId	: $("#dealCompanyId").val(),
		}
		
	
		var callback = function(result){
			
			var obj = JSON.parse(result);
			var list = obj.resultList;
			
			var str ='';
			if(list.length > 0){
				
				for(var i=0; i<list.length; i++){
					
					var info = list[i];
					str +='<tr onclick="dealRecommedPersonObj.recommendResult('+info.sNb+',\''+info.rgNm+'\');">';
					str +='<td>'+info.rgNm+'</td>';
					str +='<td>'+info.memo+'</td>';
					str +='<td>'+(info.tmDt).replace(/-/gi,'/')+'</td>';
					
					
					str +='</tr>';
				}
				
			}else{
				str +='<tr><td colspan="3">추천 목록이 없습니다.</td></tr>';
			}
			
			$("#recommendPersonTb tbody").html(str); 
		};
		
		commonAjax("POST", url, param, callback, false); 
		
		
	},
	
	//추천인 선택
	recommendResult : function(sNb,name){
		
		$("#dealRecommendId").val(sNb);
		$("#dealRecommendInput").html(name);
		$('.modal-close-btn').trigger('click');
		
	}
	
	
	
};


$(function(){
	
	dealRecommedPersonObj.preloadCode();
	dealRecommedPersonObj.doSearch();
	
});




</script>