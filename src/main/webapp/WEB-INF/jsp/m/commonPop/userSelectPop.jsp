<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="wrap" class="fixedTop">
 	<!--고정서브navi-->
 	<div class="sub_fixWrap intaglio">
		<div class="mb_pop_location">
			<span>업무대상선택</span>
			<button type="button" onclick="closeBottomBox('userSelectCommonPop','userSelectCommonArea','second');" id="userSelectPopCanBtn" class="btn_left" >취소</button>
			<a href="javascript:userSelectPopFnObj.selectFinish();" class="btn_right">완료</a>
		</div>
		<!--tab-->
		<div class="tab_flatst">
			<ul class="tab_flatst_list n02">
				<li id="teamLi" name="tab" class="current" onclick="userSelectPopFnObj.changeTab('team');"><a href="javascript:;">부서별</a></li>
				<li id="singleLi" name="tab" onclick="userSelectPopFnObj.changeTab('single');"><a href="javascript:;">직원별</a></li>
			</ul>
		</div>
		<!--//tab//-->
		<!--직원선택리스트-->
		<ul class="add_mm_list" id="selectUserListArea"></ul>
		<!--//직원선택리스트//-->
		<div class="add_mm_search">
			<input type="text" title="이름검색" placeholder="이름검색" id="searchNameKey" onclick="userSelectPopFnObj.userNameSearchFocus();" onkeyup="userSelectPopFnObj.userNameSearch();"/>
			<a id="cancelSearch" style="display:none;" class="btn_cls_search" onclick="userSelectPopFnObj.cancelSearch();"><em>취소</em></a>
		</div>
		<div class="team_nmtitle" id="allCheckArea">
			<h4><span id="companyNmArea"></span><span class="mm_count"><span id="selectUserCount"></span>/<span id="totalUserCount"></span></span></h4>
			<span id="allCheck" onclick="userSelectPopFnObj.checkAll();"></span>
		</div>
	</div>
	<!--//고정서브navi//-->
	<!--서브컨텐츠-->
	<section class="contentsWrap scrollArea userchWrap">
		<!--부서별목록-->
		<div id="treeWrapArea" >
			<div class="tree_listBox" id="treeArea"></div>	
		</div>
		<!--//부서별목록//-->
	</section>
	<!--//서브컨텐츠//-->
</div>
		
<script>



//검색옵션
var isOneUser = '${isOneUser}' == 'Y'  ? 'Y' : 'N'; //유저 한명만 선택 여부       .. default:N   ('Y': 한명만,      그외,: 다중)
var isOneDept = '${isOneDept}' == 'N'  ? 'N' : 'Y'; //부서 한명만 선택 여부       .. default:Y   ('Y': 한명만,      그외,: 다중)
var isUserSelectEabled ='${isUserSelectEabled}' == 'N'  ? 'N' : 'Y';    //유저 선택 체크박스 disabled  .. default:Y
var isCloseBySelect ='${isCloseBySelect}' == 'N'  ? 'N' : 'Y';
var isEnable        =('${isEnable}' == 'N' ? 'N' : '');                 //재직자 조회시 빈값 퇴사자면 N 값
var isDeptSelect    =('${isDeptSelect}' == 'Y' ? 'Y' : 'N');            //부서 단일 선택               .. default:N

var isCheckDisable = ('${isCheckDisable}' == '' ? 'Y' : '${isCheckDisable}'); //diable 리스트가 부서선택시 체크 선택 해제 기능을 사용할것인지 .. default:Y

var g_parentKey ='${parentKey}'         //부모창 키 값.


var g_selectUserStr ='${userList}';     //선택 유저 리스트 to String(sabun값만있다)
var g_selectUserList =[];               //선택유저 리스트 (g_selectUserStr를 이용 db 에서 정보를 가져옴)
var g_selectDeptList =[];
var g_disabledList = [];                //선택 및 해제 불가 유저리스트

var g_userList =[];                     //해당org의 유저리스트
var g_deptList =[];                     //해당 org 의 부서리스트

var g_groupList =[];                	//그룹 리스트
var g_groupUserList =[];				//그룹에 속한 유저리스트

var resultList =[];                     //선택리스트


