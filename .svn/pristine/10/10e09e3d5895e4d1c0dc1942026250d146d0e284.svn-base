<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="wrap">
	<div class="mb_sub_location">
		<c:choose>
			<c:when test="${openType eq 'inner' }">
				<button type="button" id="dealProcPopCanBtn" class="back" onclick="closeRightBox('dealProcInnerPop','dealProcInnerArea');"><em>이전</em></button>
			</c:when>
			<c:otherwise>
				<button type="button" id="dealProcPopCanBtn" class="back" onclick="closeBottomBox('dealProcPop','dealProcArea','first');"><em>이전</em></button>
			</c:otherwise>
		</c:choose>
		<a href="javascript:;" class="depth01">Deal ${sNb != '' && sNb != '0' ? '수정' : '등록'  }</a><a href="javascript:;" class="depth02"></a>
	</div>
	<!--서브컨텐츠-->
	<section class="contentsWrap scrollArea dealergiWrap">
		
		<!--운행정보입력--> 
		<article> 
			<table class="tb_input_basic02" summary="딜등록(날짜, 경로, 중개인, 유형, 회사, 발행규모, 내용입력)">
				<colgroup>
					<col width="70"/> 
					<col width="*"/> 
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="IDNAME01">날짜 </label></th>
						<td>
							<input type="date" class="input_basic" id="dealTmDt"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="IDNAME01">경로 </label></th>
						<td>
							<p id="dealMiddleOfferArea" class="itemlist2 f11_5"></p>
						</td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="note">중개인</label></th>
						<td class="valign">
							<input type="text" id="dealCustomerInput" class="input_basic w_r_full"  placeholder="인물선택" readonly="readonly" onclick="commonPopAllObj.commonComORCusPop(1,'0','iP','searchPerson');" title="회사선택"/><input type="hidden" id="dealCustomerId" value="0"/><button type="button" class="btn_3dst_basic2 mgl05rem" onclick="dealProcObj.initCusComRe('Customer');"><span class="icon_reset"><em>초기화</em></span></button>
						</td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="ScheduleType">유형</label></th>
						<td class="valign">
							<span id="dealTypeArea"></span><span><select id="sellBuy" class="select_basic wdate mgl05rem">
									<option value="0">SELL</option>
									<option value="1">BUY</option>
									<option value="2">투자유치</option>
								</select>
							</span>
						</td>
						
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="stbDate">회사</label></th>
						<td class="valign">
							<span><input type="text" id="dealCompanyInput" class="select_basic w_r_full"  placeholder="회사선택" readonly="readonly" onclick="commonPopAllObj.commonComORCusPop(1,'0','c','searchCompany');" title="회사선택"/><input type="hidden" id="dealCompanyId" val="0"/><input type="hidden" id="dealACompanyId" val="0"/></span><span><button type="button" class="btn_3dst_basic2 mgl05rem" id="initCompanyBtn" onclick="dealProcObj.initCusComRe('Company');"><span class="icon_reset"><em>초기화</em></span></button></span>
					    </td>
					</tr>
					<tr name="mnaTr" style="display:none;">
						<th scope="row" class="valign"><label for="stbDate">업종</label></th>
						<td class="valign">
							<span id="dealCompanyTypeCdArea"></span><span><input type="text" id="dealCompanyTypeEct" class="input_basic w_half mgl05rem" placeholder="업종입력" title="업종직접입력"/></span>
					    </td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="stbDate">발행규모</label></th>
						<td class="valign">
							<input type="text" id="dealPrice" class="input_basic w_half" placeholder="발행규모"  title="발행규모"/><input type="text" id="dealInvestPrice" class="input_basic w_half mgl05rem" placeholder="투자규모" title="투자규모"/>
					    </td>
					</tr>
					<tr name="recommendTr" style="display:none;">
						<th scope="row" class="valign"><label for="stbDate">추천인</label></th>
						<td>
							<p class="valign">
							  <button type="button" id="" class="btn_3dst_basic" onclick="dealProcObj.dealRecommedPersonPop();">
							       <span class="icon_joinmember"><em id="dealRecommendInput">추천인 매칭</em></span>
							  </button>
							   <button type="button" class="btn_3dst_basic2 mgl05rem" onclick="dealProcObj.initCusComRe('Recommend');"><span class="icon_reset"><em>초기화</em></span></button>
							   <input type="hidden" id="dealRecommendId" value="0"/>
							 </p>
						</td>
					</tr>
					<tr name="ipoTr" style="display:none;">
						<th scope="row" class="valign"><label for="stbDate">시가총액</label></th>
						<td class="valign">
							<input type="text" id="marketPrice" class="input_basic w_full" placeholder="매매가기준 시가총액"/>
						</td>
					</tr>
					<tr>
						<th scope="row" class="valign"><label for="stbDate">내용</label></th>
						<td >
							<!-- <div id="dealTypeDiv" style="margin-top:1rem; margin-bottom:1rem;"></div> -->
							<div class="dealinputBox" > 
							   <p class="d_inp_title" id="dealTypeDiv">
							    <span>유형 및 회사 선택</span> <button type="button" class="btn_exicon mgl05rem" onclick="dealProcObj.openDealGuide();"><em>딜안내</em></button>
							   </p>
							  <textarea id="dealMemo" cols="5" rows="8" class="d_txtArea w100pro" placeholder="딜내용을 입력하세요."></textarea> 
							  
							   <!--파일선택-->
					 		  <p class="file_list noSearch">
								  <span class="btn_file">
									 <span class="icon_fileclip">파일선택</span>
									 <span id="fileInputAreaPro">
										<input name="upFilePro" type="file" multiple onchange="dealProcObj.newFileUpload('');" class="file_upload" />
									</span>
						  	 		</span>
						 		 <span id="uploadFileListPro" class=""></span>
					    	 </p>
			
						<!--//파일선택//-->
							  
							</div>
							
					    </td>
					</tr>
				</tbody>
			</table>
		</article>	
		<div class="btn_box_basic">
			<ul class="btn_b_list btn_count2">
				<c:choose>
					<c:when test="${openType eq 'inner' }">
						<li><a class="btn_mobile_gray01" onclick="closeRightBox('dealProcInnerPop','dealProcInnerArea');" >취소</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="btn_mobile_gray01" onclick="closeBottomBox('dealProcPop','dealProcArea','first');" >취소</a></li>
					</c:otherwise>
				</c:choose>
				<li><button type="button" id="AddEnd"  onclick="javascript:dealProcObj.dealSave();" class="btn_mobile_blue01">저장</a></li>
			</ul>
		</div>
	</section>
	<!--//서브컨텐츠//-->
