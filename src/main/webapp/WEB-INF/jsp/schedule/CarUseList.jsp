<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css_m/style.css'/>" rel="stylesheet" type="text/css">
		
		<script type="text/javaScript" src="js/sp/synergy_util.js"></script>
		<script type="text/javaScript" src="js/sp/jquery-1.8.2.min.js"></script>
			<script>var contextRoot="${pageContext.request.contextPath}";</script><!-- necessary! to import js files -->	
		<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=2" ></script>
		<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
		<%@ include file="/includeAxisj.jsp" %>
		<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 
		
		<script type="text/javaScript" language="javascript">
			<!--
			top.document.title = "${vo.scheSDate} 차량 사용 리스트";
			
			$(document).ready(function () {
				$(window).load(function() {
					$('#PaddingTable').attr('style', 'padding-top:'+$('#titleArea').height()+'px;');
					BtnSet();
				});
			});

		
			-->
		</script>
	<style type="text/css">
		.subtable{
			font-size: 1.5rem;
		     color: #oooooo;
		  	
		    border-collapse: collapse;
		}
		.form3 {
		    font-size: 1.4rem;
		    color: #oooooo;
		    border-top: #b9c1ce solid 1px;
		    border-bottom: #b9c1ce solid 1px;
		  
		    border-collapse: collapse;
		}

		.form3 .grid_title, .form3_noline .grid_title {
		    border: #b9c1ce solid 1px;
		    font-size:1.2rem;
		   text-align: center;
		    font-weight: bold;
		    background: #d8dce3;;
		    background-position: right bottom;
		  
		}
		.form3 .grid_input_BR, .form3_noline .grid_input_LBR {
		    font-size: 1rem;
		    color: #000000;
		  	border: 1px #e5e5e5 solid;
		  
		    text-align: center;
		}
	
	</style>
	</head>
	
	<body>
		<div id="wrap">
			<div class="containerWrap">
				<section class="contentsWrap">
					<article>
					<form name="CarUseList" id="CarUseList" action="<c:url value='/CarUseList.do'/>" method="post">
					<%--<div class="FixTable _popUpWidth" style="font-size:1.6rem;">
					</div>--%>
						<h3 class="pop_main_title">차량 사용 리스트 (${vo.scheSDate})</h3>
							<table id="title" class="pop_tb_basic" summary="차량사용리스트(차량, 사용자, 운행시간)">
								<caption>차량사용리스트</caption>
								<colgroup>
									<col width="30%" />
									<col width="30%" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr class="Text_C" style="height:2rem;">
										<th scope="col" class="grid_title">차량</th>
										<th scope="col" class="grid_title">사용자</th>
										<th scope="col" class="grid_title">운행시간</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(CarUseList) >0}">
											<c:forEach var="result" items="${CarUseList}" varStatus="status">
											<tr>
												<td class="grid_input_BR" style="width:30%;">${result.carnum}</td>
												<td class="grid_input_BR" style="width:30%;">${result.pernm}</td>
												<td class="grid_input_BR" style="width:*;">${result.stime} ~ ${result.etime}</td>
											</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="nocondata" colspan="3">등록 내역이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</form>
						<div class="btn_pop_basic" >
							<button type="button" class="btn_pop_gray01" onclick="window.close();">닫기</button>
						</div>
					</article>
				</section>
			</div>
	</div>
	</body>
</html>