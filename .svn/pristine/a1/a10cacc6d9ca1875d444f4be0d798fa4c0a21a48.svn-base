<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<!-- 업무일지 -->	
<script type="text/JavaScript" src="<c:url value='/js/jquery-ui.js'/>" ></script>
<script>
$("#closeTab").mousedown(function(){
	$("#tbl00").draggable();
});

function insertInvestment(th){
	var obj = $(th).parent().parent();
	data = {
			sNb: $('#ivmSnb').val()
			,invest_cpn_snb: $('#cst_snb').val()
			,cpn_snb: obj.find('[id^=AP_CpnSnb]').val()
			,cst_snb: obj.find('[id^=AP_cstId]').val()
			,category: $('#categoryCd').val()
			,price: $('#price').val()
			,comment: obj.find('textarea').val()
			,rgId: $("#rgstId").val()
	}
	,url = "<c:url value='/company/insertInvestment.do'/>"
	,fn = function(arg){
		$("#offerDiv").html('');
		re_fresh();
	};
	ajaxModule(data,url,fn);
}
function deleteInvestment(){
	var data = {sNb: $('#ivmSnb').val()}
	, url = "<c:url value='/company/deleteInvestment.do'/>"
	, fn = function(){
		$("#offerDiv").html('');
		re_fresh();
	}
	ajaxModule(data,url,fn);
}
</script>
<style>
.popUpMenu #closeTab{
	margin: 0;
	text-align: right;
	
	background-color: #323232;
    border-bottom: 1px solid hsl(0, 0%, 95%);
    color: hsl(0, 0%, 100%);
	border-radius: 4px 4px 0 0;
    font-weight: bold;
    padding: 7px 12px 7px 15px;
    position: relative;
}
</style>
<div class="popUpMenu" style="width:460px;" id="tbl00">
	<p id="closeTab" name="textR"><span class="closePopUpMenu" onclick="javascript:if(typeof(closePopUpMenu)=='function') closePopUpMenu(this);" title="닫기">ⅹ닫기</span></p>
	<table class="t_skinR00" style="width:100%">
		<caption>
			<col width="50">
			<col width="">
		</caption>
		<c:forEach var="ivm" items="${investMentList}" varStatus="ivmS">
		<input type="hidden" id="ivmSnb" value="${ivm.sNb}"/>
		<thead>
		<tr>
			<th style="border-radius:0px;">투자</br>물건</th>
			<input type="hidden" id="AP_cpnId_0" value="0"/>
			<input type="hidden" id="AP_CpnSnb_0" value="${ivm.cpnSnb}"/>
			<td style="border-radius:0px;">
				<span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('0','c')" id="AP_cpnNm_0">
				<c:choose><c:when test="${empty investMentList}">선택</c:when>
				<c:otherwise>${ivm.cpnNm}</c:otherwise></c:choose>
				</span>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">담당자</th>
			<input type="hidden" id="AP_cstId_0" value="${ivm.cstSnb0 }"/>
			<td style="border-radius:0px;">
				<span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('_0','p')" id="AP_cstNm_0">
				<c:choose><c:when test="${empty investMentList}">선택</c:when>
				<c:otherwise>${ivm.cstNm}</c:otherwise></c:choose>
				</span>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">유 형</th>
			<td>
				<select id='categoryCd' style="margin-left: 5px;">
					<option value="">-유형선택-</option><c:forEach var="cmmCd" items="${cmmCdCategoryList}">
					<option value="${cmmCd.dTailCd}"<c:if test="${cmmCd.dTailCd eq ivm.category}"> selected</c:if>>${cmmCd.cdNm}</option></c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">규 모</th>
			<td>&nbsp;<input type="text" id="price" value="${ivm.price}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea style="width:95%;margin:0px 0px 0px 5px;border:1px solid lightgray;font-size:11px;">${ivm.comment}</textarea></td>
		</tr>
		</thead>
		</c:forEach>
		<c:if test="${empty investMentList}">
		<thead>
		<tr>
			<th style="border-radius:0px;">투자</br>물건</th>
			<input type="hidden" id="AP_cpnId_0" value="0"/>
			<input type="hidden" id="AP_CpnSnb_0" value="0"/>
			<td style="border-radius:0px;">
				<span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('0','c')" id="AP_cpnNm_0">선택</span>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">담당자</th>
			<input type="hidden" id="AP_cstId_0" value="0"/>
			<td style="border-radius:0px;">
				<span class="btn s glass" style="margin:0px 0px 0px 5px;" onclick="popUp('_0','p')" id="AP_cstNm_0">선택</span>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">유 형</th>
			<td>
				<select id='categoryCd' style="margin-left: 5px;">
					<option value="" selected>-유형선택-</option><c:forEach var="cmmCd" items="${cmmCdCategoryList}">
					<option value="${cmmCd.dTailCd}">${cmmCd.cdNm}</option></c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th style="border-radius:0px;">규 모</th>
			<td>&nbsp;<input type="text" id="price" value=""/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea style="width:95%;margin:0px 0px 0px 5px;border:1px solid lightgray;font-size:11px;"></textarea></td>
		</tr>
		</thead>
		</c:if>
	</table>
	<p class="cent" style="margin:3px 0px;">
		<span class="btn s green" onclick="javascript:insertInvestment(this);"><a>저장</a></span>
		<c:if test="${not empty investMentList}"><span class="btn s red" onclick="javascript:deleteInvestment();"><a>삭제</a></span></c:if>
	</p>
</div>