</div>

<script>

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
		
		$('#dealCompanyInput').val(cpnNm);		//회사명
	 	$('#dealCompanyId').val(cpnId);			//회사아이디
	 	$("#dealACompanyId").val(rVal.aCpnId);			//회사아이디(상장)
	 	
	 	dealProcObj.initCusComRe('Recommend');	//회사변경시 추천영역 초기화 
	 
		closeBottomBox('searchCompanyPop','onlyCompany','second'); // 공통함수 mobile.js
		
		dealProcObj.changeTab();
		
	}else{
		
		//인물
  		var tmpSpan = document.createElement("span");
		tmpSpan.innerHTML = rVal.nm;
		
		var cstNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 인물명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cstId = rVal.snb;
		
		$('#dealCustomerInput').val(cstNm);			//인물명 표시
		$('#dealCustomerId').val(cstId);			//인물 ID 임시저장
		
		//회사
		/* tmpSpan.innerHTML = rVal.cpnNm;
		
		var cpnNm = $(tmpSpan).text();		//위에서 임시로  span 을 만들어 내부에 테그를포함한 회사명을 넣어놓고 text()로 텍스트만 뽑아낸다.
		var cpnId = rVal.cpnId;
		
		$('#dealCompanyInput').val(cpnNm);		//회사명
	 	$('#dealCompanyId').val(cpnId);			//회사아이디
	 	 */
	 	
		closeBottomBox('searchPersonPop','onlyCompany','second');
	}
	
}

