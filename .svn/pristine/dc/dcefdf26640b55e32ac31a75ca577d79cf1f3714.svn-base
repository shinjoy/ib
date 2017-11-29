<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	
<!-- 인물 등록,업체등록 form -->
<form id="modifyCst" name="modifyCst" action="<c:url value='/person/modifyCst.do' />" method="post"><input type="hidden" id="m_Name" name="sNb"><input type="hidden" id="choose_popMain" name="choose_popMain"></form>
<form id="insertCst" name="insertCst" action="<c:url value='/work/popRgstCst.do' />" method="post"><input type="hidden" id="s_Name" name="cstNm"><input type="hidden" id="s_Name2" name="searchCstNm" value="${searchName}"><input type="hidden" id="flag1" name="modalFlag" value="${MDf}"><input type="hidden" id="num1" name="modalNum" value="${MDn}"></form>
<form id="insertCpn" name="insertCpn" action="<c:url value='/work/popRgstCpn.do' />" method="post"><input type="hidden" id="flag1" name="modalFlag" value="${MDf}"><input type="hidden" id="num1" name="modalNum" value="${MDn}"><input type="hidden" name="searchCpnNm" value="${searchName}"></form>



<div id="wrap">
 	<div class="mb_sub_location">
 		<c:choose>
 			<c:when test="${vo.openType eq 'inner' }">
 				<button type="button" class="back" id="scheduleProcPopCanBtn" onclick="closeRightBox('scheduleProcInnerPop','scheduleProcInnerArea');"><em>이전</em></button>
 			</c:when>
 			<c:otherwise>
 				<button type="button" class="back" id="scheduleProcPopCanBtn" onclick="closeBottomBox('scheduleProcPop','scheduleProcArea','first');"><em>이전</em></button>
 			</c:otherwise>
 		</c:choose>	
 		<a href="javascript:;" class="depth01">업무일정</a>
 		<a href="javascript:;" class="depth02">
	 		<c:choose>
				<c:when test="${vo.scheSeq eq 0  || scheVO.scheSeq eq ''}">일정등록</c:when>
				<c:otherwise>일정수정</c:otherwise>
			</c:choose>
		</a>
 	</div>
	<!--서브-->
   	<div class="containerWrap">  
     	<!--서브컨텐츠-->
       	<section class="contentsWrap con_pdst01 scrollArea schedulewrap">
		 	<form name="ScheAdd" id="ScheAdd" method="post" action="">
			<input type="hidden" name="InfoMessage" 		id="InfoMessage"/>
			<input type="hidden" name="CMD"					id="CMD"				value="${vo.CMD}"/>
			<input type="hidden" name="EmpCnt"				id="EmpCnt"				/>
			<input type="hidden" name="EventType"			id="EventType"			value="${scheVO.scheSeq > 0 || scheVO.scheSeq == '' ? 'Add' : 'Edit'}"/>
			<input type="hidden" name="ParentPage"			id="ParentPage"			value="mobile"/>
			<input type="hidden" name="SelDate"				id="SelDate"			value="${vo.scheSDate}"/>
			<input type="hidden" name="PerSabun"			id="PerSabun"			value="${userLoginInfo.sabun}"/>
			<input type="hidden" name="RegPerSabun"			id="RegPerSabun"		value="${userLoginInfo.sabun}"/>
			<input type="hidden" name="IB_ID"				id="IB_ID"				value="${loginVO.IB_ID}"/>
			<input type="hidden" name="ScheSeq"				id="ScheSeq"			value="${scheVO.scheSeq}"/>
			<input type="hidden" name="ScheGrpCd"			id="ScheGrpCd"			value="${scheVO.scheGrpCd}"/>
			<input type="hidden" name="ProcFlag"			id="ProcFlag"			value="${vo.procFlag}"/>
			<input type="hidden" name="ScheSYear"			id="ScheSYear"/>
			<input type="hidden" name="ScheSMonth"			id="ScheSMonth"/>
			<input type="hidden" name="ScheSDay"			id="ScheSDay"/>
			<input type="hidden" name="ScheEYear"			id="ScheEYear"/>
			<input type="hidden" name="ScheEMonth"			id="ScheEMonth"/>
			<input type="hidden" name="ScheEDay"			id="ScheEDay"/>
			<input type="hidden" name="SchePeriodFlag"		id="SchePeriodFlag"		value="${scheVO.schePeriodFlag}"/>
			<input type="hidden" name="ScheAlarmFlag"		id="ScheAlarmFlag"/>
			<input type="hidden" name="ScheRepetFlag"		id="ScheRepetFlag"		value="None"/><!-- 반복은 일단 없는걸로... -->
			<input type="hidden" name="ScheRepetFlagTmp"	id="ScheRepetFlagTmp"	value="${scheVO.scheRepetFlag}"/>
			<input type="hidden" name="ScheGubun" 			id="ScheGubun"			value="${scheVO.scheGubun}"/>
			<input type="hidden" name="ScheType" 			id="ScheType"			value="${scheVO.scheType}"/>
			<input type="hidden" name="ContactLoc" 			id="ContactLoc"			value="mobile"/>
			<input type="hidden" name="SearchPerSabun" 		id="SearchPerSabun"	value="${userLoginInfo.sabun}"/>
			<input type="hidden" name="beforePage" 	id="beforePage"		value="${vo.beforePage}"/> 
		 	<input type="hidden"  name="ScheTitle" id="ScheTitle" value="${scheVO.scheTitle}"/>
		 	<input type="hidden"  name="changePeriodN" id="changePeriodN"/>
		 	
		 	<input type="hidden"  name="CarUseFlag" id="CarUseFlag"/>
		 	<input type="hidden"  name="meetingRoomUseFlag" id="meetingRoomUseFlag"/>
		 	<input type="hidden"  name="CarNum" id="CarNum"/>
		 	
		 	<input type="hidden"  name="grpCd" id="grpCdNew" value="${scheVO.grpCd}"/>				<!-- 2017-09-14 신규 일정 그룹코드 추가 -->
		 	
		 	<!-- 직원 선택 변경에 따른 추가 -->
		 	<div style="display:none;" id="userSelectArea"></div>
		 	<!-- 회의실 예약 추가 -->
		 	<input type="hidden" name="meetingRoomId"	id="meetingRoomId"	value=""/>
		 	<input type="hidden" name="userSeq"				value="${userLoginInfo.staffSnb }"/>
		 	<input type="hidden" id="rsvId" name="rsvId" value="0"/>
		 	<!-- 지금은 안보이는 화면 -->
		 	<div data-role="fieldcontain">
				<fieldset data-role="controlgroup" data-type="horizontal" style="display:none;">
		 			<legend>구분</legend>
		 			<input type="radio" name="ScheduleGubun" id="ScheduleGubun1" value="All" checked>
		 			<label for="ScheduleGubun1">전체 일정</label>
		 			<input type="radio" name="ScheduleGubun" id="ScheduleGubun2" value="Alone">
		 			<label for="ScheduleGubun2">개인 일정</label>
		 		</fieldset>
	        </div>
	        <!-- //////// -->
	        <!-- <div style="overflow:scroll; width:100%; height:370px; display:inline-block;-webkit-overflow-scrolling:touch;"></div> -->
			<table class="tb_input_basic02" summary="일정등록(입력방식, 업무분류, 기간, 인물ㆍ회사, 제목, 참가자, 중요도, 장소, 세부내용, 알람설정)">
				<caption>일정등록</caption>
				<colgroup>
					<col width="75" />
					<col width="*" />
				</colgroup>
				<!-- 기본 입력 -->
				<tr>
					<th scope="row" class="valign"><label for="ScheduleType">업무분류</label><span class="redstar">*</span></th>
					<td>
						<p class="itemlist mgb03rem">
							<label><input type="checkbox" name="IsMna" id="IsMna" onclick="javascript:scheProcObj.chkIsMna();"><span>M&amp;A 업무여부</span></label>
							<label><input type="checkbox" name="Secret" id="Secret" disabled="disabled" onclick="javascript:scheProcObj.checkSecret(this);"/><span>비공개</span></label>
						</p>
						<select id="ScheduleType" class="select_basic wselwork" name="ScheduleType" onchange="scheProcObj.chngScheType();">
							<optgroup label="관리">
								<option value="Invest">투자</option>
								<option value="Notice">알림(공지)</option>
								<option value="Private">개인메모</option>
								<option value="Mt_inside">회의</option>
								<option value="Schedule">일정</option>
							</optgroup>
							<optgroup label="업무">
								<option value="IR">IR</option>
								<option value="Visit">탐방</option>
								<option value="Meet">미팅</option>
								<option value="Mt_lunch">점심미팅</option>
								<option value="Mt_dinner">저녁미팅</option>
								<option value="Inspect">실사</option>
								<option value="Mediate">중개</option>
								<option value="Manage">관리</option>
								<option value="BusiTrip">출장</option>
							</optgroup>
						</select>	
					</td>
           		 	</tr>
                   	<tr>
                   		<th scope="row" class="valign"><label for="ScheSDate">기간</label><span class="redstar">*</span></th>
                          	<td class="valign">
                          		<p class="itemlist mgb03rem">
                          			<label><input type="checkbox" name="AllTime" id="AllTime" onclick="scheProcObj.checkAllTime();"><span>종일일정</span></label>
                          		</p>
                          		<input type="hidden" name="ScheAllTime" id="ScheAllTime"  value="N"/>
	                           	<p class="mgb05rem">
	                            	<input type="date" name="ScheSDate" id="ScheSDate"  class="input_basic wdate" title="시작일 날짜" onchange="scheProcObj.checkDateValidation(this.name);" />
	                            	<select name="STime" id="STime" class="select_basic wtime mgl02rem"  onchange="scheProcObj.scheTimeChange(this.id, this.value); $('#ScheEDate').focus();"></select>
	 								<input type="hidden" name="ScheSTimeAMPM" id="ScheSTimeAMPM" />
									<input type="hidden" name="ScheSTime" id="ScheSTime" />
	                           	</p>
	                            <p>
		                            <input type="date" name="ScheEDate" id="ScheEDate"  class="input_basic wdate" title="종료일 날짜" onchange="scheProcObj.checkDateValidation(this.name);"/>
		                            <select name="ETime" id="ETime" class="select_basic wtime mgl02rem" onchange="scheProcObj.scheTimeChange(this.id, this.value);"></select><br/>
									<input type="hidden" name="ScheETimeAMPM" id="ScheETimeAMPM" />
									<input type="hidden" name="ScheETime" id="ScheETime" />
	                            </p>
                          		<p id="dateErrDiv" class="p_notice redpoint mgt05rem" style="display:none;" ></p>
                           </td>
                       </tr> 
					<tr>
						<th scope="row" class="valign">참가자</th>
						<td>
		             		<p class="itemlist mgb05rem">
			             		<button type="button" id="joinMember" class="btn_3dst_basic" onclick='scheProcObj.userSelectPop();'>
			             			<em class="icon_joinmember">참가자선택</em>
			             		</button>
		             		</p>
		             		<ul class="join_memberlist"  id="userDiv">
		             			<li id='li_${userLoginInfo.sabun}'>
		             				<strong>${userLoginInfo.name}</strong><button type="button" id ="btn_${userLoginInfo.sabun}" onclick="deleteUser(${userLoginInfo.sabun});" ><span><em>삭제</em></span></button>
		             				<input type="hidden" name="selectUserId" value="${userLoginInfo.sabun}"/>
		             			</li>
		             		</ul>
					 	</td>
				 	</tr>
				 	<tr>
						<th scope="row" class="valign"><label>인물/회사</label></th>
						<td class="valign">
		              		<input type="hidden" id="s_Name" name="cstNm">
		              		<input type="hidden" id="s_Name2" name="searchCstNm" value="${searchName}">
		              		<input type="hidden" id="flag1" name="modalFlag">
		              		<input type="hidden" id="num1" name="modalNum" >
		                  	<input type="text" id="AP_infoProviderNm" class="input_basic wpeople" placeholder="인물선택" readonly="readonly" onclick="commonPopAllObj.commonComORCusPop(1,'0','iP','searchPerson')" title="인물선택" />
		              		<input type="text" id="AP_cpnNm" class="input_basic wpeople mgl02rem" placeholder="회사선택" readonly="readonly" onclick="commonPopAllObj.commonComORCusPop(1,'0','c','searchCompany')" title="회사선택" />
							<button type="button" onclick="scheProcObj.resetCstCpn();" class="btn_3dst_basic2 mgl02rem"><span class="icon_reset"><em>초기화</em></span></button>
							<br/>
							<span id="personDiv" style="display:none;"></span><span id="tagDiv" style="display:none;">:</span>
							<span id="companyDiv"style="display:none;"></span>
							<input type="hidden" class="input_box" name="tmpCstNm" id="tmpCstNm" readonly="readonly" />
							<input type="hidden" name="tmpCstId" id="tmpCstId" />
							<input type="hidden" class="input_box" name="tmpCpnNm" id="tmpCpnNm" readonly="readonly" />
		                    <input type="hidden" name="tmpCpnId" id="tmpCpnId" />
						</td>
					</tr>                 
					<tr>
						<th scope="row" class="valign"><label for="ScheTitleTmp">제목</label><span class="redstar">*</span></th>
						<td class="valign">
							<p id="titleDiv" class="mgb06rem" style="display:none;">${scheVO.scheTitle}</p>
							<input type="text"  class="input_basic w100pro" name="ScheTitleTmp" id="ScheTitleTmp" placeholder="제목을 입력해주세요."/>
						</td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="IDNAME07">중요도</label></th>
						<td>
							<p class="itemlist">
								<label><input type="radio" name="ScheImportant" id="ScheImportant1" value="top"><span>상</span></label> 
								<label><input type="radio" name="ScheImportant" id="ScheImportant2" value="middle"><span>중</span></label>
								<label><input type="radio" name="ScheImportant" id="ScheImportant3" value="bottom"><span>하</span></label>
							</p>
						</td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="ScheArea">장소</label></th>
						<td><input type="text"  class="input_basic w100pro"  name="ScheArea" id="ScheArea" placeholder="장소를 입력해주세요." value="${scheVO.scheArea}"/></td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="IDNAME09">세부내용</label></th>
						<td><textarea  cols="5" rows="2" name="ScheCon" id="ScheCon" class="textarea_basic w100pro" placeholder="세부내용을 입력해주세요.">${scheVO.scheCon}</textarea></td>
					</tr>
					<!-- //기본 입력 //-->
					
					<tr class="detailArea">
						<th scope="row" class="valign"><label for="carUseChk">차량사용</label></th>
						<td>
							<p class="itemlist">
								<label><input type="checkbox" id="carUseChk" value="Y" onclick="scheProcObj.checkCarUse();"><span>사용함</span></label>
								<label><button type="button" class="btn_3dst_basic" onclick="scheProcObj.carUseListPop();"><em class="icon_carreser">예약현황</em></button></label>
							</p>
							<p>
								<select class="select_basic mgt05rem w100pro" name ="CarNumSelect" title="차량선택" id ="CarNumSelect" style="display:none;">
									<option value="X">차량선택</option>
									<c:forEach var="car" items="${CarList}" varStatus="status">
										<c:choose>
											<c:when test="${car.caruseflag eq 'N'}"><option value="${car.carnum}">${car.carnum}</option></c:when>
											<c:otherwise><option value="${car.carnum}" style="background:#FFD7EB;">${car.carnum} - (${car.pernm} ${car.stime} ~ ${car.etime})</option></c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</p>
						</td>
					</tr>
					
					<tr class="detailArea">
						<th scope="row" class="valign"><label for="">회의실사용</label></th>
						<td>
							<p class="itemlist">
								<label><input type="checkbox"  id="meetingRoomUseChk" value="Y" onclick="scheProcObj.changeScheTimeToMeetTime();"><span>사용함</span></label>
								<label><button type="button" class="btn_3dst_basic"  onclick="scheProcObj.meetingRoomRsvList();"><em class="icon_meetreser">예약현황</em></button></label>
							</p>
							<div id="useMeetRoom" style="display:none;" class="mgt05rem">
								<p id="useTimeArea"></p>
								<p id="meetingRoomArea" class="mgt05rem"></p>
							</div>
						</td>
					</tr>
				     <tr class="detailArea">
		               	<th scope="row" class="valign"><label for="IDNAME10">알림설정</label></th>
		                <td class="valign">
		                    <p>
		                        <select id="ScheAlarm" name="ScheAlarm" class="select_basic wdate" onchange="scheProcObj.checkAlarm();">
		                            <option value="None">없음</option>
		                            <option value="7">일주일전</option>
		                            <option value="0">당일</option>
		                            <option value="Write" >직접입력</option>
		                        </select>
		                        <span id="dayDiv" style="display:none;">
		                        	<input type="text" name="WriteDay" id="WriteDay" class="input_basic w_setday mgl02rem" onkeyup="NumFormat(this.name, this.value);" title="며칠전 직접입력" />
		                        	<span class="mgl03rem">일전</span>
		                        </span>
		                    </p>
		                </td>
			          </tr>
		              <tr id="AlarmHowTr" style="display:none;">
		              	<th scope="row" class="valign"><label for="IDNAME11">알림방식</label></th>
		                <td class="itemlist">
			                <label><input type="radio" name="AlarmHow" value="Pop"  checked="checked"><span>팝업</span></label>
			                <label><input type="radio" name="AlarmHow" value="PopSMS"><span>팝업 &amp; 문자</span></label>
		                	<input type="hidden" name="ScheAlarmHow" id="ScheAlarmHow" value="None"/>	
		                </td>
		              </tr>
		              <tr style="display:none;"><!-- /현재 안보임.. -->
		               	<th scope="row" class="valign"><label for="IDNAME10">공개여부</label></th>
		                <td>
		                    <p class="itemlist">
		                        <label><input type="radio" name="SchePublicFlag" id="SchePublicFlag1" value="Y" checked="checked">공개</label>
								<label><input type="radio" name="SchePublicFlag" id="SchePublicFlag2" value="N" >비공개</label>
		                    </p>
		                </td>
			          </tr>
	        	   </table>
	        	   <div>
                       	<button type="button" onclick="scheProcObj.setDetailArea();" class="detailBtnArea">추가입력(회의실, 차량, 알림)</button>
                   </div>
	       		</form>
         		<div class="btn_box_basic">
              		<ul class="btn_b_list btn_count2">
              			<c:choose>
				 			<c:when test="${vo.openType eq 'inner' }">
				 				<li><button type="button" class="btn_mobile_gray01" onclick="closeRightBox('scheduleProcInnerPop','scheduleProcInnerArea');">뒤로</button></li>
				 			</c:when>
				 			<c:otherwise>
				 				<li><button type="button" class="btn_mobile_gray01" onclick="closeBottomBox('scheduleProcPop','scheduleProcArea','first');">뒤로</button></li>
				 			</c:otherwise>
			 			</c:choose>	
                  		<li><button type="button" id="AddEnd" onclick="scheProcObj.scheduleProcEnd();" class="btn_mobile_blue01">저장</button></li>
                       	<li><button type="button" id="EditEnd" onclick="scheProcObj.scheduleProcEnd();" style="display:none;" class="btn_mobile_blue01">완료</button></li>
                  </ul>
               </div>           
       	</section>
  	</div>
