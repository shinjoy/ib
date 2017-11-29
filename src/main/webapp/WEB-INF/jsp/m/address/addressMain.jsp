<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %>
<%@ include file ="../includeJSP/commonPopAll.jsp" %> 
<body>
<div id="wrap">
	<!--서브고정-->
	<div class="sub_fixWrap">
	    <div class="mb_sub_location">
	    	<button type="button" class="back" onclick='history.back(-1);'><em>이전</em></button>
	    	<a href="javascript:;" class="depth01">직원목록</a><a href="javascript:;" class="depth02"><span id="topTitle">연락처안내</span></a>
	    </div>
	    <div class="shadowWrap">
		    <div class="con_net_srch">
			    <div class="netpeople_srch">
					<input type="text" placeholder="직원검색" id="nameSearch" title="직원검색" onkeyup="fnObj.searchName(this.value);">
					<!--<button type="button" onclick="fnObj.searchName();" style="padding:0.8em 1em;"><em>검색</em></button>-->
				</div>
			</div>
		</div>
	</div>
	<!--//서브고정//-->
	
	<!--서브-->
	<div class="containerWrap"> 
		<!--서브컨텐츠1 -->
	    <section id="firstSection" class="contentsWrap scrollArea addresswrap">
	    	<div class="userArea" id="userListArea"></div>
			<!-- <div class="btn_top"><a id="toTop" href="#"><strong>맨위로</strong></a></div> -->
		</section>
		<div class="rightSpell">
			<div><a href="javascript:fnObj.moveCho(0);" >ㄱ</a></div>
			<div><a href="javascript:fnObj.moveCho(1);">ㄴ</a></div>
			<div><a href="javascript:fnObj.moveCho(2);">ㄷ</a></div>
			<div><a href="javascript:fnObj.moveCho(3);">ㄹ</a></div>
			<div><a href="javascript:fnObj.moveCho(4);">ㅁ</a></div>
			<div><a href="javascript:fnObj.moveCho(5);">ㅂ</a></div>
			<div><a href="javascript:fnObj.moveCho(6);">ㅅ</a></div>
			<div><a href="javascript:fnObj.moveCho(7);">ㅇ</a></div>
			<div><a href="javascript:fnObj.moveCho(8);">ㅈ</a></div>
			<div><a href="javascript:fnObj.moveCho(9);">ㅊ</a></div>
			<div><a href="javascript:fnObj.moveCho(10);">ㅋ</a></div>
			<div><a href="javascript:fnObj.moveCho(11);">ㅌ</a></div>
			<div><a href="javascript:fnObj.moveCho(12);">ㅍ</a></div>
			<div><a href="javascript:fnObj.moveCho(13);">ㅎ</a></div>
			<div><a href="javascript:fnObj.moveCho(14);">기타</a></div>
		
		</div>
	</div>
	<!--퀵메뉴-->
   	<%@ include file ="../includeJSP/quickmenu.jsp" %> 
    <!--//퀵메뉴//-->
</div>
</body>

<script type="text/javascript">



//Global variables :S ---------------

//공통코드

var myGrid = new SGrid();					   // instance		new sjs
	

var staffSnb='${userLoginInfo.staffSnb}'; 	//로그인 유저의 staffSnb
var sabun='${userLoginInfo.sabun}'; 	//로그인 유저의 사번 


