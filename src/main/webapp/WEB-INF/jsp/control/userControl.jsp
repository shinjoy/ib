<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/html5.js'/>"></script>
<script src="<c:url value='/js/jquery.min.js'/>" type="text/JavaScript" ></script>
<script src="<c:url value='/js/base.js'/>" type="text/JavaScript" ></script>
<script>
$(document).ready(function(){

});
function sortTable(flag){
	if(flag == 'total') $("#total").val(flag);
	else $("#sorting").val(flag);
	document.modifyRec.submit();
}
function kyPsrtCd(th){
	var obj = $(th)
	  , TD1st = obj.parent().parent();
	TD1st.addClass('bgRed');
}
function changePmsn(th){
	var obj = $(th)
	  , TD1st = obj.parent().parent();
	TD1st.addClass('bgRed');
	obj.removeClass();
	obj.addClass('bgP'+obj.val());
	//obj.parent().find('input').val(obj.val());
}
function changeOffice(th){
	var obj = $(th)
	  , TD1st = obj.parent().parent();
	TD1st.addClass('bgRed');
	obj.removeClass();
	//obj.parent().find('input').val(obj.val());
}
function reSetPw(snb){
	var DATA = {sNb: snb}
	  , url = "../control/reSetPw.do"
	  , fn = function(){ 
		alert("로그인 비밀번호가 '1234'로 초기화되었습니다.");
		document.modifyRec.submit();
	};
	ajaxModule(DATA,url,fn);
}
function setResign(snb){
	var DATA = {sNb: snb}
	  , url = "../control/setResign.do"
	  , fn = function(){ 
		alert("퇴사 처리되었습니다.");
		document.modifyRec.submit();
	};
	ajaxModule(DATA,url,fn);
}

//저장
function saveStaffInfo(snb){
	
	var DATA = {
		 sNb   			: $('input[name=sNb' + snb + ']').val()
		,usrNm 			: $('input[name=usrNm' + snb + ']').val()
		,position 		: $('select[name=position' + snb + ']').val()
		,division 		: $('select[name=division' + snb + ']').val()
		,usrId			: $('input[name=usrId' + snb + ']').val()
		,office			: $('select[name=office' + snb + ']').val()
		,srtCd			: $('input[name=srtCd' + snb + ']').val()
		,statSeq		: $('input[name=statSeq' + snb + ']').val()
		,permission		: $('select[name=permission' + snb + ']').val()
		,cstId			: $('input[name=cstId' + snb + ']').val()
		,deptId			: $('select[name=dept' + snb + ']').val()
		
		,reviewLevel	: $('select[name=reviewLevel' + snb + ']').val()
		,analYn			: $('select[name=analYn' + snb + ']').val()
		,preStaff		: $('select[name=preStaff' + snb + ']').val()
		,preStaffCd		: $('input[name=preStaffCd' + snb + ']').val()
		,mezzL			: $('select[name=mezzL' + snb + ']').val()
		,mezzN			: $('select[name=mezzN' + snb + ']').val()
		
	};
	
	var url = "../control/modifyStaffInfo.do";
	var fn = function(){
			alert(" '"+DATA.usrNm+"' 의 정보가 수정되었습니다.");
			document.modifyRec.submit();
		};
	
	ajaxModule(DATA,url,fn);
}
function saveStaffInfo0000000000(th){
	var obj = $(th)
	  , inputLeng = obj.parent().parent().find('input').length
	  , input = obj.parent().parent()
	  , snb = 0, usrNm = '', usrId = '', office = '', srtCd = '', permission = '', cstId = '';
	
	for(var i=0;i<inputLeng;i++){
		var inputCur = input.find('input:eq('+i+')');
		// alert("i="+i+";input="+inputCur.val());
		switch(i){
		case 0: snb 		= inputCur.val(); break;
		case 1: usrNm 		= inputCur.val(); break;
		case 2: usrId 		= inputCur.val(); break;
		case 3: office 		= inputCur.val(); break;
		case 4: srtCd 		= inputCur.val(); break;
		case 5: permission 	= inputCur.val(); break;
		case 6: cstId 		= inputCur.val(); break;
		default: break;
		}
	}
	var DATA = {
		sNb: snb
		,usrNm: usrNm
		,usrId: usrId
		,office: office
		,srtCd: srtCd
		,permission: permission
		,cstId: cstId
	}
	  , url = "../control/modifyStaffInfo.do"
	  , fn = function(){ 
		alert(" '"+usrNm+"' 의 정보가 수정되었습니다.");
		document.modifyRec.submit();
	};
	ajaxModule(DATA,url,fn);
}
function updateSabun(th){
	var obj = $(th).parent().parent().find('input:eq(1)');
	var data = {usrNm:obj.val()}
		, url = "../control/updateIBstaffwithInside.do"
		, fn = function(){
		alert(" '"+obj.val()+"' 의 정보가 수정되었습니다.");
		document.modifyRec.submit();
	};
	ajaxModule(data,url,fn);
}
function saveStaff(th){
	var obj = $(th).parent().parent()
	, name = obj.find('input[name*=usrNm]')
	, id = obj.find('input[name*=usrId]')
	, phn = obj.find('input[name*=phn1]')
	;
	obj.find('input').removeClass();
	if( name.val().is_null() ){
		name.addClass('bgRed');
		name.focus();
		alert("이름을 입력하세요.");
		return;
	}
	else if( id.val().is_null() ){
		id.addClass('bgRed');
		id.focus();
		alert("id을 입력하세요.");
		return;
	}
	else if( phn.val().is_null() ){
		phn.addClass('bgRed');
		phn.focus();
		alert("휴대폰을 입력하세요.");
		return;
	}
		
	document.addStaff.submit();
	
}