var userSelectPopFnObj = {
		
	preload	: function(){
		
		var disabledList = '${disabledList}';
        g_disabledList = disabledList.split(",");
        
        $("#companyNmArea").html('시너지');
        console.log(g_selectUserStr)
     
	},
	
    //파라미터로 넘어온 선택된 유저리스트 정보 
    getAllUserList : function(){

        var url = contextRoot+"/common/getStaffListNameSort.do";
        var param = {
            
                deptOrder   : 'Y' ,
                userStatus  : isEnable,
                sabunList   : g_selectUserStr,
            
        };


        var callback = function(result){

            var obj = JSON.parse(result);
            var cnt = obj.resultVal;        //결과수
            var list = obj.resultList;      //결과데이터JSON
            
            g_selectUserList = list;

        }

        commonAjax("POST", url, param, callback, false, null, null);
    },
	

    
  	//유저 체크박스 세팅
    getDeptUserList : function(){
		 
    	 var url = contextRoot+"/common/getStaffListNameSort.do";
         var param = {
                
                 deptOrder   : 'Y' ,
                 userStatus  : isEnable,
              
         };


         var callback = function(result){

             var obj = JSON.parse(result);
             var cnt = obj.resultVal;        //결과수
             var list = obj.resultList;      //결과데이터JSON
             g_userList = list;
             
             $("#totalUserCount").html(g_userList.length);
   
         }

         commonAjax("POST", url, param, callback, false, null, null);
   },
	
    //팀 체크박스 세팅
    getDeptList : function(){

        var url = contextRoot+"/common/getDeptList.do";
        var param = {
               enable      : 'Y',
        };

        var callback = function(result){

            var obj = JSON.parse(result);
            var cnt = obj.resultVal;        //결과수
            var list = obj.resultList;      //결과데이터JSON
            g_deptList = list;
            var allStr ='';
            if(isOneUser != 'Y' && isDeptSelect !='Y'){     //단일 유저 선택이아니면,
                //allStr ='';
            	$("#allCheck").addClass("mm_add_check");

            }
            
            

        }
        commonAjax("POST", url, param, callback, false, null, null);
   },
   
   
   
   ////////-------------------------------부서별-------------------------------------/////////
   
   //최상위 부서
   setDeptTopGrid : function(){
	   var str ='';

       $("#totalUserCount").html(g_userList.length);
       
   
	   for(var i=0; i<g_deptList.length; i++){
		     
		     str +='<dl class="tree_list_team '+('${loginVO.perDept}' == g_deptList[i].deptSeq ? 'open' : '')+'" id="tree_deptNmArea_'+g_deptList[i].deptSeq+'">';
		   	 str +='<dt id="teamCheck_'+g_deptList[i].deptSeq+'"><span id="deptNmArea_'+g_deptList[i].deptSeq+'" onclick="userSelectPopFnObj.openDiv(this.id);">'+g_deptList[i].deptNm+'</span>';
		   	 str +='<span class="mm_count" id="userAllCount_'+g_deptList[i].deptSeq+'"></span>';
		   	 str +='<span class="mm_add_check" onclick="userSelectPopFnObj.checkDept('+g_deptList[i].deptSeq+');"></span></dt>';
			    
			 var userStr = userSelectPopFnObj.setDeptUserListGrid(g_deptList[i].deptSeq);
			 
			 if(userStr !=''){
				 str +='<dd id="userDD_'+g_deptList[i].deptSeq+'">';
				 str +='<ul>'+userStr+'</ul>';
				 str +='</dd>';
			 }
			 
			 str +='</dl>';
	   }
	   
	   $("#treeArea").html(str);
	   
	   userSelectPopFnObj.setDetailGrid();
   },
   
   
   //유저그리드 (부서별)
   setDeptUserListGrid : function(deptSeq){
	   
	   var str ='';
	   for(var i=0;i<g_userList.length; i++){
		   if(g_userList[i].deptSeq ==  deptSeq){
			   
			   str +='<li id="userCheck_'+g_userList[i].sabun+'" rel-sabun="'+g_userList[i].sabun+'" ><span class="mb_name">'+g_userList[i].usrNm+'</span><span class="mb_grade">'+g_userList[i].position+'</span>';
			   str +='<span class="mm_add_check" onclick="userSelectPopFnObj.checkUser('+g_userList[i].sabun+','+g_userList[i].deptSeq+');"></span></li>';
			
		   }
	   }
	  
	   return str;
   },
   
   ////////-------------------------------직원별-------------------------------------/////////
   
   //유저그리드 (직원별)
   setUserListGrid : function(){
	   
	   $("#totalUserCount").html(g_userList.length);
	   
	   var userList = g_userList.clone();
	   
	   sortByKey(userList, 'usrNm', 'ASC');
	   
	   var str ='';
	   for(var i=0;i<userList.length; i++){
		   
		   str +='<dl class="single_mb_list" id="userCheck_'+userList[i].sabun+'">';
		   str +='<dt class="mb_photo"></dt>';
		   str +='<dd><span class="mb_name">'+userList[i].usrNm+'</span>';  
		   str +='<span class="mb_grade">'+userList[i].position+'</span><span class="mm_add_check" onclick="userSelectPopFnObj.checkUser('+userList[i].sabun+',-1);"></span></dd></dl>';  
	   }
	  
	   $("#treeArea").html(str);
	   
	   userSelectPopFnObj.setDetailGrid();
   },
   
  
   //상세 설정   
   setDetailGrid : function(){
	   
	   for(var i=0; i<g_deptList.length; i++){
		  var userCount = $("#tree_deptNmArea_"+g_deptList[i].deptSeq).find("li[id^='userCheck_']").length;
		  
		  $("#userAllCount_"+g_deptList[i].deptSeq).html(userCount);
		  
		  if(userCount == 0){
			  $("#deptNmArea_"+g_deptList[i].deptSeq).attr('onclick','');
			  $("#tree_deptNmArea_"+g_deptList[i].deptSeq).addClass('no');
		  }
	   }
	   
	   //선택된거 
       for(var i=0;i<resultList.length;i++){
           $("#userCheck_"+resultList[i].sabun).addClass('add_member');
       }
       
 	  //얘는 disable
	   
       for(var i=0;i<g_disabledList.length;i++){
    	 
           $("#userCheck_"+g_disabledList[i]).addClass('noCheck');	
         
       }
 	  
	   //얘는 disable
	   var noChecklist = $(".tree_list_team");
       for(var i=0;i<noChecklist.length;i++){
          if($(noChecklist[i]).find('dd').find('ul').length == 0
        	||( $(noChecklist[i]).find("li[id^='userCheck_'][class*='noCheck']").length == $(noChecklist[i]).find('dd').find('li').length)
          ){
              $(noChecklist[i]).find('dt').addClass('noCheck');	
          }
          
       }
       
       
  },
  
  //처음 로드시 세팅
  firstReadCall : function(){
	   
      for(var i=0;i<g_selectUserList.length;i++){
          $("#userCheck_"+g_selectUserList[i].sabun).addClass('add_member');	
          
          //userSelectPopFnObj.setResultList('ADD', g_selectUserList[i].userId);	
          resultList = addToArray(resultList, 0, g_selectUserList[i]);				//파라미터로 넘어온 선택 값을 resultList에 세팅
          userSelectPopFnObj.getSelectListGrid();									//그리드함.
        
      }
      
      userSelectPopFnObj.checkAutoDept();			//자동선택
  
  }, 
   
  //열기 닫기
  openDiv : function(id){
	
	if($("#tree_"+id).hasClass('open'))  $("#tree_"+id).removeClass('open');
	else  $("#tree_"+id).addClass('open');
	
	
  },
  
  //전체선택 자동 선택
  checkAutoAll : function(){
	  
	  var currentType = $('li[name=tab][class=current]').attr('id');
	 
	  var allCnt = 0;
	  var userCnt = 0;
	
	  
	  if(currentType == 'singleLi'){
		  
		  allCnt = $("#treeWrapArea").find("dl[id^='userCheck_']").not('.noCheck').length;
		  userCnt = $("dl[id^='userCheck_'][class*='add_member']").not('.noCheck').length;
	  }else{
		  
		  allCnt = $("#treeWrapArea").find("li[id^='userCheck_']").not('.noCheck').length;
		  userCnt = $("li[id^='userCheck_'][class*='add_member']").not('.noCheck').length;
	  }
	  
	  
	  
	  if( allCnt == userCnt) $("#allCheck").addClass('add_member');
	  else $("#allCheck").removeClass('add_member');
	  
	 
  },
  
  //팀선택 자동 선택
  checkAutoDept : function(){
	  
	  var currentType = $('li[name=tab][class=current]').attr('id');
	  
	  var deptList = [];
	
	  if(currentType == 'teamLi') deptList = g_deptList.clone();		//팀일때
	  else deptList = g_groupList.clone();								//그룹일때 

     // sortByKey(deptList, 'levelSeq', 'DESC');  //레벨(depth)이 낮은 부서부터 체크
      
      for(var i =0;i<deptList.length;i++){
            
    	  var deptSeq = deptList[i].deptSeq;
          var parentDeptId = deptList[i].parentDeptId;
          var name = deptList[i].name;
          var levelSeq = deptList[i].deptOrder;
          
         
          //체크 비활성화가 아닌 전체유저 = 체크 비활성화가 아닌 선택유저  -> 전체 선택이 되었다. 
          var totalNoUser = $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").not('.noCheck').length;
          var totalNoCheckUser = $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_'][class*='add_member']").not('.noCheck').length;
          
          //전체 유저  = 체크 유저 -> 전체 선택이 되었다.
          var totalUser = $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").length;
          var totalCheckUser = $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_'][class*='add_member']").length;
         
          
          if(totalUser > 0){
        	  if(totalUser == totalCheckUser || (totalNoUser >0  && totalNoUser == totalNoCheckUser)) $("#teamCheck_"+deptSeq).addClass('add_member');
              else $("#teamCheck_"+deptSeq).removeClass('add_member');
          }
      }
	  
	  userSelectPopFnObj.checkAutoAll();
  },
  
  //팀 체크박스
  checkDept : function(deptSeq,type){
	  
	  if($("#tree_deptNmArea_"+deptSeq).find('dd').length > 0){		//li 안에 dd 
		  
		  var userObjList = $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']");
	  	  var type ='';
	  	  
		  if($("#teamCheck_"+deptSeq).hasClass('add_member') || type == 1){		//선택 된거 해제
			  
			  $("#teamCheck_"+deptSeq).removeClass('add_member');
		  	  
		  	  // disable 조작 가능 여부 Y 조작가능  N 안됨. 
		      if(isCheckDisable == 'Y' ) $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").removeClass('add_member');
		      else $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").not('.noCheck').removeClass('add_member');
		      
		      
		      $("#tree_deptNmArea_"+deptSeq).find("dt[id^='teamCheck_']").removeClass('add_member');	
			  
			  
			  type ='DEL';
		
			  
		  }else if(!$("#teamCheck_"+deptSeq).hasClass('add_member') || type == 2){	
			  //선택
			  $("#teamCheck_"+deptSeq).addClass('add_member');
			  
			  if(isCheckDisable == 'Y' ) $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").addClass('add_member');
		      else $("#tree_deptNmArea_"+deptSeq).find("li[id^='userCheck_']").not('.noCheck').addClass('add_member');
			  
			  $("#tree_deptNmArea_"+deptSeq).find("dt[id^='teamCheck_']").not('.noCheck').addClass('add_member');
			
			  type ='ADD';
			 
		  }
		  
	  	 for(var i=0; i<userObjList.length; i++){
	  		 
		  	var sabun = $(userObjList[i]).attr('rel-sabun');
		  	
		  	var cnt = getArrayIndexWithValue(g_disabledList, sabun);					//disabled List 에 존재하냐
		  	
		  	if(isCheckDisable == 'Y' ) userSelectPopFnObj.setResultList(type,sabun);	// disable 조작 가능 여부 Y 조작가능  N 안됨. 
		  	else{
		  		if(cnt == -1) userSelectPopFnObj.setResultList(type,sabun);			
		  	}
	  	 } 
		 
		 userSelectPopFnObj.getSelectListGrid();				//선택된거 그리드
		 userSelectPopFnObj.checkAutoDept();					//팀 자동 선택
		
	  }
	  
  },
  
  //전체선택 버튼
  checkAll : function(){
	  
	  var type ='';
	  var currentType = $('li[name=tab][class=current]').attr('id');
	  
	  
	  if($("#allCheck").hasClass('add_member')){		//선택해제
		  
		  type ='DEL';
	  
		  $("#allCheck").removeClass('add_member')
		  
	  	  if(isCheckDisable == 'Y' ){					//disable 조작 가능 
			  
	  		  if(currentType == 'singleLi') $("dl[id^='userCheck_']").removeClass('add_member');		//직원별 탭
	  		  else{		//부서별
	  			  
	  			  $("li[id^='userCheck_']").removeClass('add_member');
				  $("dt[id^='teamCheck_']").removeClass('add_member');
	  		  }	  
	  		  
			  
		  }else{										//disable 조작 불가						
			  
			  if(currentType == 'singleLi') $("dl[id^='userCheck_']").not('.noCheck').removeClass('add_member');	//직원별 탭
			  else{		//부서별
				  $("li[id^='userCheck_']").not('.noCheck').removeClass('add_member');
				  $("dt[id^='teamCheck_']").not('.noCheck').removeClass('add_member');
			  }
			  
		  }
	  
	  }else{											//전체 선택
		  
		  type ='ADD';
		  
		  $("#allCheck").addClass('add_member')
		  
		  if(isCheckDisable == 'Y' ){					//disable 조작 가능 
			 
			  if(currentType == 'singleLi') $("dl[id^='userCheck_']").addClass('add_member');		//직원별 탭
	  		  else{		//부서별
	  			  
			  		$("li[id^='userCheck_']").addClass('add_member');
			  		$("dt[id^='teamCheck_']").addClass('add_member');
	  		  }
		  
		  }else{										//disable 조작 불가
			  
			  if(currentType == 'singleLi') $("dl[id^='userCheck_']").not('.noCheck').addClass('add_member');	//직원별 탭
	  		  else{		//부서별
	  			  
	  			  $("li[id^='userCheck_']").not('.noCheck').addClass('add_member');
				  $("dt[id^='teamCheck_']").not('.noCheck').addClass('add_member');
	  		  }
			  
		  }
		  
	  }
	  
	  
	  for(var i=0; i<g_userList.length; i++){
	  		 
		  	var sabun = g_userList[i].sabun;
		  	
		  	var cnt = getArrayIndexWithValue(g_disabledList, sabun);					//disabled List 에 존재하냐
		  	
		  	if(isCheckDisable == 'Y' ) userSelectPopFnObj.setResultList(type,sabun);	// disable 조작 가능 여부 Y 조작가능  N 안됨. 
		  	else{
		  		if(cnt == -1) userSelectPopFnObj.setResultList(type,sabun);			
		  	}
	  } 
	  
	  
	  userSelectPopFnObj.getSelectListGrid();				//선택된거 그리드
		 
	 
	  
  },
  
  //사원 체크박스
  checkUser : function(sabun,deptSeq){
	  
	  var type ='';
	  
	  if($("#userCheck_"+sabun).hasClass('noCheck')) return false;
		  
	  if($("#userCheck_"+sabun).hasClass('add_member')){
		  
		  $("#userCheck_"+sabun).removeClass('add_member');
		  
		  type ='DEL';
		  			
		  
	  }else{
		  
		  $("#userCheck_"+sabun).addClass('add_member');
		  
		  type ='ADD';
		  	
	  }
	  
	  userSelectPopFnObj.setResultList(type, sabun);		//선택 리스트 세팅
	  userSelectPopFnObj.getSelectListGrid();				//선택된거 그리드	
	  
	  if(deptSeq > 0) userSelectPopFnObj.checkAutoDept();	//직원별이 아니면 팀 자동선택 
	  else userSelectPopFnObj.checkAutoAll();				//직원별이 아니면 전체 자동선택 
  },
  
  //체크값 가져오기
  setResultList : function(type,sabun){
	 
	  //추가
	  if(type == 'ADD'){
		 
		  var currentType = $('li[name=tab][class=current]').attr('id');
		  var obj={};
		
		  obj = getRowObjectWithValue(g_userList, 'sabun', sabun);
		 
		  var cnt = getCountWithValue(resultList, 'sabun', sabun);
		
		  if(cnt == 0)  resultList = addToArray(resultList, 0, obj);
	  //삭제	
	  }else{
		  
		  resultList.remove(getRowIndexWithValue(resultList, 'sabun', sabun));
		  
	  }
	  
	  
  },
  
  //체크된거 표시
  getSelectListGrid : function(){
	  
	  var frontStr = '';		//앞에 고정 
	  var str = '';
	  var orgCnt = userSelectPopFnObj.getOrgSelectUserCnt();
	  
	  
	  
	  for(var i=0; i<resultList.length; i++){
		 
		  
		  
		  //disable 리스트에 있는지 판별 있으면 x 표시 없앰.
		  var cnt = getArrayIndexWithValue(g_disabledList, resultList[i].sabun);
		  
		  if(cnt == -1){
			  str += '<li><span class="mm_delete" id="del_'+resultList[i].sabun+'" onclick="userSelectPopFnObj.deleteUser('+resultList[i].sabun+');">'+resultList[i].usrNm+'</span></li>';
		  }else{
			  frontStr += '<li>'+resultList[i].usrNm+'</li>';
		  }
		
	  }
	 
	  
	  $("#selectUserCount").html(orgCnt);		//선택 카운트
	  $("#selectUserListArea").html(frontStr+str);
	  
  },
  
  //x 버튼
  deleteUser : function(sabun){
	  
	  userSelectPopFnObj.setResultList('DEL', sabun);		//선택 리스트 세팅
	  $("#userCheck_"+sabun).removeClass('add_member');
	  
	  userSelectPopFnObj.getSelectListGrid();				//선택된거 그리드
	  userSelectPopFnObj.checkAutoDept();					//팀 자동선택 
	  
	  if($('.searchLayer').length) userSelectPopFnObj.searchCheckUser(sabun);
	  
  },
  
  //탭 변경
  changeTab : function(type){
	  
	  if($('.searchLayer').length || $('.opacity_bg_layer').length) userSelectPopFnObj.cancelSearch(); 	//만약 검색기능 중이었으면 취소
	  
	  $("#allCheckArea").show();
	  
	  $('#treeWrapArea').removeClass();
	  $('#treeWrapArea').addClass('pop'+type+'Wrap');
	  
	  $('li[name=tab]').removeClass('current');
	  $("#"+type+'Li').addClass('current');
	  
	  
	  if(type == 'single' ){
		  
		  userSelectPopFnObj.setUserListGrid();
		  
	  }else if(type == 'team' ){
		  
		  userSelectPopFnObj.setDeptTopGrid();
		  userSelectPopFnObj.checkAutoDept();
		  
	  }
  },

  
  //선택완료
  selectFinish : function(){

      if(resultList.length == 0){
        
    	  modal({
              type: 'alert',
              title: '주의',
              text: (isDeptSelect == "Y" ? "부서를" : "사원을")+" 선택해주세요!",
             
          });
    	  
    	  return;
     }
     
     if(isCloseBySelect == 'Y'){            //선택과동시에 창닫기면
    	closeBottomBox('userSelectCommonPop','userSelectCommonArea','second');
     }
     
     selectUserPopGetResult(resultList, g_parentKey);

  },
  
  //검색 버튼 클릭 
  userNameSearchFocus : function(){
	  
	  $("#allCheckArea").hide();
	  $("#searchNameKey").addClass('select');
	  $("#cancelSearch").show();
	  
	  if($('.opacity_bg_layer').length == 0) { // 불투명 배경 레이어가 없으면 생성
		  $('.userchWrap').after('<div class="opacity_bg_layer" onclick="userSelectPopFnObj.cancelSearch();"></div>');
	  }
	  
	  var oj = $(".opacity_bg_layer");

	  // 화면의 가로, 세로 알아내기
	  var w = $(document).width();
	  var h = $(window).innerHeight();

	  oj.css({'width':w,'height':h}); // 불투명 배경 레이어 크기 설정
	  oj.fadeIn(500); // 불투명 배경 레이어 보이기(속도:0.5초)



  },
  
  //검색
  userNameSearch : function(){
	  
	  var height=0;
	  
	  if($('.searchLayer').length == 0) { 		// 검색 레이어가 없으면 생성
		  $('.opacity_bg_layer').after('<div class="scrollArea searchLayer"></div>');
	  }
	  
	  var value = $("#searchNameKey").val();
	  var currentType = $('li[name=tab][class=current]').attr('id');
	  
	  if(value=='') $(".searchLayer").remove();
	  else{
		
		  	var searchInfoList = [];
			
			var currentType = $('li[name=tab][class=current]').attr('id');
			
			if(currentType != 'groupLi') searchInfoList = g_userList;
			else searchInfoList = g_groupUserList;
			
			var korResult = runSearch(searchInfoList, value);	//바꾸지 않은 고유 값 대입
			
			
			var encValue = engTypeToKor(value.toLowerCase());								//입력된 건 영문 을 한글로 바꿈
			var encResult = (value != encValue ? runSearch(searchInfoList,encValue) : '');	//바꾼 값 대입
			
			var result = (encResult !='' ? encResult+',' : '') + korResult;
			var str='';
			
			if(encResult == '' && korResult == '' ) str+='<div class="tree_listBox"><dl class="single_mb_list"><dd>검색결과없음</dd></dl></div>';
			else{
				
				var nameArr = result.split(',');
				var deptSeq = -1;
				
				str+='<div class="tree_listBox">';
				for(var i=0;i<nameArr.length;i++){
					
					var obj = getRowObjectWithValue(searchInfoList, 'usrNm', nameArr[i])
	    			if(obj != null){
	    				
	    				str +='<dl id="searchUserId_'+obj.sabun+'" class="single_mb_list';
	    				
	    				var selectCnt = getCountWithValue(resultList, 'sabun', obj.sabun);		//선택되어있냐
	    				var disableCnt = getArrayIndexWithValue(g_disabledList, obj.sabun);		//조작 불가이냐
	    				
	    				if(selectCnt >0) str += ' add_member ';		//있으면 선택 표시
	    				if(disableCnt != -1) str += ' noCheck ';	//있으면 disable
	    				
	    				if(currentType != 'singleLi') deptSeq = obj.deptSeq;
	    				
	    				str +='">';
	    				str +='<dt class="mb_photo"></dt>';
	    				str+='<dd><span class="mb_name">'+obj.usrNm+'</span><span class="mb_grade">'+obj.deptNm+'</span>';
	    				str+='<span class="mm_add_check" '+(disableCnt != -1 ? '' : 'onclick="userSelectPopFnObj.searchCheckUser('+obj.sabun+','+deptSeq+');"')+'></span></dd>';
	    				str +='</dl>';
	    			}
	    		}
				str+='</div>';
				
				
			}
			
			$(".searchLayer").html(str);
			
	  }
	  
	  $(".searchLayer").show(); 

  },
  
  //검색창에서 유저 클릭 
  searchCheckUser : function(sabun,deptSeq){
	  
	  if($("#searchUserId_"+sabun).hasClass('add_member')){
		  
		  $("#searchUserId_"+sabun).removeClass('add_member');
		 
	  }else{
		  
		  $("#searchUserId_"+sabun).addClass('add_member');
		  
	  }
	  
	  if(deptSeq != undefined ) userSelectPopFnObj.checkUser(sabun,deptSeq);
	  
	 
  },
  
  //검색 취소
  cancelSearch : function(){
	  
	  $("#searchNameKey").val('');
	  $("#searchNameKey").removeClass('width80');
	  $("#cancelSearch").hide();
	  
	  $("#allCheckArea").show();
	  
	  $(".searchLayer").remove();		//검색 영역 지우고
	  $('.opacity_bg_layer').remove();	//마스크 화면 지우기
	  
  },
  
  //선택된 갯수 리턴
  getOrgSelectUserCnt : function(){
	  
	  var orgCnt = 0;
	  var currentType = $('li[name=tab][class=current]').attr('id');
	  
	  if( currentType == 'teamLi') orgCnt = $("li[id^='userCheck_'][class*='add_member']").length;
	  else orgCnt = $("dl[id^='userCheck_'][class*='add_member']").length;
	  
	  
	  return orgCnt;
  }
  
  
  
  
  
};

$(function(){
	
	userSelectPopFnObj.preload();
	
	if(g_selectUserStr != '') userSelectPopFnObj.getAllUserList();
	
	userSelectPopFnObj.getDeptUserList();
	userSelectPopFnObj.getDeptList();
	userSelectPopFnObj.setDeptTopGrid();		//재귀함수 go 
	userSelectPopFnObj.firstReadCall();			//처음 로드시 세팅
/* 	
	$(document).on('touchstart', '',function (e) {
		passive: true 
	}); */
	
/*  
	$('input, textarea').blur(function(){
		
		if(mobileOsCheck() == "IOS") keypadDown();
		
	}); */

});

</script>
