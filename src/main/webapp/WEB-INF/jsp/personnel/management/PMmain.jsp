<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Main</title>
<%-- <link href="<c:url value='/css/tab.css'/>" rel="stylesheet" type="text/css"/> --%>
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/management.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/comment.css'/>" rel="stylesheet" type="text/css"/>

<style>
input{border:1px solid #bbbbbb;}

</style>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/previewImg.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/calendar_beans_v2.0.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js'/>" ></script>
<script>
$(document).ready(function(){
	//$("ul.tbody:even li").css("background-color", "#E0F8F7");
	if('<c:out value='${saveCnt}'/>' > 0 ) {
		alert("저장 되었습니다.");
		location.href ="<c:url value='index.do' />";
	} else if('<c:out value='${error}'/>' > 0 ) {
		//alert("저장되지 않았습니다.");
		location.href ="<c:url value='index.do' />";
	}
	//$(".dnTbl:even").css("background-color", "#E0F8F7");
	if(<c:out value='${userLoginInfo.id ne selectStaffId and userLoginInfo.permission<20 and userLoginInfo.permission!="00015"}'/>){
		$(".table_main input, .table_main select").attr('disabled','disabled');
		$(".privThings input, .privThings select").attr('disabled','disabled');
	};
	
	$(document).on("click",".subTab",function(){
		var cls = $(".subTabon").attr("class");//선택전 클래스형식으로 초기화
		$(".subTabon").attr("class",cls.replace("subTabon","subTab"));
		var eq = $(".subTab").index(this);//눌러진 클래스의 번호
		var leng = $(".subTab").length;
		for(var i=0; i<leng;i++){
			if("block"==$(".tabMenu:eq("+i+")").css("display")){
				AjaxTabSubmit(i);
			}

			if(i==eq) {
				var cls = $(".subTab:eq("+i+")").attr("class");
				$(".subTab:eq("+i+")").attr("class",cls.replace("subTab","subTabon"));
				$(".tabMenu:eq("+i+")").show();
			} else {
				$(".tabMenu:eq("+i+")").hide();
			}
		}
	});

	$(document).on("click",".fixIntNum",function(){
		var obj = $(this);
		for(var i=0;i<2;i++){
			obj.val(obj.val().replace('-',''));
		}

	});
	
	$("#CV_upload").change(function () {
		$("#multiFile_N_comment").attr("action","../management/uploadCV.do");
		traverseFiles(this.files);
	});
});

function submitForm(){
	if( $("#priv").val() == 'true' ) $("#basicInfo").submit();
}

function saveBasicInfo(formNm,formNm2){
	var leng = $(".subTab").length;
	for(var i=0; i<leng+1;i++){
		if("block"==$(".tabMenu:eq("+i+")").css("display")){
			//alert(i);
			AjaxTabSubmit(i);
			location.href ="index.do?usrId="+$("#selectST").val();
		}
	}console.log("end ajax tab submit");
	if($("#prev_previewId").attr('id')!=null && $("#prev_previewId").attr("src").indexOf("../../")){
		var frm1 = document.getElementById(formNm2);//sender form id
		frm1.target = "uploadIFrame";//target frame name
		if( $("#priv").val() == 'true' ) frm1.submit();
	}else{
		submitForm();
	}
}

function AjaxTabSubmit(tabNumber){
	var URL = "";
	var DATA = "";
	var selectTabObj = "";
	var flag = false;
	switch(tabNumber){
	case 0:
		URL = "../management/familyInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if( $("#priv").val() == 'false' ) return;
		break;
	case 1:
		URL = "../management/schoolInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if( $("#priv").val() == 'false' ) return;
		break;
	case 2:
		URL = "../management/careerInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if( $("#priv").val() == 'false' ) return;
		break;
	case 3:
		URL = "../management/licenseInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if( $("#priv").val() == 'false' ) return;
		break;
	case 4:
		URL = "../management/Process.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		break;
	case 5:
		URL = "../management/insideCareerInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		flag = true;
		break;
	case 6:
		URL = "../management/justiceInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		flag = true;
		break;
	case 7:
		URL = "../management/salaryInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		flag = true;
		break;
	case 8:
		URL = "../management/assessmentInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		flag = true;
		break;
	case 9:
		URL = "../management/stockOptionInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if($("#per").val()=='true') return;
		flag = true;
		break;
	case 10:
	case 11:
	case 12:
	case 13:
		URL = "../management/problemInfoProcess.do";
		selectTabObj = ".tabMenu:eq("+tabNumber+")";
		if( $("#priv").val() == 'false' ) return;
		break;
	}
	DATA = $(selectTabObj+" input,"+ selectTabObj+" select,"+ selectTabObj+" textarea").serialize();

	$.ajax({
		type:"POST",        //POST GET
		url:URL,     //PAGEURL
		data : DATA,
		timeout : 30000,       //제한시간 지정
		cache : false,        //true, false
		success: function whenSuccess(arg){  //SUCCESS FUNCTION
			if(flag) {
				//alert("저장 되었습니다.");
				//location.href ="index.do?usrId="+$("#selectST").val();
			}
		},
		error: function whenError(x,e){    //ERROR FUNCTION
			//ajaxErrorAlert(x,e);
		}
	});
}
</script>
</head>
<body>
<input type="hidden" id="per" value="${userLoginInfo.permission < '00015'}"/>
<input type="hidden" id="priv" value="${userLoginInfo.id eq selectStaffId or userLoginInfo.permission == '00015'}"/>
<input type="hidden" id="selectST" value="${selectStaffId}"/>

<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/recommend/saveOpinion.do' />" method="post" encType="multipart/form-data">
	<input type="hidden" id="m_categoryCd" name="categoryCd" value="00002">
	<input type="hidden" id="m_offerSnb" name="offerSnb">
	<input type="hidden" id="m_comment" name="comment">
	<input type="hidden" name="tmpNum1" value="${staffSNb}">
	<input type="hidden" name="usrId" value="${selectStaffId}"/>
	<input id="CV_upload" name="files-upload" type="file" multiple style="display:none;">
	<!-- <div id="m_files"></div> -->
</form>
<form id="downName" name="downName" action="<c:url value='/work/downloadProcess.do' />" method="post">
	<input type="hidden" name="makeName" id="makeName"/>
	<input type="hidden" name="recordCountPerPage" value="0"/>
</form>
<!-- --------------------------------------------------------------------------------- -->
	<div class="wrap">
	<iframe id="uploadIFrame" name="uploadIFrame" style="display:none;visibility:hidden"></iframe>
		<form id="basicInfoImg" action="<c:url value='/personnel/management/basicInfoImg.do' />" method="post" enctype="multipart/form-data">
			<input type="hidden" name="sNb" value="${staffSNb}"/>
			
			<div style="float: left;">
			<div id='previewId' style="float: left; height:200px; width:150px; line-height:200px; border: 2px solid skyblue;">
				<%-- <img src="<c:url value='file:///E:/UpLoadData/back.PNG' />" style="width: 150px; max-height: 200px;"/> --%>
				<c:if test="${not empty makeNm }">
				<img id="prev_previewId" src="<c:url value='../../data/${makeNm}' />" style="width: 150px; max-height: 200px;"/>
				</c:if>
			</div>
			<div class="clear"><input type="file" name="files-upload"  size="10" style="width:150px;" onchange="previewImage(this,'previewId')"></div>
			</div>
		</form>
			
		<form id="basicInfo" name="basicInfo" action="<c:url value='/personnel/management/basicInfoProcess.do' />" method="post">
		<input type="hidden" name="sNb" value="${staffSNb}"/>
		<c:forEach var="sInfo" items="${staffInfo}">
			<div class="table_style table_main" style="margin-left:10px;">
				<ul>
					<li>한글이름</li>
					<li><input class="stringT" type="text" name="usrNm" value="${sInfo.usrNm}"/>
					</li>
					<li>영문이름</li>
					<li><input class="stringT" type="text" name="engNm" value="${sInfo.engNm}"/>
					</li>
					<li>여권번호</li>
					<li><input class="stringT" type="text" name="passport" value="${sInfo.passport}"/>
					</li>
				</ul>
				<ul>
					<li>소&nbsp;&nbsp;&nbsp;속</li>
					<li><select class="cent" style="width:106px;" name="office">
							<option value="1" <c:if test="${sInfo.office == 1}">selected</c:if>>파트너스</option>
							<option value="2" <c:if test="${sInfo.office == 2}">selected</c:if>>투자자문</option>
							<option value="3" <c:if test="${sInfo.office == 3}">selected</c:if>>IB투자</option>
					</select></li>
					<li>입사일자</li>
					<li><input class="stringT intNum fixIntNum" type="text" 
						onKeyPress="return numbersonly(event, false);" maxlength="8"  name="joinDt" value="${sInfo.joinDt}"/>
					</li>
					<li>생년월일</li>
					<li><input class="stringT intNum fixIntNum" type="text"
						onKeyPress="return numbersonly(event, false);" maxlength="8" name="birthDt" value="${sInfo.birthDt}"/>
					</li>
				</ul>
				<ul>
					<li>직&nbsp;&nbsp;&nbsp;급</li>
					<li><input class="stringT" type="text" name="position" value="${sInfo.position}"/></li>
					<li>정직원발령일</li>
					<li><input class="stringT intNum fixIntNum" type="text"
						onKeyPress="return numbersonly(event, false);" maxlength="8" name="fulltimeDt" value="${sInfo.fulltimeDt}"/>
					</li>
					<li>결&nbsp;&nbsp;&nbsp;혼</li>
					<li><input class="Mdate intNum fixIntNum" type="text"
						onKeyPress="return numbersonly(event, false);" maxlength="8" name="marriedDt" value="${sInfo.marriedDt}" />
						<select style="/* width:33px; */">
							<option <c:if test="${sInfo.marriedDt == null}">selected</c:if>>미혼</option>
							<option value="1"<c:if test="${sInfo.marriedDt != null}">selected</c:if>>기혼</option>
					</select></li>
				</ul>
				<ul>
					<li><!-- 소&nbsp;속&nbsp;팀 --></li>
					<li><!-- <input class="stringS" type="text" value=""/> --></li>
					<li>퇴사일자</li>
					<li><input class="stringT intNum fixIntNum" type="text"
						onKeyPress="return numbersonly(event, false);" maxlength="8" name="resignDt" value="${sInfo.resignDt}"/>
					</li>
					<li>퇴사구분</li>
					<li><select style="width:107px;">
							<option></option>
							<option value="1">자진퇴사</option>
							<option value="2">권고사직</option>
					</select></li>
				</ul>
				<ul>
					<li>주&nbsp;&nbsp;&nbsp;소</li>
					<li style="width:612px;"><input class="stringL" type="text" name="address" value="${sInfo.address}"/>
					</li>
				</ul>
				<ul>
					<li>취&nbsp;&nbsp;&nbsp;미</li>
					<li class="doubleS"><input class="stringM" type="text" name="hobby" value="${sInfo.hobby}"/>
					</li>
					<li>종&nbsp;&nbsp;&nbsp;교</li>
					<li><input class="stringT" type="text" name="religion" value="${sInfo.religion}"/></li>
				</ul>
				<ul>
					<li>특&nbsp;&nbsp;&nbsp;기</li>
					<li class="doubleS"><input class="stringM" type="text" name="abillity" value="${sInfo.abillity}"/>
					</li>
					<li>혈&nbsp;액&nbsp;형</li>
					<li><select style="width:107px;" name="blood">
							<option></option>
							<option value="1" <c:if test="${sInfo.blood == 1}">selected</c:if>>A</option>
							<option value="2" <c:if test="${sInfo.blood == 2}">selected</c:if>>B</option>
							<option value="3" <c:if test="${sInfo.blood == 3}">selected</c:if>>O</option>
							<option value="4" <c:if test="${sInfo.blood == 4}">selected</c:if>>AB</option>
					</select></li>
				</ul>
				<ul>
					<li>휴&nbsp;대&nbsp;폰</li>
					<li><input class="stringT" type="text" name="phn1" value="${sInfo.phn1}"/>
					</li>
					<li>비상연락</li>
					<li style="width:232px;"><input class="phone" type="text" name="emergencyCall" value="${sInfo.emergencyCall}"/>
						<select style="width:55px;overflow:hidden;" name="emergencyRelation">
							<option>관계</option>
						<c:forEach var="cmmCd" items="${cmmCdFamily}">
							<option value="${cmmCd.dTailCd}" <c:if test="${sInfo.emergencyRelation == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
						</c:forEach>

					</select></li>
					<li style="background-color:white;border:1px 0 1px 0 solid white;padding:0;width:0;"></li>
					<li><span class="btn green s" onclick="saveBasicInfo('basicInfo','basicInfoImg')"><a>&nbsp;&nbsp;&nbsp;&nbsp;저&nbsp;&nbsp;장&nbsp;&nbsp;&nbsp;&nbsp;</a></span></li>
				</ul>
			</div>
		</c:forEach>
		</form>

			<div class="blank"></div>
<!-- tabs -->
			<div class="clear" style="width:10px;float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
			<div class="subTabon">가족사항</div>
			<div class="subTab">학력사항</div>
			<div class="subTab">경력사항</div>
			<div class="subTab">자격증</div>
			<div class="subTab sng">이력서</div>
			<div class="subTab sng">경력</div>
			<div class="subTab sng">상벌</div>
			<div class="subTab sng">급여</div>
			<div class="subTab sng">고과</div>
			<div class="subTab sng">스톡옵션</div>
			<div class="subTab vio">애로사항</div>
			<div class="subTab vio">희망사항</div>
			<div class="subTab vio">긴급사항</div>
			<div class="subTab vio">건의사항</div>
			<div style="width:calc(100% - 962px);float:left;height:25px;border-bottom:1px solid #CCC;">&nbsp;</div>
<!-- tabs -->	
			<!-- <div class="zTop" style="float: left; line-height: 25px; width: 560px;">&nbsp;</div> -->
<!-- tabs tail -->


<!-- 가족사항 -->
			<div class="table_style clear tabMenu privThings" style="display:block;">
				<div id="familyTab">
					<ul class="header">
						<li>관&nbsp;&nbsp;&nbsp;계 <font style="color:red;font-weight:bold">*</font></li>
						<li>성&nbsp;&nbsp;&nbsp;명 <font style="color:red;font-weight:bold">*</font></li>
						<li>생년월일</li>
						<li>직&nbsp;&nbsp;&nbsp;업</li>
						<li>동거여부</li>
					</ul>
				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="fInfo" items="${family}">
					<input type="hidden" name="sNbUP" value="${fInfo.sNb }"/>
					<ul class="tbody">
						<li><select name="relationUP">
								<option>관계</option>
							<c:forEach var="cmmCd" items="${cmmCdFamily}">
								<option value="${cmmCd.dTailCd}" <c:if test="${fInfo.relation == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
							</c:forEach>
						</select></li>
						<li><input class="stringS" type="text" name="familyNmUP" value="${fInfo.familyNm}"/></li>
						<li><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="familyBirthDtUP" value="${fInfo.familyBirthDt}" /></li>
						<li><input class="stringS" type="text" name="jobUP" value="${fInfo.job}" /></li>
						<li><select name="liveUP">
								<option></option>
								<option value="1" <c:if test="${fInfo.live == 1}">selected</c:if>>동거</option>
								<option value="2" <c:if test="${fInfo.live == 2}">selected</c:if>>비동거</option>
						</select></li>
					</ul>
				</c:forEach>
					<ul class="tbody">
						<li><select name="relationUP">
								<option>관계</option>
							<c:forEach var="cmmCd" items="${cmmCdFamily}">
								<option value="${cmmCd.dTailCd}" <c:if test="${sInfo.emergencyRelation == cmmCd.dTailCd}">selected</c:if>>${cmmCd.cdNm}</option>
							</c:forEach>
						</select></li>
						<li><input class="stringS" type="text" name="familyNmUP"/></li>
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="familyBirthDtUP"/></li>
						<li><input class="stringS" type="text" name="jobUP"/></li>
						<li><select name="liveUP">
								<option></option>
								<option value="1">동거</option>
								<option value="2">비동거</option>
						</select></li>
					</ul>
				
				</div>
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('familyTab')"><a>추가</a></span>
				</div>
			</div>
<!-- 가족사항 -->
			
			
<!-- 학력사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="schoolTab">
					<ul class="header">
						<li>졸업년도 <font style="color:red;font-weight:bold">*</font></li>
						<li>구&nbsp;&nbsp;&nbsp;분 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">학&nbsp;교&nbsp;명 <font style="color:red;font-weight:bold">*</font></li>
						<li>전&nbsp;&nbsp;&nbsp;공 <font style="color:red;font-weight:bold">*</font></li>
					</ul>
					
				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="aInfo" items="${academic}">
					<input type="hidden" name="sNbUP" value="${aInfo.sNb }"/>
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="4" name="ARjoinSchoolDt" value="${fn:substring(aInfo.joinSchoolDt,0,4)}" /></li>
						<li><select name="ARgraduate">
								<option value="0">구분</option>
								<option value="1" <c:if test="${aInfo.graduate == 1}">selected</c:if>>졸업</option>
								<option value="2" <c:if test="${aInfo.graduate == 2}">selected</c:if>>편입</option>
								<option value="3" <c:if test="${aInfo.graduate == 3}">selected</c:if>>중퇴</option>
						</select></li>
						<li><input class="stringS" type="text" name="ARacademicNm" value="${aInfo.academicNm }"/></li>
						<li>
							<select name="ARacademicGd">
								<option>학교</option>
								<option value="1" <c:if test="${aInfo.academicGd == 1}">selected</c:if>>고등학교</option>
								<option value="2" <c:if test="${aInfo.academicGd == 2}">selected</c:if>>대학교</option>
								<option value="3" <c:if test="${aInfo.academicGd == 3}">selected</c:if>>대학원(석사)</option>
								<option value="4" <c:if test="${aInfo.academicGd == 4}">selected</c:if>>대학원(박사)</option>
							</select>
						</li>
						<li><input class="stringS" type="text" name="ARmajor" value="${aInfo.major }" /></li>
					</ul>
				</c:forEach>
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="4" name="ARjoinSchoolDt"/></li>
						<li><select name="ARgraduate">
								<option value="0">구분</option>
								<option value="1">졸업</option>
								<option value="2">편입</option>
								<option value="3">중퇴</option>
						</select></li>
						<li><input class="stringS" type="text" name="ARacademicNm"/></li>
						<li>
							<select name="ARacademicGd">
								<option>학교</option>
								<option value="1">고등학교</option>
								<option value="2">대학교</option>
								<option value="3">대학원(석사)</option>
								<option value="4">대학원(박사)</option>
							</select>
						</li>
						<li><input class="stringS" type="text" name="ARmajor"/></li>
					</ul>
				</div>
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('schoolTab')"><a>추가</a></span>
				</div>
			</div>
<!-- 학력사항 -->
<!-- 경력사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="careerTab">
					<ul class="header">
						<li>입사날짜 <font style="color:red;font-weight:bold">*</font></li>
						<li>퇴사날짜 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">회&nbsp;사&nbsp;명 <font style="color:red;font-weight:bold">*</font></li>
						<li>직&nbsp;&nbsp;&nbsp;위 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">직&nbsp;&nbsp;&nbsp;무 <font style="color:red;font-weight:bold">*</font></li>
					</ul>
					
				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="careerInfo" items="${career}">
					<input type="hidden" name="sNbUP" value="${careerInfo.sNb }"/>
					<ul class="tbody">
						<li><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARjoinCpnDt" value="${careerInfo.joinCpnDt}"/></li>
						<li><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARresignCpnDt" value="${careerInfo.resignCpnDt}" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARcompanyNm" value="${careerInfo.companyNm}" /></li>
						<li><input class="stringS" type="text" name="ARposition" value="${careerInfo.position}" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARjob" value="${careerInfo.job}" /></li>
					</ul>
				</c:forEach>
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARjoinCpnDt" /></li>
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARresignCpnDt" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARcompanyNm" /></li>
						<li><input class="stringS" type="text" name="ARposition" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARjob" /></li>
					</ul>
				
				</div>
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('careerTab')"><a>추가</a></span>
				</div>
			</div>
<!-- 경력사항 -->
<!-- 자격증 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="licenseTab">
					<ul class="header">
						<li class="x2">자격/면허증 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">발행처/기관 <font style="color:red;font-weight:bold">*</font></li>
						<li>취득날짜 <font style="color:red;font-weight:bold">*</font></li>
					</ul>

				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="licenseInfo" items="${license}">
					<input type="hidden" name="sNbUP" value="${licenseInfo.sNb }"/>
					<ul class="tbody">
						<li class="x2"><input class="stringS2" type="text" name="ARlicenseNm" value="${licenseInfo.licenseNm}" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARissue" value="${licenseInfo.issue}" /></li>
						<li><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARobtainDt" value="${licenseInfo.obtainDt}"/></li>
					</ul>
				</c:forEach>
					<ul class="tbody">
						<li class="x2"><input class="stringS2" type="text" name="ARlicenseNm" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARissue" /></li>
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARobtainDt"/></li>
					</ul>
				
				</div>
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('licenseTab')"><a>추가</a></span>
				</div>
			</div>
<!-- 자격증 -->




<!-- 이력서 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="resumeTab" style="min-width:400px;">
					<div style="margin:5px;">
						<a class="btn glass s" onclick="$('#CV_upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../../images/file/fileDisk.png' />" align="absmiddle">File</a>
						<span class="btn glass s"><a href="javascript:saveComment('','${staffSNb}')">업로드</a></span>
						<div><table id="file_list"></table></div>
					</div>
					<div style="margin:5px; <c:if test="${empty CVlist}">display:none;</c:if>">
						<c:forEach var="CV" items="${CVlist}"><br/>
							<c:set var="FileInfo" value="${CV.realName}"/>
								<c:set var="extension" value="${fn:split(CV.realName,'.')}"/>
								<c:set var="lastDot" value="${fn:length(extension)-1}"/>
								<input type="hidden"  id="mkNames${imStT.count}" value="${CV.makeName}"/>
								<c:set var="ext" value=""/>
								<c:if test="${extension[lastDot]=='doc' or extension[lastDot]=='docx'}"><c:set var="ext" value="doc"/></c:if>
								<c:if test="${extension[lastDot]=='xls' or extension[lastDot]=='xlsx'}"><c:set var="ext" value="xls"/></c:if>
								<c:if test="${extension[lastDot]=='ppt' or extension[lastDot]=='pptx'}"><c:set var="ext" value="ppt"/></c:if>
								<c:if test="${extension[lastDot]=='pdf'}"><c:set var="ext" value="pdf"/></c:if>

								<img class="mail_send filePosition" id="file${imStT.count}"
								<c:choose>
									<c:when test="${empty ext or ext == ''}">src="../../images/file/files.png"</c:when>
									<c:otherwise>src="../../images/file/${ext}.png"</c:otherwise>
								</c:choose>
								title="${FileInfo}" align="absmiddle"> <a id="ffile${imStT.count}" class="hand filePosition" style="color:navy;">${FileInfo}</a>&nbsp;
						</c:forEach>
					</div>
					<div class="cmt_box">
						<div class="cmt_top">
							<p onclick="comment_open()" class="count new">이력서 코멘트<!-- <span>[4]</span> --></p>
						</div>
						<div class="new_cmt" <c:if test="${empty CVlist}">style="display: none;"</c:if>>
							<div class="form"><div class="textwrap"><div>
								<textarea id="toast_comment_text" toast="required:true,maxLength:5000" style="width: 100%; height: 115px;"></textarea>
							</div></div></div>
							<div class="action">
								<%-- <a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../../images/file/fileDisk.png' />" align="absmiddle">File</a> --%>
								<span class="btn s green"><a href="javascript:saveComment('','${staffSNb}')">저장</a></span> <span class="btn s red"><a href="javascript:write_cancle('ist')">취소</a></span>
							</div>
						</div>
		<!-- 의견 -->
						<c:forEach var="opinion" items="${opinionList}" varStatus="OPst">
						<c:if test="${OPst.count>1}"><p class="hr"></p></c:if>
						<div class="cmt">
							<div id="" class="message">
								<input type="hidden" id="OPsNb${OPst.count}" value="${opinion.sNb}">
								<div class="post_info">
								<span class="user"><a>${opinion.cstNm}</a></span> <span class="date">${fn:substring(opinion.rgDt,0,16)}</span>
								<c:if test="${userLoginInfo.permission > '00019'  or  userLoginInfo.name==opinion.cstNm}">
								<span class="cur" onclick="javascript:modify_comment(${OPst.count})"><img src="<c:url value='/images/recommend/modify.png'/>" title="수정"/></span>&nbsp;<span class="cur" onclick="javascript:saveComment('${OPst.count}')"><img src="<c:url value='/images/recommend/delete.png'/>" title="삭제"/></span>
								</c:if>
								</div>
								<div class="post_data">
									<div id="user_text${OPst.count}" class="user_text">${fn:replace(opinion.comment, lf,"<br/>")}</div>
									<div id="modi_textarea${OPst.count}" style="display:none"><textarea id="toast_comment_text${OPst.count}" toast="required:true,maxLength:5000" style="width: 100%; height: 115px;">${opinion.comment}</textarea> <span class="btn s green"><a onclick="javascript:saveComment('${OPst.count}','${staffSNb}')">저장</a></span> <span class="btn s red"><a href="javascript:write_cancle('mdf','${OPst.count}')">취소</a></span></div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
<!-- 이력서 -->
<!-- 시너지경력 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="insideCareerTab">
					<ul class="header">
						<li>진급날짜 <font style="color:red;font-weight:bold">*</font></li>
						<li>구&nbsp;&nbsp;&nbsp;분 </li>
						<li>직&nbsp;&nbsp;&nbsp;급 <font style="color:red;font-weight:bold">*</font></li>
					</ul>

				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="insideCareerInfo" items="${insideCareer}">
					<input type="hidden" name="sNbUP" value="${insideCareerInfo.sNb }"/>
					<ul class="tbody">
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARpromotionDt" value="${insideCareerInfo.promotionDt}"/></c:if><c:if test="${userLoginInfo.permission < '00015'}">${insideCareerInfo.promotionDt}</c:if></li>
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS" type="text" name="ARdivision" value="${insideCareerInfo.division}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${insideCareerInfo.division}</c:if></li>
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS" type="text" name="ARposition" value="${insideCareerInfo.position}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${insideCareerInfo.position}</c:if></li>
					</ul>
				</c:forEach>
					<c:if test="${userLoginInfo.permission > '00011'}">
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARpromotionDt"/></li>
						<li><input class="stringS" type="text" name="ARdivision"/></li>
						<li><input class="stringS" type="text" name="ARposition"/></li>
					</ul>
					</c:if>
				
				</div>
				<c:if test="${userLoginInfo.permission > '00011'}">
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('insideCareerTab')"><a>추가</a></span>
				</div>
				</c:if>
			</div>
<!-- 시너지경력 -->
<!-- 상벌 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="justiceTab">
					<ul class="header">
						<li>적용날짜 <font style="color:red;font-weight:bold">*</font></li>
						<li>상벌이유 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">포상/벌칙 내용 <font style="color:red;font-weight:bold">*</font> </li>
					</ul>

				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="justiceInfo" items="${justice}">
					<input type="hidden" name="sNbUP" value="${justiceInfo.sNb }"/>
					<ul class="tbody">
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARjusticeDt" value="${justiceInfo.justiceDt}"/></c:if><c:if test="${userLoginInfo.permission < '00015'}">${justiceInfo.justiceDt}</c:if></li>
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS" type="text" name="ARreason" value="${justiceInfo.reason}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${justiceInfo.reason}</c:if></li>
						<li class="x2"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS2" type="text" name="ARcomment" value="${justiceInfo.comment}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${justiceInfo.comment}</c:if></li>
					</ul>
				</c:forEach>
					<c:if test="${userLoginInfo.permission > '00011'}">
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARjusticeDt"/></li>
						<li><input class="stringS" type="text" name="ARreason" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARcomment" /></li>
					</ul>
					</c:if>
				</div>
				<c:if test="${userLoginInfo.permission > '00011'}">
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('justiceTab')"><a>추가</a></span>
				</div>
				</c:if>
			</div>
<!-- 상벌 -->
<!-- 급여 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="salaryTab">
					<ul class="header">
						<li>변동날짜 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">변동내역 <font style="color:red;font-weight:bold">*</font></li>
						<li>금액 <font style="color:red;font-weight:bold">*</font></li>
					</ul>

				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="salaryInfo" items="${salary}">
					<input type="hidden" name="sNbUP" value="${salaryInfo.sNb }"/>
					<ul class="tbody">
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum fixIntNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARvariableDt" value="${salaryInfo.variableDt}"/></c:if><c:if test="${userLoginInfo.permission < '00015'}">${salaryInfo.variableDt}</c:if></li>
						<li class="x2"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS2" type="text" name="ARcomment" value="${salaryInfo.comment}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${salaryInfo.comment}</c:if></li>
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" name="ARpay" value="${salaryInfo.pay}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${salaryInfo.pay}</c:if></li>
					</ul>
				</c:forEach>
					<c:if test="${userLoginInfo.permission > '00011'}">
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="8" name="ARvariableDt"/></li>
						<li class="x2"><input class="stringS2" type="text" name="ARcomment" /></li>
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" name="ARpay"/></li>
					</ul>
					</c:if>
				
				</div>
				<c:if test="${userLoginInfo.permission > '00011'}">
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('salaryTab')"><a>추가</a></span>
				</div>
				</c:if>
			</div>
<!-- 급여 -->
<!-- 고과 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="assessmentTab">
					<ul class="header">
						<li>년도 <font style="color:red;font-weight:bold">*</font></li>
						<li>고과점수 <font style="color:red;font-weight:bold">*</font></li>
						<li class="x2">성과급 <font style="color:red;font-weight:bold">*</font></li>
					</ul>

				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="assessmentInfo" items="${assessment}">
					<input type="hidden" name="sNbUP" value="${assessmentInfo.sNb }"/>
					<ul class="tbody">
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="4" name="ARassessmentDt" value="${assessmentInfo.assessmentDt}"/></c:if><c:if test="${userLoginInfo.permission < '00015'}">${assessmentInfo.assessmentDt}</c:if></li>
						<li><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS" type="text" name="ARassessmentScore" value="${assessmentInfo.assessmentScore}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${assessmentInfo.assessmentScore}</c:if></li>
						<li class="x2"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS2" type="text" name="ARpay" value="${assessmentInfo.pay}" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${assessmentInfo.pay}</c:if></li>
					</ul>
				</c:forEach>
					<c:if test="${userLoginInfo.permission > '00011'}">
					<ul class="tbody">
						<li><input class="stringS intNum" type="text" onKeyPress="return numbersonly(event, false)" maxlength="4" name="ARassessmentDt"/></li>
						<li><input class="stringS" type="text" name="ARassessmentScore" /></li>
						<li class="x2"><input class="stringS2" type="text" name="ARpay" /></li>
					</ul>
					</c:if>
				
				</div>
				<c:if test="${userLoginInfo.permission > '00011'}">
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('assessmentTab')"><a>추가</a></span>
				</div>
				</c:if>
			</div>
<!-- 고과 -->
<!-- 스톡옵션 -->
			<div class="table_style clear tabMenu" style="display:none;">
				<div id="stockOptionTab">
					<ul class="header">
						<li class="w4x">부여</li>
						<li class="w4x">행사</li>
					</ul>
					<ul class="header">
						<li>차수</li>
						<li>부여일</li>
						<li>부여수량</li>
						<li>부여시 행사가격</li>
						<li>행사일</li>
						<li>행사수량</li>
						<li>잔존수량</li>
						<li>행사가격</li>
					</ul>
				<input type="hidden" name="staffSNb" value="${staffSNb}"/>
				<c:forEach var="stockInfo" items="${stock}" varStatus="stockSt">
					<c:set var="reminder" value="${stockInfo.quantity}"/>
					<ul class="tbody">
						<input type="hidden" name="ARturn" value="${stockInfo.turn}">
						<input type="hidden" name="sNbUP" value="${stockInfo.sNb}">
						<li class="hx">${stockInfo.turn}</li>
						<li class="hx"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARstockDt" value="${stockInfo.stockDt}" onKeyPress="return numbersonly(event, false)" maxlength="8" onclick="return (this.value='${stockInfo.stockDt}'.replace(/-/gi,''));" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${stockInfo.stockDt}</c:if></li>
						<li class="hx"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARquantity" value="${stockInfo.quantity}" onKeyPress="return numbersonly(event, false)" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${stockInfo.quantity}</c:if></li>
						<li class="hx"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARpay" value="${stockInfo.price}" onKeyPress="return numbersonly(event, false)" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${stockInfo.price}</c:if></li>
						<li class="w4x2 bd0 pd0" style="padding: 0 0 4px 0">
						<c:set var="cnt" value="1"/>
						<c:forEach var="stockGInfo" items="${stockGet}" varStatus="getSt"><c:if test="${stockInfo.turn == stockGInfo.turn}">
							<ul><c:set var="reminder" value="${reminder - stockGInfo.quantity}"/>
								<input type="hidden" name="ARGsNb" value="${stockGInfo.sNb}">
								<input type="hidden" name="ARGturn" value="${stockGInfo.turn}">
								
								<li class="bdD addF"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARGstockDt" value="${stockGInfo.stockDt}" onKeyPress="return numbersonly(event, false)" maxlength="8" onclick="return (this.value='${stockGInfo.stockDt}'.replace(/-/gi,''));" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${stockGInfo.stockDt}</c:if></li>
								<li class="bdD"     ><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARGquantity" value="${stockGInfo.quantity}" onKeyPress="return numbersonly(event, false)" /></c:if><c:if test="${userLoginInfo.permission < '00015'}">${stockGInfo.quantity}</c:if></li>
								<li class="bdD"     ></li>
								<li class="bdD addL" style="color:red;"><fmt:formatNumber value="${stockGInfo.quantity * stockInfo.price}" pattern="#,###" /></li>
							</ul>
							<c:if test="${reminder > '0'}"><c:set var="cnt" value="${cnt+1}"/></c:if>
							<c:if test="${reminder == '0'}"><c:set var="cnt" value="${cnt}"/></c:if>
							
						</c:if></c:forEach>
						<c:if test="${reminder > '0'}">
							<ul>
								<input type="hidden" name="ARGsNb" value="">
								<input type="hidden" name="ARGturn" value="">
								<li class="bdD addF"><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARGstockDt" value="" onKeyPress="return numbersonly(event, false)" maxlength="8" /></c:if><c:if test="${userLoginInfo.permission < '00015'}"></c:if></li>
								<li class="bdD"     ><c:if test="${userLoginInfo.permission > '00014'}"><input class="stringS intNum" type="text" name="ARGquantity" value="" onKeyPress="return numbersonly(event, false)" /></c:if><c:if test="${userLoginInfo.permission < '00015'}"></c:if></li>
								<li class="bdD remin" style="font-weight:bold"></li>
								<li class="bdD addL" id="rmPrice${stockSt.count}" style="color:blue"></li>
								<script>$("#rmPrice${stockSt.count}").html(parent.add_comma("${reminder * stockInfo.price}"));</script>
							</ul>
							<script>$(".remin:last").html("${reminder}");</script>
						</c:if>
								
						</li>
					</ul>
					<script>$(".hx").addClass("h"+"${cnt}"+"x"); $(".h"+"${cnt}"+"x").removeClass("hx");</script><c:set var="cnt" value="0"/>
				</c:forEach>
				<c:if test="${userLoginInfo.permission > '00014'}">
					<ul class="tbody">
						<input type="hidden" name="ARturn" value="">
						<input type="hidden" name="sNbUP" value="">
						<li class=""></li>
						<li class=""><input class="stringS intNum" type="text" name="ARstockDt" value="" onclick="" onKeyPress="return numbersonly(event, false)" maxlength="8" /></li>
						<li class=""><input class="stringS intNum" type="text" name="ARquantity" value="" onKeyPress="return numbersonly(event, false)" /></li>
						<li class=""><input class="stringS intNum" type="text" name="ARpay" value="" onKeyPress="return numbersonly(event, false)" /></li>
						<li class="w4x2 bd0 pd0" style="padding: 0 0 4px 0">
							<ul>
								<input type="hidden" name="ARGsNb" value="">
								<input type="hidden" name="ARGturn" value="">
								<li class="bdD addF"><input class="stringS intNum" type="text" name="ARGstockDt" value="" onKeyPress="return numbersonly(event, false)" /></li>
								<li class="bdD"><input class="stringS intNum" type="text" name="ARGquantity" value="" onKeyPress="return numbersonly(event, false)" /></li>
								<li class="bdD"></li>
								<li class="bdD addL"></li>
							</ul>
						</li>
					</ul>
				</c:if>
				</div>
				<c:if test="${userLoginInfo.permission > '00014'}">
				<div class="clear">
					<span class="btn s orange" onclick="insertUl('stockOptionTab')"><a>추가</a></span>
				</div>
				</c:if>
			</div>
<!-- 스톡옵션 -->



<!-- 애로사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="problemTab">
					<ul class="header">
						<li>애로사항</li>
					</ul>

					<input type="hidden" name="staffSNb" value="${staffSNb}"/>
					<input type="hidden" name="division" value="1"/>
					
					<c:forEach var="proposalInfo" items="${proposal1}">
						<c:if test='${proposalInfo.division ==1}'>
						<input type="hidden" name="sNb" value="${proposalInfo.sNb }"/>
						<ul>
							<li><textarea class="textSize" name="contents"/>${proposalInfo.contents }</textarea></li>
						</ul>
						</c:if>
					</c:forEach>

					<c:if test="${empty proposal1}">
					<ul><li><textarea class="textSize" name="contents"/></textarea></li></ul>
					</c:if>
				</div>
			</div>
<!-- 애로사항 -->
<!-- 희망사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="hopeTab">
					<ul class="header">
						<li>희망사항</li>
					</ul>

					<input type="hidden" name="staffSNb" value="${staffSNb}"/>
					<input type="hidden" name="division" value="2"/>
					
					<c:forEach var="proposalInfo" items="${proposal2}">
						<c:if test='${proposalInfo.division ==2}'>
						<input type="hidden" name="sNb" value="${proposalInfo.sNb }"/>
						<ul>
							<li><textarea class="textSize" name="contents"/>${proposalInfo.contents }</textarea></li>
						</ul>
						</c:if>
					</c:forEach>
				
					<c:if test="${empty proposal2}">
					<ul><li><textarea class="textSize" name="contents"/></textarea></li></ul>
					</c:if>
				</div>
			</div>
<!-- 희망사항 -->
<!-- 긴급사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="mustTab">
					<ul class="header">
						<li>긴급사항</li>
					</ul>

					<input type="hidden" name="staffSNb" value="${staffSNb}"/>
					<input type="hidden" name="division" value="3"/>
					
					<c:forEach var="proposalInfo" items="${proposal3}">
						<c:if test='${proposalInfo.division ==3}'>
						<input type="hidden" name="sNb" value="${proposalInfo.sNb }"/>
						<ul>
							<li><textarea class="textSize" name="contents"/>${proposalInfo.contents }</textarea></li>
						</ul>
						</c:if>
					</c:forEach>
				
					<c:if test="${empty proposal3}">
					<ul><li><textarea class="textSize" name="contents"/></textarea></li></ul>
					</c:if>
				</div>
			</div>
<!-- 긴급사항 -->
<!-- 건의사항 -->
			<div class="table_style clear tabMenu privThings" style="display:none;">
				<div id="suggestTab">
					<ul class="header">
						<li>건의사항</li>
					</ul>

					<input type="hidden" name="staffSNb" value="${staffSNb}"/>
					<input type="hidden" name="division" value="4"/>
					
					<c:forEach var="proposalInfo" items="${proposal4}">
						<c:if test='${proposalInfo.division ==4}'>
						<input type="hidden" name="sNb" value="${proposalInfo.sNb }"/>
						<ul>
							<li><textarea class="textSize" name="contents"/>${proposalInfo.contents }</textarea></li>
						</ul>
						</c:if>
					</c:forEach>
				
					<c:if test="${empty proposal4}">
					<ul><li><textarea class="textSize" name="contents"/></textarea></li></ul>
					</c:if>
				</div>
			</div>
<!-- 건의사항 -->
		<!-- --------------------------------------------------------------------------------- -->

</div> <!-- wrap -->

</body>
</html>