</div>



<script>

//공통 팝업 리턴함수

//회사 인물 선택 리턴 함수. 
function returnCompanyPersonPopUp(rVal){
	
	var flag = rVal.f
	var nm = rVal.nm
	var num = rVal.n;
	
	if(flag=='c'){
		
		var tmpSpan = document.createElement("span");
		tmpSpan.innerHTML = rVal.nm;
		
		var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cpnId = rVal.snb;
		
		
		$('#tmpCpnNm').val(cpnNm);			//회사명 표시
		$('#tmpCpnId').val(cpnId);			//회사 ID 임시저장
		
		$('#AP_cpnNm').val(cpnNm);			//회사 ID 임시저장
		
		$('#AP_cpnNm').val(cpnNm);				//회사 명
	
		$('#companyDiv').html(cpnNm);
		$('#ScheArea').val(cpnNm);			//장소 표시
		
		closeBottomBox('searchCompanyPop','onlyCompany','second'); // 공통함수 mobile.js
		
	}else{
		
		//인물
  		var tmpSpan = document.createElement("span");
		tmpSpan.innerHTML = rVal.nm;
		
		var cstNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 인물명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cstId = rVal.snb;
		
		$('#tmpCstNm').val(cstNm);			//인물명 표시
		$('#tmpCstId').val(cstId);			//인물 ID 임시저장
		$('#personDiv').html(cstNm);
		
		//회사
		tmpSpan.innerHTML = rVal.cpnNm;
		
		var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cpnId = rVal.cpnId;
		
		$('#tmpCpnNm').val(cpnNm);			//회사명 표시
		$('#tmpCpnId').val(cpnId);			//회사 ID 임시저장
	
		$('#companyDiv').html(cpnNm);
		$('#ScheArea').val(cpnNm);			//장소 표시
		
		$('#AP_infoProviderNm').val(cstNm);		//인물 명
		$('#AP_cpnNm').val(cpnNm);				//회사 명
		
		//backPanel('searchPersonPop','','onlyCompany');		//패널 닫기 공통함수 mobile.js
		closeBottomBox('searchPersonPop','onlyCompany','second');
	}
					 
	scheProcObj.setAutoMakeTitle();				//제목 자동생성 호출
	$("#ScheTitleTmp").focus(); 

}

