<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Left</title>
<link href="<c:url value='/css/leftMenu.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<%-- <script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script> --%>



<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>

<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.3"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/ajaxRequest.js"></script>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

<style>
.bt{float:right;}.hov:hover{background-color: moccasin !important;}
.arrowL{
  float: right;
  background-color: #75c5de;
  color: white;
  padding: 0px 2px 3px 2px;
  cursor: pointer;
}
div#menubody {
    padding-left: 5px;
    padding-right: 5px;
}

ul li {
    height: auto;    
}

.new_dept{
	/* text-align:center; */
	/* border-left: #cccccc 5px solid; */
	font-size: 11px;
	/* color : #75c5de; */
	color : #75c5de!important;	
	/* padding-left: 0px;
	padding-top: 5px;
	padding-bottom: 1px; */
	font-weight: bold;	/* normal; */
	/* width:68px; */
	width:auto!important;
	max-width:100px;	
	
	position:relative; left:7px; top:5px; z-index:1; background:#fff; padding:0 5px; 
}
.new_dept_box{
	border:#67b9d3 dashed 1px; border-radius:7px; position:relative; padding:7px 0px 5px 10px;
}
.new_dept_li{
	height:16px;
}

ul.dual span {
	padding: 2px 5px 0 0px;
}
ul.dual a {
    margin-bottom:1px;
    width: 55px;
}

ul li.leftTitle {
    margin-bottom: 1px;
}

.left_new{
	margin-left: 10px;
}
.btn_tab{
	text-align: left;
	border-bottom:2px solid #53b0cc;
	padding-top:20px;
}
button {
  color: #FFF;
  background-color: #a5d5e4;
  border:0px;
  border-top-left-radius:3px;
  border-top-right-radius:3px;
  padding:3px;
}
.click_tab{
	background-color: #2B9ABF;
}
.division_li{
	margin: 0px;
    padding: 6px;
    border: 1px solid #bad5e6;
    background: url(../images_m/work/bg_workbtn2.gif) repeat-x 0 0 #dcdcdc;
}


.deal_main {
    float: left;
    vertical-align: middle;
    border: #9aaacc solid 1px;
    border-radius: 20px;
    font-size: 11px;
    padding: 0 5px;
    box-sizing: border-box;
    background: #f7f9fc;
    margin: 2px 0 2px 5px;
    
    color: #84888d;
    font-size: 12px;
    letter-spacing: -0.5px;
    margin-left: 3px;
}

/* 왼쪽메뉴 숨김버튼 */
.btn_leftmn_cl {
    position: absolute;
    <c:if test="${deal ne 'Y'}">	/* 딜에서 열지 않고, 업무일지에서 열였을때 */
    left: 160px;
    </c:if>
    <c:if test="${deal eq 'Y'}">	/* 딜에서 열였을때 */
    left: 178px;
    </c:if>
    top: 23px;
    z-index: 2;
}
.btn_leftmn_cl a {
    background: url(../images/common/btn_snb_close.png) no-repeat;
    width: 25px;
    height: 27px;
    display: inline-block;
    
}
.btn_leftmn_cl em{display:none;}
/* a {
    color: #555;
    text-decoration: none;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: middle;
} */
</style>
</head>