//Global variables :E ---------------
var g_userList = [];

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
//선로딩코드
	preloadCode: function(){
		//$("#nameSearch").focus();
	},


	//화면세팅
    pageStart: function(){
    			
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    	
    	
    	var url = contextRoot + "/common/getStaffListNameSort.do";
    	var param = {division : 'SYNERGY'};
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		g_userList = list;
    		
    		
    		fnObj.userListSet();
    		
    	};
    	
    	
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    },//end doSearch
    
    //검색없이 세팅 
    userListSet : function(){

		var str ='';
    	
    	var choGrpArr = [
	    		           	[ "ㄱ" , "ㄲ"],
	    		           	[ "ㄴ"],
	    		           	[ "ㄷ" , "ㄸ"],
	    		           	[ "ㄹ"],
	    		           	[ "ㅁ"],
	    		           	[ "ㅂ" , "ㅃ"],
	    		           	[ "ㅅ" , "ㅆ"],
	    		           	[ "ㅇ"],
	    		           	[ "ㅈ" , "ㅉ"],
	    		           	[ "ㅊ" ],
	    		        	[ "ㅋ" ],
	    		           	[ "ㅌ" ],
	    		           	[ "ㅍ" ],
	    		           	[ "ㅎ" ]
		          ];
		
		var choUserList = [];
		
		for(var i=0;i<choGrpArr.length;i++){
			for(k=0;k<choGrpArr[i].length;k++){
				
				if(k==0) str+='<div class="choArea" id="cho_'+i+'" name="cho_'+i+'" >'+choGrpArr[i][k]+'</div><ul>';
				
				for(var j=0;j<g_userList.length;j++){
	    			 var sung = cho_hangul(g_userList[j].usrNm.substring(0, 1));
	    			 
	    			 if(sung == choGrpArr[i][k]){
	    				str+='<li class="nameArea"><a href="javascript:;">'+g_userList[j].usrNm+'<span class="nameSub">('+g_userList[j].deptNm+' | '+g_userList[j].position+')</span></a>';
	    				
	    				str+='<div>';
	    				
	    				if(g_userList[j].phone != '') str += '<span class="nameTel" onclick="callPhone(\''+g_userList[j].phone+'\');">'+g_userList[j].phone+'</span>';
	    				
	    				if(g_userList[j].comPhone != ''){
	    					str+='<span class="comTel" onclick="callPhone(\''+g_userList[j].comPhone+'\');">'+g_userList[j].comPhone+'</span>';
	    				}
	    				
	    				str +='</div>';
	    				
	    				if(g_userList[j].email != '') str+='<div><span class="perEmail" onclick="sendEmail(\''+g_userList[j].email+'\');">'+g_userList[j].email+'</span></div>';
	    				str+='</li>';
	    				choUserList.push(g_userList[j]);
	    			 }
	    		}
				str+='</ul>';
			}
		}
		
		//기타 세팅
		var ectList = [];
		for(var i=0;i<g_userList.length;i++){
			if(getRowObjectWithValue(choUserList, 'userId', g_userList[i].userId) == null) ectList.push(g_userList[i]);
		}
		
		str+='<div class="choArea" id="cho_'+(choGrpArr.length)+'" name="cho_'+(choGrpArr.length)+'">기타</div><ul>';
		
		for(var i=0;i<ectList.length;i++){
			
			str+='<li class="nameArea"><a href="javascript:;">'+ectList[j].usrNm+'<span class="nameSub">('+ectList[j].deptNm+' | '+ectList[j].position+')</span></a>';
			str+='<div>';
			
			if(ectList[j].phone != '') str +='<span class="nameTel" onclick="callPhone(\''+ectList[j].phone+'\');">'+ectList[j].phone+'</span>';
				
			if(ectList[j].comPhone != ''){
				str+='<span class="comTel" onclick="callPhone(\''+ectList[j].comPhone+'\');">'+ectList[j].comPhone+'</span>';
			}
			str +='</div>';
			
			if(ectList[j].email != '') str+='<div><span class="perEmail" onclick="sendEmail(\''+ectList[j].email+'\');">'+ectList[j].email+'</span></div>';
			str+='</li>';
		}
		str+='</ul>';
		
		
		$("#userListArea").html(str);
    },
	
    //이름 찾기
    searchName : function(value){
		
    	if(value == 'undefined') value = $("#nameSearch").val();
    	
		if(value=='') fnObj.userListSet();
		else{
			
			
			var korResult = runSearch(g_userList,value);	//바꾸지 않은 고유 값 대입
			
			
			var encValue = engTypeToKor(value.toLowerCase());				//입력된 건 영문 을 한글로 바꿈
			var encResult = (value != encValue ? runSearch(g_userList,encValue) : '');	//바꾼 값 대입
			
			var result = (encResult !='' ? encResult+',' : '') + korResult;
			var str='';
			
			if(encResult == '' && korResult == '' ) str+='<ul><li class="nameArea">검색결과없음</li></ul>';
			else{
				
				var nameArr = result.split(',');
				
				str+='<ul>';
				for(var i=0;i<nameArr.length;i++){
					var obj = getRowObjectWithValue(g_userList, 'usrNm', nameArr[i])
	    			if(obj != null){
	    				str+='<li class="nameArea"><a href="javascript:;">'+obj.usrNm+'<span class="nameSub">('+obj.deptNm+' | '+obj.position+')</span></a>';
	    				str+='<div>';
	    				
	    				if(obj.phone != '') str+='<span class="nameTel" onclick="callPhone(\''+obj.phone+'\');">'+obj.phone+'</span>';
	    				
	    				if(obj.comPhone != ''){
	    					str+='<span class="comTel" onclick="callPhone(\''+obj.comPhone+'\');">'+obj.comPhone+'</span>';
	    				}
	    				
	    				str += '</div>';
	    				
	    				if(obj.email != '') str+='<div><span class="perEmail" onclick="sendEmail(\''+obj.email+'\');">'+obj.email+'</span></div>';
	    				str+='</li>';
	    			
	    			}
	    		}
				str+='</ul>';
				
				
			}
			
			$("#userListArea").html(str);
		}
	},
	
	//이동 
	moveCho : function(value){
		
		$("#cho_"+value).get(0).scrollIntoView(true);
		
	}
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();
	fnObj.doSearch();
	
});


</script>