</script>
<style>
p{font-size:11px;}
tbody tr td,thead tr th{padding:2px !important;}
input,select{border: 1px dotted #F08080;width: 100%;height: 100%;}
tbody tr:hover{background-color: moccasin !important;}
.bgP00001{background-color: silver !important;}
.bgP00005{background-color: #BBBBFF !important;}
.bgP00013,.bgP00014{background-color: yellowgreen !important;}
.bgP00015{background-color: #D0DAB1 !important;}
.bgP00016{background-color: #F0DAF1 !important;}
.bgP00017{background-color: #70d6f9 !important;}
.bgP00020{background-color: khaki !important;}
.bgP00021{background-color:#ff9999!important;}
/* .bgP00011{background-color: steelblue !important;} */
/*.bgS00001,.bgS00002,.bgS00003,.bgS00004,.bgS00005,.bgS00006,.bgS00007,.bgS00008,.bgS00009,.bgS00010,
.bgS00011,.bgS00012,.bgS00013,.bgS00014,.bgS00015,.bgS00016,.bgS00017,.bgS00018,.bgS00019,.bgS00020,
.bgS00021{background-color: peachpuff !important;}*/
.bgS201{background-color: silver !important;}
.bgS00000{background-color: silver !important;}
.bgS10000{background-color: gray !important;}

.bgDivSYNERGY{background-color:#efe4c6!important;}

.nameDInput{text-align: center;width:40px;}
.cpnDInput{text-align: center;width:55px;}
.companyNameInput{text-align: center;width:70px;}
.addTableTitle{width:50px;display:inline-block;}
.addStf{width:250px;}
.addStf ul{
	padding: 7px;
	margin: 0;
	list-style: none; /* ul 점 없애기 */
}

.width120{
	width:120px;
}
.width200{
	width:200px;
}

.bgSY{background-color:#c6efed!important;}


</style>
</head>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<body>
	<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">
	<form name="modifyRec" method="post" action="<c:url value='/control/userControl.do' />"><input type="hidden" id="sorting" name="sort_t"/></form>
	
	<form name="addStaff" method="post" action="<c:url value='/control/insertStaff.do' />">
	<div class="popUpMenu addStf" id="addStaff">
		<p class="closePopUpMenu" name="textR" title="닫기">ⅹ닫기</p>
		<ul>
			<li class="c_title"><span class="addTableTitle cent">이&nbsp;&nbsp;름</span>: <input type="text" name="usrNm" style="width:140px;"/></li>
			<li class="c_title"><span class="addTableTitle cent">I&nbsp;&nbsp;&nbsp;&nbsp;D</span>: <input type="text" name="usrId" style="width:140px;"/></li>
			<li class="c_title"><span class="addTableTitle cent">소&nbsp;&nbsp;속</span>:
				<select name="office" style="width:145px;">
					<option value="">선택</option>
					<!-- <option value="1">파트너스</option>
					<option value="2">투자자문</option>
					<option value="3">IB투자</option>
					<option value="4">벤처투자</option> -->
					<c:forEach	items="${companyList}" var="item">
						<option value="${item.hqId}">${item.hqName}</option>
					</c:forEach>
				</select>
			</li>
			<li class="c_title"><span class="addTableTitle cent">직&nbsp;&nbsp;급</span>: <input type="text" name="position" style="width:140px;"/></li>
			<li class="c_title"><span class="addTableTitle cent">휴대폰</span>: <input type="text" name="phn1" onKeyPress="return numbersonly(event, false);" maxlength="11" style="width:140px;"/></li>
			<li class="c_title"><span class="addTableTitle cent">권&nbsp;&nbsp;한</span>:
				<select name="permission" style="width:145px;">
					<option value="00001" <c:if test="${stf.permission=='00001'}">selected</c:if>>외부</option>
					<option value="00005" <c:if test="${stf.permission=='00005'}">selected</c:if>>자회사_일반</option>
					<option value="00011" <c:if test="${stf.permission=='00011'}">selected</c:if>>일반</option>
					<option value="00012" <c:if test="${stf.permission=='00012'}">selected</c:if>>분석</option>
					<option value="00013" <c:if test="${stf.permission=='00013'}">selected</c:if>>딜상태변경</option>
					<option value="00014" <c:if test="${stf.permission=='00014'}">selected</c:if>>딜코멘트</option>
					<option value="00015" <c:if test="${stf.permission=='00015'}">selected</c:if>>인사</option>
					<option value="00016" <c:if test="${stf.permission=='00016'}">selected</c:if>>총무</option>
					<option value="00017" <c:if test="${stf.permission=='00017'}">selected</c:if>>CRM매니저</option>
					<option value="00020" <c:if test="${stf.permission=='00020'}">selected</c:if>>관리</option>
				<c:if test="${userLoginInfo.permission > '00020'}">	<option value="00021" <c:if test="${stf.permission=='00021'}">selected</c:if>>개발</option></c:if>
				</select>
			</li>
			<li class="bsnsR_btn">
				<span class="btn s green" onclick="saveStaff(this);"><a>저장</a></span>&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
	</div></form>
	
	<section>
		<article>
		<div class="fixed-top" style="z-index:10;">
			<div><c:if test="${userLoginInfo.permission > '00020'}">
				<span class="btn s blue" onclick="view('addStaff',this)"><a>직원추가</a></span></c:if>
				<span class="btn s black"><a onclick="javascirpt:if($('.bgS').css('display')!='none') $('.bgS').css('display','none'); else $('.bgS').css('display','');">퇴사가리기</a></span>
			</div>
			<table class="t_skinR00" style="width:100%;margin-top:5px;padding-right:5px;">
				
				<colgroup>
					<col width="50"/> 	<!-- snb -->
					<col width="70"/> 	<!-- 직원ID -->
					<col width="75"/> 	<!-- 이름 -->
					<col width="100"/> 	<!-- 직급 -->	
					<col width="85"/> 	<!-- 권한 -->
					<col width="50"/> 	<!-- srt_cd -->
					<col width="50"/> 	<!-- stat_seq -->
					<col width="100"/>	<!--  부서 -->
					<col width="70"/> 	<!-- division -->
					<col width="110"/> 	<!-- 소속 -->
					<col width="90"/> 	<!-- 휴대폰 -->
					<col width="60"/> 	<!-- 인물 -->
					<col width="80"/> 	<!-- 투심인 -->
					<col width="50"/> 	<!-- 분석자 -->
					<col width="50"/> 	<!-- 직원직전권한 -->
					<col width="50"/> 	<!-- 직원직전 코드 -->
					<col width="65"/> 	<!-- 메자닌보기 상장 -->
					<col width="65"/> 	<!-- 메자닌보기 비상장 -->
					<col width="50"/> 	<!-- 저장버튼 -->
					<col width="160"/> 	<!-- 사번 -->
					<col width="160"/> 	<!-- pw -->
					<col width="60"/> 	<!-- PASS계정 -->
				</colgroup>
				
				
				
				
				<thead>
					<tr>
 						<th rowspan="" onclick="sortTable()" class="hand bgYlw nameD">S_NB<br/>▼</th>
 						<th rowspan="" class="bgYlw cpnD">직원ID</th>
 						<th rowspan="" onclick="sortTable(1)" class="hand bgYlw companyName">USR_NM<br/>▼</th>
 						<th rowspan="" class="hand bgYlw companyName" style="width:65px;">POSITIOIN</th>
 						<th rowspan="" onclick="sortTable(3)" class="hand bgYlw " title="PERMISSION" style="width:100px;">권한<br/>▼</th>
 						<c:if test="${userLoginInfo.permission > '00020'}">
 						<th rowspan="" onclick="sortTable(2)" class="hand bgYlw nameD">SRT_CD<br/>▼</th> 						
 						</c:if>
 						<th rowspan="" class="hand bgYlw nameD">STAT<br/>_SEQ</th>
 						<th rowspan="" onclick="sortTable(5)" class="hand bgYlw companyName" title="부서(팀)">부서(팀)<br/>▼</th>
 						<th rowspan="" onclick="sortTable(6)" class="hand bgYlw companyName" style="width:80px;" title="DIVISION">DIVISION<br/>▼</th>
 						<th rowspan="" onclick="sortTable(4)" class="hand bgYlw companyName" title="소속">소속<br/>▼</th>
 						<th rowspan="" class="bgYlw companyName">휴대폰</th>
 						<%-- <th rowspan="" onclick="sortTable(2)" class="hand bgYlw nameD">구분<br/>▼</th> --%>
 						
 						<th rowspan="" class="bgYlw cpnD">인물ID</th>
 						
 						<th rowspan="" class="bgYlw ">투심인</th>
 						<th rowspan="" class="bgYlw ">분석자</th>
 						<th rowspan="" class="bgYlw ">직원전<br/>권한</th>
 						<th rowspan="" class="bgYlw ">직원전<br/>코드</th>
 						<th rowspan="" class="bgYlw ">메자닌보기<br/>(상장)</th>
 						<th rowspan="" class="bgYlw ">메자닌보기<br/>(비상장)</th>
 						
 						<th rowspan="" class="bgYlw nameD"></th>
 						
 						
 						<th rowspan="" class="bgYlw">SABUN</th>
 						
 						
 						<c:if test="${userLoginInfo.permission > '00020'}">
 						
	 						
	 						<th rowspan="" class="bgYlw ">USR_PW</th>
	 					</c:if>
 						
 						
						<th rowspan="" class="bgYlw">PASS계정</th>
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
				
			</table>
		</div>
		<div style="padding-top:63px;">
			<form name="insertCard" id="insertCard" method="post">
	
			<table class="t_skinR00" style="width:100%">
				<colgroup>
					<col width="50"/> 	<!-- snb -->
					<col width="70"/> 	<!-- 직원ID -->
					<col width="75"/> 	<!-- 이름 -->
					<col width="100"/> 	<!-- 직급 -->	
					<col width="85"/> 	<!-- 권한 -->
					<col width="50"/> 	<!-- srt_cd -->
					<col width="50"/> 	<!-- stat_seq -->
					<col width="100"/>	<!--  부서 -->
					<col width="70"/> 	<!-- division -->
					<col width="110"/> 	<!-- 소속 -->
					<col width="90"/> 	<!-- 휴대폰 -->
					<col width="60"/> 	<!-- 인물 -->
					<col width="80"/> 	<!-- 투심인 -->
					<col width="50"/> 	<!-- 분석자 -->
					<col width="50"/> 	<!-- 직원직전권한여부 -->
					<col width="50"/> 	<!-- 직원직전 코드 -->
					<col width="65"/> 	<!-- 메자닌보기 상장 -->
					<col width="65"/> 	<!-- 메자닌보기 비상장 -->
					<col width="50"/> 	<!-- 저장버튼 -->
					<col width="160"/> 	<!-- 사번 -->
					<col width="160"/> 	<!-- pw -->
					<col width="60"/> 	<!-- 기타 -->
				</colgroup>
				
				
				<tbody>
					<c:forEach var="stf" items="${staffList}" varStatus="stfS">
					<tr <c:if test="${stf.srtCd=='10000'}">class="bgS" style="display:none;"</c:if>>
						<input type="hidden" name="sNb${stf.sNb}" value="${stf.sNb}"/>
						<td class="cent nameD">${stf.sNb}</td>
						<td class="cent cpnD"><input type="text" class="cpnDInput" name="usrId${stf.sNb}" value="${stf.usrId}"/></td>
						<td class="cent companyName"><input type="text" class="companyNameInput" name="usrNm${stf.sNb}" value="${stf.usrNm}"/></td>
						<td class="cent companyName" style="width:65px;">
							<%-- <input type="text" class="companyNameInput" style="text-align:left;padding-left:3px;width:70px;" name="position${stf.sNb}" value="${stf.position}"/> --%>
							<select name="position${stf.sNb}" <c:if test="${stf.positionCd eq null or stf.positionCd eq ''}">style="background:silver;"</c:if>>
								<option value="" style="background:silver;">선택</option>
								<c:forEach var="pstn" items="${positionList}" varStatus="pS">
									<option value="${pstn.positionCd}" <c:if test="${stf.positionCd eq pstn.positionCd}">selected</c:if>>${pstn.positionNm}</option>								
								</c:forEach>
							</select>
						</td>
						<td class="cent " style="width:100px;">
							<select name="permission${stf.sNb}" class="bgP${stf.permission}" onchange="changePmsn(this);" <c:if test="${userLoginInfo.permission < stf.permission}">disabled</c:if>>
								<option value="00001" <c:if test="${stf.permission=='00001'}">selected</c:if>>외부</option>
								<option value="00005" <c:if test="${stf.permission=='00005'}">selected</c:if>>자회사_일반</option>
								<option value="00011" <c:if test="${stf.permission=='00011'}">selected</c:if>>일반</option>
								<option value="00012" <c:if test="${stf.permission=='00012'}">selected</c:if>>분석</option>
								<option value="00013" <c:if test="${stf.permission=='00013'}">selected</c:if>>딜상태변경</option>
								<option value="00014" <c:if test="${stf.permission=='00014'}">selected</c:if>>딜코멘트</option>
								<option value="00015" <c:if test="${stf.permission=='00015'}">selected</c:if>>인사</option>
								<option value="00016" <c:if test="${stf.permission=='00016'}">selected</c:if>>총무</option>
								<option value="00017" <c:if test="${stf.permission=='00017'}">selected</c:if>>CRM매니저</option>
								<option value="00020" <c:if test="${stf.permission=='00020'}">selected</c:if>>관리</option>
								<option value="00021" <c:if test="${stf.permission=='00021'}">selected</c:if>>개발</option>
							</select>
						</td>
						
						<c:if test="${userLoginInfo.permission < '00021'}"><input type="hidden" name="srtCd${stf.sNb}" value="${stf.srtCd}"/></c:if>
						<c:if test="${userLoginInfo.permission > '00020'}"><td class="cent nameD"><input type="text" class="nameDInput bgS${stf.srtCd}" name="srtCd${stf.sNb}" value="${stf.srtCd}" onKeyPress="kyPsrtCd(this); return numbersonly(event, false);" maxlength="5"/></td></c:if>
						
						<td class="cent nameD"><input type="text" class="nameDInput bgS${stf.statSeq}" name="statSeq${stf.sNb}" value="${stf.statSeq}" maxlength="5" style="" /></td>
						<td class="cent companyName">
							<select name="dept${stf.sNb}">
								<option value="" <c:if test="${stf.team eq ''}">selected</c:if>>선택</option>
							<c:forEach var="dept" items="${deptList}" varStatus="dS">
								<option value="${dept.code}" <c:if test="${stf.team eq dept.code}">selected</c:if>>${dept.name}</option>								
							</c:forEach>
							</select>
						</td>
						<td class="cent companyName" style="width:80px;">
							<select name="division${stf.sNb}" class="bgDiv${stf.division}">
								<option value="" <c:if test="${stf.division eq ''}">selected</c:if>>선택</option>
							<c:forEach var="divi" items="${divList}" varStatus="dS">
								<option value="${divi.code}" <c:if test="${stf.division eq divi.code}">selected</c:if>>${divi.name}</option>								
							</c:forEach>
							</select>
						</td>
						<td class="cent companyName">
							<select name="office${stf.sNb}" class="" onchange="changeOffice(this);">
								<c:forEach	items="${companyList}" var="item">
									<option value="${item.hqId }" <c:if test="${stf.office eq item.hqId }">selected</c:if>>${item.hqName}</option>
								</c:forEach>
							</select>
						</td>
						<td class="cent companyName">${stf.phn1}</td>
						<%-- 
						<td class="cent nameD bgS${stf.srtCd}">
							<c:if test="${stf.srtCd<10}">IB관리</c:if>
							<c:if test="${stf.srtCd=='10000'}">퇴사</c:if>
						</td>
						 --%>
						 
						<td class="cent cpnD"><input type="text" class="nameDInput" style="text-align:right!important;padding-right:3px;" name="cstId${stf.sNb}" value="${stf.cstId}"/><!-- <span class="btn s glass bold" onclick="javascript:updateCustomer(this);">update</span> --></td>
						
						 
						<!-- 투심인 -->
						<td>
							<select id="reviewLevel${stf.sNb}" name="reviewLevel${stf.sNb}" class="bgS${stf.reviewLevel != 'N' ? 'Y' : 'N' }">
								<option value="F" ${stf.reviewLevel == 'F' ? 'selected' : '' }>구자형</option>
								<option value="M" ${stf.reviewLevel == 'M' ? 'selected' : '' }>이명철</option>
								<option value="A" ${stf.reviewLevel == 'A' ? 'selected' : '' }>일반분석</option>
								<option value="N" ${stf.reviewLevel == 'N' ? 'selected' : '' }>권한없음</option>
							</select>
						</td>
						
						<!-- 분석자 -->
						<td>
							<select id="analYn${stf.sNb}" name="analYn${stf.sNb}" class="bgS${stf.analYn}" ${stf.analYn == '' ? 'disabled' : '' } >
								<option value="Y" ${stf.analYn == 'Y' ? 'selected' : '' }>Y</option>
								<option value="N" ${stf.analYn == 'N' ? 'selected' : '' }>N</option>
								<option value="" disabled="disabled"  ${stf.analYn == '' ? 'selected' : '' }>프로필없음</option>
							</select>
						</td>
						<!-- 직원직전권한 -->
						<td>
							<select id="preStaff${stf.sNb}" name="preStaff${stf.sNb}" class="bgS${stf.preStaff}">
								<option value="Y" ${stf.preStaff == 'Y' ? 'selected' : '' }>Y</option>
								<option value="N" ${stf.preStaff == 'N' ? 'selected' : '' }>N</option>
							</select>
						</td>
						<!-- 직원직전 코드 -->
						<td class="cent nameD">
							<input type="text" class="nameDInput" name="preStaffCd${stf.sNb}" value="${stf.preStaffCd}" <c:if test="${fn:length(stf.preStaffCd) gt 0}">style="background:#ffecec;"</c:if> maxlength="1" />
						</td>
						
						<!-- 메자닌보기 상장 -->
						<td>
							<select id="mezzL${stf.sNb}" name="mezzL${stf.sNb}" class="bgS${stf.mezzL}" ${stf.mezzL == '' ? 'disabled' : '' } >
								<option value="Y" ${stf.mezzL == 'Y' ? 'selected' : '' }>Y</option>
								<option value="N" ${stf.mezzL == 'N' ? 'selected' : '' }>N</option>
								<option value="" disabled="disabled"  ${stf.mezzL == '' ? 'selected' : '' }>프로필없음</option>
							</select>
						</td>
						<!-- 메자닌보기 비상장 -->
						<td>
							<select id="mezzN${stf.sNb}" name="mezzN${stf.sNb}" class="bgS${stf.mezzN}" ${stf.mezzN == '' ? 'disabled' : '' }  >
								<option value="Y" ${stf.mezzN == 'Y' ? 'selected' : '' } >Y</option>
								<option value="N" ${stf.mezzN == 'N' ? 'selected' : '' }>N</option>
								<option value="" disabled="disabled" ${stf.mezzN == '' ? 'selected' : '' }>프로필없음</option>
							</select>
						</td>
												 
						<td class="cent nameD"><span class="btn s green" onclick="saveStaffInfo(${stf.sNb});"><a>저장</a></span></td>
						
						<td class="cent" style="border-left:6px solid #09b9ea;">
							${stf.sabun}
							<span class="btn s orange" onclick="javascript:updateSabun(this);"><a>Update</a></span>							
						</td>
						
						<c:if test="${userLoginInfo.permission > '00020'}">
						<td class="cent" style="border-left:6px solid #09b9ea;border-right:6px solid #09b9ea;">
							<span class="btn s red" onclick="reSetPw('${stf.sNb}')"><a>PW 초기화</a></span>
							<c:if test="${stf.srtCd!='10000'}">
								&nbsp;<span class="btn s black" onclick="setResign('${stf.sNb}')"><a>퇴사</a></span>
							</c:if>
						</td>
						</c:if>
						<td class="cent"><%-- ${stf.usrPw} --%>
							<c:choose>
								<c:when test="${empty stf.userStatus}">
									<span style="color:white;font-weight:bold;background-color:red;">미등록</span>
								</c:when>
								<c:when test="${stf.userStatus eq 'W'}">
									<span style="color:blue;font-weight:bold;">ON</span>
								</c:when>
								<c:otherwise>
									<span style="color:white;font-weight:bold;background-color:silver;">OFF</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
						
		</article>
	</section>
</body>
</html>