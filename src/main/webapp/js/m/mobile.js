

/*
 * mobile.js
 * 
 * 
 * 
 * 
 */

var nowUrl ='';
var beforeUrl =[];


window.onpopstate = history.onpushstate = function(event) {
	

	if(beforeUrl.length == 0){
		history.go(-1);
		
	}else{
	
		var urlLast = nowUrl.split('/').pop();
		var closeBtnId =  urlLast.split('_')[0];
		
		$("#"+closeBtnId+'CanBtn').trigger('click');
	}
	
	
	
}



//ajax paging 처리를 이용한 리스트(인물,회사) 가져오기.
function getPagingList(frm,pageIndex,num,flag){ //폼,페이지 번호 flag:c 회사 iP 인물

	var sUrl = '';
	var Nm =$('#nameSearch').val();
	var NmKor=$('#nameSearch').val();

	if(Nm!=undefined){ 
		NmKor=engTypeToKor(Nm);
	} 
	var param = {};
	
	if(flag=='iP'){//인물
		sUrl = contextRoot+"/m/commonPop/personSearch.do";
		sUrl+='?f='+flag+'&n='+num+'&pageIndex='+pageIndex;
		param.cstNm = Nm;
		param.cstNmKor = NmKor;
		param.modalFlag = flag;
		
	}else{ //회사
		
		flag = $("#modalFlag").val();
		Nm =$('#nameSearch2').val();
		sUrl = contextRoot+"/m/commonPop/companySearch.do";
		sUrl+='?f='+flag+'&n='+num+'&fromInside=y&pageIndex='+pageIndex;
		param.cpnNm = Nm;
		param.modalFlag = flag;
	}
	
	var callback = function(json){
		var obj = JSON.parse(json);
		var list = obj.searchList;
		var paging = obj.paging;
		var MDf = obj.MDf;
		var MDn = obj.MDn;
		
		if(flag=='iP') { //인물
			setPersonPop(list,paging);
			
		}else{//회사
			
			$("#modalFlag").val(MDf);
			setCompanyPop(list,paging,flag); 
		}
		
		
	};
	
	commonAjax("POST", sUrl, param, callback, false, null, null);
	
}

//리스트에서 클릭시 이벤트. 
function selectPersonOrCompany(nm,snb,cpnId,cpnNm,position,cpnSnb,MDf,MDn,aCpnId){
	///인물 cstId,cstNm,cpnId,cpnNm,position,cpnSnb
	///회사 cpnNm,cpnId,'','','',cpnSnb
	
	if(mobileOsCheck() == "IOS") keypadDown();
	
	var rVal = new Object();
	if(MDf == 'iP'){ ///인물 선택인데
		
		if(cpnId.length==0 || cpnId=='null'){ //회사가 없다면.
			if(!confirm("회사가 없는 사람은 선택할 수 없습니다.\n회사를 등록하시겠습니까?")){
				return ;
			}
			registPerCom('iP','0',snb);
			return;
		}
	}
		
	rVal.f = MDf ;
	rVal.n = MDn ;
	rVal.nm = nm;
	rVal.snb = snb;
	rVal.cpnId = cpnId;
	rVal.cpnNm = cpnNm;
	rVal.position = position;
	rVal.cpnSnb = cpnSnb;
	rVal.aCpnId = aCpnId;
	
	if(MDf!='iPc'){
		
		returnCompanyPersonPopUp(rVal);
		
	}else{
		
		returnReg(rVal);
	}
	
};


