<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script type="text/javaScript">
	$(document).ready(function (){
		getPagingList('',1,'0','iP');
	});	
</script>
<style>

</style>	
<input type="hidden" id="personlistCnt">
		
	<div id="wrap" class="fixedTop">
	 	<!--고정서브navi-->
	 	<div class="sub_fixWrap intaglio" style="z-index: 10;">
			<div class="mb_pop_location">
				<span>인물선택</span>
				<a href="javascript:closeBottomBox('searchPersonPop','onlyCompany','second');" class="btn_left">닫기</a>
				<a href="javascript:commonPopAllObj.registPerCom('iP','','');" class="btn_right">신규등록</a>
			</div>
		</div>	
		<div class="scrollArea schedulewrap con_pdst01">
			<div class="netpeople_srch mgb1rem mgt05rem">
				<input type="text" placeholder="인물명 검색" id="nameSearch" title="인물명 검색" onkeyup="getPagingList('',1,0,'iP');"/>
			</div>
			<div id="searchPerson"></div>
			<div class="btn_pop_basic">
            	<button type="button" class="btn_pop_gray01" onclick="closeBottomBox('searchPersonPop','onlyCompany','second');"  id="personPopCanBtn">닫기</button>
                <button type="button" id="regBtn" class="btn_pop_white01" onclick="commonPopAllObj.registPerCom('iP','','');">신규등록</button>
           </div>
		</div>		
	</div>	