//직원 공통 팝업 리턴 값
function selectUserPopGetResult(resultList, g_parentKey){
	
	
	$("#userDiv").html('');
	
	var userSabun = [];
	var str = '';
	for(var i=0;i<resultList.length;i++){
		
		userSabun.push(resultList[i].sabun);
		
		//-- 이름 세팅
		str +=' <li id="li_'+resultList[i].sabun+'"><span>' ;
		
		if('${userLoginInfo.sabun}' == resultList[i].sabun) str+='<strong>'+resultList[i].userNm+'</strong>';
		else str +=resultList[i].userNm;
		
		str +='</span><button type="button" id ="btn_'+resultList[i].sabun+'" onclick="deleteUser(\''+resultList[i].sabun+'\');" ><span><em>삭제</em></span></button>';
		str +=' <input type="hidden" name="selectUserId" value="'+resultList[i].sabun+'"/>';
		str +=' </li>';
		
	}
	
	$("#userDiv").append(str);
	
	
}


//삭제
function deleteUser(sabun){ $("#li_"+sabun).remove();}

var g_meetingRoomList = new Array();

//분류    	
var g_sTypeObj = {
		       			 Invest:	'투자'
				   		,Notice:		'알림'
					   	,Schedule:		'일정'
				   		,Mt_inside:		'회의'
			   			,Private:		'메모'
					   	,IR:			'IR'
					   	,Visit:			'탐방'
					   	,Meet:			'미팅'
					   	,Mt_lunch:		'점심미팅'
					   	,Mt_dinner:		'저녁미팅'
					   	,Inspect:		'실사'
					   	,Mediate:		'중개'
					   	,Manage:		'관리'
					   	,BusiTrip:		'출장'
		   	
		   };		 

var g_noRsvList = [];		//예약 리스트

var g_rsvList = [];			//회의실 현황 

var g_orgUserList =[];		//DB 저장 참가자 리스트 	