//인물 화면 세팅
function setPersonPop(list,paging){ //ajax 로 가져온 리스트와, 페이징 처리 html 
	
	var str='<table class="pop_tb_basic" >';
	str+='		<colgroup>';
	str+='			<col width="30%">';
	str+='			<col width="*">';
	str+='			<col width="24%">';
	str+='		</colgroup>';
	str+='		<thead>';
	str+='			<tr>';
	str+='				<th scope="col">이름</th>';
	str+='				<th scope="col">회사</th>';
	str+='				<th scope="col">직급</th>';
	str+='			</tr>';
	str+='		</thead>';
	str+='		<tbody>';
	
	if(list.length>0){
		for(var i = 0; i<list.length;i++){
			str+='			<tr  name="result_searched'+i+'" class="link" onclick="selectPersonOrCompany(\''+list[i].cstNm+'\',\''+list[i].sNb +'\',\''+list[i].cpnId+'\',\''+list[i].cpnNm+'\',\''+list[i].position+'\',\''+list[i].cpnSnb+'\',\'iP\',\'0\');">';
			str+='				<th scope="row">'+list[i].cstNm+'</th>';

			if(list[i].cpnNm == null){
				str+='				<td> </td>';
			}else{
				str+='				<td>'+list[i].cpnNm+'</td>';
			}
			str+='				<td>'+list[i].position+'</td>';
			str+='			</tr>';	 
		}
	}else{
		str+='<tr><td colspan="3">검색결과가 없습니다.</td></tr>'
	}
	
	str+='		</tbody>';
	str+='	</table>';
	if(list.length>0){//페이징
		str+= paging;
	}
	$("#searchPerson").html(str);
	$("#personlistCnt").val(list.length);
}

//회사 화면 세팅
function setCompanyPop(list,paging,f){ //ajax 로 가져온 리스트와, 페이징 처리 html 
	
	
	
	var str='<table class="pop_tb_basic" >';
	str+='		<colgroup>';
	str+='			<col width="*">';
	str+='			<col width="24%">';
	str+='		</colgroup>';
	str+='		<thead>';
	str+='			<tr>';
	str+='				<th scope="col">법인명</th>';
	str+='				<th scope="col">코드</th>';
	str+='			</tr>';
	str+='		</thead>';
	str+='		<tbody>';
	for(var i = 0; i<list.length;i++){
		str+='			<tr  name="result_searched'+i+'" class="link" onclick="selectPersonOrCompany(\''+list[i].cpnNm+'\',\''+list[i].cpnId +'\',\'\',\'\',\'\',\''+list[i].cpnSnb+'\',\''+f+'\',\'0\',\''+list[i].aCpnId+'\');">';
		str+='				<th scope="row"><b>'+list[i].cpnNm+'</b></th>';
		str+='				<td>'+list[i].aCpnId+'</td>';
		str+='			</tr>';	 
	}
	str+='		</tbody>';
	str+='	</table>';
	
	if(list.length>0){ //페이징
		str+= paging;
	}

	$("#searchCompany").html(str);
	
}


//----------------------------------------- 인물 회사 팝업 : E

//--------아래서 위로 슬라이드 닫기이벤트 

function closeBottomBox(divName,emptyDivNameStr,type){

	 startLoadingBar();

	$('#'+divName).addClass('disPlayNone');
	
	//초기화 시킬 div id 배열
	if(emptyDivNameStr !='' ){
		var emptyArr = emptyDivNameStr.split(',');
		
		//초기화 
		for(var i=0;i<emptyArr.length;i++){
			$("#"+emptyArr[i]).empty();
		}
	}
	
	
	
	//메뉴 닫기
  	if(divName !='') {
  		$('#'+divName).animate({'bottom':'-100%'},300);
  		endLoadingBar();
  	}
  	
  	nowUrl =window.location.href;
  	
  	
  	
  	if(type == 'first'){
  		
  		var urlStr = nowUrl.substring(0,nowUrl.indexOf('#'));
  		
  		beforeUrl = [];
  	  	window.history.replaceState({}, 'Title', urlStr);
  	  	
  	  	//메인일때 스타일 동적 생성
  	  	if(urlStr.indexOf("/m/main.do") != -1){
  	  		
	  	  	var headID = document.getElementsByTagName("head")[0];
	  		var cssNode = document.createElement('link');
	  		cssNode.type = 'text/css';
	  		cssNode.rel = 'stylesheet';
	  		cssNode.href = contextRoot+'/css_m/refont.css';
	  		headID.appendChild(cssNode);
	  		
  	  	}else{
  	  		quickObj.getAlarmCount();		//퀵메뉴 알림 갯수 
  	  	}
  	  	
	}else{
		
		var subUrlSet ='';
		if(beforeUrl[beforeUrl.length-1] != undefined && beforeUrl[beforeUrl.length-1] != 'undefined'){
			subUrlSet = '#' + beforeUrl[beforeUrl.length-1];
		}
		
		window.history.replaceState({}, 'Title', nowUrl.substring(0,nowUrl.indexOf('#')) + subUrlSet);
		
		
		nowUrl = (beforeUrl[beforeUrl.length-1] == undefined || beforeUrl[beforeUrl.length-1] == 'undefined' ? '' : beforeUrl[beforeUrl.length-1]);
		
		beforeUrl.pop();
	}
	
  	
  	
  	
  	endPageReset();      
};

