<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">

<style>
label {
    padding-right: 7px;
}
.btn_bg{
	background-color: #efefef;
	padding-bottom: 3px;
	padding-left:12px;
	padding-right:12px;
	border: solid 1px gray;
}
</style>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js'/>" ></script><!-- 20160108 -->
<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script><!-- jquery , ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/html5.js"></script>

<script>
$(document).ready(function(){
	$('#cst_nm').focus();
	
	$('#AP_cpnId_0').change(function(){alert('hi');});
	
});
function clkPosition(txt){
	if(txt=='ceo'){
		$("#position").val('대표이사');
	}else{
		$("#chkCeo").removeAttr('checked');
		$("#position").val('');
	}
}


//20160115
//부서 콤보박스 선택
function changeCpnPart(th){
	if(th.value=='new'){
		$('#cpnPart').attr('disabled', false);
		$('#cpnPart').focus();
		$('#cpnPart').css('border-color','gray');
	}else{
		$('#cpnPart').attr('disabled', true);
		$('#cpnPart').val('');
		$('#cpnPart').css('border-color','#EFEFEF');
	}
}

//회사 선택을 했을때 부서 선택 콤보박스 세팅
function cpnPartEnable(){
	
	//var cpnId = $('#cpnPart').val();
	var cpnId = $('#AP_cpnId_0').val();
	
	var url = contextRoot + "/person/getCpnDeptList.do";
	var param = {
			cpnId: cpnId,			//화면 모드 mode : "new", "update"
	}
	var callback = function(result){
			
		//부서선택 콤보박스 활성화
		$('#selCpnPart').removeAttr('disabled');
		$('#selCpnPart').focus();
		
		
		var obj = JSON.parse(result);
				
		var cnt = obj.resultVal;		//결과수
		var list = obj.resultList;		//결과데이터JSON

		/*
		SELECT COMPANY_ID	as cpnSnb
			  ,DEPT_CODE	as deptCd
		      ,KOR_NAME		as deptNm
		*/
		
		//부서 콤보박스에 반영
		var optionHtml = '';
		optionHtml += '<option value="">선택</option>';
		optionHtml += '<option value="new">직접입력</option>';
		optionHtml += '<option value="none" style="background-color:#eeeeee;">NONE</option>';
		for(var i=0; i<list.length; i++){
			optionHtml += '<option value="' + list[i].deptCd + '" style="background-color:#ffeeee;">' + list[i].deptNm + '</option>';
		}		
		$('#selCpnPart').html(optionHtml);
		
	};
	
	commonAjax("POST", url, param, callback);
	
}

</script>
</head>
<base target="_self">
<body>

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<form id="searchCst" name="searchCst" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="nameSearch" name="cstNm">
</form>

<form id="personLeft" name="personLeft" action="<c:url value='/person/selectLeft.do' />" method="post"></form>
<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
<input type="hidden" id="tmpTak" value="${page}">
<input type="hidden" id="cst_snb" value="">
<input type="hidden" id="rtn" value="">
<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>

<%-- 노트 추가 --%>
	<div id="cloneDiv">
		<div class="popUpMenu title_area" id="addNotePr0" name="textR">
			<p class="closePopUpMenu" name="textR">ⅹ닫기</p>
			<ul>
				<li class="c_title"><input type="text" class="m_note" id="txt0" placeholder="이력/정보 제목"/></li>
				<li><textarea id="resultarea0" placeholder="이력/정보사항.."></textarea></li>
			</ul>
			<p class="bsnsR_btn">
				<span class="<%-- nt_btnOk --%>cloneOk btn s green"><a><spring:message code="button.save" /></a></span>&nbsp;&nbsp;&nbsp;
				<!-- <span class="dealResult_btnDel">완전삭제</span> -->
			</p>
		
		</div>
	</div>