var scheProcObj = {
	
	preloadCode : function(){
		
		if('${scheVO.scheSeq}' == "") $("#EventType").val('Add');
		else  $("#EventType").val('Edit');
		
		scheProcObj.timeSelectSet();	//일정 & 회의실 시간 셀렉트 세팅
		
		if($("#EventType").val() == 'Add') {		//신규모드
			
			var selectDate =  new Date().yyyy_mm_dd();
			
			if(g_selectDate != '' && g_selectDate != 'undefined') selectDate= g_selectDate;
			
			///선택된 날짜 세팅.
			$('#ScheSDate').val(selectDate);
			$('#ScheEDate').val(selectDate);
			
		}else {								//수정모드
			
			scheProcObj.setScheInfo();
			
		}
		
		
	},
	
	 //미팅룸 리스트 
    getMeetingRoomList : function(){
    	
    	var url = contextRoot + "/meetingRoom/getMeetingRoomList.do";
		
    	var param = {enable : 'Y', sortCol:'GROUP_CODE',  sortVal:'ASC'};
		
		var callback = function(result){
			var obj = JSON.parse(result);
			var list = obj.resultList;	
    		
    		for(var i=0;i<list.length;i++) {
    			g_meetingRoomList.push({id : list[i].meetingRoomId , title : list[i].meetingRoomNmS, meetingRoomNm : list[i].meetingRoomNm, groupCode : list[i].groupCode});
    		}
    		
		};
		
		commonAjax("POST", url, param, callback, false);
    },
	
	//수정일때 
	setScheInfo : function(){
		
		$('#STime').val('${scheVO.scheSTimeAMPM}${scheVO.scheSTime}');
		$('#ETime').val('${scheVO.scheETimeAMPM}${scheVO.scheETime}');
		
		$('#AddEnd').hide(); //저장버튼 감추기
		$('#EditEnd').show();
		
		$('input:radio[name="ScheduleGubun"]:input[value="${scheVO.scheGubun}"]').attr("checked", true);		//구분(숨김) ...전체일정,개인일정
		
		$("#ScheduleType").val("${scheVO.scheType}").attr("selected", "selected");
		
		scheProcObj.chngScheType();		//분류선택 세팅
		
		
		if('${scheVO.scheAllTime}' == 'Y') {
			$('#ScheAllTime').val("Y");
			$('#STime').hide();
			$('#ETime').hide();
			$('input[name="AllTime"]').attr("checked", true);
		}
		
		$('#titleDiv').html('${scheVO.scheTitle}');
		
		if('${scheVO.scheTitle}' == '') $('#titleDiv').hide();
		else $('#titleDiv').css('display','block');
		
		
		$('#ScheTitle').val('${scheVO.scheTitle}');
		
		$('#ScheSDate').val('${scheVO.scheSDate}');
		$('#ScheEDate').val('${scheVO.scheEDate}');
		$('#SelDate').val('${scheVO.scheSDate}');
		$("#CarUseFlag").val('${scheVO.carUseFlag}')
		
		//차량 세팅
		if('${scheVO.carUseFlag}' == 'Y') {
			
			$("#carUseChk").prop("checked", true);
			scheProcObj.checkCarUse();
			//$('#carUseChk').trigger('click');
			$('#CarNum').val('${scheVO.carNum}');
			$('#CarNumSelect').val('${scheVO.carNum}'+'_-_'+'${scheVO.scheSeq}');
			
		}
		
		
		$('input:radio[name="ScheRepetFlag"]:input[value="${scheVO.scheRepetFlag}"]').attr("checked", true);
		
		var ScheAlarmFlag = '${scheVO.scheAlarmFlag}';
		
		// 직접입력이면
		if(ScheAlarmFlag != '7' && ScheAlarmFlag != '0' && ScheAlarmFlag != 'None') {	
			
			$("#ScheAlarm").val("Write").attr("selected", "selected");
			$('#dayDiv').show();
			
			$('#WriteDay').val(ScheAlarmFlag);
		
		}else $("#ScheAlarm").val(ScheAlarmFlag).attr("selected", "selected");
		
		if(ScheAlarmFlag != "None") {			//알림방식 없음이 아니면.
			$('#AlarmHowTr').show();			//알림방법 
			
			$('input:radio[name="AlarmHow"]:input[value="${scheVO.scheAlarmHow}"]').attr("checked", true);
		}
		
		$('input:radio[name="ScheImportant"]:input[value="${scheVO.scheImportant}"]').attr("checked", true);
		
		
		//세부내용 세팅
		$('#ScheCon').val('${scheVO.scheCon}');
		
		var form = document.ScheAdd;				
		
		//-- M&A 세팅 
		if('${scheVO.scheType}' == 'mna') form.mnaType.value = '${scheVO.mnaType}';		//값 세팅
		if('${scheVO.mnaType}' == 'M') form.IsMna.checked = true;
		
		
		$('#tmpCpnNm').val('${scheVO.companyNm}');
		$('#tmpCpnId').val('${scheVO.company}');
		$('#tmpCstNm').val('${scheVO.customer}');
		$('#tmpCstId').val('${scheVO.customerId}');
		$('#companyDiv').html('${scheVO.companyNm}');
		$('#personDiv').html('${scheVO.customer}');
		
		$('#AP_infoProviderNm').val('${scheVO.customer}');			//인물 명
		$('#AP_cpnNm').val('${scheVO.companyNm}');					//회사 명
		
		
		//회의실 세팅
		if('${meetingRoomChk}' != 0){
			
			$("#meetingRoomUseChk").prop("checked", true);
			$('#rsvId').val('${meetingRoom.rsvId}');
			
			scheProcObj.setMeetingRoomList();
			
			$("#meetStartTime").val('${meetingRoom.startTime}');
			$("#meetEndTime").val('${meetingRoom.endTime}');
			
			$('#selectRoomId').val('${meetingRoom.meetingRoomId}');
		}
		
		$('#ScheArea').val('${scheVO.scheArea}');	//장소
		
		scheProcObj.getScheduleEntryList();			//참가자
		
		//개인 메모 
		if('${scheVO.scheGubun}' == 'Alone') {
			
			$('input:radio[name="SchePublicFlag"]:input[value="${scheVO.schePublicFlag}"]').attr("checked", true);
			$('#SchePublicFlag2').attr('disabled', false);
			$('#joinMember').hide();
			$("#btn_${userLoginInfo.sabun}").hide();
			
			if('${scheVO.schePublicFlag}' == 'N'){
				
				$('#Secret').attr('checked', true);
				$('#Secret').removeAttr('disabled');
			}
		}
		
		if('${scheVO.carUseFlag}' == 'Y' || '${meetingRoomChk}' != 0 || ScheAlarmFlag != "None")  scheProcObj.setDetailArea();
		
	},
	
	//수정시 참가자 세팅
 	getScheduleEntryList : function(){
		
		var url=contextRoot+"/getScheduleEntryList.do";
		var param = {
		    			scheSeq 	: $("#ScheSeq").val(),
		    			eventType   : 'Edit'
					};
		
		var callback = function(result){
			
			var obj = JSON.parse(result);
			var cnt = obj.resultVal;		//결과수
			var list = obj.resultList;		//결과데이터JSON
			
			g_orgUserList = list
			
			if(list.length>0) selectUserPopGetResult(list);
			
			
		};

		commonAjax("POST", url, param, callback, false, null, null);
	},


	
	
	/* =====================클릭 & 셀렉트 세팅 : S==================== */
	
	//분류세팅
	chngScheType : function(){
		
		var scheduleType = $('#ScheduleType').val();	
		
		if(scheduleType == 'Private'){						//개인메모 이면 일정구분(숨기있음)이 개인일정으로 선택되도록
			
			$('#ScheduleGubun2').trigger('click');
			$('#joinMember').hide(); 
			$('#Secret').attr('disabled', false);			//비공개 활성화
			
			$("#userDiv").find('li').not("#li_${userLoginInfo.sabun}").remove();
			$("#btn_${userLoginInfo.sabun}").hide();
			
			
		}else{												//일정구분 > 전체일정
			
			$('#ScheduleGubun1').trigger('click');
			$('#Secret').removeAttr('checked');
			$('#joinMember').show(); 
			$("#btn_${userLoginInfo.sabun}").show();
			$('#Secret').attr('disabled', true);			//비공개 비활성화
		}
		
		
		//메모 활성화여부, M&A업무여부
		if(scheduleType == 'Invest' || scheduleType == 'Notice' || scheduleType == 'Private' || scheduleType == 'Mt_inside' || scheduleType == 'Schedule'){
		
			$("#IsMna").prop("checked", false);
			$("#IsMna").attr("disabled", true);
			
			
		}else{
			
			if(!$('#IsMna').is(':checked')) $("#IsMna").attr("disabled",false);
			
		}
		
		scheProcObj.setAutoMakeTitle();		//제목자동생성 호출
		$("#ScheSDate").focus();
	},
	
	//사용가능 차량 
	getEnableCarList : function() {
		
		var rslt = true;
		
		var ScheSTime, ScheETime;
		if($('#ScheSTimeAMPM').val() == 'PM' && $('#ScheSTime').val().split(':')[0] != 12) Time = Number($('#ScheSTime').val().split(':')[0]) + Number(12);
		else Time = Number($('#ScheSTime').val().split(':')[0]);
		ScheSTime = Time + ':' + $('#ScheSTime').val().split(':')[1];
		
		if($('#ScheETimeAMPM').val() == 'PM' && $('#ScheETime').val().split(':')[0] != 12) Time = Number($('#ScheETime').val().split(':')[0]) + Number(12);
		else Time = Number($('#ScheETime').val().split(':')[0]);
		ScheETime = Time + ':' + $('#ScheETime').val().split(':')[1];
		
		var url = contextRoot + "/m/schedule/enableCarList.do"
		
		
		var param = {
						ScheSDate : $('#ScheSDate').val(),
						ScheSTime : ScheSTime,
						ScheETime : ScheETime
				};
	
	
		var callback = function(result){
		
			var obj = JSON.parse(result);
			var list = obj.resultList;	
			
			if($("#carUseChk").is(":checked")){
				$('#CarNumSelect').empty();
				$('#CarNumSelect').append('<option value="X" >차량');
				var cnt =0;
				$.each(list, function(i) {
					var hqId = '${userLoginInfo.hqId}';		//로그인 사용자의 법인	
					
					if(hqId == list[i].cpn 
						|| ((hqId == '1' || hqId == '2') && (list[i].cpn == '1' || list[i].cpn == '2'))){
						
						if(list[i].caruseflag == 'N'){
							 $('#CarNumSelect').append("<option value="+ list[i].carnum +">"+ list[i].carnum +" - "+list[i].managerNm+"</option>");
							 cnt++;
						}else if(list[i].caruseflag == 'Y' && list[i].scheseq == $('#ScheSeq').val()){
							$('#CarNumSelect').append("<option value="+ list[i].carnum +"_-_"+ list[i].scheseq +" selected>"+ list[i].carnum + " - (" +list[i].pernm + " " + list[i].stime + " ~ " + list[i].etime + ")</option>");
							cnt++;
						}//else $('#CarNum').append("<option value="+ list[i].carnum +" style='background:#FFD7EB;'>"+ list[i].carnum + " - (" +list[i].pernm + " " + list[i].stime + " ~ " + list[i].etime + ")</option>");
					}
				});
				
				$('#CarNumSelect').append("</option>");
				
				if(cnt == 0){
					rslt = false;
					swal("예약가능한 차량이 없습니다.");
				}
				
				
			}
			
		}
		
		commonAjax("POST", url, param, callback, false);
		

		return rslt;
	},
	
	//차량 사용 라디오 클릭 
	checkCarUse : function(){
		
		if($('#carUseChk').is(':checked')) $('#CarNumSelect').show();
		else $('#CarNumSelect').hide();
		
		
		if($('input[name="AllTime"]').is(":checked")) {
			
			scheProcObj.scheTimeChange('STime', 'AM8:30');
			scheProcObj.scheTimeChange('ETime', 'PM6:00');
			
		}else {
			
			scheProcObj.scheTimeChange('STime', $('#STime').val());
			scheProcObj.scheTimeChange('ETime', $('#ETime').val());
		}
		
		var rslt = scheProcObj.getEnableCarList();				//사용가능 차량리스트
		//scheProcObj.changeScheTimeToMeetTime();		//회의실 시간 및 사용가능 회의실 세팅 
		
		if(!rslt){
			$('#CarNumSelect').hide();
			$('#carUseChk').prop('checked',false);
			$('#CarNumSelect').empty();
			$('#CarNumSelect').append('<option value="X" >차량선택</option>');
		} 
		
		
	},
	
	//M&A업무여부 체크
	chkIsMna : function()	{
		
		scheProcObj.setAutoMakeTitle();		//제목자동생성 호출
	},
	
	//제목 자동생성 호출
	setAutoMakeTitle : function(){
		
		var form = document.ScheAdd;
		
		var title = '';
		
		//분류
		var kV = $("#ScheduleType").val();
		if(kV != undefined) title += '[' + g_sTypeObj[kV] + '] ';
		
		//회사
		var cpV = $('#tmpCpnNm').val();
		if(cpV.trim().length > 0) 	title += $('#tmpCpnNm').val() + ' ';		//회사정보 ( 회사명 )
		
		//인물
		var csV = $('#tmpCstNm').val();
		if(csV.trim().length > 0)	title += $('#tmpCstNm').val() + ' ';		//인물정보 ( 인물명 )
		
		
		
		if($('#IsMna').is(':checked')){				//M&A 일경우
			title += '/ M&A /';
		}
		
		//추가 제목입력 사항
		var aV = $('#ScheTitleTmp').val();
		if(aV.trim().length > 0) title += ' ' + aV;
		
		
		$('#titleDiv').html(title);
		
		if(title=='') $('#titleDiv').hide();
		else $('#titleDiv').show();
		
		
		$('#ScheTitle').val(title);
		$('#ScheCon').val(title);	//내용에도 추가
	},
	
	///차량 리스트 가져올때 체크해야하기 때문에. 시간 유효성 체크 필요
	checkDateValidation : function(Obj){
		
		var starDate = $("#ScheSDate").val();
		var endDate = $("#ScheEDate").val();
		
		if(starDate > endDate) {
			$("#dateErrDiv").html("일정 시작일이 종료일보다  이후입니다!");
			$("#dateErrDiv").css('display','block');
			$('#ScheSDate').focus();
			
		}else{
			$("#dateErrDiv").html("");
			$("#dateErrDiv").hide();
			
			scheProcObj.getEnableCarList();		//사용가능 차량 
			
			if(Obj == 'ScheSDate') $("#STime").focus();		
			
			if(Obj == 'ScheEDate') $("#ETime").focus();		
			
		}
	},
	
	
	
	
	//종일일정 클릭 
	checkAllTime : function(){
		
		if($('input[name="AllTime"]').is(":checked")) {
			$('#ScheAllTime').val("Y");
			$('#STime').hide();
			$('#ETime').hide();
		}
		else {
			$('#ScheAllTime').val("N");
			$('#STime').show();
			$('#ETime').show();
		}
		
		scheProcObj.getEnableCarList();
	
	},
	
	//일정의 시간 세팅 
	timeSelectSet : function(){
		
		//-- 회의실 시간 : S
		var timeArr = [];
		
		for(var i=8;i<22;i++){
			
			var timeStr = fillzero(i,2);	//2자리로 맞춘다
			
			timeArr.push({id : timeStr+':00:00' , name : timeStr+':00'});
			timeArr.push({id : timeStr+':30:00' , name : timeStr+':30'});
		}
		
		timeArr.push({id : '22:00:00' , name : '22:00'});
																								
		var startTimeSelectTag = createSelectTag('meetStartTime', timeArr, 'id', 'name', '', 'scheProcObj.setMeetingRoomList();', '', '','select_basic w_time mgr02rem');
		var endTimeSelectTag = createSelectTag('meetEndTime', timeArr, 'id', 'name', '', 'scheProcObj.setMeetingRoomList();', '', '','select_basic w_time mgl02rem');
		
		$("#useTimeArea").html(startTimeSelectTag+'~'+endTimeSelectTag);
		
		//-- 회의실 시간 : E
		
		
		
		
		for(var Hour = 0; Hour < 24; Hour++) {
			for(var Min = 0; Min < 2; Min++) {
				
				if(Hour >= 12) {
					AMPM = "오후 ";
					AMPM_Val = "PM";
					Hh = Hour - 12;
					Color = '#00CECE';
				
				}else {
					AMPM = "오전 ";
					AMPM_Val = "AM";
					Hh = Hour;
					Color = '#CEFFFF';
				}
				
				if(Hh == 0) Hh = 12;

				if(Min == 0) Mm = ':00';
				else Mm = ':30';
				
				var Now = new Date();
				var SHh = Now.getHours();
				var EHh = Now.getHours() + 1;
				
				//시작시간
				if(SHh == Hour) {
					$('#STime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";' selected>"+AMPM + Hh + Mm+"</option>");
					if('${scheVO.scheSeq}' == '') {
						
						$('#ScheSTimeAMPM').val(AMPM_Val);
						$('#ScheSTime').val(Hh + Mm);
					
					}else {
						
						$('#ScheSTimeAMPM').val('${scheVO.scheSTimeAMPM}');
						$('#ScheSTime').val('${scheVO.scheSTime}');
					}
					
				}else $('#STime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";'>"+AMPM + Hh + Mm+"</option>");
				
				//종료시간
				if(EHh == Hour) {
					$('#ETime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";' selected>"+AMPM + Hh + Mm+"</option>");
					
					if('${scheVO.scheSeq}' == '') {
						
						$('#ScheETimeAMPM').val(AMPM_Val);
						$('#ScheETime').val(Hh + Mm);
					
					}else{
						
						$('#ScheETimeAMPM').val('${scheVO.scheETimeAMPM}');
						$('#ScheETime').val('${scheVO.scheETime}');
					}
					
				}else $('#ETime').append("<option value='"+AMPM_Val + Hh + Mm+"' style='background:"+Color+";'>"+AMPM + Hh + Mm+"</option>");
				
			}
		}
	},
	
	// 일정시간 변경
	scheTimeChange : function(Obj, Val) {
		
		var EAP = '', ET = '', EM = '';
		$('#Sche'+Obj+'AMPM').val(Val.substr(0, 2));
		$('#Sche'+Obj).val(Val.substr(2));
		
		if(Obj == "STime") {
			if(Val.substr(2).split(":")[0] == '11') EAP = 'PM';
			else EAP = Val.substr(0, 2);
			ET = Number(Val.substr(2).split(":")[0]) + 1;
			EM = Val.substr(2).split(":")[1];
			if(ET == '13') ET = '1';
			$('#ScheETimeAMPM').val(EAP);
			$('#ScheETime').val(ET + ":" + EM);
			$('#ETime').val(EAP + ET + ":" + EM).attr("selected", "selected");
		}
		
		
	},
	
	//일정 타입에 따른 설정(전체 개인)
	setMemoPublic : function(schePublicType) {
		
		if(schePublicType == "All") {
			$('#SchePublicFlag1').trigger('click');
			setEnableChildren($('#EntryView').get(0));		//참가자 활성화
			
		}else {
			setDisableChildren($('#EntryView').get(0));		//참가자 비활성화
		
			///////////////////////전체 해제시킴.
			for(var i=0;i<divisionList.length;i++){
				$('.Entry_'+divisionList[i].divCode).removeAttr('checked');
				SelAll('Entry',i,divisionList[i].divCode);
			}
			$("#userDiv").html("");
		}
	},
	
	//비공개(개인메모)
	checkSecret : function(th){
		
		if(th.checked){
			$('#SchePublicFlag2').trigger('click');
			$("#userDiv").find('li').not("#li_${userLoginInfo.sabun}").remove();
			
		}
		else{
			$('#SchePublicFlag1').trigger('click');
		}
	},
	
	//알람 발생시기 
	checkAlarm : function(){
		
		var scheAlarm =$("#ScheAlarm").val(); //알람발생시기 값
		
		if(scheAlarm == 'Write' ){ //직접입력이면,
			
			$("#dayDiv").show();
			$("#AlarmHowTr").show();
			
		}else if(scheAlarm == 'None'){//알람설정 없음 이면,
			
			$("#dayDiv").hide();//직접 입력 칸 없애고.
			$('input:radio[name="AlarmHow"]').attr("checked", false); //알림방식 설정되있는거 체크해제
			$('#ScheAlarmHow').val("None");//값 변경.
			$("#AlarmHowTr").hide(); 
			
		}else{
			
			$("#dayDiv").hide();//직접 입력 칸 없애고.
			$("#AlarmHowTr").show();
		}
	},
	
	//스케쥴 시간 변경시 회의실 시간 변경 
	changeScheTimeToMeetTime : function(){
		
		//시간 세팅
		var scheStart = $("#STime").val();
		$('#ScheSTimeAMPM').val(scheStart.substr(0, 2));
		$('#ScheSTime').val(scheStart.substr(2));
		
		var scheEnd = $("#ETime").val();
		$('#ScheETimeAMPM').val(scheEnd.substr(0, 2));
		$('#ScheETime').val(scheEnd.substr(2));
		
		
		var startTime = parseInt($("#ScheSTime").val().replace(/:/gi,''));
		var sAmPm = $("#ScheSTimeAMPM").val();
		
		var endTime = parseInt($("#ScheETime").val().replace(/:/gi,''));
		var eAmPm = $("#ScheETimeAMPM").val();
		
		
		//오전 오후 변경 
		if(sAmPm=='PM' && startTime<1200)   startTime = parseInt(startTime)+1200;
		if(eAmPm=='PM' && endTime<1200) 	endTime = parseInt(endTime)+1200;
		
		
		//스케쥴이 다른날
		if($("#ScheSDate").val() != $("#ScheEDate").val()) endTime = parseInt(startTime)+100;
		
		//8시 이전 일경우 8 시로
		if(startTime<800) startTime=800;
		if(endTime<=800) endTime=900;
		
		//10시 이후일 경우 9시로
		if(startTime>2200) startTime=2200;
		if(endTime>2200) endTime=2200;
		
		if((startTime)>(endTime)){
			swal("시간을 다시 확인해주세요.");
			$("#STime").focus();
			return;
		}
		
		
		startTime = fillzero(startTime,4);
		endTime = fillzero(endTime,4);
		
		startTime = startTime.substring(0,2)+':'+startTime.substring(2,4)+':00';
		endTime = endTime.substring(0,2)+':'+endTime.substring(2,4)+':00';
		
		$("#meetStartTime").val(startTime);
	 	$("#meetEndTime").val(endTime);
	 		
		scheProcObj.setMeetingRoomList();
	},


	//회의실 세팅
	setMeetingRoomList : function(){
		
		$('#meetingRoomArea').empty();
	
		if($('#meetingRoomUseChk').is(':checked')){
			
			$('#meetingRoomArea').show();
			$("#useMeetRoom").show();
		
		}else{		
			
			$('#meetingRoomArea').hide();
			$("#useMeetRoom").hide();
			$("#ScheArea").val('');
			return;					//사용안함일때 사용가능 미팅룸 세팅 안함
		}

			
		scheProcObj.meetingRoomChk('',$("#meetStartTime").val(),$("#meetEndTime").val(),$("#rsvId").val());		//미팅룸 리스트 조회
		
		
		var enableRsvRoomList = [];
	  		
		for(var i=0;i<g_meetingRoomList.length;i++){
			
			if(getCountWithValue(g_noRsvList, 'meetingRoomId', g_meetingRoomList[i].id) == 0){
				enableRsvRoomList.push(g_meetingRoomList[i]);
			}
		}
	   	
		if(enableRsvRoomList.length>0){
		   	var roomSelectTag = createSelectTag('selectRoomId', enableRsvRoomList, 'id', 'meetingRoomNm', '', 'scheProcObj.setArea();', '', '','select_basic w100pro');	
			$("#meetingRoomArea").html(roomSelectTag);
		 	
			scheProcObj.setArea();	//장소자동 세팅
		}else{
			if($('#meetingRoomUseChk').is(':checked')) swal("이용가능한 회의실이 없습니다.");
		}
	},
	
	//장소자동 세팅
	setArea : function(){
		$("#ScheArea").val($("#selectRoomId :selected").text())
	},
	
	//회의실 사용가능 체크
	meetingRoomChk : function(meetingRoomId,startTime,endTime,rsvId){
		
		var rslt = false;
		
		var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
		
	   	var param = {
	   					choiceDate 		: $("#ScheSDate").val(),
	   					meetingRoomId 	: (meetingRoomId == undefined || meetingRoomId == ''  ? '' : meetingRoomId) ,
	   					enable			: 'Y',
	   					rsvStartTime	: startTime.split(':')[0]+':'+startTime.split(':')[1]+':01',
	   					rsvEndTime		: endTime,
	   					rsvId			: (rsvId == undefined || rsvId == '' || rsvId == 0  ? '' : rsvId)
	   				};
	   	
	   	
	   	var callback = function(result){
	   		
	   		var obj = JSON.parse(result);
	   		var list = obj.resultList;	
	   		
	   		if(meetingRoomId == '' || meetingRoomId == undefined) g_noRsvList = list;		//전체 검색건만 불가능한 회의실리스트 세팅
	   		
	   		if(list.length == 0){		//예약 가능
	   			rslt = true;
	   		}
	   		
	   	}
	  		
	   	commonAjax("POST", url, param, callback, false);
	   	
	   	return rslt;
	},
	
	//회의실 예약내역 
	doSearch : function(){ 

		var url = contextRoot + "/meetingRoom/getMeetingRoomRsvList.do";
		var param = {
						choiceDate 		:$('#ScheSDate').val(),
						meetingRoomId 	: ''
					};
		
		
		var callback = function(result){
			
			var obj = JSON.parse(result);
			var list = obj.resultList;	

    		for(var i=0;i<list.length;i++) {
    			
    			list[i].title = list[i].rsvUserNm;
    			//내가 쓴게 아니면 어떠한 이벤트도 불가 처리
    			if(list[i].createdBy == '${userLoginInfo.staffSnb}'){
    			
        			list[i].className ='other_rsv_div';
        			
    			}
    			
    			
    		}
    		
			g_rsvList = list ;			//전역변수로 예약내역리스트 담아둠
		
		};
		commonAjax("POST", url, param, callback, false);
		
	},//end doSearch
 
	setCalendarGrid : function(){
		
		
		
		$('#meetDataArea').fullCalendar({
			
		 	schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			defaultView: 'agendaDay',
			defaultDate: $('#ScheSDate').val(),
			editable: false,
			selectable: false,
			eventLimit: true, 				//더보기 갯수
			minTime : '08:00:00',			//표시최소시간
			maxTime : '22:00:00',			//표시최대시간
			allDaySlot : false,				//하루종일 사용 여부
			slotEventOverlap: false,		//겹침 사용 (시간중복시 오버랩 사용여부)
			lazyFetching : false,
			
		
			header: false,
			
			
			titleFormat:'YYYY/MM/DD',		// 타이틀 포맷 형식 
			smallTimeFormat : 'HH시',
			timeFormat: 'HH:mm',
			contentHeight: 320,				// 높이 -- 지정가능
			aspectRatio : 20,				// 달력의 너비와 높이의 종횡비를 결정 숫자가 클수록 높이가 낮아짐
			
			//-- 데이터 셋 S
			
			resources: g_meetingRoomList, 	// 컬럼 리스트  ... ex> { id: 'b', title: 'Room B', eventColor: 'green' }, 
			
		    eventSources: [ {overlap : false, events: g_rsvList} ],  //view List  [{ id: '1', resourceId: '31', start: '2017-03-07T17:00:00', end: '2017-03-07T18:00:00', title: 'event 1' } ],	
				
			//-- 데이터 셋 E
		
		});
		
		
		var obj = $(".fc-row").find('table');
		
		
   		if(($(obj).find('tr').length) == 1){
   			
   			var str = '<tr><th width="30px"></th>';
   			var code = '';
   			for(var i=0; i<g_meetingRoomList.length; i++){
   				if(code != g_meetingRoomList[i].groupCode){
   					code = g_meetingRoomList[i].groupCode;
   					var count = getCountWithValue(g_meetingRoomList, 'groupCode', code);
   					str += '<th colspan="'+count+'">'+code+'F</th>';
   				}
   			}
   			str += '</tr>';
   			
   			$(".fc-row").find('table thead').prepend(str);
   			
   			
   		}
   		
		
	},


	
	//인물, 회사 초기화
	resetCstCpn : function(){
		
		$('#tmpCpnNm').val('');
		$('#tmpCpnId').val('');
		$('#tmpCstNm').val('');
		$('#tmpCstId').val('');
		$('#ScheArea').val('');		//장소 표시
		$('#personDiv').html('');
		$('#companyDiv').html('');
		
		$('#AP_infoProviderNm').val('');		//인물 명
		$('#AP_cpnNm').val('');					//회사 명
		
		$("#tagDiv").hide();
		scheProcObj.setAutoMakeTitle();			//제목 자동생성 호출
		
	},
	
	//상세 입력내용
	setDetailArea : function(){
		$(".detailArea").show();
		$(".detailBtnArea").hide();
	},

	
	/* =====================클릭 & 셀렉트 세팅 : E==================== */
	
	/* =====================팝업 : S==================== */
	
	//차량 사용현황 팝업 
	carUseListPop : function() {
		
		ScheSDate = $('#ScheSDate').val();
		
		var url=contextRoot+"/m/car/carRsvLogList.do";
	 	var params = {ScheSDate : 	ScheSDate};
		
	 	var callback = function(result){
	  		modal({
	            type: 'customer',
	            title: '차량현황',
	            text: result,
	        });
	  	}
	  	
	 	commonAjaxTohtml( url, params, callback);
		
	},
	
	
	//회의실 사용 현황 팝업
	meetingRoomRsvList : function() {

		var choiceDate = $('#ScheSDate').val();
		
		var url = contextRoot + '/m/meetingRoomListPop.do';
	 	var params = {choiceDate : 	choiceDate};
		
		var callback = function(result){
	  		modal({
	            type: 'customer',
	            title: '회의실현황',
	            text: result,
	            center : false
	        });
	  		
	  		scheProcObj.doSearch();
		  	scheProcObj.setCalendarGrid();
	  	}
	  	
		commonAjaxTohtml( url, params, callback);
		
	  	
	},
	
	//직원선택 팝업
	userSelectPop : function() {

		/* 
		if('${vo.openType}'=='inner') $('div#scheduleViewPop.bottomBox').css('top', '0');
		else{
			
			$('div#scheduleProcPop.bottomBox').css('top', '0');
		}
		 */
		var selectList = [];
		var disabledList = [];
		
		var arr =$("input[name=selectUserId]");
		
		for(var i=0;i<arr.length;i++){
			selectList.push(arr[i].value);
			
		}
		
  		var params ={	
  				
  				userList 	   : selectList.join(','),
  				disabledList   : disabledList.join(','),
  				isCheckDisable : 'N',				//disable 상위 부서에 조작에 따른 선택여부
  				g_parentKey	   : 'userSelectPop'
  				
  		};
  		
  		commonPopAllObj.openUserSelectPop(params);   //commonPopAll.jsp 
  		
  		
	},
	

	/* =====================팝업 : E==================== */	
	
	// 일정 등록/수정 완료
	scheduleProcEnd : function() {
		
		var frm = document.ScheAdd;
		
		//---------------------------- validation chk : S
		
		if($("#ScheSDate").val() > $("#ScheEDate").val()){
			swal("시작일은 종료일 보다 이후 일 수 없습니다.");
			return false;
			
		}else{
			
			if($("#ScheSDate").val() == $("#ScheEDate").val() && !$("#AllTime").is(':checked')){
				
				
				var scheStart = ($("#STime").val().substr(2)).replace(/:/gi,'');
				var scheEnd = ($("#ETime").val().substr(2)).replace(/:/gi,'');
				
				
				var startTime = $("#STime").val().substr(0, 2) == 'PM' && scheStart < 1200 ? 1200+ parseInt(scheStart) : parseInt(scheStart);
				var endTime = $("#ETime").val().substr(0, 2) == 'PM' && scheEnd < 1200 ? 1200+ parseInt(scheEnd) : parseInt(scheEnd);
				
				
				if(startTime > endTime){
					swal("시작시간은 종료시간 보다 이후 일 수 없습니다.");
					return false;
				}
				
			}
			
		}
		
		$('#ScheGubun').val($('input:radio[name="ScheduleGubun"]:checked').val());
		
		//업무분류
		if($("#ScheduleType").val() =="") {
			swal('분류를 선택하셔야 합니다.');
			return;
		}else $('#ScheType').val($("#ScheduleType").val());
		
		//M&A업무여부
		if($('#IsMna').is(':checked')) $('#IsMna').val('M');
		else $('#IsMna').val('');
		
		//차량
		if(!$('#carUseChk').is(':checked')) {
			
			$('#CarUseFlag').val('N');
			$('#CarNumSelect').val('X');
			
		}else if($('#carUseChk').is(':checked') && $('#CarNumSelect').val() == 'X') {
			
			swal('차량을 선택해 주세요. \n선택하실 차량이 없으실 경우 \'사용안함\'으로 체크해주세요.');
			return;
			
		}
		
		//차량 사용 세팅
		if($('#carUseChk').is(':checked'))	$('#CarUseFlag').val('Y');
	    
	
		//인물 회사
		var scheduleType = $("#ScheduleType").val(); //분류
		if(scheduleType != 'Invest' && scheduleType != 'Notice' && scheduleType != 'Private' && scheduleType != 'Mt_inside' && scheduleType != 'Schedule'){
			if($("#EventType").val() == 'Add' && isEmpty($('#tmpCstNm').val()) && isEmpty($('#tmpCpnNm').val())){
				swal('인물,회사 정보는 최소한 한가지 정보를 입력하셔야 합니다.');
				return;
			} 
			
			if($("#EventType").val() == 'Edit'){						
				var tmp = $('#ScheTitle').val().split('/')[0].trim();
				tmp = tmp.split(']')[1];
				
				if(isEmpty(tmp)){
					swal('인물,회사 정보는 최소한 한가지 정보를 입력하셔야 합니다.');
					return;
				}
			}
		}
		
		//제목
		if($('#ScheTitle').val() == "") {
			swal('제목을 입력하셔야 합니다.');
			$('#ScheTitle').focus();
			return;
		}
	
		//알림설정
		if($('#ScheAlarm').val() == 'Write') {
			if($('#WriteDay').val() == "") {
				swal('알림발생시기를 입력하셔야 합니다.');
				$('#WriteDay').focus();
				return;
			}
			$('#ScheAlarmFlag').val($('#WriteDay').val());
			
		}else {
			$('#WriteDay').val('');
			$('#ScheAlarmFlag').val($('#ScheAlarm').val());
		}
		
		//알림방법
		if($('input:radio[name="AlarmHow"]:checked').val() != undefined)
			$('#ScheAlarmHow').val($('input:radio[name="AlarmHow"]:checked').val());
		
		if($('#ScheAlarm').val() != 'None' && $('#ScheAlarmHow').val() == 'None') {
			swal("알림방법을 선택하셔야 합니다.");
			return;
		}
	
		if($("#ScheAlarm").val() == 'None'){ ////알람 설정 없을때 -> 방식도 없음 세팅      
			
			$('#ScheAlarmFlag').val('None');
			$('#ScheAlarmHow').val('None');
			
		}
		
		//--회의실 추가
		
		if($('#meetingRoomUseChk').is(':checked') && $("#selectRoomId").val() =='') {
			swal('회의실을 선택해 주세요');
			$("#meetingRoomId").focus();
			return;
			
		}
		
		if($('#meetingRoomUseChk').is(':checked')){
			var meetStartTime = ($("#meetStartTime").val()).replace(/:/gi,'');
			var meetEndTime = ($("#meetEndTime").val()).replace(/:/gi,'');
			
			if(meetStartTime > meetEndTime){
				swal("회의실 예약 시작시간은 종료시간 보다 이후 일 수 없습니다.");
				return false;
			}
		}
		
		
		
		//중복 여부 확인
		if($('#meetingRoomUseChk').is(':checked')){
			
			if(!scheProcObj.meetingRoomChk($("#selectRoomId").val() ,$("#meetStartTime").val() ,$("#meetEndTime").val() ,$("#rsvId").val())){
				swal('이미 예약된 회의실 입니다.');
				$("#selectRoomId").focus();
				return;
			}else{
				$("#meetingRoomId").val($("#selectRoomId").val()); 
				
			}
			
		}
		
		
		//-------------------------- validation chk : E
	
		
		//---------------------------- 참가자세팅 : S
		
		var selectUserList =$("input[name=selectUserId]");
		var cnt = 1;
		var arr =[];
		
		if(selectUserList.length == 0){
			swal('참가자를 선택해주세요');
			return false;
		}
		
		
		// 참가자
		for(var i=0;i<selectUserList.length;i++){
			arr.push(selectUserList[i].value);
			$("#userSelectArea").append('<input type="hidden" id="EntrySabunAry'+cnt+'" name="EntrySabunAry'+cnt+'"/> <input type="hidden" id="EntryDelFlagAry'+cnt+'"  name="EntryDelFlagAry'+cnt+'"/>');
			$('#EntrySabunAry'+cnt).val(selectUserList[i].value);
			$('#EntryDelFlagAry'+cnt).val('N');
			cnt++;
		}
		
		//참가자 삭제
		for(var i=0;i<g_orgUserList.length;i++){
			if(getArrayIndexWithValue(arr, g_orgUserList[i].sabun)<0){		//없다 
				arr.push(g_orgUserList[i].sabun);
				$("#userSelectArea").append('<input type="hidden" id="EntrySabunAry'+cnt+'" name="EntrySabunAry'+cnt+'"/> <input type="hidden" id="EntryDelFlagAry'+cnt+'" name="EntryDelFlagAry'+cnt+'"/>');
				$('#EntrySabunAry'+cnt).val(g_orgUserList[i].sabun);
				$('#EntryDelFlagAry'+cnt).val('Y');
				cnt++;
			}
			
		}
		
		if(arr.length <0){
			$("#SearchPersabun").val('${userLoginInfo.sabun}');
			$('#EntrySabunAry1').val('${userLoginInfo.sabun}');
			
		}else $("#SearchPersabun").val(arr.join(','));
		
		$('#EmpCnt').val(arr.length);
		
		//---------------------------- 참가자세팅 : E
		
		$('#ScheSYear').val($('#ScheSDate').val().split('-')[0]);
		$('#ScheSMonth').val($('#ScheSDate').val().split('-')[1]);
		$('#ScheSDay').val($('#ScheSDate').val().split('-')[2]);
		$('#ScheEYear').val($('#ScheEDate').val().split('-')[0]);
		$('#ScheEMonth').val($('#ScheEDate').val().split('-')[1]);
		$('#ScheEDay').val($('#ScheEDate').val().split('-')[2]);
		
		if($('#ScheSDate').val() != $('#ScheEDate').val()){
			
			$('#SchePeriodFlag').val('Y');
			$('#ScheGrpCd').val('Period');
		}else{
			
			$('#SchePeriodFlag').val('N');
			$('#ScheGrpCd').val('');
			$('#changePeriodN').val('N');
			
		}
	
		if( ($('#SchePeriodFlag').val() == 'Y') && $('#meetingRoomUseChk').is(':checked')){
			
			swal("기간일정은 회의실 예약이 불가하여, 회의실 예약 설정은 취소됩니다.");
			$('#meetingRoomUseChk').prop('checked',false);
			
		}
		
		//회의실 세팅
		if($('#meetingRoomUseChk').is(':checked')) $("#meetingRoomUseFlag").val('Y');
		else $("#meetingRoomUseFlag").val('N');
		
		
		//차량 번호세팅
		
		var carNum = $("#CarNumSelect").val();
		
		if($("#CarUseFlag").val() == 'Y' &&  $('#CarNumSelect option:selected').val().indexOf('_-_') != -1){
			var arr =($("#CarNumSelect").val()).split('_-_');
			carNum = arr[0];
			
		} 
		
		$("#CarNum").val(carNum);
		
		var formData = $("#ScheAdd").serialize();
		var url = "/m/schedule/scheduleEditEnd.do";
		var callback='';
		
		if($('#EventType').val() == 'Add') {
			
			url ="/m/schedule/scheduleAddEnd.do";
			callback = function(result){
				
				var obj = JSON.parse(result);
	    		var cnt = obj.resultVal;		//결과수
	    		
	    		endLoadingBar();
	    		
	    		if(cnt == -8){
	    			
	    			alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
	    		}else if(cnt > 0){
	    			
	    			
					toast.push("완료되었습니다.");
					//$('html, body').css({'overflow': 'hidden', 'height': '100%','transform':''});
				
					$("#scheduleProcPopCanBtn").trigger('click');
					
					
	    		}else if(cnt == -5){
	    			
	    			swal("이미 등록된 차량입니다. 다른 차량을 선택해주세요");
	    			
					
	    		}else{
	    			
	    			swal("서버오류!!");
	    		}
				
				
			};
		
		}else {
			
			
			$('#EventType').val("Edit");
			$("#SearchPerSabun").val("");
			//$('#ScheAdd').attr('target', "_self");
			
			url ="/m/schedule/scheduleEditEnd.do";
			
			callback = function(result){
				
				var obj = JSON.parse(result);
	    		var cnt = obj.resultVal;		//결과수
	    		
	    		endLoadingBar();
	    		
	    		if(cnt == -8){
	    			
	    			alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
	    		}else if(cnt > 0){
	    			
	    			
					toast.push("완료되었습니다.");
					
					if('${vo.openType}' == 'inner'){
						closeRightBox('scheduleProcInnerPop','scheduleProcInnerArea');
						closeBottomBox('scheduleViewPop','scheduleViewArea','first');
					}else{
						$("#scheduleProcPopCanBtn").trigger('click');
					}
					
	    		}else if(cnt == -5){
	    			
	    			swal("이미 등록된 차량입니다. 다른 차량을 선택해주세요");
	    			
					
	    		}else{
	    			
	    			swal("서버오류!!");
	    		}
				
				
			};
			
		}
		
		var beforeSubmit = function(){
    		startLoadingBar();
    	}

		
		var onError = function(){
			swal("에러");
		};
		
		$.ajax({
			   type : "POST",
			   url : contextRoot+ url ,
			   cache : false,
			   data : formData,
			   success : callback,
			   beforeSend: beforeSubmit,
			   error : onError
		});
		//showLayer();
	}
		
};




$(function() {
	
	scheProcObj.getMeetingRoomList();
	scheProcObj.preloadCode();
	
	$('#ScheTitleTmp').bind('change', function(){
		scheProcObj.setAutoMakeTitle();		//제목자동생성 호출  transform: translate3d(0,0,0)
	});

	//$('html, body').css({'overflow': 'hidden', 'height': '100%' , 'transform':'translate3d(0,0,0)'});
	
});



</script>