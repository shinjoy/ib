<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>


var commonPopAllObj = {
		
		//업무일지 등록
		workProcPop : function(sNb){
					
			var url= "/m/schedule/workProcPop_openLayer.do";
			
	  		var params ={	
	  				
	  				sNb  : sNb,
	  			
	  		};
	  	
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			//g_tabType ='WorkDiary';
	  			
	  			$('#workProcArea').html(result);
	  			commonPopAllObj.bottomSlideView('workProc',url);
	  			
	  			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
	  		
	  		
	  		commonPopAllObj.iosBackDefault();	 //  ios  메뉴호출후  백하면  default
			
		},
		
		//업무일지(보기)
		workViewPop : function(sNb){	//snb 
	
		    
			var url= "/m/schedule/workViewPop_openLayer.do";
			
	  		var params ={	
	  				
	  				sNb 	 : sNb
	  			
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			$('#workViewArea').html(result);
				
	  			commonPopAllObj.bottomSlideView('workView',url);
	  		
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback);
	   	
			
		},
		
		//메모 보기 & 등록
		memoViewPop : function(memoMainSnb,memoSnb){	//snb or mainSnb , 고유 snb
	
				
			var url= "/m/schedule/memoViewPop_openLayer.do";
			
	  		var params ={	
	  				
	  				 memoId 	 : memoMainSnb,
	  				 memoSnb	 : memoSnb
	  				
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			$('#memoViewArea').html(result);
	  			commonPopAllObj.bottomSlideView('memoView',url);
	  			
	  			$("#scrollChatArea").animate({ scrollTop: $('#scrollChatArea').eq(0).prop("scrollHeight")}, 50);
	  			
	  			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback);
	  		
	  		
	  		commonPopAllObj.iosBackDefault();	 //  ios  메뉴호출후  백하면  default
			
		},
		
		//일정등록팝업
		scheduleProcPop : function(scheSeq,type){
			
			var url= "/m/schedule/scheduleProcPop_openLayer.do";
			
	  		var params ={	
	  				
	  				 ScheSeq 	 	: scheSeq,
	  		
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			$('#scheduleProcArea').html(result);
	  			
	  			commonPopAllObj.bottomSlideView('scheduleProc',url);
	  			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
	  		
	  		commonPopAllObj.iosBackDefault();	 //  ios  메뉴호출후  백하면  default
		},
		
		//일정보기팝업
		scheduleViewPop : function(scheSeq){
			
			var url= "/m/schedule/scheduleViewPop_openLayer.do";
			
	  		var params ={	
	  				
	  				 ScheSeq 	 	: scheSeq,
	  		
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			$('#scheduleViewArea').html(result);
	  			commonPopAllObj.bottomSlideView('scheduleView',url);
	  			
	  			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},
		
		
		
		//직원선택 팝업 
		openUserSelectPop : function(params){
			
			var url = "/m/commonPop/userSelectPop_openLayer.do";
			
			commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#userSelectCommonArea").html(result);			//팝업에 직원세팅
	  		
				window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			nowUrl = url;
	  			
	  			
	  			commonPopAllObj.bottomSlideView('userSelectCommon',url);
	  			
	  			
			}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback);
		},
		
		//메모검색 팝업
		memoSearchView : function(){
			
			startLoadingBar();
			
			var url= "/m/schedule/memoSearchViewPop_openLayer.do";
			
	  		var params ={};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			endLoadingBar();
	  			
	  			$('#memoSearchViewArea').html(result);
	  			commonPopAllObj.bottomSlideView('memoSearchView',url);
	  		
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},
		
		//미완료
		todayNewMemoView: function(){
			
			var url= "/m/schedule/todayNewMemoViewPop_openLayer.do";
			
	  		var params ={};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  			
	  			$('#todayNewMemoViewArea').html(result);
	  			commonPopAllObj.bottomSlideView('todayNewMemoView',url);
	  			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},
		


		// 인물. 회사 팝업
		commonComORCusPop : function(pageNum,nm,flag,divName){ //페이지번호, 숫자, 인물 회사구분, div(searchPerson,searchCompany)
			
			
			var url = '/m/commonPop/companyPop_openLayer.do';
			var modalTitleNm = '회사검색';
			
			
			if(flag == 'iP'){//인물이면
				url = '/m/commonPop/personPop_openLayer.do';
				modalTitleNm = '인물검색';
			}
	
			var params = {f: flag,modalFlag: flag,nm :nm};
			
			commonPopAllObj.pushBeforeUrl();
			
			
			var callback = function(result){
				
				if(flag != 'iPc'){
					
					$('#'+divName+'Area').html(result);
					commonPopAllObj.bottomSlideView(divName,url);
			
				
				}else{	//인물등록안에 회사검색 팝업 
					
					$("#searchPersonArea").hide();
					$("#regPersonArea").hide();
					
					$("#searchCompanyInnerArea").html(result);
					$("#searchCompanyInnerArea").show();
					
				}
				
				
				nowUrl = url;
			
				window.history.pushState({'url' : url}, 'Title', "#"+url);
			}
			
			commonAjaxTohtml( contextRoot+url, params, callback);
		  	
		  	if(flag =='iP') $('#nameSearch').val("");
			
		},


		//등록 팝업
		registPerCom : function(flag,nm,sNb){
				
			var name ;
			var url ;
			var params = {flag: flag,nm:nm};
			var cnt ='';
			
			var modalTitleNm = '회사등록';
			
			if(flag == 'iP'){//인물이면
				
				name =$('#nameSearch').val(); 			//검색창에 입력값
				cnt=$("#personlistCnt").val(); 			//검색한 리스트 갯수
				params.cstNm =$('#nameSearch').val(); 	//이름 세팅
				params.searchCstNm =$('#nameSearch').val();
				
				if(name != '' && cnt != 0){
					
					params.cstNm =$('#nameSearch').val()+cnt; //이름+cnt세팅
					params.searchCstNm =$('#nameSearch').val()+cnt;
				}
				params.sNb =sNb;
				url = '/m/commonPop/regPersonPop_openLayer.do';
				
				modalTitleNm = '인물등록';
				
			}else{
				
				name =$('#nameSearch2').val();
				url = '/m/commonPop/regCompanyPop_openLayer.do';
				params.searchCpnNm =name; ///검색창 입력값
			
			}
			
			commonPopAllObj.pushBeforeUrl();
			
			var callback = function(result){
				
				
				if(flag == 'iP'){//인물이면
					$("#regPersonArea").html(result);
				
					$("#searchPersonArea").hide();
					$("#regPersonArea").show();
				
					
					window.history.pushState({'url' : url}, 'Title', "#"+url);
					nowUrl = url;
					
				}else{
					modal({
			            type: 'customer',
			            title: '회사등록',
			            text: result,
			        });
					
				}
			}
			
			commonAjaxTohtml( contextRoot+url, params, callback);
		},
		
		//알람리스트 메인 
		alarmListMain : function(params){
			
			var url = "/m/commonPop/alarmListMainPop_openLayer.do";
			
			commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#alarmListMainArea").html(result);			
	  		
				window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			nowUrl = url;
	  			
	  			commonPopAllObj.bottomSlideView('alarmListMain',url);
	  		}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback);
		},
		
		//딜 상세 팝업 
		dealDetail : function(dealSnb,commentSnb, openType){
			
			var url = "/m/commonPop/dealViewPop_openLayer.do";
			var params = {
						sNb 		: dealSnb,
						commentSnb  : commentSnb
			};
			
			commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#dealViewArea").html(result);			
	  		
				window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			nowUrl = url;
	  			
	  			commonPopAllObj.bottomSlideView('dealView',url);
	  		}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback);
		},
		
		//딜 등록 팝업
		dealProc : function(sNb){
			
			var url= "/m/deal/dealProcPop_openLayer.do";
			
	  		var params ={	
	  				
	  				sNb  		: sNb,
	  				openType	: ''
	  		};
	  		
	  		commonPopAllObj.pushBeforeUrl();
	  		
	  		var callback = function(result){
	  		
	  			$("#dealProcArea").html(result);			
		  		
				window.history.pushState({'url' : url}, 'Title', "#"+url);
	  			nowUrl = url;
	  			
	  			commonPopAllObj.bottomSlideView('dealProc',url);
			
	      	}
	      	
	  		commonAjaxTohtml( contextRoot+url, params, callback); 
			
		},
		

		//뒤로가기를 위한 전 페이지 정보 담기
		pushBeforeUrl : function(){
			
			if((window.location.href).indexOf('#')){
	  			var nowpo = window.location.href.split('#');
	  			beforeUrl.push(nowpo[1]);
	  		}
	  		
		},
		
		//아래서 위로
		bottomSlideView : function(divCode,url){
		
  			$('#'+divCode+'Pop').removeClass('disPlayNone');
  			$('#'+divCode+'Pop').animate({'bottom':'0'},300);
  			nowUrl = url;
  			
  			window.history.pushState({'url' : url}, 'Title', "#"+url);
		},
		
		//  ios  메뉴호출후  백하면  default
		iosBackDefault : function(){
			
			 //  ios  메뉴호출후  백하면  default
			 if(  $("#maskingLayOut div").hasClass('jfab_overlay') ==  true ){

	    		 $('.jfab_btns_wrapper').css('display','none');
	    		 $('.jfab_main_btn').removeClass('rotate');
	    	
	    		 setTimeout(function() {
	    			 $("#maskingLayOut").empty();
	    	       }, 400);
	    		 
	    	 }   
			 
		}

		
		
		
};



