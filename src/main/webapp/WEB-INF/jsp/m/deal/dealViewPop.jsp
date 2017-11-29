<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div id="wrap" name="dealDetailDiv">
	<div class="mb_sub_location">
		<c:choose>
			<c:when test="${openType eq 'inner' }">
				<button type="button" id="dealViewPopCanBtn" class="back" onclick="closeRightBox('dealViewInnerPop','dealViewInnerArea');"><em>이전</em></button>	
			</c:when>
			<c:otherwise>
				<button type="button" id="dealViewPopCanBtn" class="back" onclick="closeBottomBox('dealViewPop','dealViewArea','first');"><em>이전</em></button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:;" class="depth01" id="companyNameArea"></a>
	</div> 
	<div class="containerWrap ">
		<section id="dealDetailAll" class="contentsWrap scrollArea dealviewWrap">
			
		  	<div class="d_viewBox">
		  		<!-- 등록자 진행상태 -->
		  		<div class="deal_info">
		  			 <div id="dealTmDtArea" class="date"> </div>
		  			 <div class="fr_block">
		  				  <span id="dealRgNmArea" class="writer"></span><em id="dealCusNmArea"></em>
		  				  <span id="dealProgressArea" class="d_state"></span>
		  			 </div>
		  		</div>	
		  		<!-- //등록자 진행상태// -->		
		  		
		  		<!-- 투자금액 분석자 -->
		  		<div class="deal_info2">
					<div id="dealPriceArea" class="d_rateBox"></div>
					<div id="dealAnalUserArea" class="d_analBox"></div>
		  		</div>
		  		<!-- //투자금액 분석자// -->
		  		<!-- 딜내용 -->
		  		<div class="dealConBox">
		  			<pre id="dealMemoArea" class="detail_text"></pre>
		  			<div id="dealFileArea"></div>
		  			<!-- 딜수정버튼 -->
		  			<div class="dealbtnZone">
						<ul id="btnEditDel" class="btn_b_list btn_count2">
							<li><a href="javascript:dealDetailObj.dealProcInnerPop('${sNb}','inner');" id="dealEditBtn" style="display:none;" class="btn_mobile_gray01">수정</a></li>
							<li><a href="javascript:dealDetailObj.dealDelete('${sNb}');" id="dealDelBtn" style="display:none;" class="btn_mobile_white01">삭제</a></li>
						</ul>
					</div>
					<!--// 딜수정버튼 //-->
		  		</div>

		  	    <div class="d_opiBox authArea">
					<span class="icon_opi">투자의견</span>
					<span class="op_txt dealInvestEditArea" style="display:none;"><input type="text" id="dealInvestMemoInput" class="input_basic_mini" value="" /></span>
					<span class="op_txt" id="dealInvestMemoArea" onclick="dealDetailObj.editDealInvestMode();"></span> 
					<div class="btn_modify_wrap">
						<button type="button" style="display:none;" class="btn_s_withe dealInvestEditArea btn_modify01" onclick="dealDetailObj.doEditDealInvest('EDIT');">수정</button><button type="button" style="display:none;" class="btn_s_withe dealInvestEditArea" onclick="dealDetailObj.doEditDealInvest('DEL');">삭제</button>
					</div>
				</div>
				<!-- //딜내용// -->

				<!-- 코멘트 입력 -->
				<div class="d_opiType authArea">
					<ul class="opiTypeList">
						<li id="dealSearchTab_proposal" class="dealSearchTab"><button type="button" class="btn_type" onclick="dealDetailObj.searchTabType('proposal');"><span>제안</span><em id="proposalCntArea"></em></button></li> 
						<li id="dealSearchTab_anal" class="dealSearchTab"><button type="button" class="btn_type" onclick="dealDetailObj.searchTabType('anal');"><span>분석</span><em id="analCntArea"></em> </button></li>
						<li id="dealSearchTab_irVisit" class="dealSearchTab"><button type="button" class="btn_type" onclick="dealDetailObj.searchTabType('irVisit');"><span>IR/탐방</span><em  id="irVisitCntArea"></em></button></li>
						<li id="dealSearchTab_opinion" class="dealSearchTab"><button type="button" class="btn_type" onclick="dealDetailObj.searchTabType('opinion');"><span>단순</span><em id="opinionCntArea"></em></button></li>
						<li id="dealSearchTab_" class="dealSearchTab on"><a href="javascript:dealDetailObj.searchTabType('');" class="btn_s_withe">전체 </a></li>
					</ul>
				</div> 
		   		<div class="co_regiBox authArea">
					<div class="co_regiType">
						<ul class="regiTypeList">
							<li><label><input type="radio" name="commentType" value="proposal" rel-val="00005" onclick="dealDetailObj.commentTypeChange();"><span>제안서</span></label></li>
							<li><label><input type="radio" name="commentType" value="analysis" rel-val="00004" onclick="dealDetailObj.commentTypeChange();"><span>분석</span></label></li>
							<li><label><input type="radio" name="commentType" value="ir" rel-val="00002" onclick="dealDetailObj.commentTypeChange();"><span>IR</span></label></li>
							<li><label><input type="radio" name="commentType"  value="opinion"  rel-val="00001" onclick="dealDetailObj.commentTypeChange();" checked="checked"><span>단순</span></label></li>
						</ul>
					</div>
					<!-- co_regiinput -->
						<!-- 분석일때(추가) --> 
						<div name="analysisArea" class="analZone" style="display:none;">
							<div class="opinion">
						 		<span class="title">분석의견</span>
						 		<ul class="relationGrade">
									<li><a href="javascript:dealDetailObj.setImportant(1);" name="important" id="important_1"><em>+1</em></a></li>
									<li><a href="javascript:dealDetailObj.setImportant(2);" name="important" id="important_2"><em>+2</em></a></li>
									<li><a href="javascript:dealDetailObj.setImportant(3);" name="important" id="important_3"><em>+3</em></a></li>
									<li><a href="javascript:dealDetailObj.setImportant(4);" name="important" id="important_4"><em>+4</em></a></li>
									<li><a href="javascript:dealDetailObj.setImportant(5);" name="important" id="important_5"><em>+5</em></a></li>
								</ul>
						 	</div> 
						 	<div class="opinion">
							 	<span class="title">분석유효기간</span>
							 	<label><input type="radio" name="expirationDate" value="3">3개월</label>
								<label><input type="radio" name="expirationDate" value="6">6개월</label>
								<label><input type="radio" name="expirationDate" value="9">9개월</label>
								<label><input type="radio" name="expirationDate" value="12">1년 </label>
								<label><input type="radio" name="expirationDate" value="24">2년 </label>
							</div>
							<textarea id="opinionComment" rows="" cols="" class="textarea_deal_pop opinion_area" placeholder="분석의견을 입력하세요"></textarea>
						</div>
						<!--// 분석일때(추가) //-->
						<!-- 코멘트기본입력 -->
						<div class="co_regiinput">
							<textarea id="dealCommentTxt" class="txtArea_b" placeholder="코멘트를 작성해주세요" title="코멘트 작성"></textarea>
							<button type="button" onclick="dealDetailObj.saveComment(0);" class="btn_send">등록</button>
							<!--파일선택-->
							<p class="file_list noSearch">
								<span class="btn_file">
									<span class="icon_fileclip">파일선택</span>
									<span id="fileInputArea">
										<input name="upFile" type="file" multiple onchange="dealDetailObj.newFileUpload('');" class="file_upload" />
									</span>
								</span>
								<span id="uploadFileList" class=""></span>
							</p>
							<!--//파일선택//-->
				   		</div>
				   		<!--// 코멘트기본입력 //-->
			   		<!-- //co_regiinput// -->
			   	</div>
			   	<!-- //코멘트 입력// -->
			   	
				<!-- 딜 정보 상세 -->
			  	<div id="dealCommentBoxArea" class="co_viewList authArea"></div>
				<!-- //딜 정보 상세// -->
				
			</div>
		</section>
	</div> 