<%-- 노트 추가 --%>

	<header>
	</header>
	<section>
		<article>
			<table class="t_skin04">
				<tr>
					<th class="tbColor inputLine" width="120px">인물구분</th>
					<td>
						<input class="categoryCd" type="checkbox" id="categoryCd1" value="1"> <label for="categoryCd1">심사역</label>
						<input class="categoryCd" type="checkbox" id="categoryCd2" value="2"> <label for="categoryCd2">운용인재</label>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">인맥구분 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<span style="margin:0px 0px 0px 5px;display:inline-block;line-height: 150%;">
							<c:forEach var="cm" items="${cmmCdNet}" varStatus="cmS">
								<label><input type="radio" name="rdoS" value="${cm.dTailCd}" align="absmiddle"/>${cm.cdNm}</label>
								<%--<c:if test="${cmS.count==5}"><br/></c:if> --%>
							</c:forEach>
						</span>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">이름 <font style="color:red;font-weight:bold">*</font></th>
					<td><input class="regist" type="text" id="cst_nm" value="${cstNm}" style="ime-mode:active;" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">회사 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input class="regist" type="hidden" id="AP_cpnId_0" value="${workVO.cpnId }" />
						<a onclick="popUp('0','c')" id="AP_cpnNm_0" class="btn_bg c_title" title="이름">&nbsp;회사선택&nbsp;</a>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">부서 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<select class="work-1stSelect" id="selCpnPart" onchange="changeCpnPart(this);" style="border-color:gray;" disabled="true" >
							<option value="">선택</option>
							<option value="new">직접입력</option>
						</select>
					
						<input class="regist" type="text" id="cpnPart" style="ime-mode:active;width:150px;border-color:#EFEFEF;" disabled="true" />
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">직급 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<SMALL>※ "CEO, 대표, 대표이사" 등의 직급은 모두 <font color="orangered">"대표이사"</font> 선택, 나머지 직급은 직접 입력해주세요.</SMALL><br/>
						<label><input type="radio" id="chkCeo" onclick="clkPosition('ceo');"> 대표이사</label> | 
						<input class="regist" type="text" id="position" onclick="clkPosition();" style="ime-mode:active;" />
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">email <font style="color:red;font-weight:bold">*</font></th>
					<td><input class="regist" type="text" id="email" style="ime-mode:inactive;" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">휴대전화 <font style="color:red;font-weight:bold">*</font></th>
					<td><input class="regist" type="text" id="phn_1" />
						<label><input type="checkbox" id="exposure"/>감추기</label>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">직통전화</th>
					<td><input class="regist" type="text" id="phn_2" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">내선전화</th>
					<td><input class="regist" type="text" id="phn_3" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">메모</th>
					<td><input class="regist" type="text" id="memo" style="width:450px;" /></td>
				</tr>
<!-- 
				<tr>
					<th class="tbColor inputLine">이력/정보</th>
					<td>
						<span id="cloneSpan1">
							<p id="info0" name="infoInfo"></p>
						</span>
						<span class="btn s blue" >
							<a class="addNote1" id="addNote_0">이력/정보 추가</a>
						</span>
					</td>
				</tr><tr>
					<th class="tbColor inputLine">네트워크</th>
					<td>
						<span id="cloneSpan2">
							<p id="ntwk0" name="ntwk"></p>
						</span>
						<span class="btn s blue" >
							<a href="" id="addNtw" onclick="popUp('_0','DD','cstNm','sNb'); return false;">네트워크 추가</a>
						</span>
					</td>
				</tr>
 -->				
				<tr>
					<td colspan="4">
					<p class="bsnsR_btn">
						<span class="newCst_btnOk btn s green"><a><spring:message code="button.save" /></a></span>
					</p>
					</td>
				</tr>

			
			</table>
				<!-- <div>※ <b>이력/정보추가 버튼</b>과 <b>네트워크 추가 버튼</b>을 누르게 되면 <br/>&nbsp;&nbsp;&nbsp;자동으로 상단에 입력한 내용이 저장됩니다.</div> -->
		</article>
	</section>
</body>
</html>