$(function() {

	
});

</script>

<!-- 메모보기팝업 -->
<div class="bottomBox disPlayNone" id="memoViewPop">
	<div class="bottomBox-inner">
       <div id="memoViewArea"></div>
   </div>
</div> 

<!-- 메모상세팝업 -->
<div class="bottomBox disPlayNone" id="memoSearchViewPop">
	<div class="bottomBox-inner">
       <div id="memoSearchViewArea"></div>
   </div>
</div> 

<!-- 오늘신규메모팝업 -->

<div class="bottomBox disPlayNone" id="todayNewMemoViewPop">
	<div class="bottomBox-inner">
       <div id="todayNewMemoViewArea"></div>
   </div>
</div> 

<!-- 업무일지 등록팝업 -->  
<div class="bottomBox disPlayNone" id="workProcPop">
	<div class="bottomBox-inner">
      <div id="workProcArea"></div>
   </div>
</div>

<!-- 업무일지 상세팝업 -->  
<div class="bottomBox disPlayNone" id="workViewPop">
	<div class="bottomBox-inner">
      <div id="workViewArea"></div>
   </div>
</div>

<!-- 일정등록팝업 -->
<div class="bottomBox disPlayNone" id="scheduleProcPop">
	<div class="bottomBox-inner">
      <div id="scheduleProcArea"></div>
   	</div>