var g_sNb = '${sNb}';	//딜 SNB 
var g_dealTypeList = new Array();
var g_proIdx =0;
var delArrayPro = new Array();

var dealProcObj = {
		
		preloadCode : function(){
			
			$("#dealTmDt").val(new Date().yyyy_mm_dd());
		},
		
		getTabList : function(){
			
		/* 	var url = contextRoot + "/m/deal/getDealTabList.do";
	    	var param = { menuCd : '00015'};
	    	
			var callback = function(result){
				
				var obj = JSON.parse(result);
				var list = obj.resultList;
			}
			
			commonAjax("POST", url, param, callback, false);  */
			
		},
		
		//딜 공통 코드 정보
		getDealCodeInfo : function(){
			
			var url = contextRoot + "/m/deal/getDealCodeInfo.do";
	    	
			var param = {};
	    	
			var callback = function(result){
				
				var obj = JSON.parse(result);
				var codeInfo = obj.resultObject;
				
				var dealMiddleOfferList = codeInfo.dealMiddleOfferList;			//00011 중개 제안중
				var dealSubOfferList = codeInfo.dealSubOfferList;				//받은제안, 제안 
				var dealTypeList = codeInfo.dealTypeList;						//상장 CB
				var companyTypeCdList = codeInfo.companyTypeCdList;				//회사 업종
				
				g_dealTypeList = dealTypeList;
				
				//경로
				var str ='';
				for(var i=0; i<dealMiddleOfferList.length; i++){
					if (dealMiddleOfferList[i].cdSort == '00000') str +='<label><input type="radio" '+ (i==0 ? 'checked=checked' : '') +' name="dealMiddleOfferRadio" onclick="dealProcObj.changeMiddleOffer();" value="'+dealMiddleOfferList[i].dTailCd+'"/><span>'+dealMiddleOfferList[i].cdNm+'</span></label>';
				} 
				$("#dealMiddleOfferArea").html(str);
				
				var obj = {
						sNb 	: '0',
						menuCd  : '00017',
						dTailCd : '00000',
						cdNm 	: '유형선택',
						cdDc	: null,
						useAt	: null,
						cdSort	: '00000'
				};
				
				dealTypeList = addToArray(dealTypeList,0, obj);
				
				//유형
				var dealTypeTag = createSelectTag('dealType', dealTypeList, 'dTailCd', 'cdNm', '', 'dealProcObj.changeDealType();', {}, 100, 'select_basic bgimport w_half');
				$("#dealTypeArea").html(dealTypeTag);
				
				//업종
				var companyTypeCdTag = createSelectTag('companyTypeCd', companyTypeCdList, 'dTailCd', 'cdNm', '', '', {}, 100, 'select_basic w_half');
				$("#dealCompanyTypeCdArea").html(companyTypeCdTag);
				
			}
			
			commonAjax("POST", url, param, callback, false);
			
		},
		
		//수정시 데이터 셋
		getDealInfo : function(){
			
			var url = contextRoot + "/m/deal/getDealDetail.do";
			
			var param = {
					sNb	 : g_sNb,
				
			}
			
		
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
	    			
	    			$('input[type=radio][value='+dealInfo.middleOfferCd+']').prop("checked",true);
	    			$("#dealType").val(dealInfo.categoryCd);		//딜유형
	    			
	    			//수정시 회사명 수정 못하게
	    			$('#dealCompanyInput').val(dealInfo.cpnNm);		//회사명
	    		 	$('#dealCompanyId').val(dealInfo.cpnId);		//회사아이디
	    		 	$('#dealACompanyId').val(dealInfo.aCpnId);		//회사아이디(상장)
	    		 	$("#dealCompanyInput").attr("disabled","disabled");
	    		 	$("#dealCompanyInput").addClass('disableInput');	//css 요청 
	    			$("#initCompanyBtn").hide();
	    			
	    		 	$("#dealTmDt").val((dealInfo.tmDt).substring(0,10));
	    		 	$("#dealTmDt").attr("disabled","disabled");
	    		 	$("#dealTmDt").addClass('disableInput');	//css 요청 
	    		 	
					//-----------------중개인
					if(dealInfo.cstId != 0){
						$('#dealCustomerInput').val(dealInfo.cstNm);	//인물명 표시
		    		 	$('#dealCustomerId').val(dealInfo.cstId);		//인물 ID 임시저장
					}
					
					$("#dealInvestPrice").val(dealInfo.investPrice);
					$("#dealPrice").val(dealInfo.price);
					
					
					$("#dealMemo").html(dealInfo.memo);
					$("#sellBuy").val(dealInfo.sellBuy);
					
					//회사 업종
					if(dealInfo.categoryCd == '00008' || dealInfo.categoryCd == '00012' ){
						
						dealProcObj.changeDealType();
						$("#companyTypeCd").val(dealInfo.cpnTypeCd);
						if(dealInfo.cpnType != null) $("#dealCompanyTypeEct").val(dealInfo.cpnType);
					}
					
					if(dealInfo.middleOfferCd == '00002' || dealInfo.middleOfferCd == '00005'){
						
						$('tr[name=recommendTr]').show();
						
						//추천인 세팅
						if(dealInfo.rcmdProposer != 0 && dealInfo.rcmdProposer != '' && dealInfo.rcmdProposer != null){
							
							$('#dealRecommendId').val(dealInfo.rcmdProposer);
							$('#dealRecommendInput').html(dealInfo.rcmdProposerNm);
						}
						
					}else $('tr[name=recommendTr]').hide();
					
				}
	    		dealProcObj.changeTab();
	    		endLoadingBar();
	    	
			}; 
			
		
			commonAjax("POST", url, param, callback, true); 
			
		},
		
		//딜 등록 수정
		dealSave : function(){
			
			var middleOfferCd = $("input[type=radio][name=dealMiddleOfferRadio]:checked").val();	//00001중개 , 00002직접발굴, 00004제안중(중개), 00005제안중(직접발굴) 
			var cpnId = $("#dealCompanyId").val();		//회사 아이디
			var dealType = $("#dealType").val();		//딜유형
			var rcmdSnb	= $("#dealRecommendId").val();	//추천인
			var marketPrice = $("#marketPrice").val();	//시가총액
			/* 수정하면  br 입력되어  다시 수정 -kds  */
			var regex = /<br\s*[\/]?>/gi;    
			var dealMemo = $('#dealMemo').val().replace(regex, "\n");
		
			var companyTypeCd = $("#companyTypeCd").val();
			var dealCompanyTypeEct = $("#dealCompanyTypeEct").val();
				
			var offerCd = '00000';
			var fileList ='';
	    	var delFileList='';
	    	
	    	//--------------validation : S
			
			if(cpnId == 0 || cpnId == ''){
				swal("회사를 선택해주세요.");
				return false;
			}
			
			if(dealType == '00000'){
				swal("딜 유형을 선택해 주세요.");
				return false;
			}
			
			if(dealMemo ==""){ 
				swal("딜 내용을 입력해 주세요.");
				return false;
			}
			
			
			if(middleOfferCd == '00002' || middleOfferCd == '00005'){ //직접발굴, 제안중(직접발굴) 추천인 
				
				if(rcmdSnb == '' || rcmdSnb == '0'){
					
					var doConfirm = false;
					
					swal({
						  title: "",
						  text: "추천인을 지정하지 않아, 미지정 처리로 저장됩니다. 계속 하시겠습니까?",
						  
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  
						  cancelButtonText: '취소',
						  confirmButtonText: '확인'
					  },
					  function(isConfirm){
						  if(!isConfirm) return false;
					  });
				
				}
			
			}
			
			if(dealType == '00012' && g_sNb == 0){
				
				if(marketPrice == '' || marketPrice == 0){
					swal("매매가기준 시가총액을 입력하세요.");
					return false;
				}
			}
			
			//--------------validation : E
			
			//프리 IPO M&A 가 아닐때
			if(dealType != '00012' && dealType != '00008'){
				companyTypeCd = '00000';
				dealCompanyTypeEct = '';
			}
			
			
			
			if(middleOfferCd == '00001') offerCd = '00007';
			else if(middleOfferCd == '00002') offerCd = '00006';
			if(dealType == '00012' && g_sNb == 0) dealMemo = '시가총액: '+marketPrice+'억\n' + dealMemo;
		
			
			/*=========== 첨부파일 : S =========== */
	    	
	     	var offerSnbList 	= $('input[name=offerSnbPro]');			//시퀀스 리스트
	     	var realNameList 	= $('input[name=realNamePro]');			//파일명 리스트
	     	var makeNameList 	= $('input[name=makeNamePro]');			//새로운 저장 파일명 리스트
	     	var pathList 		= $('input[name=pathPro]');				//경로 리스트
	     
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
	 				
	 				jobj.fileCategory= '00000';					//단순 의견이 아닐때(분석,제안서,IR)
	 				
	 				jobj.subCd='0';
	 				jArray.push(jobj);
	     		}
	     	}

	     	var totalObj = new Object();
	 		totalObj.items=jArray;												//items 란 키값으로 totalObj에 jobj를 담은 jArray를 세팅
	 		
	 		fileList = JSON.stringify(totalObj);								//totalObj 를 string 변환

	 		if(jArray.length ==0) fileList = '';								//파일이 없을때는 빈값

	 		if(delArrayPro.length !=0) delFileList = delArrayPro.join(",");		//수정시 삭제한 파일들의 리스트
			
			
			var url = contextRoot + "/m/deal/doDealSave.do";
			
			var param = {
					sNb				: g_sNb,
					cstId			: $("#dealCustomerId").val(),
					memo			: dealMemo,
					tmDt			: ($("#dealTmDt").val()).replace(/-/gi,''),  // 딜등록  날짜 
					cstNm			: $('#dealCustomerNm').val(),
					price			: $('#dealPrice').val(),
					investPrice		: $('#dealInvestPrice').val(),
					cpnId			: cpnId,
					aCpnId			: $("#dealACompanyId").val(),
					cpnNm			: $("#dealCompanyInput").val(),
					middleOfferCd	: middleOfferCd,
					offerCd			: offerCd,
					categoryCd		: dealType,
					categoryNm		:  $("#dealType option:selected").text(),
					rcmdSnb			: rcmdSnb,							//추천인
					sellBuy			: $("#sellBuy").val(),
					cpnTypeCd		: companyTypeCd,					//회사 코드값
					cpnType			: dealCompanyTypeEct,				//회사 부가 설명
					
					fileList 		: fileList,
 					delFileList		: delFileList,						//수정시 삭제한 파일들의 시퀀스 리스트
 					
 					rcmdEdit		: 'Y'
			}
		
			var callback = function(result){
			
				var obj = JSON.parse(result);
	    		  
	    		var cnt = obj.resultVal;		//결과수
				
	    		
	    		
				if(cnt > 0){			
					
					swal("완료되었습니다.");
					$("#dealProcPopCanBtn").trigger('click');
					
					if('${openType}' == 'inner'){
						closeBottomBox('dealViewPop','dealViewArea','first');
						dealListObj.doSearch();
					}
					
					
				}else if(cnt == -8){
					
					alert("로그인 후 이용해주세요.");
					location.href = "${pageContext.request.contextPath}/m/login.do";
				}else{
					swal("서버에러!!");
					return;
				}
				//endLoadingBar();
			}; 
			
			/* var beforeSubmit = function(){
				
				setTimeout(function() {
					startLoadingBar();
	   	       }, 100);
				
			};
			 */
		
			commonAjax("POST", url, param, callback, false); 
		},
		
		//-- 유형 경로 변경 이벤트
		
		//경로변경
		changeMiddleOffer : function(){
			
			var chkOffer = $('input[type=radio][name=dealMiddleOfferRadio]:checked').val();
			
			//직접발굴 , 제안중(직접발굴)
			if(chkOffer == '00002' || chkOffer == '00005'){
				$('tr[name=recommendTr]').show();
			}else $('tr[name=recommendTr]').hide();
			
			dealProcObj.changeTab();
			
		},
		
		//유형변경
		changeDealType : function(){
			
			var chkDealType = $('#dealType').val();
			
			//mna or ipo
			if(chkDealType == '00008' || chkDealType == '00012'){
				
				$('tr[name=mnaTr]').show();
				if(chkDealType == '00012' && g_sNb == 0) $('tr[name=ipoTr]').show();
				
			}else{
				
				$('tr[name=mnaTr]').hide();
				$('tr[name=ipoTr]').hide();
			}
			
			dealProcObj.changeTab();
		},
		
		//유형표시
		changeTab : function(){
			
			var chkDealType = $('#dealType').val();										
			var chkOffer = $('input[type=radio][name=dealMiddleOfferRadio]:checked').val();		//00004,00005 제안중 일때
			var companyId = $("#dealACompanyId").val();
			
			var obj = getRowObjectWithValue(g_dealTypeList, 'dTailCd', chkDealType);
			var viewYn = 'N';
			
			if(chkDealType != '00000')  viewYn = 'Y';		//표시여부(유형선택 안햇을땐 표시하지않음)
			
			var str = '';
			
			if(viewYn == 'Y'){
				//메자닌_상장 딜제안중 메자닌_비상장 M&A 바이오/헬스케어 프리IPO 벤처 블록딜(WRT) Shell
				if(chkOffer == '00004' || chkOffer == '00005'){
				
					str = '딜제안중';
				//메자닌
				}else if(chkDealType == '00001' || chkDealType == '00003' || chkDealType == '00002' || chkDealType == '00015'){
				
					//메자닌 이고, 회사 아이디가 있을때
					if(companyId != ''){
							str = '메자닌_비상장';
						//상장사
						
						if(companyId.indexOf('A') != -1 || companyId.indexOf('Q') != -1){
							str = '메자닌_상장';
						}
						
					}else{
						str = '';
						viewYn = 'N';
					}
					
				//블록딜	
				}else if(chkDealType == '00004' ||chkDealType == '00005' || chkDealType == '00006' || chkDealType == '00007'){
					
					str = '블록딜';
					
				}else str = obj.cdNm;
			}
			
			
			if(viewYn != 'N') {
				$("#dealTypeDiv").html('<span>'+str+'</span> <button type="button" class="btn_exicon mgl05rem" onclick="dealProcObj.openDealGuide();"><em>딜안내</em></button>');
				//$('.d_inp_title').css("display","block");
			}else {
				
				$("#dealTypeDiv").html('<span>유형 및 회사 선택</span> <button type="button" class="btn_exicon mgl05rem" onclick="dealProcObj.openDealGuide();"><em>딜안내</em></button>'); 
				//$('.d_inp_title').css({"display":"none" , "border-top":"none"});
			}
			
			
			
		},
		
		//초기화 버튼 클릭
		initCusComRe : function(type){
			
			if(type == 'Recommend') $('#deal'+type+'Input').html('추천인 매칭');
			else $('#deal'+type+'Input').val('');
			$('#deal'+type+'Id').val('0');
			
			if(type == 'Company'){
				dealProcObj.initCusComRe('Recommend');	//회사초기화시 추천영역 초기화 
				$('#dealACompanyId').val('0');
			}
			
			dealProcObj.changeTab();
		},
		
		//-------------------팝업
		
		//딜 추천인 팝업
		dealRecommedPersonPop : function(){
			
			var dealCompanyId = $('#dealCompanyId').val();
			
			if(dealCompanyId == 0 || dealCompanyId == ''){
				swal("회사를 먼저 선택해주세요.");
				return false;
			}
			
			var url=contextRoot+"/m/deal/dealRecommendPersonPop.do";
	     	
	     	var callback = function(result){
	      		modal({
	                type: 'customer',
	                title: '추천인 매칭',
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
		
		//딜 안내 팝업
		openDealGuide : function(){
			
			
			
			var url=contextRoot+"/m/deal/openDealGuidePop.do";
	     	
	     	var callback = function(result){
	      		modal({
	                type: 'customer',
	                title: '딜 안내사항',
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
		
		//---------------------------파일 등록 로직
		
		//신규 파일 등록시
	  	newFileUpload : function(){

	  		
	  		var url = contextRoot+"/file/uploadFiles.do"
	  		
	  		
			var callback = function(result){

	   			var list = result.resultList;
	   			var str='';
	   			for(var i=0;i<list.length;i++){
	   				
	   				var fileObj = list[i];
	    			str +='<span class="file_name" id="liPro_'+g_proIdx+'">' + fileObj.realName ;
	    			str +='<input type="hidden" name="offerSnbPro" value="0">' ;
	    			str +='<input type="hidden" name="realNamePro" value="'+fileObj.realName+'">' ;
	    			str +='<input type="hidden" name="makeNamePro" value="'+fileObj.makeName+'">' ;
	    			str +='<input type="hidden" name="pathPro" value="'+fileObj.path+'">' ;
	    			
	   				str +='<a href="javascript:dealProcObj.newFileDelete(\''+fileObj.makeName+'\',\''+fileObj.path+'\','+g_proIdx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
	   				g_proIdx++;


	   			}

	   			//파일 태그 재 생성.
	   			$('#fileInputAreaPro').append('<input name="upFilePro" type="file" multiple class="file_upload"  onchange="dealProcObj.newFileUpload(\'\');"/>');


	   			$('#uploadFileListPro').append(str);
	   		 	
	   		}
	  		
	   		commonAjaxForFileCreateForm(url,"","upFilePro","","fileSize", callback , "",'','');

	  	},
	  	

	    //파일 바로 삭제
	    newFileDelete : function(makeName,path,idx){
	    	
	    	var url = contextRoot + "/file/deleteFile.do";
	    	var param = { makeName : makeName , path : path};
	    	var callback = function(result){
	    		var obj = JSON.parse(result);
	    		var cnt = obj.resultVal;
	    		if(cnt>0){
	    			$("#liPro_"+idx).remove();
	    		}
	    		
	    	
	    	};
	    	commonAjax("POST", url, param, callback, false);
	    },
	    
	  	//수정시 db 에 이미 저장된 파일삭제 할땐. 바로삭제하지않고 리스트를 만든다.
	    setDelFile: function(fileSeq,idx){

	    	delArrayPro.push(fileSeq);
	    	$("#liPro_"+idx).remove();
	    	
	    },//end setDelFile
	    
	  	//첨부파일 리스트
	    getFileList : function(){
	    	
	    	var url = contextRoot + "/file/getFileList.do";
	    	var param = {
	    					offerSnb 		: g_sNb,
	    					fileCategory    : '00000'
	    				}

	    	var callback = function(result){
	    		var obj = JSON.parse(result);
	    		var list = obj.resultList;
	    		var str = '';
	    		
	    		saveFileList = list;
	    		
	    	 	if(list.length>0){
		    		for(var i=0;i<list.length;i++){

		    			var fileObj = list[i];
		    			str +='<span class="file_name" id="liPro_'+g_proIdx+'">' + fileObj.realName ;
		    			str +='<input type="hidden" name="offerSnbPro" value="'+fileObj.offerSnb+'">' ;
		    			str +='<input type="hidden" name="realNamePro" value="'+fileObj.realName+'">' ;
		    			str +='<input type="hidden" name="makeNamePro" value="'+fileObj.makeName+'">' ;
		    			str +='<input type="hidden" name="pathPro" value="'+fileObj.path+'">' ;
		    			str +='<a href="javascript:dealProcObj.setDelFile('+fileObj.sNb+','+g_proIdx+');" class="btn_delete_employee"><em>삭제</em></a>,</span>';
		    			g_proIdx++;
					}
		    		$('#uploadFileListPro').html(str);
	    		} 
	    	
	    	}
	    	commonAjax("POST", url, param, callback, false);
	    },
		
};

$(function() {   
	
	dealProcObj.preloadCode();
	dealProcObj.getDealCodeInfo();
	if(g_sNb != '0' && g_sNb != ''){
		dealProcObj.getDealInfo();
		dealProcObj.getFileList();
	} 
	
});	


</script>