function closeInnerBox(divName,emptyDivNameStr){

	//초기화 시킬 div id 배열
	if(emptyDivNameStr !='' ){
		var emptyArr = emptyDivNameStr.split(',');
		
		//초기화 
		for(var i=0;i<emptyArr.length;i++){
			$("#"+emptyArr[i]).empty();
			$("#"+emptyArr[i]).hide();
		}
	}
	
	$("#"+divName).show();
	
	nowUrl =window.location.href;
	
	var subUrlSet ='';
	if(beforeUrl[beforeUrl.length-1] != undefined && beforeUrl[beforeUrl.length-1] != 'undefined'){
		subUrlSet = '#' + beforeUrl[beforeUrl.length-1];
	}
	
	window.history.replaceState({}, 'Title', nowUrl.substring(0,nowUrl.indexOf('#')) + subUrlSet);
	
	
	nowUrl = (beforeUrl[beforeUrl.length-1] == undefined || beforeUrl[beforeUrl.length-1] == 'undefined' ? '' : beforeUrl[beforeUrl.length-1]);
	
	beforeUrl.pop();
 	      
};


//--------아래서 위로 슬라이드 닫기이벤트 

function closeRightBox(divName,emptyDivNameStr){
	
	startLoadingBar();
	
//	if(mobileOsCheck() == "IOS") keypadDown();
	
	$('input textare').blur();
	
	setTimeout(function(){
		
		if(beforeUrl[beforeUrl.length-1] != undefined && beforeUrl[beforeUrl.length-1] != 'undefined'){
				
			var nowPage = beforeUrl[beforeUrl.length-1];
			
			//메모 팝업일때
			if(divName == 'memoViewInnerPop'){
				if(nowPage.indexOf('memoSearchViewPop') != -1) memoSearchViewObj.autoPageRefreshSet();
				if(nowPage.indexOf('todayNewMemoViewPop') != -1)  todayNewMemoViewObj.doSearch();
			}
			
			//전 페이지가 알림 팝업일때
			if(nowPage.indexOf('alarmListMain') != -1)alarmListMainObj.doSearch();
			
			
		}
		
		//초기화 시킬 div id 배열
		if(emptyDivNameStr !='' ){
			var emptyArr = emptyDivNameStr.split(',');
			
			//초기화 
			for(var i=0;i<emptyArr.length;i++){
				$("#"+emptyArr[i]).empty();
			}
		}
		
		//메뉴 닫기
	  	if(divName !='') {
	  	
	  		$('#'+divName).animate({'right':'-100%'},300);  
	  		$('#'+divName).addClass('disPlayNone');
	  	}
	  	
	  	if($('.memoMore_bg_layer').length !=0 ) $(".memoMore_bg_layer").remove();
	  
	  	nowUrl =window.location.href;
		
		var subUrlSet ='';
		if(beforeUrl[beforeUrl.length-1] != undefined && beforeUrl[beforeUrl.length-1] != 'undefined'){
			subUrlSet = '#' + beforeUrl[beforeUrl.length-1];
		}
		
		window.history.replaceState({}, 'Title', nowUrl.substring(0,nowUrl.indexOf('#')) + subUrlSet);
		
		
		nowUrl = (beforeUrl[beforeUrl.length-1] == undefined || beforeUrl[beforeUrl.length-1] == 'undefined' ? '' : beforeUrl[beforeUrl.length-1]);
		
		beforeUrl.pop();
		
	
		
		endLoadingBar();
		
	},200);
	
	
	

};