</div><!-- Wrap -->


<!-- 딜 등록 팝업 -->
<div class="rightBox disPlayNone"  id="dealProcInnerPop">
	<div class="rightBox-inner">
      <div id="dealProcInnerArea"></div>
  	</div>
</div>
<!-- //딜 등록 팝업// -->




<script type="text/javascript">

var g_dealSnb = '${sNb}';
var g_commentSnb = '${commentSnb}';
var g_cpnId = '';
var g_readAuthYn = '';
var g_cpnNm = '';
var g_cateNm = ''; 
var g_tmDt = '';
var g_analyList = new Array();
var g_idx =0;
var delArray = new Array();		//저장된 파일 지운 리스트
var g_opinionList = new Array();	
var g_dealRgId = '';

var lastT;
var currentX =0;   
var lastX = 0;
var startX =0;
var currentY =0;
var startY  =0;
var gab_Y  =0;

/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var dealDetailObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
	},
	
	//화면세팅
    pageStart: function(){
    	
    },//end pageStart.
   
 	//검색
    doSearch: function(){ 
    	
    	
    	
		var url = contextRoot + "/m/deal/getDealDetail.do";
    	var param = { sNb : g_dealSnb };
    	
    
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var infoObj = obj.resultObject;
    		
    		var dealInfoList = infoObj.list;				//딜 정보
    		var mnaMatchList = infoObj.mnaMatchList;		//mna 매칭 
    		var cdCategoryList = infoObj.cdCategoryList;	//카테고리정보
    		
    		/* sNb, cpnId, cpnNm(회사명), cpnSnb, categoryBusiness(업종), 
    		majorProduct(품목), ceo(대표이사), stockValue(시총), unitPrice(주가), 
    		offerCd, middleOfferCd, memo(내용), investPrice(발행규모), 
    		price(투자규모), cpnType, categoryCd, progressCd, investDt(제안일), 
    		cstNm(중개인), cstId, cstCpnNm(중개인회사), rgNm(등록자), tmDt(등록일), 
    		dueDt, rgDt, realNm, rgId, rgStaffPhn1, dealSms, infoLevel, cpnStts, aCpnId */
    		
    		
    		for(var i=0; i<dealInfoList.length; i++){
    			
    			var dealInfo = dealInfoList[i];
    			
    			g_dealRgId = dealInfo.rgId;
    			
    			//수정버튼 표시여부
    			if(g_dealRgId == '${userLoginInfo.id}') $("#dealEditBtn").show();
    			
    			//마스킹 여부 판단
    			if(
   					(dealInfo.rgId != '${userLoginInfo.id}' &&  (dealInfo.cpnStts == 'A' || dealInfo.cpnStts == 'Q' )
   						&& (dealInfo.categoryCd == '00001' || dealInfo.categoryCd == '00002' || dealInfo.categoryCd == '00003' || dealInfo.categoryCd == '00015')	
   						&& (dealInfo.progressCd == '00001' || dealInfo.progressCd == '00002'))
   					&& g_mezzLYn == 'N'	
    			){
    				g_readAuthYn = 'N';
    				
    			}else g_readAuthYn = 'Y';
    			
    			if(g_readAuthYn != 'Y') $(".authArea").hide();
    		
    			//category nm 
    			var categoryObj = getRowObjectWithValue(cdCategoryList, 'dTailCd', dealInfo.categoryCd);
    			
    			
    			var cateNm = categoryObj.temp;
    			g_cateNm = cateNm;
    			
    			//tab nm
    			var tabNm = '';
    			
    			var isView = true;
    			
    			//메자닌
    			if(categoryObj.dTailCd == '00001' || categoryObj.dTailCd == '00002' || categoryObj.dTailCd == '00003' || categoryObj.dTailCd == '00015'){
    				
    				if(dealInfo.middleOfferCd == '00004' || dealInfo.middleOfferCd == '00005') tabNm = '딜 제안중';
    				else if((dealInfo.cpnStts == 'A' || dealInfo.cpnStts == 'Q' ))  tabNm = '메자닌(상)';
    				else tabNm = '메자닌(비)';
    			
    				
    			}else if(categoryObj.dTailCd == '00004' || categoryObj.dTailCd == '00005' || categoryObj.dTailCd == '00006' || categoryObj.dTailCd == '00007'){
    				
    				tabNm = '블록딜';
    			
    			
    			}else{
    				isView = false;
    				tabNm = cateNm;
    			}
    			
    			//회사명  
    			
    			if (!isView) $("#companyNameArea").html(g_readAuthYn == 'Y' ? '<span class="com_ellipsis">'+dealInfo.cpnNm+'</span><span class="deal_type">'+tabNm +'</span>': '***');
    			else  $("#companyNameArea").html(g_readAuthYn == 'Y' ? '<span class="com_ellipsis">'+dealInfo.cpnNm+'</span><span class="d_state_com">'+cateNm+'</span><span class="deal_type">'+tabNm +'</span>': '***');
    			
    			//if(dealInfo.cpnNm.length > 14) $('.mb_sub_location .depth01').css('font-size', '0.8rem');
    			
    			g_cpnId = dealInfo.cpnId;
    			g_cpnNm = dealInfo.cpnNm;
    			g_tmDt  = (dealInfo.tmDt).substring(0,10);
    		
	    		//dealDetailBoxArea
	    		
	    		$("#dealTmDtArea").html(g_tmDt.replace(/-/gi,'.'));			//날짜
	    		$("#dealRgNmArea").html(dealInfo.rgNm);						//등록자
	    		
	    	
			
				//-----------------중개인
				if(dealInfo.cstNm != null){
					$("#dealCusNmArea").html( g_readAuthYn == 'Y' ?   '</em><span class="mediation">'+dealInfo.cstNm+' <span class="mediCom">'+dealInfo.cstCpnNm+'</span></span><em>': '***' );
					
				}
				
				//-----------------진행상태
				
				var statusObj;
				
				//mna
				if(dealInfo.categoryCd == '00008'){
					
					statusObj = getRowObjectWithValue(g_mnaStatusCodeList, 'code', dealInfo.progressCd);
					
				}else{
					statusObj = getRowObjectWithValue(g_statusCodeList, 'code', dealInfo.progressCd);
				}
				
				//상태값
				$("#dealProgressArea").html(( g_readAuthYn == 'Y' ? statusObj.cdNm : '***' ));
				
				$("#dealProgressArea").addClass((dealInfo.categoryCd == '00008' ? 'dealMNAStatus_' : 'dealStatus_')+dealInfo.progressCd);
				
				var str = '<strong>규모</strong><em>(</em><span class="ntxt divline">발행</span><span class="ntxt">투자</span><em>)</em>';
				
				var displayClass ="";
    			
    			if(dealInfo.price =='' && dealInfo.investPrice =='' ) displayClass='style="display:none;"';
				
    			//발행금액
    			str += '<span class="ntxt2 divline" '+displayClass+'>'
    			str += (g_readAuthYn == 'Y' ? (dealInfo.price == '' ? '-' : dealInfo.price) : '***') +  '</span>';
				//투자금액
				str += '<span class="ntxt3" '+displayClass+'>'
				str += (g_readAuthYn == 'Y' ? (dealInfo.investPrice == '' ? '-' : dealInfo.investPrice) : '***') + '</span>';
				
				
				
				
				$("#dealPriceArea").html(str);
				
				str = '';
				if(mnaMatchList.length >0){
					str ='<div>매칭회사 : ' + mnaMatchList[0].cpnNm + '('+mnaMatchList[0].usrNm+') ' + (mnaMatchList[0].comment == null ? '' : '-'+mnaMatchList[0].comment )+'</div>';
				}
				$("#dealMemoArea").html(( g_readAuthYn == 'Y' ? str+' '+ dealInfo.memo : '***' ));
				
				
				//파일 세팅
				var str = '';
				
				if(dealInfo.realNm != '' && dealInfo.realNm != null){
					
					if(g_readAuthYn == 'Y' ){
						
						var fileList = (dealInfo.realNm).split(',');
						str +='<ul class="file_list">';
						for(var k=0; k<fileList.length; k++){
		    				var fileInfoList = fileList[k].split('^');
		    				str +='<li onclick="dealDetailObj.fileDownForNm(\''+fileInfoList[2]+'\',\''+fileInfoList[1]+'\');">'+fileInfoList[1]+'</li>';
		    			}
					}else str +='<li>*********</li>';
					
					str +='</ul>';
					
					$("#dealFileArea").html(str);
				}
				
				//투자의견
				
				if(dealInfo.investOpinion != '' && dealInfo.investOpinion != null) $("#dealInvestMemoArea").html(dealInfo.investOpinion);
				else{
					 $("#dealInvestMemoArea").html('투자의견을입력하세요.');
				}
				$("#dealInvestMemoInput").val(dealInfo.investOpinion);
				
				
			}
    		
    		endLoadingBar();
    	};
    	
    	var beforeFn = function(){
    		startLoadingBar();
    	}
   
    	commonAjax("POST", url, param, callback, false,beforeFn);
    	
    },
    
    //탭타입 선택
	 searchTabType : function(tabType){
		
		 $(".dealSearchTab").removeClass('on');
		 $("#dealSearchTab_"+tabType).addClass('on');
		 
		
		 if(tabType != ''){
			 $('article[ref-val="comment"]').hide();
			 $("."+tabType+"ListArea").show();
			
		 }else $('article[ref-val="comment"]').show(); 
		
		
	 },
    
  	//검색
    searchComment: function(){ 
    	
    
		var url = contextRoot + "/m/deal/getDealComment.do";
    	var param = { 
    			sNb 	: g_dealSnb,
    			cpnId	: g_cpnId,
    			tmDt	: g_tmDt
    					
    	};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var infoObj = obj.resultObject;
    		
    		var opinionList = infoObj.opinionList;			//투자(분석)의견 -단순의견
    		
    		g_opinionList = opinionList ;
    		
    		var proposalList = infoObj.proposalList;		//제안서
    		
    		var analysisList = infoObj.analysisList;		//분석
    		var irList = infoObj.irList;					//ir 
    		var visitList = infoObj.visitList;				//탐방 
    		
    		if( g_dealRgId == '${userLoginInfo.id}' &&  opinionList.length == 0){
    			$("#dealDelBtn").show();
    			$("#btnEditDel").addClass('btn_count2');
    			$("#btnEditDel").removeClass('btn_count1');
    		}
    		else{
    			$("#dealDelBtn").hide();
    			$("#btnEditDel").removeClass('btn_count2');
    			$("#btnEditDel").addClass('btn_count1');
    		}
    		
    		var str = '';
    		
    		//---------------------제안서 : S
    		if(proposalList.length >0){
    			str +='<article ref-val="comment" class="proposalListArea">';
    			str +='<h4 class="comment_type">제안서</h4>';
    			
	    		for(var i=0; i<proposalList.length; i++){
	    			str +='<dl class="comment_box">';
	    			var proposalInfo = proposalList[i];
	    			str +='<dt class="com_info"><span class="writer">'+proposalInfo.rgNm+'</span> <span class="date">'+(proposalInfo.tmDt).replace(/-/gi,'/')+'</span></dt>';
	    			
	    			//파일세팅
	    			if(proposalInfo.realNm != '' && proposalInfo.realNm != null){
		    			
	    				var fileList = (proposalInfo.realNm).split('^^^');					//realNm
		    			var fileMakeList = (proposalInfo.makeNm).split('^^^');				//makeNm
		    			str +='<dd class="com_con"><ul class="file_list">';
		    			for(var k=0; k<fileList.length; k++){
		    				
		    				str +='<li onclick="dealDetailObj.fileDownForNm(\''+fileMakeList[k]+'\',\''+fileList[k]+'\');">'+fileList[k]+'</li>';
		    			}
		    			str +='</ul></dd>';
	    			}
	    			
	    			
	    			str +='<dd class="com_con"><pre class="pre_text">';
	    			str += proposalInfo.memo;
			
					str +='</pre></dd></dl>';
				
	    		
	    		}
	    		str +='</article>';
	    		
	    		$("#proposalCntArea").html('('+proposalList.length+')');	//제안서 갯수
    		}
    		//---------------------제안서 : E
    		
    		
    		//분석 
    		str +=dealDetailObj.setOfferInfo(analysisList);
    					
    		if(analysisList.length !=0) $("#analCntArea").html('('+analysisList.length+')');	//분석 갯수
    		
    		//IR 
    		str +=dealDetailObj.setOfferInfo(irList);
    		
    		//탐방
    		str +=dealDetailObj.setOfferInfo(visitList);
    		
    		var sum = (irList.length + visitList.length)*1;
    		if(sum != 0) $("#irVisitCntArea").html('('+sum+')');	//ir + 탐방 갯수
    		
    		
    		//---------------------단순의견 : S
    		
    	 	if(opinionList.length >0){
    	 		str +='<article ref-val="comment" class="opinionListArea">';
    			str +='<h4 class="comment_type">단순의견</h4>';
    		
	    		for(var i=0; i<opinionList.length; i++){
	    			
	    			var opinionInfo = opinionList[i];
	    			
	    			
	    			str +='<dl class="comment_box" id="commentSnb_'+opinionInfo.sNb+'">';
	    			str +='<dt class="com_info"><span class="writer">'+opinionInfo.cstNm+'</span> <span class="date">'+((opinionInfo.rgDt).substring(0,10)).replace(/-/gi,'/')+'</span>';
	    			
					if(opinionInfo.rgId == '${userLoginInfo.id}'){ // || '${userLoginInfo.permission}' > '00019'
	    				str +='<span class="opinionOne_'+opinionInfo.sNb+' allViewArea btn_modify_wrap01">'
	    				str +='<button type="button" class="btn_s_withe modify01" onclick="dealDetailObj.opinionEditMode('+opinionInfo.sNb+');">수정</button>';
	    				str +='<button type="button" class="btn_s_withe" onclick="dealDetailObj.opinionDelete('+opinionInfo.sNb+');">삭제</button>';
	    				str +='</span>';
	    				
	    				str +='<span class="btn_modify_wrap01 showbtn">';
	    				str +='<button type="button" onclick="dealDetailObj.opinionViewMode('+opinionInfo.sNb+');" class="btn_s_withe">수정취소</button>';
	    				str +='</span>';
	    			}
	    			
					str +='</dt>';
					str +='<dd class="com_con opinionOne_'+opinionInfo.sNb+' allViewArea">';
					str +='<pre class="pre_text allViewArea">'+opinionInfo.comment+'</pre>';
	    			
	    			
	    			//파일세팅
	    			if(opinionInfo.realNm != '' && opinionInfo.realNm != null){
		    		 	var fileList = (opinionInfo.realNm).split(',');
		    		 	str +='<ul class="file_list">';
		    			for(var k=0; k<fileList.length; k++){
		    				var fileObjList = fileList[k].split('^');
		    				str +='<li onclick="dealDetailObj.fileDownForNm(\''+fileObjList[2]+'\',\''+fileObjList[1]+'\');">'+fileObjList[1]+'</li>';
		    			} 
		    			str +='</ul>';
	    			}
	    			
	    			str +='</dd></dl>';
	    			
					if(opinionInfo.rgId == '${userLoginInfo.id}' ){ // || '${userLoginInfo.permission}' > '00019'
	    				
	    				str +='<div id="opinionEditArea_'+opinionInfo.sNb+'" class="co_regiinput allEditArea" style="display:none;"></div>';
	    			}
	    			
	    		}
	    		
	    		str +='</article>';
	    		
	    		$("#opinionCntArea").html('('+opinionList.length+')');	//단순의견 갯수
    	 	}
    		//---------------------단순의견 : E
    		
    		
    		
    		$("#dealCommentBoxArea").html(str);
    	
    		//$("#commentSnb_"+g_commentSnb)[0].scrollIntoView(true);
    	};
   
    	commonAjax("POST", url, param, callback, false);
    	
    },//end searchComment
   
    //IR, 탐방, 분석 세팅 
    setOfferInfo : function(list){
    	
    	var str ='';
    			
    	if(list.length >0){
    	    //if (list[0].offerNm =='탐방') str +='<article ref-val="comment" id="tomVisitListArea"><h4 class="comment_type">'+list[0].offerNm+'</h4>'
    	    //else str +='<article ref-val="comment" id="'+(list[0].offerCd == '00004' ? 'analListArea' : 'irVisitListArea')+'"><h4 class="comment_type">'+list[0].offerNm+'</h4>';
		
    	    str +='<article ref-val="comment" class="'+(list[0].offerCd == '00004' ? 'analListArea' : 'irVisitListArea')+'"><h4 class="comment_type">'+list[0].offerNm+'</h4>';
    	    
			for(var i=0; i<list.length; i++){
				
				str +='<dl class="comment_box">';
				var info = list[i];
				str +='<dt class="com_info">';
				
				str += '<span class="writer">'+info.rgNm+'</span>';
				str += '<span class="date">'+info.tmDt.replace(/-/gi,'/')+'</span>';
				
				if (info.offerCd =='00004'){
					
					str += '<div class="opinion_view">';
					str += '<h5 class="title">분석의견</h5>';
					
				}
				
				
				if(info.star != null){ 
					
					var  starlength =parseInt(info.star);
						str += '<div class="opinion_star">';
						str += '<ul class="small_relationGrade">';
						for( var k=0 ; k < starlength ; k++){
							
							str +='<li><a href="javascript:;" class="on"><em>+1</em></a></li>';
						}
						
						for( var k=0 ; k < 5-starlength ; k++){
							
							str +='<li><a href="javascript:;"><em>+1</em></a></li>';
						}
						str += '</ul>';
						
				}
				
				if(info.expirationDt != null){ 
					 
					 if (parseInt(info.expirationDt) >= 12) str +='<span>('+ parseInt(info.expirationDt)/12+'년)</span> ';
					 else str +='<span>('+info.expirationDt+')개월</span> ';
				} 
				str += '</div>';
				//str += '<span class="writer">'+info.rgNm+'</span><span class="date"> '+(info.tmDt).replace(/-/gi,'/')+' </span></dt>';
				if(info.comment != null) str += '<pre class="pre_text">'+info.comment+'</pre>';
				
				if (info.offerCd =='00004') str += '</div>';
				
				str +='<dd class="com_con">';
				
				str += '<pre class="pre_text">'+info.memo+'</pre>';
				
				//파일세팅
				if(info.realNm != '' && info.realNm != null){
					
					str +='<ul class="file_list">';
					var fileList = (info.realNm).split('^^^');
					var fileMakeList = (info.makeNm).split('^^^');
					for(var k=0; k<fileList.length; k++){
						str +='<li onclick="dealDetailObj.fileDownForNm(\''+fileMakeList[k]+'\',\''+fileList[k]+'\');">'+fileList[k]+'</li>';
					}
					
					str += '</ul>';
				}
			
				str += '</dd></dl>';
				
			}
			str +='</article>';
    	}
    	
    	return str;
    	
    },
    
    //파일 다운로드
    fileDownForNm : function(makeNm,filename){
    	
		var url = contextRoot + "/file/downFile.do?makeName="+makeNm;
    	
    	if(mobileOsCheck() == "IOS"){
    		
    		location.href="app://"+filename+"/schema/"+url;   //   send ios native 
    	
    	}else{
    		location.href=url;
    	}
    },
    
    //코멘트 종류 라디오 클릭 
    commentTypeChange : function(){
    	var commentType = $("input[type=radio][name=commentType]:checked").val();

    	//분석일때
		if(commentType == 'analysis'){
			
			$("div[name=analysisArea]").show();
		}else{
			
			$("div[name=analysisArea]").hide();
		}
    },
    
    //분석의견 중요도
    setImportant : function(val){
		
    	var starList = $("a[name=important][class=on]").length;
    	
     	$("a[name=important]").removeClass("on");

     	 for(var i=1; i<=val; i++){
     		 $("#important_"+i).addClass("on");
     	 }
     
     	 if(val == 1 && starList == 1){
 			 $("#important_1").removeClass("on");
 		 } 
    	
    },
    
    //-----------------------분석자 지정 
    
  	//분석자 지정된 직원 리스트 
    getAnalyList : function(){
    	
    	
    	var url = contextRoot + "/recommend/getAnalyUserList.do";
    	var param = {
    				offerId 	: g_dealSnb,
    				cpnId 		: g_cpnId,
    				tmDt 		: g_tmDt
    	
    		};
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    		
    		g_analyList = list;
    		
    		var str = '<div class="d_analBox">';
    		    str += '<span class="icon">분석</span>';
    		    str += '<span class="p_name">';
    		
    		for(var i=0; i<list.length; i++){
    			
    			str += '<em>'+list[i].userNm+'</em>';	
    			if(i<list.length-1) str +=', ';
    		}
    		str +='</span>';
    		str +='<button  type="button" class="btn_s_withe" onclick="dealDetailObj.openDealAnalPop();">';
    		
    		if(list.length == 0) str +='지정 ';
    		else str +='수정';
    		
    		str +='</button></div>';
    		
    		$("#dealAnalUserArea").html(str);
    		
    		
    		
    	};
    	
    	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
    },
    
    //딜 분석자 지정 팝업
    openDealAnalPop : function(){
    	
		var url=contextRoot+"/m/deal/openDealAnalPop.do";
     	
     	var callback = function(result){
      		modal({
                type: 'customer',
                title: '분석자지정',
                text: result,
            });
      	}
      	
      	$.ajax({
    		type	: "POST",        			//"POST" "GET"
    		url		: url,    					//PAGEURL
    		data	: {},					//parameter object
    		dataType: "html",
    		timeout : 100000,       			//제한시간 지정(millisecond)
    		cache 	: false,        			//true, false
    		success	: callback,					//SUCCESS FUNCTION
    		async	: false,
    		error	: function whenError(x,e){	//ERROR FUNCTION			
    			swal("서버오류!!");			
    		}
     	});
    },
    
    //------------------의견 달기
  	//신규 파일 등록시
  	newFileUpload : function(sNb){

  		
  		var url = contextRoot+"/file/uploadFiles.do"
  		
  		
		var callback = function(result){

   			var list = result.resultList;
   			var str='';
   			for(var i=0;i<list.length;i++){
   				
   				var fileObj = list[i];
    			str +='<span class="file_name" id="li_'+g_idx+'">' + fileObj.realName ;
    			str +='<input type="hidden" name="offerSnb'+sNb+'" value="0">' ;
    			str +='<input type="hidden" name="realName'+sNb+'" value="'+fileObj.realName+'">' ;
    			str +='<input type="hidden" name="makeName'+sNb+'" value="'+fileObj.makeName+'">' ;
    			str +='<input type="hidden" name="path'+sNb+'" value="'+fileObj.path+'">' ;
    			
   				str +='<a href="javascript:dealDetailObj.newFileDelete(\''+fileObj.makeName+'\',\''+fileObj.path+'\','+g_idx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
   				g_idx++;


   			}

   			//파일 태그 재 생성.
   			$('#fileInputArea'+sNb).append('<input name="upFile'+sNb+'" type="file" multiple class="file_upload"  onchange="dealDetailObj.newFileUpload(\''+sNb+'\');"/>');


   			$('#uploadFileList'+sNb).append(str);
   		 	
   		}
  		
   		commonAjaxForFileCreateForm(url,"","upFile"+sNb,"","fileSize", callback , "",'','');

  	},
  	

    //파일 바로 삭제
    newFileDelete : function(makeName,path,idx){
    	
    	var url = contextRoot + "/file/deleteFile.do";
    	var param = { makeName : makeName , path : path};
    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;
    		if(cnt>0){
    			$("#li_"+idx).remove();
    		}
    		
    	
    	};
    	commonAjax("POST", url, param, callback, false);
    },
    
  	//수정시 db 에 이미 저장된 파일삭제 할땐. 바로삭제하지않고 리스트를 만든다.
    setDelFile: function(fileSeq,idx){

    	delArray.push(fileSeq);
    	$("#li_"+idx).remove();
    	
    },//end setDelFile
    
  	//첨부파일 리스트
    getFileList : function(sNb, cate){
    	
    	var url = contextRoot + "/file/getFileList.do";
    	var param = {
    					offerSnb 		: sNb,
    					fileCategory    : cate
    				}

    	var callback = function(result){
    		var obj = JSON.parse(result);
    		var list = obj.resultList;
    		var str = '';
    		
    		saveFileList = list;
    		
    	 	if(list.length>0){
	    		for(var i=0;i<list.length;i++){

	    			var fileObj = list[i];
	    			str +='<span class="file_name" id="li_'+g_idx+'">' + fileObj.realName ;
	    			str +='<input type="hidden" name="offerSnb'+sNb+'" value="'+fileObj.offerSnb+'">' ;
	    			str +='<input type="hidden" name="realName'+sNb+'" value="'+fileObj.realName+'">' ;
	    			str +='<input type="hidden" name="makeName'+sNb+'" value="'+fileObj.makeName+'">' ;
	    			str +='<input type="hidden" name="path'+sNb+'" value="'+fileObj.path+'">' ;
	    			str +='<a href="javascript:dealDetailObj.setDelFile('+fileObj.sNb+','+g_idx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
	    			g_idx++;
				}
	    		$('#uploadFileList'+sNb).html(str);
    		} 
    	
    	}
    	commonAjax("POST", url, param, callback, false);
    },
    
    //의견달기
    saveComment : function(sNb){
    	
    	if(sNb == 0) sNb ='';
    	
    	var param ={};
    	var url = "";
    	var commentType = $("input[type=radio][name=commentType]:checked").val();
    	
    	var fileList ='';
    	var delFileList='';
    	
    	//-- validation 
    	
    	if($("input[type=radio][name=commentType]:checked").length == 0 && sNb == ''){
    		swal("코멘트 종류를 선택해주세요.");
    		return false;
    	}
    	
    	if($("#dealCommentTxt"+sNb).val() == ""){
    		swal("의견을 입력하세요.");
    		return false;
    	}
    	
    	
    	/*=========== 첨부파일 : S =========== */
    	
     	var offerSnbList 	= $('input[name=offerSnb'+sNb+']');			//시퀀스 리스트
     	var realNameList 	= $('input[name=realName'+sNb+']');			//파일명 리스트
     	var makeNameList 	= $('input[name=makeName'+sNb+']');			//새로운 저장 파일명 리스트
     	var pathList 		= $('input[name=path'+sNb+']');				//경로 리스트
     
     	var jArray = new Array();

     	for(var i=0;i<offerSnbList.length;i++){

     		var offerSnb	 = offerSnbList[i].value;
     		var realName 	 = realNameList[i].value;
     		var makeName  	 = makeNameList[i].value;
     		var path 	 	 = pathList[i].value;
     		
     		if(offerSnb == 0){								//신규 등록건만 추가
 	    		var jobj = new Object();
 				jobj.offerSnb=offerSnb;
 				jobj.realName=realName;
 				jobj.makeName=makeName;
 				jobj.path=path;
 				
 				if(commentType != 'opinion' && sNb == '') jobj.fileCategory= '00000';	//단순 의견이 아닐때(분석,제안서,IR)
 				else jobj.fileCategory= '00002';										//단순 의견일때
 				
 				jobj.subCd='0';
 				jArray.push(jobj);
     		}
     	}

     	var totalObj = new Object();
 		totalObj.items=jArray;											//items 란 키값으로 totalObj에 jobj를 담은 jArray를 세팅
 		
 		fileList = JSON.stringify(totalObj);							//totalObj 를 string 변환

 		if(jArray.length ==0) fileList = '';							//파일이 없을때는 빈값

 		if(delArray.length !=0) delFileList = delArray.join(",");		//수정시 삭제한 파일들의 리스트
    	
    	
    	var commentVal = $("input[type=radio][name=commentType]:checked").attr('rel-val');
    	
    	
 		if(commentType == 'opinion' || sNb != ''){
 			
 			url = contextRoot + "/m/deal/saveDealComment.do";
 			
 			param = {
 					sNb	 		: sNb,
 		    		offerSnb 	: g_dealSnb,
 		    		comment		: $("#dealCommentTxt"+sNb).val(),
 		    		categoryCd	: (sNb != '' ?  '00001' : commentVal),
 		    		cpnNm		: g_cpnNm,
 		    		userId		: g_dealRgId,				//딜 작성한 사람
 		    		
 		    		fileList 	: fileList,
 					delFileList	: delFileList				//수정시 삭제한 파일들의 시퀀스 리스트
 		    };
 			
 			
 		}else{
 			
 			url = contextRoot + "/m/deal/saveIrAnalpro.do";
			param = {
					sNb	 		: '',
					cpnId		: g_cpnId,
 		    		offerCd 	: commentVal,
 		    		memo		: $("#dealCommentTxt"+sNb).val(),
 		    		fileList 	: fileList,
 					delFileList	: delFileList				//수정시 삭제한 파일들의 시퀀스 리스트
 		    };
			
			if(commentType == 'analysis'){
				
				var important =0;
		    	var starList = $("a[name=important]");
					
		    	for(var i=0;i<starList.length;i++){
		    		if($(starList[i]).hasClass("on")){
		    			important++;
		    		}
		    	}
		    	
		    	if(important == 0){
		    		swal("분석의견 별을 선택해주세요.");
		    		return false;
		    	}
		    	if($("#opinionComment").val() == ""){
		    		swal("분석의견을 적어주세요.");
		    		return false;
		    	}
		    	if($("input[type=radio][name=expirationDate]:checked").length == 0){
		    		swal("분석의견 유효기간을 선택해주세요");
		    		return false;
		    	}
		    	
		    	param.star = important;
		    	param.comment = $("#opinionComment").val();
		    	param.expirationDt = $("input[type=radio][name=expirationDate]:checked").val();
		    	 
			}
			
 		}
 		
 		var callback = function(result){
 			
 			var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수
    		
			if(cnt == -8){
    			
    			alert("로그인 후 이용해주세요.");
				location.href = "${pageContext.request.contextPath}/m/login.do";
				
    		}else if(cnt > 0){
    			
    			swal("완료되었습니다.");
     			dealDetailObj.initCommentArea();
     			dealDetailObj.doSearch();
     			dealDetailObj.searchComment();
    		}
 			
 		};
    	
 		commonAjax("POST", url, param, callback, false);
    },
    
    //삭제
    opinionDelete :function(sNb){
    	
    	swal({
			  title: "",
			  text: "삭제하시겠습니까?",
			  
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  
			  cancelButtonText: '취소',
			  confirmButtonText: '확인'
			  
		  },
		  function(isConfirm){
			  
			  if(isConfirm){
				  	
				  	url = contextRoot + "/m/deal/deleteDealComment.do";
					
					param = {
							sNb	 		: sNb,
				    		
				    };
					
					var callback = function(result){
			 			
						var obj = JSON.parse(result);
			    		var cnt = obj.resultVal;		//결과수

						if(cnt == -8){
			    			
			    			alert("로그인 후 이용해주세요.");
							location.href = "${pageContext.request.contextPath}/m/login.do";
			    		}else if(cnt > 0){
			    			
			    			swal("완료되었습니다.");
			     			dealDetailObj.initCommentArea();
			     			dealDetailObj.doSearch();
			     			dealDetailObj.searchComment();
			    		}
			 			
			 		};
			    	
			 		commonAjax("POST", url, param, callback, false);
				  
			  }
		  });
    	
    	
    },
    
    //초기화
    initCommentArea : function(){
    	
    	$("input[type=radio][name=commentType]").prop("checked",false);
    	$("input[type=radio][name=expirationDate]").prop("checked",false);
    	
    	$("a[name=important]").removeClass('on');
    	
    	$("#dealCommentTxt").val('');
    	$("#opinionComment").val('');
    	
    	$("#uploadFileList").empty();
    	
    	$("div[name=analysisArea]").hide();
    	
    	delArray = new Array();
    	
    },
    
  	//단순의견 수정 화면 초기화
    initEditCommentArea : function(){
    	
    	$(".allEditArea").empty();
    	$(".allEditArea").hide();
    	$(".allViewArea").show();
    	$(".comment_box").removeClass('bgadd');
    	
    	delArray = new Array();
    },
    
    //------ 투자의견
    
  	//투자의견 수정모드
    editDealInvestMode : function(){
    	var permission = '${userLoginInfo.permission}';
    	
    	if(permission > '00019' || permission == '00014'){
    		
    		$(".dealInvestEditArea").show();
        	$("#dealInvestMemoArea").hide();
        	$("#dealInvestMemoInput").focus();
    		
    	}
    	
    },
    
    //투자의견 수정이나 삭제
    doEditDealInvest : function(type){
    	
    	swal({
			  title: "",
			  text: "변경 하시겠습니까 ?",
			  
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  
			  cancelButtonText: '취소',
			  confirmButtonText: '확인'
		  },
		  function(isConfirm){
			  if(isConfirm) {
				  
				  	var investOpinion = (type == 'DEL' ? '' : $("#dealInvestMemoInput").val());
			    	
			    	var url = contextRoot + "/m/deal/doEditDealInvest.do";
			    	var param = {
			    			opinion	 		: investOpinion,
			    			sNb				: g_dealSnb,
			    			tmpNum1			: 'op',
			    			cpnNm			: g_cpnNm,
		 		    		userId			: g_dealRgId,				//딜 작성한 사람
			    			
			    	};
			    	
					var callback = function(result){
			 			
						var obj = JSON.parse(result);
			    		var cnt = obj.resultVal;		//결과수

						if(cnt == -8){
							
							alert("로그인 후 이용해주세요.");
							location.href = "${pageContext.request.contextPath}/m/login.do";
							
			    		}else if(cnt > 0){
			    			
			    			swal("완료되었습니다.");
				 			
				 			$(".dealInvestEditArea").hide();
				 	    	$("#dealInvestMemoArea").show();
				 	    	
				 	    	dealDetailObj.doSearch();
			    		}
						
			 		};
			    	
			 		commonAjax("POST", url, param, callback, false);
			  }
		});
    },
    
    //-- 단순의견
    
    //단순의견 수정모드 
    opinionEditMode : function(sNb){
    	
    	dealDetailObj.initEditCommentArea();		//전체 수정 화면 초기화
    	
    	var opinionInfo = getRowObjectWithValue(g_opinionList, 'sNb', sNb);
    	
    	var str ='';
    	
    	
		str +='<textarea id="dealCommentTxt'+opinionInfo.sNb+'" class="txtArea_b" title="코멘트 작성">'+opinionInfo.comment+'</textarea>';
		str +='<button type="button" onclick="dealDetailObj.saveComment('+sNb+');" class="btn_send">등록</button>';
		
		str +='<p class="file_list noSearch">';
		str +='<span class="btn_file">';
		str +='<span class="icon_fileclip">파일선택</span>';
		str +='<span id="fileInputArea'+opinionInfo.sNb+'">';
		str +='<input name="upFile'+opinionInfo.sNb+'" type="file" multiple onchange="dealDetailObj.newFileUpload('+opinionInfo.sNb+');" class="file_upload" />';
		str +='</span>';
		str +='</span>';
		str +='<span id="uploadFileList'+opinionInfo.sNb+'">';
		str +='</span>';
		str +='</p>';
		
		/* str +='<div>';
		//str +='<button type="button" onclick="dealDetailObj.saveComment('+sNb+');" class="btn_s_withe">등록</button>';
		str +='<button type="button" onclick="dealDetailObj.opinionViewMode('+sNb+');" class="btn_s_withe">취소</button>';
		str +='</div>'; */
		
		$('#opinionEditArea_'+opinionInfo.sNb).html(str);
		$('#opinionEditArea_'+opinionInfo.sNb).show();
		$('.opinionOne_'+opinionInfo.sNb).hide();
		
		if(opinionInfo.realNm != '' && opinionInfo.realNm != null) dealDetailObj.getFileList(sNb,'00002');
		
		if(sNb!=null && sNb!='') $("#commentSnb_"+sNb).addClass('bgadd'); 
		
		
    },
    
    //단순의견 보기모드
    opinionViewMode : function(sNb){
    	if(sNb!=null && sNb!='') $("#commentSnb_"+sNb).removeClass('bgadd'); 
    	
    	$("#opinionEditArea_"+sNb).empty();
    	$("#opinionEditArea_"+sNb).hide();
    	
    	$(".opinionOne_"+sNb).show();
    },
    
    //--------딜 등록 팝업
	dealProcInnerPop : function(sNb,openType){
		
		
		var url= "/m/deal/dealProcPop_openLayer.do";
		
  		var params ={	
  				
  				sNb  		: sNb,
  				openType	: openType
  		};
  		
  		commonPopAllObj.pushBeforeUrl();
  		
  		var callback = function(result){
  		
  			$("#dealProcInnerArea").html(result);  
			
  			$('#dealProcInnerPop').animate({'right':'0'},300);
			$('#dealProcInnerPop').removeClass('disPlayNone');
  			nowUrl = url;
  			
  			window.history.pushState({'url' : url}, 'Title', "#"+url);
		
      	}
      	
  		commonAjaxTohtml( contextRoot+url, params, callback); 
		
	},	
	
	//딜 삭제
	dealDelete : function(sNb){
		
		swal({
			  title: "",
			  text: "삭제 하시겠습니까 ?",
			  
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  
			  cancelButtonText: '취소',
			  confirmButtonText: '확인'
		  },
		  function(isConfirm){
			  
			  if(isConfirm) {
				  
			    	var url = contextRoot + "/m/deal/dealDelete.do";
			    	var param = {
			    			
			    			sNb	: g_dealSnb,
			    			
			    	};
			    	
					var callback = function(result){
			 			
						var obj = JSON.parse(result);
			    		var cnt = obj.resultVal;		//결과수

						if(cnt == -8){
							
							alert("로그인 후 이용해주세요.");
							location.href = "${pageContext.request.contextPath}/m/login.do";
							
			    		}else if(cnt > 0){
			    			
			    			swal("완료되었습니다.");
			    			$("#dealViewPopCanBtn").trigger('click');
			    			dealListObj.doSearch();
			    			
			    		}else{
			    			swal("이미 단순의견이 달렸거나 잘못된 정보입니다.");
			    			return false;
			    		}
						
			 		};
			    	
			 		commonAjax("POST", url, param, callback, false);
			  }
			  
		});
	}
    
}


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	dealDetailObj.preloadCode();			//공통코드 or 각종선로딩코드
	dealDetailObj.doSearch();
	 
	if(g_readAuthYn == 'Y' ){
		
		dealDetailObj.searchComment();
		dealDetailObj.getAnalyList();
	} 
	
	
	$(".scroll_tapMenu ul li ").click(function(e) {

		  if ($(this).hasClass('tapMenu_slider')) {
		    return;
		  }
		  var whatTab = $(this).index();
		  var howFar = 93 * whatTab;
		  $(".tapMenu_slider").css({
		    left: howFar + "px"
		  });

	});


	$('div[name=dealDetailDiv]').bind('touchstart', function(event) {

		var e = event.originalEvent;

		startX = 0;
		clearTimeout(lastT);
		startX = e.targetTouches[0].pageX;
		startY = e.targetTouches[0].pageY;

		// Check if moving is done
		/* lastT = setTimeout(function() {
			startX = 0;

		}, 300); */
		
		//event.stopPropagation();
	});

	$('div[name=dealDetailDiv]').bind('touchmove', function(event) {

		
		//event.preventDefault();
		var e = event.originalEvent;

		currentX = 0;
		clearTimeout(lastT);
		currentX = e.targetTouches[0].pageX;
		currentY = e.targetTouches[0].pageY;

	/* 	if (lastX == 0) {
			lastX = currentX;
		} */

		var gab_Y = Math.abs(startY - currentY);
		var gab_X = currentX - startX;
		//alert("gab_X"+gab_X+"gcurrentXab_X"+currentX+"startX"+startX);
		if (gab_X > 20 && gab_Y < 2) {

			$('#dealViewPop').hide("slide", {
				direction : "right"
			}, 600);
			setTimeout(function() {
				
				$('#dealViewPop').addClass('disPlayNone');
				$('#dealViewPop').css({
					"bottom" : "-100%",
					"display" : ""
				});
				
				
				
			}, 700);

		}

		

	});
	/* 스크롤  하단  바텀   */
	if($("#dealEditBtn").css('display')== "none" && $("#dealDelBtn").css('display') == "none" ){
		$(".scrollArea.dealviewWrap").css("bottom","0");
	}else{
		var  height=$(window).height()-120;
		$(".btn_box_basic_01").css({'margin-top': height});
	}
	
	/* 코멘트   스크롤 이동  */
	if(g_commentSnb != 0 && g_commentSnb != '' && g_commentSnb != null ){
		$("#commentSnb_"+g_commentSnb).find('pre').addClass("alarm_point01");
		setTimeout(function(){$("#commentSnb_"+g_commentSnb).get(0).scrollIntoView(true);},100);	
	}
	

	$('.dealConBox').click(function(){
			
		if ($('#dealInvestMemoArea').css('display') == "none"){
				$('.op_txt.dealInvestEditArea').css('display','none');
				$('.btn_s_withe.dealInvestEditArea').css('display','none');
				$('#dealInvestMemoArea').css('display','');
		}
	});
	
	
   
});


</script>