</div>

<!-- 일정 상세팝업 -->  
<div class="bottomBox disPlayNone" id="scheduleViewPop">
	<div class="bottomBox-inner">
      <div id="scheduleViewArea"></div>
   </div>
</div>
<!-- //일정 상세팝업// --> 

<!-- 딜 상세 팝업 -->
<div class="bottomBox disPlayNone" id="dealViewPop">
	<div class="bottomBox-inner">
     	<div id="dealViewArea"></div>
    </div>
</div>
<!-- //딜 상세 팝업// -->

<!-- 딜 등록 팝업 -->
<div class="bottomBox disPlayNone" id="dealProcPop">
	<div class="bottomBox-inner">
     	<div id="dealProcArea"></div>
    </div>
</div>
<!-- //딜 상세 팝업// -->

<!-- 알람리스트 팝업 -->
<div class="bottomBox disPlayNone" id="alarmListMainPop">
	<div class="bottomBox-inner">
     	<div id="alarmListMainArea"></div>
    </div>
</div>
<!-- //알람리스트 팝업// -->



<!-- 인물검색 팝업 -->   
<div class="bottomBox disPlayNone" id="searchPersonPop">
	<div class="bottomBox-inner">
      <div id="searchPersonArea"></div>
      <div id="regPersonArea"></div>
      <div id="searchCompanyInnerArea"></div>
   </div>
</div>
<!-- //인물검색 팝업// -->  

<!-- 회사검색 팝업 --> 
<div class="bottomBox disPlayNone" id="searchCompanyPop">
	<div class="bottomBox-inner">
     	<div id="searchCompanyArea"></div>
    </div>
</div>
<!-- //회사검색 팝업// --> 

<!-- 직원선택 팝업 -->
<div class="bottomBox disPlayNone" id="userSelectCommonPop">
	<div class="bottomBox-inner">
     	<div id="userSelectCommonArea"></div>
    </div>
</div>
<!-- //직원선택 팝업// -->






















