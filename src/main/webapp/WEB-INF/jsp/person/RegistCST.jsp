<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.js?ver=0.1'/>" ></script>


<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->


<style>
.selUserStyle{
	height:25px;
	font-size:13px;
}
input{
	padding-left:1px;
}
</style>


<script>
$(document).ready(function(){
	$('#cst_nm').focus();
	
});
function clkPosition(txt){
	if(txt=='ceo'){
		$("#position").val('대표이사');
	}else{
		$("#chkCeo").removeAttr('checked');
		$("#position").val('');
	}
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

<input type="hidden" id="fromMain" value="${fromMain}"> <!-- 메인페이지 위젯 추가를 통해 등록하는 것인지 체크 ...fromMain=='y' -->

<form id="customerName" name="customerName" action="<c:url value='/person/main.do' />" method="post">
	<input type="hidden" id="s_Name" name="sNb">
</form>

<form name="rgstForm">

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
				<tr style="display:none;">
					<th class="tbColor inputLine" width="120px">인물구분</th>
					<td>
						<input class="categoryCd" type="checkbox" id="categoryCd1" value="1"> <label for="categoryCd1">심사역</label>
						<input class="categoryCd" type="checkbox" id="categoryCd2" value="2"> <label for="categoryCd2">운용인재</label>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">인물구분 <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px;">
						<span id="cstRadioTag"></span>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine" width="120px">이름 <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px"><input class="regist" type="text" id="cst_nm" value="${cstNm}" style="ime-mode:active;" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">회사</th>
					<td style="padding-left:7px">
						<input class="regist" type="hidden" id="AP_cpnId_0" value="${workVO.cpnId }"/>
						<a onclick="popUp('0','c')" id="AP_cpnNm_0" class="c_title" title="이름">회사선택</a>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">직급 <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px">
						<SMALL>※ "CEO, 대표, 대표이사" 등의 직급은 모두 <font color="orangered">"대표이사"</font> 선택, 나머지 직급은 직접 입력해주세요.</SMALL><br/>
						<label><input type="radio" id="chkCeo" onclick="clkPosition('ceo');"> 대표이사</label> | 
						<input class="regist" type="text" id="position" onclick="clkPosition();" style="ime-mode:active;" />
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">email <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px"><input class="regist" type="text" id="email" style="ime-mode:inactive;" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">휴대전화 <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px"><input class="regist" type="text" id="phn_1" />
						<label><input type="checkbox" id="exposure"/>감추기</label>
					</td>
				</tr>
				<tr>
					<th class="tbColor inputLine">직통전화</th>
					<td style="padding-left:7px"><input class="regist" type="text" id="phn_2" /></td>
				</tr>
				<tr>
					<th class="tbColor inputLine">내선전화</th>
					<td style="padding-left:7px"><input class="regist" type="text" id="phn_3" /></td>
				</tr>
				
				<tr><th colspan=2 height=20></th></tr>
				
				<tr>
					<th class="tbColor inputLine">담당자(직원) <font style="color:red;font-weight:bold">*</font></th>
					<td style="padding-left:7px">
						<span id="userSelectTag" style="float:left;"></span>
						
						<span><div style="float:left;font-size:12px;margin-left:2px;margin-top:5px;margin-right:3px;">과의 <b>친밀도</b></div>
						<div id="relDeg1" onclick="fnObj.chkRelationDegree(this,1);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;background-color:pink;"></div>
						<div id="relDeg2" onclick="fnObj.chkRelationDegree(this,2);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg3" onclick="fnObj.chkRelationDegree(this,3);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg4" onclick="fnObj.chkRelationDegree(this,4);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<div id="relDeg5" onclick="fnObj.chkRelationDegree(this,5);" style="float:left;width:12px;height:12px;border:1px solid gray;margin-left:2px;margin-top:6px;cursor:pointer;"></div>
						<input type="hidden" name="relDegV" id="relDegV" value="00001"><!-- default value 1 -->
						
						<div style="float:left;font-size:12px;margin-left:7px;margin-top:5px;margin-right:4px;"><b>관계메모</b></div>
						<div><input type="text" name="relMemo" id="relMemo" style="margin-top:3px;width:250px;"></div>
						</span>
					</td>
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
						<span class="btn s green"><a href="javascript:fnObj.doSave();"><spring:message code="button.save" /></a></span>
					</p>
					</td>
				</tr>

			
			</table>
				<!-- <div>※ <b>이력/정보추가 버튼</b>과 <b>네트워크 추가 버튼</b>을 누르게 되면 <br/>&nbsp;&nbsp;&nbsp;자동으로 상단에 입력한 내용이 저장됩니다.</div> -->
		</article>
	</section>
	
</form>
	
</body>
</html>





<script type="text/javascript">

//Global variables :S ---------------

//공통코드
//var comCodeRoleCd;				//권한코드
//var comCodeMenuType;			//메뉴타입
var comCodeCstType;			//고객구분
var division ="${userLoginInfo.division}";
//var myModal = new AXModal();	// instance

var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs


//div popup 방식을 위한 글쓰기,수정 위한 변수
var mode;						//"new", "view", "update" 
var staffList;
//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		//공통코드
		comCodeCstType = getCommonCode('00013', null, 'CD', 'NM');		//고객구분('00013') 공통코드 (Sync ajax)
		
		//'optionValue','optionText' 프로퍼티를 생성하며 값으로 CD, NM 의 값 할당
		//this.addComCodeArray(comCodeMenuType);
		var cstRadioTag = createRadioTag('rdCstType', comCodeCstType, 'CD', 'NM', '', 15, 5, null);	//'fnObj.clickRdBudget(this);');//radio tag creator 함수 호출 (common.js)		
		$("#cstRadioTag").html(cstRadioTag);
		
		
		//담당자(직원)		
		staffList = getCodeInfo(null, 'cusId', 'usrNm', null, null, null, '/common/getStaffListNameSort.do',{division : division});
		
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		//var userSelectTag = createSelectTag('selStaff', staffListObj, 'cusId', 'usrNm', '${userLoginInfo.cusId}', null, colorObj, 90, 'selUserStyle');	//select tag creator 함수 호출 (common.js)
		//$("#userSelectTag").html(userSelectTag);

		
		if($('#cst_nm').val().length < 3)		//숫자 뜨는것 막기위해
			$('#cst_nm').val('');		//이름 입력란 초기화

		
		//페이지크기 세팅
		//fnObj.setPageSize();
	},
	
	
	//화면세팅
    pageStart: function(){
       	console.log(staffList);
		var str=' <select name="selStaff" id="selStaff">';
		
		//str+=' <optgroup label="----SYNERGY" > '
    	for(var i=0;i<staffList.length;i++){
    		var chk="";
    	//	if(staffList[i].division=='SYNERGY'){
    			if(staffList[i].cusId == "${userLoginInfo.cusId}"){
    				chk=' selected="selected"';
    			}
    			str+='<option value='+staffList[i].cusId+chk+'>'+staffList[i].usrNm+'</option>'
    	//	}
    	}
		//str+=' </optgroup>';
	/* 	str+=' <optgroup label="--------FIDES" > '
    	for(var i=0;i<staffList.length;i++){
    		var chk="";
    		if(staffList[i].division=='FIDES'){
    			if(staffList[i].cusId == "${userLoginInfo.cusId}"){
    				chk=' selected="selected"';
    			}
    			str+='<option value='+staffList[i].cusId+chk+'>'+staffList[i].usrNm+'</option>'
    		}
    	}
		str+=' </optgroup>'; */
		str+=' </select>';
		$("#userSelectTag").html(str);
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//저장
    doSave: function(){
    	
    	var cateCd = 0
		,cstNm = $('#cst_nm')
		,cpnId = $('#AP_cpnId_0')
		,pst   = $('#position')
		,email = $('#email')
		,phn1   = $('#phn_1')
		,phn2   = $('#phn_2')
		,phn3   = $('#phn_3')
		,expo   = $('#exposure');

		var i = 1;
		$('input[class=categoryCd]').each(function(){
			if($('input[class=categoryCd]:checked').length!=0 && this.checked)
				cateCd+=parseInt($('#categoryCd'+i).val());
			i++;
		});
		var page = 0;
		if("popUpReg" == $('#tmpTak').val()){
			page = 1;
		}
		$("input").css('background-color','');
		
		var cstType = $('input:radio[name=rdCstType]:checked').val();		//document.rgstForm.rdCstType.value; 
		if(isEmpty(cstType)){		//인물구분
			alert("인물구분을 입력하세요!");
			return;
		}
		
		
		if(cstNm.val().is_null()){
			cstNm.focus();
			cstNm.css('background-color','#A9F5BC');
			alert("이름을 입력하세요!");return;
		}
		/*if(cpnId.val().is_null()){
			alert("회사를 선택하세요.");
			cpnId.focus();
			return;
		}*/
		if(pst.val().is_null()){
			pst.focus();
			pst.css('background-color','#A9F5BC');
			alert("직급을 입력하세요.");return;
		}
		if(email.val().is_null()){
			email.focus();
			email.css('background-color','#A9F5BC');
			alert("email을 입력하세요.");return;
		}
		if(phn1.val().is_null()){
			phn1.focus();
			phn1.css('background-color','#A9F5BC');
			alert("전화번호를 입력하세요.");return;
		}
	
		//if(expo.is(":checked")==true) phn1 = '[N]'+phn1.val();
		//else phn1 = phn1.val();
	
		
		//---------- 해당 이름 존재 여부 체크
		
		var url = contextRoot + "/person/getCustomerName.do";
    	var param = {
    			cstNm: cstNm.val()
    	};
    	
    	var callback = function(result){
    			
    		var obj = JSON.parse(result);
    		
    		var rsltObj = obj.resultObject;	//결과수
    		
    		if(obj.result == "SUCCESS"){
    			    			
    			//------------------- 등록 프로세스 :S --------------------
    			
    			var msg = '';
    			if(rsltObj.isExist=='Y'){
    				msg = '요청하신 이름 \'' + cstNm.val() + '\' 이 존재하여\n';
    				msg += '[' + rsltObj.cstNm + '] 로 등록합니다.\n\n';    				
    			}
    			
    			msg += '등록 하시겠습니까?\n';
    			
    			
    	    	if(confirm(msg)){
		
    	    		if(rsltObj.isExist=='Y')
    	    			cstNm.val(rsltObj.cstNm);		//새로운 이름으로 세팅
    	    		
		
				//if(confirm("적용하시겠습니까?")){
					$.ajax({
						type:"POST",        //POST GET
						url:"../person/insertCst.do",     //PAGEURL
						data : ({
							cstNm: cstNm.val(),
							//categoryPSCd: "0000"+cateCd,
							categoryPSCd: cstType,				//인물구분 
							cpnId: cpnId.val(),
							position: pst.val(),
							email: email.val(),
							phn1: phn1.val(),
							phn2: phn2.val(),
							phn3: phn3.val(),
							rgId: $('#rgstId').val(),
							
							usrCusId: $('#selStaff').val(),		//담당자 cusId
							relDegree: $('#relDegV').val(),		//담당자 와의 친밀도
							relMemo: $('#relMemo').val()
							
							}),
						timeout : 30000,       //제한시간 지정
						cache : false,        //true, false
						success: function whenSuccess(arg){  //SUCCESS FUNCTION
			//						$(obj).hide();
							
							
							//메인페이지 위젯에서 추가한경우	20160122
							if('y' == $('#fromMain').val()){
								opener.location.reload();		//메인페이지 refresh
								window.close();					//팝업 close
								return;
							}
							
							
							if(page == 1){
								$('#nameSearch').val(cstNm.val());
								var frm = document.getElementById('searchCst');
								frm.action = "popUpCst.do?f="+$('#flag').val()+"&n="+$('#num').val();
								frm.submit();
			
							}else{
									$('#nameSearch').val(cstNm.val());
									var frm = document.getElementById('searchCst');//sender form id
									frm.target = "mainFrame";//target frame name
									frm.submit();
									frm = document.getElementById('personLeft');//sender form id
									frm.target = "leftFrame";//target frame name
									frm.submit();
							}
			
						},
						error: function whenError(x,e){    //ERROR FUNCTION
							ajaxErrorAlert(x,e);
						}
					});
				//}
    	    	}//if confirm
    		}//if success
    	};//callback
    	
    	commonAjax("POST", url, param, callback);
    	
    },//end doSave
    
    
    //친밀도 체크
    chkRelationDegree: function(th, val){
    	var end = false;	//체크 완료
    	var colV = 'pink';
    	for(var i=1; i<=5; i++){
    		
    		$('#relDeg'+i).css('background-color', colV);
    		
    		if(i == val){
    			end = true;
    			colV = 'white';
    			$('#relDegV').val('0000'+i);		//친밀도 세팅
    		}
    	}
    }
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	//fnObj.doSearch();		//검색
	//fnObj.setTooltip();
});
</script>