//--------메뉴 패널 이벤트 


//레이어 팝업 닫을때 리스트 재 그리드호출
function endPageReset(){

	if(typeof g_workOpenType != 'string'){
		
	}else if(g_workOpenType == 'list'){
		
		scheListObj.searchCalendarDate();
		
	}else if(g_workOpenType == 'cal'){
		
		scheCalObj.setSelectList();
		
	}else if(g_workOpenType == 'deal'){
		
		dealListObj.doSearch();
		
	}else if(g_workOpenType == 'dealComment'){
		
		dealCommentListObj.doSearch();
	}
	
}

//================== native 호출 : S

var userAgent = navigator.userAgent.toLowerCase();

//os 체크
function mobileOsCheck(){
	
	if((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)
			|| (userAgent.search("ipad") > -1)) return "IOS";
	
	else if(userAgent.search("android") > -1) return "AND";
		
		
}

//앱버전 체크
function callMobileVersion(){
	
	if(mobileOsCheck() == "IOS") location.href="appVersion://"+g_ver;   		//   send ios native   
 	else if(mobileOsCheck() == "AND") AndroidTest.callMobileVersion(g_ver);
}

//모바일 정보요청
function callMobileInfo(){
	
	if(mobileOsCheck() == "IOS") location.href="nativecall://";   		//   send ios native   
 	else if(mobileOsCheck() == "AND") AndroidTest.callMobileInfo();
}

//네이티브 호출 받기(정보)
function recvMobileInfo(unparsedJson){

	var parsedJson;

	if(mobileOsCheck() == "IOS") var parsedJson = JSON.parse(JSON.stringify(unparsedJson));
	else if(mobileOsCheck() == "AND")  var parsedJson = JSON.parse(unparsedJson);
	
	$("#deviceType").val(parsedJson.mobile_gubun);
	$("#deviceUuid").val(parsedJson.uuid);
	$("#deviceToken").val(parsedJson.token);
}

//로딩바 시작
function startLoadingBar(){
	
	if(mobileOsCheck() == "IOS") location.href="apploadingstart://";   //   send ios native 
 	else if(mobileOsCheck() == "AND") AndroidTest.loadingStart();
 	
}

//로딩바 끝
function endLoadingBar(){
	
	if(mobileOsCheck() == "IOS") location.href="apploadingstop://";   //   send ios native 
 	else if(mobileOsCheck() == "AND") AndroidTest.loadingEnd();
 		
 	
}

//pc 버전 보기
function callPcWeb(){
	if(mobileOsCheck() == "IOS") location.href="pc_IBsys://";   //   send ios native 
 	else if(mobileOsCheck() == "AND") AndroidTest.callPcWeb();
	
}

//전화걸기
function callPhone(num){
	
	if(num == ''){
		swal('잘못된 전화번호 입니다.');
		return false;
	}else location.href="tel:"+num;
}

//전화걸기
function sendEmail(email){
	
	if(email == ''){
		swal('잘못된 메일 입니다.');
		return false;
	}else location.href="mailto:"+email;
}


function keypadDown(){
	location.href="keypadDown://";
}

//뱃지 초기화
function badgeInit(){
	
	if(mobileOsCheck() == "IOS") location.href="badgeInit://";   //   send ios native 
 	else if(mobileOsCheck() == "AND") AndroidTest.badgeInit();
 		
 	
}