<body>
	
	<!-- 왼쪽메뉴 숨김버튼 -->
	<span class="btn_leftmn_cl" id="btnLeftMenuHide" style="display: block;">
		<a href="#" onclick="fnObj.hideView(this);" title="왼쪽 메뉴 숨김"><em>왼쪽메뉴 숨기기</em></a>
	</span>


	<form name="movePage" id="movePage" method="post"></form>
	<form id="staffName" name="staffName" action="<c:url value='/work/selectPrivateWorkV.do' />" method="post">
		<input type="hidden" id="s_Name" name="name">
		<input type="hidden" id="s_Id" name="tmpId">
		<input type="hidden" id="s_mon" name="choice_month">
		<input type="hidden" id="s_year" name="choice_year">
	</form>
	<header>
		<%-- <h2 id="login_name">이름: ${userLoginInfo.name}</h2>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;IP: ${userLoginInfo.ip}
			<br/>Date: ${userLoginInfo.loginDt}
		</h4> --%>
	</header>
	<section>
		<article>
		<div style="overflow-y:auto;" id="menubody">
		<!-- <div class="arrowL" onclick="javscript:fnObj.hideView(this);">◀</div> -->
			
			<ul class="dual">
				<br/>
				
				<c:if test="${deal ne 'Y'}">	<!-- 딜에서 열지 않고, 업무일지에서 열였을때 -->
				
				<li>개인 업무일지</li>
				
				<div class="btn_tab" >
					<button id="btn_1" type="button" class="btn_click" style="cursor:pointer;margin-left:3px;" onclick="fnObj.userDivView('1');"><i class="axi axi-sitemap"></i> 부서별</button>
					<button id="btn_2" type="button" style="cursor:pointer;" onclick="fnObj.userDivView('2');"><i class="axi axi-ion-person-stalker"></i> 직원별</button>
				</div>
				
				</c:if>
				<c:if test="${deal eq 'Y'}">	<!-- 딜에서 열지 않고, 업무일지에서 열였을때 -->
					 <li class="leftTitle left_new" style="cursor:pointer;border-bottom: black 0px solid;">
					 	<font class="deal_main" style="color:#33468e;"><a style="border-left:0px;" href="javascript:$('li .bgOrg').removeClass('bgOrg');parent.top_menu('selectWorkAllDeal.do', null, 'mainFrame');">딜MAIN</a></font>
					 </li>	
				</c:if>
				
				<div id="divisionDiv"></div>
				<div id="nameSortDiv" style="display:none;"></div>
				
				<c:if test="${userLoginInfo.division=='SYNERGY'}">
					<br/>
					<li class="leftTitle left_new">딜</li>			
					<li class="left_new"><a id="leftWorkMediateDealR">중개</a> <a id="leftWorkDirectDealS">직접발굴</a></li>
					<li class="left_new"><a id="leftWorkMnaDeal">M&A</a> <a id="leftWorkIPO">프리IPO</a></li>
					<li class="left_new"><a id="leftWorkRecommend">추천</a> <a id="leftCstMngIvestCpn">투자회사</a><%--<a id="leftWorkGrowth">신성장</a> --%></li>
					
					<br/>
					
					<li class="leftTitle left_new">공시</li>				
					<li class="left_new"><a id="leftWorkNotice">증자</small></a> <a id="leftWorkNoticeMezzaine">메자닌</small></a></li>
					<li class="left_new"><a id="leftWorkNoticeStcokHolder">주주변경</small></a></li> 
					
					<br/>
					
					<li class="leftTitle left_new">자금</li>
					<li class="left_new"><a id="leftWorkEntrust">일임</a> <%--<a id="leftWorkResale">재매각</a> --%></li>
						
					<br/>
					<div id="cmmCdKeyDiv" class="left_new" style="padding-left:-30px!important;"></div>
					
					<br/>
					
					<c:if test="${deal ne 'Y'}">	<!-- 딜에서 열지 않고, 업무일지에서 열였을때 -->
					
					<li class="leftTitle hand left_new" onclick="fnObj.hiddenView('resignStaff');">Resign <div class="bt" id="resignStaffIcon"><img class="mail_send filePosition" id="fileMnP" src="../images/math/p24.png" style="width:24px;height:24px"/></div></li>
					<ul id="resignStaff" class="left_new" style="display:none">
					<li id="outUserList"></li>
					
					</c:if>
					
					</ul>
				</c:if>
			</ul>
				
		</div>
		</article>
	</section>
</div>
</body>
</html>

<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();					   // instance		new sjs


var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var permission='${userLoginInfo.permission}'; //로그인 유저의 permission
var division ="${userLoginInfo.division}";
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)


