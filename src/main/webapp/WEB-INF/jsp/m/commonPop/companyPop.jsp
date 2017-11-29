<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javaScript">
	 
 $(document).ready(function () {
	getPagingList('',1,'0','');
	
 });
	 
</script>
	
	
<div id="wrap" class="fixedTop">
 	
 	<!--고정서브navi-->
 	<div class="sub_fixWrap intaglio" style="z-index: 10;">
		<div class="mb_pop_location">
			<span>회사선택</span>
			<c:choose>
				<c:when test="${MDf eq 'c'}">	<!-- 회사팝업일때만 닫기 -->
					<a href="javascript:closeBottomBox('searchCompanyPop','onlyCompany','second');" class="btn_left" >닫기</button>
				</c:when>
				<c:otherwise>
					<a href="javascript:closeInnerBox('regPersonArea','searchCompanyInnerArea');" class="btn_left" >취소</button>
				</c:otherwise>
			</c:choose>
			
			<a href="javascript:commonPopAllObj.registPerCom('c');" class="btn_right">신규등록</a>
		</div>
	</div>

	
	<div id="onlyCompany" class="scrollArea schedulewrap con_pdst01">
		<div class="netpeople_srch mgb1rem mgt05rem">
			<input type="hidden"  id="modalFlag" value="${MDf}">
			<input type="text" placeholder="회사명 검색" id="nameSearch2" title="회사명 검색" onkeyup="getPagingList('',1,0,'');">
		</div>
		<div id="searchCompany"></div>
		<div class="btn_pop_basic">
			<c:choose>
				<c:when test="${MDf eq 'c'}">	<!-- 회사팝업일때만 닫기 -->
					<button type="button"  class="btn_pop_gray01" onclick="closeBottomBox('searchCompanyPop','onlyCompany','second');" id="companyPopCanBtn">닫기</button>
				</c:when>
				<c:otherwise>
					<button type="button"  class="btn_pop_gray01" onclick="closeInnerBox('regPersonArea','searchCompanyInnerArea');" id="companyPopCanBtn">취소</button>
				</c:otherwise>
			</c:choose>
			<button type="button"  class="btn_pop_white01" onclick="commonPopAllObj.registPerCom('c');">신규등록</button>
		</div>
	</div>
</div>	

</html>
