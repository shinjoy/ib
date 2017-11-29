<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
	<div class="con_pdst01">
		<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
		<h2 class="pop_h2_title">${fn:replace(searchDate,'-','/')}</h2>	
		<table class="pop_tb_basic" id="SGridTarget" summary="운행기록작성">
			<caption>차량 운행일지</caption>
			<colgroup>
				<col width="25%"/>
				<col width="25%"/>
				<col width="*"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="row">차량명</th>
					<th scope="row">사용자</th>
					<th scope="row">사용시간</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(CarUseList) >0}">
						<c:forEach var="result" items="${CarUseList}" varStatus="status">
							<tr>
								<td class="valign contxt_line grid_input_BR"><span class="icon_carNum">${result.carnum}</span></td>
								<td class="valign contxt_line grid_input_BR"><span class="car_user">${result.pernm}</span></td>
								<td class="valign contxt_line grid_input_BR"><span class="usetime">${result.stime} ~ ${result.etime}</span></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="nocondata" colspan="3">예약된 차량이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	  	<!--//서브//-->
		<div class="btn_pop_basic">
			<button type="button" class="btn_pop_white01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
		</div>
	</div>
</body>
</html>

</script>