//Global variables :E ---------------
var carList;
var userList;

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//정보 메뉴
		fnObj.getCommonCdListKeyPoint();
    	//퇴사자 리스트
		fnObj.getOutStaffList();
    	
	},

	//화면세팅
    pageStart: function(){
    	$('#menubody').css('max-height', $("#leftFrame", parent.document).height()-50);		//왼쪽메뉴 높이 자동조정	
    	
    	var divisionList= getCodeInfo(null,null,null,null,null,null,"/common/getDivisionList.do",null);
    	$("#divisionDiv").empty();
    	$("#nameSortDiv").empty();
    	for(var i=0;i<divisionList.length;i++){
    		var str="";
    		var nameStr="";
    		str='<div id="'+divisionList[i].divCode+'_div"></div>';
    		nameStr='<div id="name_'+divisionList[i].divCode+'_div"></div>'
    		$("#divisionDiv").append(str);				//부서별
    		$("#nameSortDiv").append(nameStr);			//사원별		
    		fnObj.getUserList(divisionList[i].divCode,divisionList[i].divName); 
    	}
    	fnObj.userDivView('1');
   },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    },//end doSearch
    
    //유저리스트세팅
    getUserList: function(divCode,divName){ 
    
    	var url = contextRoot + "/work/selectuserList.do";
    	var param = {
    			division : divCode,
    			deptOrder: 'Y'
    		};
    
    	    	    	
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		var nameSortList = list.clone();
    		sortByKey(nameSortList, 'usrNm', 'ASC');	
    		if(list.length>0){
    			var str =' <li class="division_li hand hov" onclick="fnObj.hiddenView(\'staff_'+divCode+'\');" style="padding-left:20px;">'+divName; 
	    		str	   +=' <div class="bt" id="staff_'+divCode+'Icon"><img class="mail_send filePosition" id="fileMnP" src="../images/math/p24.png" style="width:24px;height:24px"/></div></li> ';
	    		str	   +=' <ul id="staff_'+divCode+'" style= "display:none;padding-bottom:10px;" >'; 
	    		str	   +=' <li>';
	    		//이름정렬
	    		var nameStr =' <li class="division_li hand hov" onclick="fnObj.hiddenView(\'staff_'+divCode+'\');"  style="padding-left:20px;"> '+divName; 
	    		nameStr	   +=' <div class="bt" id="name_staff_'+divCode+'Icon"><img class="mail_send filePosition" id="fileMnP" src="../images/math/p24.png" style="width:24px;height:24px"/></div></li> ';
	    		nameStr	   +=' <ul id="name_staff_'+divCode+'" style= "display:none;padding:10px;">'; 
	    		nameStr	   +=' <li>';
	    		var dept = '';				//부서(grouping)
	    		
	    		for(var i=0 ; i<list.length ;i++){
	    			var selectM = '';
	    			var selectMName = '';
	    			if(list[i].sabun == '${userLoginInfo.sabun}'){			//처음 내 a 태그 표시(부서별)
	    				selectM = 'class="bgOrg"';
		        	}
	    			if(nameSortList[i].sabun == '${userLoginInfo.sabun}'){	//처음 내 a 태그 표시(사원별)
	    				selectMName = 'class="bgOrg"';
		        	}
	    			if(list[i].deptSeq != dept){							//새로운 부서 인원
	    				str+="</li><li class='new_dept_li'><span class='new_dept'>" + list[i].deptNm + "</span></li><li class='new_dept_box'>";			//줄바꾸고
	    				dept = list[i].deptSeq;		//담아둔다
	    			}
	    			if(i!=0 && i%2==0){
	        			nameStr+="</li><li>";
	        		}
	        		str += '<a name="'+list[i].usrId+'" onclick="fnObj.sortUser(this, \''+list[i].usrNm+'\',\''+list[i].usrId+'\');" '+selectM+' >' + list[i].usrNm + ' </a> ';
	        		nameStr += '<a name="'+nameSortList[i].usrId+'" onclick="fnObj.sortUser(this, \''+nameSortList[i].usrNm+'\',\''+nameSortList[i].usrId+'\');" '+selectMName+' >' + nameSortList[i].usrNm + ' </a> ';
	        	}
	        	str+='</li></ul>';
	        	nameStr+='</li></ul>';
	        	$('#'+divCode+'_div').html(str);
	        	$('#name_'+divCode+'_div').html(nameStr);
	    		//처음 display div 판별.
	    		if(division==divCode){
	    			fnObj.hiddenView('staff_'+divCode);
	    		} 
	    	}
    	};
    	commonAjax("POST", url, param, callback, false, null, null);
    	
    },//end getUserList
    
    //유저 리스트 세팅
    userDivView : function(ver){		//ver : 탭종류 - 1 부서별 2 사원별
    	$(".click_tab").removeClass();
    	$("#btn_"+ver).addClass("click_tab");
    	if(ver == 1){
    		$("#divisionDiv").show();
    		$("#nameSortDiv").hide();
    	}else{
    		$("#divisionDiv").hide();
    		$("#nameSortDiv").show();
    	}
    },
   
    
    //정보 메뉴
    getCommonCdListKeyPoint: function(){ 
    	var url = contextRoot + "/work/selectCommonCdListKeyPoint.do";
    
    	 var callback = function(result){
    	    var obj = result;
    	    var objList = JSON.parse(obj);
    	    var list = objList.resultObject;
    	    var str="";
    	    if(list.length>0){
    	    	
    	    	str+='<li class="leftTitle">정보</li>';
    	    	str+='<li><a id="leftWorkMatrix" style="width:75px;">상장사 Matrix</a></li>';
    	    	
    	    	for(var i=0;i<list.length;i++){
    	    		str+='<li><a onclick="fnObj.slctKP(this,\''+list[i].dTailCd+'\');"';
    	    		if(list[i].cdNm.length>6){
    	    			str+='style="width:100px;"';
    	    		}
    	    		str+='>'+list[i].cdNm+' </a></li>';
    	    	}

    	    	str+='<li><a onclick="fnObj.slctKP(this,\'00011\')">인맥</a></li>';
    	    	
    	    }
    	   // console.log(str);
    	    $("#cmmCdKeyDiv").html(str);
    	};
    	
    	commonAjax("POST", url, '', callback, false, null, null);
    	
    },//getCommonCdListKeyPoint
    
    
    //검색
    getOutStaffList: function(){ 
    
        
    	var url = contextRoot + "/work/outStaffList.do";
    	var param = {division : division};
    
    	    	    	
    	var callback = function(result){
    		var obj =result;
      	    var objList=JSON.parse(obj);
      	    var list= objList.resultObject;
      	   
      	    var str="";
      	    
      	    for(var i=0;i<list.length;i++){
      	    	str+='<a onclick="fnObj.sortUser(this,\''+list[i].usrNm+'\',\''+list[i].usrId+'\');">'+list[i].usrNm+'</a>';	
      		    if(i%2 ==1){
      		    	str+='</li><li>';
      		    }
      	    }
    		$("#outUserList").html(str);
    
      	};
    	
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    },//end getOutStaffList

    
    hiddenView: function(targetId){
    	var stat = $("#"+targetId).css('display');
    	if(stat == 'none') {
    		$("#"+targetId).css('display','');
    		$("#"+targetId+"Icon").html('<img class="mail_send filePosition" id="fileMnP" src="../images/math/m24.png" style="width:24px;height:24px"/>');
    		$("#name_"+targetId).css('display','');
    		$("#name_"+targetId+"Icon").html('<img class="mail_send filePosition" id="fileMnP" src="../images/math/m24.png" style="width:24px;height:24px"/>');
    	}else{
    		$("#"+targetId).css('display','none');
    		$("#"+targetId+"Icon").html('<img class="mail_send filePosition" id="fileMnP" src="../images/math/p24.png" style="width:24px;height:24px"/>');
    		$("#name_"+targetId).css('display','none');
    		$("#name_"+targetId+"Icon").html('<img class="mail_send filePosition" id="fileMnP" src="../images/math/p24.png" style="width:24px;height:24px"/>');
    	}
    },
    
    hideView : function(th){
    	var dsp = parent.dispLeft()
    		,arrow = $(th).children();
    	if(dsp==''||dsp=='block'){
    		parent.leftIframeOFF();
    		arrow.html('▶');
    	}else{
    		parent.leftIframeON();
    		arrow.html('◀');
    	}
    },
    
    sortUser : function(th,staffName,staffId){
    	var obj = $(th);
    	$('li .bgOrg').removeClass('bgOrg');
    	$('#s_Name').val(staffName);
    	$('#s_Id').val(staffId);
    	//obj.addClass('bgOrg');
    	$('a[name=\''+staffId+'\']').addClass('bgOrg');
    	
    	//var mainIframeYear = parent.mainFrame.choice_year;
    	//$("#s_year").val(mainIframeYear==null?'':mainIframeYear.value);
    	var mainIframeMon = $('#mainFrame',window.parent.document).contents().find('#choice_month').val();
    	var mainIframeYear = $('#mainFrame',window.parent.document).contents().find('#choice_year').val();
    	$("#s_mon").val(mainIframeMon);
    	$("#s_year").val(mainIframeYear);
    	var frm = document.getElementById('staffName');//sender form id
    	frm.target = "mainFrame";//target frame name
    	frm.submit();
    },
    
    //정보 메뉴 클릭
    slctKP : function(th, cd){
    	fnObj.left_menu("keyPoint.do?selectInfo="+cd,$(th));
    },
    
    
    //왼쪽메뉴 선택
    left_menu : function(sUrl,th){
    	$('li .bgOrg').removeClass('bgOrg');
    	$(th).addClass('bgOrg');
    	
    	parent.mainFrame.location.href = sUrl;    	
    },
    
    
    clickItem : function(){

    	$('#leftWorkC').click(function(){//업무일지 등록
    		fnObj.left_menu("selectWorkC.do",this);
    	});
    	$('#leftWorkV').click(function(){//업무일지 열람
    		fnObj.left_menu("selectWorkV.do",this);
    	});
    	$('#leftWorkExporing').click(function(){//탐방발굴 시스템
    		fnObj.left_menu("selectWorkExporing.do",this);
    	});
    	$('#leftWorkRecommend').click(function(){//추천
    		fnObj.left_menu("../recommend/index.do",this);
    	});
    	$('#leftWorkMediateDealS').click(function(){//중개 제안
    		fnObj.left_menu("selectWorkMediateDealS.do",this);
    	});
    	$('#leftWorkMediateDealR').click(function(){//중개 제안받은딜
    		fnObj.left_menu("selectWorkMediateDealR.do",this);
    	});
    	$('#leftWorkDirectDealS').click(function(){//직접 제안
    		fnObj.left_menu("selectWorkDirectDealS.do",this);
    	});
    	$('#leftWorkDirectDealR').click(function(){//직접 제안받은딜
    		fnObj.left_menu("selectWorkDirectDealR.do",this);
    	});
    	$('#leftWorkMnaDeal').click(function(){//딜 유형중 mna만 따로
    		fnObj.left_menu("selectWorkMnaDeal.do",this);
    	});
    	$('#leftWorkIPO').click(function(){//딜 유형중 프리IPO만 따로
    		fnObj.left_menu("selectWorkIPO.do",this);
    	});
    	$('#leftWorkNotice').click(function(){//공시(증자)
    		fnObj.left_menu("selectPublicNoticeIncCap.do",this);
    	});
    	$('#leftWorkNoticeStcokHolder').click(function(){//공시(주주변경)
    		fnObj.left_menu("selectPublicNoticeSh.do",this);
    	});	
    	$('#leftWorkNoticeMezzaine').click(function(){//공시(메자닌)
    		fnObj.left_menu("selectPublicNoticeMezzaine.do",this);
    	});
    	$('#leftCstMngIvestCpn').click(function(){//고객관리 투자회사
    		//left_menu("http://106.250.177.91:8280/SynergyCus/InvestCom.do",this);
    		window.open("http://106.250.177.91:8280/SynergyCus/InvestCom.do","투자회사", "scrollbars=yes,toolbar=yes,resizable=yes,width=1180,height=800,left=100,top=100");
    	});
    	$('#leftWorkGrowth').click(function(){//신성장연구회
    		fnObj.left_menu("selectGrowthResearch.do",this);
    	});
    	$('#leftWorkEntrust').click(function(){//일임
    		fnObj.left_menu("selectWorkEntrust.do",this);
    	});
    	$('#leftWorkResale').click(function(){//재매각
    		fnObj.left_menu("selectWorkResale.do",this);
    	});
    	$('#leftWorkFund').click(function(){//펀드
    		fnObj.left_menu("selectWorkFund.do",this);
    	});
    	$('#leftWorkMnA').click(function(){//M&A
    		fnObj.left_menu("selectWorkMnA.do",this);
    	});
    	$('#leftWorkFinancing').click(function(){//CB/EB
    		fnObj.left_menu("financing.do",this);
    	});
    	$('#leftWorkHumanNet').click(function(){//워런트
    		fnObj.left_menu("warrant.do",this);
    	});
    	$('#leftWorkAnalysisComments').click(function(){//분석의견
    		fnObj.left_menu("analysisComments.do",this);
    	});
    	$('#leftWorkManageMent').click(function(){//자산운용
    		fnObj.left_menu("management.do",this);
    	});
    	$('#leftWorkMNA').click(function(){//M&A
    		fnObj.left_menu("mna.do",this);
    	});
    	$('#leftWorkEtc').click(function(){//실적
    		fnObj.left_menu("etc.do",this);
    	});
    	$('#leftWorkShare').click(function(){//공유
    		fnObj.left_menu("share.do",this);
    	});
    	$('#leftWorkResource').click(function(){//인재
    		fnObj.left_menu("resource.do",this);
    	});
    	$('#leftWorkNetWork').click(function(){//인맥
    		fnObj.left_menu("network.do",this);
    	});
    	$('#leftWorkAudit').click(function(){//심사역
    		fnObj.left_menu("audit.do",this);
    	});
    	$('#leftWorkServey').click(function(){//업황정보
    		fnObj.left_menu("servey.do",this);
    	});
    	$('#leftWorkInvestInte').click(function(){//투자관심
    		fnObj.left_menu("investInte.do",this);
    	});
    	$('#leftWorkMatrix').click(function(){//Matrix    		
    		fnObj.left_menu("matrix.do",this);
    	});
    	$('#leftWorkMatrix2').click(function(){//Matrix2
    		fnObj.left_menu("matrix2.do",this);
    	});
    }

};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	<c:if test="${deal ne 'Y'}">
		fnObj.preloadCode();	//선코딩
		fnObj.pageStart();		//화면세팅
	</c:if>
			
	fnObj.clickItem();		//이벤트 리스너 함수 세팅	
});

</script>