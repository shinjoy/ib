<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>메모함</title>

<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/images/synergyAI.ico'/>" rel="icon" type="image/x-icon">
<link href="<c:url value='/images/favicon.ico' />" rel="shortcut icon" type="image/x-icon">

<!-- ============== style css :S ============== -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">				<!-- jquery-ui -->
<!-- ============== style css :E ============== -->

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<%--<script type="text/JavaScript" src="<c:url value='/js/process.js'/>" ></script> --%>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/sys/utils.js?ver=0.1" ></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js?ver=0.1"></script><!-- ajaxRequest, etc -->
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<%--<script type="text/JavaScript" src="<c:url value='/js/splitter.js'/>"></script> --%>

<!-- -------------- axisj source include (JS, CSS) :S -------------- -->
<%@ include file="/includeAxisj.jsp" %>
<!-- -------------- axisj source include (JS, CSS) :E -------------- --> 

<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

<!-- 파일업로드 -->
<script type="text/JavaScript" src="<c:url value='/js/multiFileUpload.js'/>" ></script>


<style>
.gtabZone {
    border-left: #bababa solid 0px;
}

.state_icon_clear{
	/* background:url(../images/work/icon_check.gif) no-repeat 0 0; */ 
	padding-left:16px; font-size:12px; font-family:"돋움"; color:#252525;
}

.btn_push_order a.on {
    background: url(../images/work/bg_btn_push_all_on.gif) repeat-x;
    line-height: 14px;
    height: 14px;
    padding: 4px 0px 4px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    /*border-left: #b3b3b3 solid 1px;*/
    display: inline-block;
    text-align:center;
    width:89px;
}
.btn_push_order a {
    background: url(../images/work/bg_btn_push_all_off.gif) repeat-x;
    line-height: 14px;
    height: 14px;
    padding: 4px 0px 4px;
    font-size: 11px;
    vertical-align: middle;
    font-weight: normal;
    /*border-left: #b3b3b3 solid 1px;*/
    display: inline-block;
    text-align:center;
    width:89px;
}
.btn_push_order {
	padding-left: 10px;
}


.num_msg {	
	background: #6287bd;
    color: #FFF;
    border: 1px solid #5e83ba;
    border-radius: 8px;
    height: 6px;
    line-height: 1;
    padding: 0px 2px 0px 3px;
    font-family: Tahoma, Geneva, sans-serif;
    font-size: 8px;
    vertical-align: middle;
    text-align: center;
    font-weight: normal;
    letter-spacing: -0.05px;    
}
.num_msg_wrap{
	float:right;
}
</style>



<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.1); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    z-index: 1000000;
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 1000000;
}
.display-none{ /*감추기*/
    display:none;
}

.memo_list_tb thead th {
    font-weight: bold;
    color: #3b4354;
    line-height: 15px;
    padding: 3px 0px 3px;
    text-align: center;
    border-bottom: #b9c1ce solid 1px;
    border-left: #b9c1ce solid 1px;
    background: #d8dce3;
}

.chat_flow {
    overflow-y: scroll;
    max-height: 430px;
    height: 430px;
    padding: 15px;
    border-right: #c7cdd8 solid 1px;
    background: #f5f6f8;
    border-left: #c7cdd8 solid 1px;
}
#LeftPane {
	border-left:0px;
	border-top:1px solid #cccccc;
	width:52%;
}
#RightPane {
    min-height: 620px;
    width: auto;
    min-width: 200px;
    overflow: hidden;
    background: url(../images/work/bg_right_block.gif) repeat-y right 0 #fff;
    padding-left:7px;
}
#MySplitter {
    min-height: 620px;
    border-bottom: #b9c1ce solid 0px;
}
.communi_inputBox {
    border-right: #c7cdd8 solid 1px;
    border-left: #c7cdd8 solid 1px;
    border-bottom: #c7cdd8 solid 1px;
}
</style>
 
 



 
 
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>


</head>

<body>
<div id="wrap"> 
	<div class="container">
	
        <div id="containerWrap">
        <!--전체메모영역-->
        	<!--메모검색-->
            <div class="memo_searchBox">
            	<span class="div_line">
                <span id="periodSelectTag" style="float:left;"></span>
                
                <input type="text" id="inStartDate" class="applyinput_B w_st06 mgl6" title="시작일선택" onchange="fnObj.chngPeriodDirect();" /><a href="javascript:fnObj.popCalendar('start');" class="btn_calendar"><em>날짜선택</em></a> ~ 
                <input type="text" id="inEndDate" class="applyinput_B w_st06" title="종료일선택" onchange="fnObj.chngPeriodDirect();" /><a href="javascript:fnObj.popCalendar('end');" class="btn_calendar"><em>날짜선택</em></a>
                </span>
                <span class="div_line">
                <%--
                <select class="sel_basic w_st06">
                    <option>전체</option>
                    <option>제목</option>
                    <option>보낸사람</option>
                    <option>받는사람</option>
                    <option>첨부파일</option>
                </select>
                 --%>
                <span id="srchTxtTypeSelectTag"></span>
                <input id="srchTxt" class="applyinput_B mgl6 w_st01 f12" placeholder="검색어 입력" onkeypress="if(event.keyCode==13){fnObj.doSearch(1);}" />
                <a href="javascript:g_isOnlyNoRead='';fnObj.doSearch(1);" class="s_violet01_btn mgl6"><em class="search">검색</em></a>		<!-- workMemo_result.jsp -->
                </span>
            </div>
            <!--//메모검색//-->
            <!--tab-->
	        <div class="gtabZone2">
	            <ul>
	                <li id="liTypeALL" class="on"><a href="javascript:fnObj.clickTab('');">전체 메모함</a></li>
	                <li id="liTypeRECV"><a href="javascript:fnObj.clickTab('RECV');">수신 메모함</a></li>
	                <li id="liTypeSEND"><a href="javascript:fnObj.clickTab('SEND');">발신 메모함</a></li>
	                <li id="liTypeMY"><a href="javascript:fnObj.clickTab('MY');">MY 메모함</a></li>
	            </ul>
	        </div>
	        <!--//tab//-->
            <p class="search_result">검색결과 : <span id="total_count" class="spe_color_st5"></span>개
            <%--<a href="javascript:fnObj.getNoRead();" class="s_gray01_btn mgl25"><em>미확인</em></a> --%>  <%--<a href="#" class="s_gray01_btn mgl6"><em>발신 미확인</em></a></p> --%>
            <span class="btn_push_st01 mgl25">
            	<a href="javascript:fnObj.getNoRead(0);" id="readSttsAll" class="on">전체</a><a href="javascript:fnObj.getNoRead(1);" id="readSttsNo" class="last">미확인</a>
            </span>
            
            <span class="btn_push_order">
            	<a href="javascript:fnObj.getNewReplyOrder();" id="newReplyOrder" class="">최신댓글순<span id="newReplyOrderTxt" style="font-size:8px;">OFF</span></a>
            </span>
            
            
            
        	<!--메모리스트 및 메모보내기-->
            <div id="MySplitter">
                <div id="LeftPane" >
                    <table id="SGridTarget" class="memo_list_tb" summary="메모목록 (구분, 내메모, 대상자, 날짜 안내)">
                        <caption>메모목록</caption>
                        <colgroup>
                        	<col width="90" />
                        	<col width="35" />
                        	<col width="35" />
                            <col width="*" />
                            <col width="110" />
                        </colgroup>
                        <thead>
                            <tr>
                            	<th scope="col" rowspan="2">날짜</th>		<%--<a href="#" class="sort_lowtohigh">날짜<em>오름차순</em></a> --%>
                                <th scope="col" colspan="2">읽음확인</th>		<%--<a href="#" class="sort_hightolow">구분<em>내림차순</em></a> --%>                                
                                <th scope="col" rowspan="2">내용</th>		<%--<a href="#" class="sort_normal">제목<em>정렬</em></a> --%>
                                <th scope="col" rowspan="2">대상자</th>                                
                            </tr>
                            <tr>
                            	
                                <th scope="col">첫글</th>		<%--<a href="#" class="sort_hightolow">구분<em>내림차순</em></a> --%>
                                <th scope="col">전체</th>		<%--<a href="#" class="sort_hightolow">구분<em>내림차순</em></a> --%>
                                                                
                            </tr>
                        </thead>
                        <tbody>
                        <%--
                        <tr class="tr_selected">
                            <td><span class="state_icon_import"><strong>수신</strong></span></td>
                            <td class="txt_left "><a href="#"><strong>붉은색은 수신 발신상관없이 중요한 메모입니다.</strong></a><span class="num">5</span></td>
                            <td><span class="contact_from">안수연<em class="icon_count_em">99</em></span></td>
                            <td class="numst">2015.09.27</td>
                        </tr>
                        <tr>
                            <td><span class="state_icon_import"><strong>발신</strong></span></td>
                            <td class="txt_left"><a href="#"><strong>붉은색에서 수신/발신 구분은 오른쪽 대상자를 통해서 알수 있습니다.</strong></a><span class="num">5</span></td>
                            <td><span class="contact_to">안수연<em class="icon_count_em">5</em></span></td>
                            <td class="numst">2015.09.27</td>
                        </tr>
                        <tr>
                            <td><span class="state_icon_import"><strong>발신</strong></span></td>
                            <td class="txt_left"><a href="#"><strong>안읽은것, 확인을 누르지 않은건 볼드처리입니다.</strong></a><span class="num">5</span></td>
                            <td><span class="contact_to">안수연<em class="icon_count_em">4</em></span></td>
                            <td class="numst">2015.09.27</td>
                        </tr>
                        <tr>
                            <td><span class="state_icon_clear"><strong>수신</strong></span></td>
                            <td class="txt_left"><a href="#"><strong>파란색볼릿은 수신입니다.</strong></a></td>
                            <td><span class="contact_from">전신혜</span></td>
                            <td class="numst">2015.09.27</td>
                        </tr>
                         --%>
                        </tbody>
                    </table>

                    <!--페이징 및 신규메모버튼-->
                    <div class="memoPageZone">
                        <div class="fl_block">
                        
                        	<span class="num_msg_wrap">*&nbsp;<span class="num_msg">1&nbsp;</span> : 댓글수</span>
                        
                            <!-- 페이지 목록 -->
                            <div class="btnPageZone" id="btnPageZone">
                                <button type="button" class="pre_end_btn"><em>맨처음 페이지</em></button>
                                <button type="button" class="pre_btn"><em>이전 페이지</em></button>
                                <%--<span><input type="text" value="1" class="input_current" /></span>
                                <span><a href="">10</a></span> --%>
                                <button type="button" class="next_btn"><em>다음 페이지</em></button>
                                <button type="button" class="next_end_btn"><em>맨마지막 페이지</em></button>
                            </div>
                            <!--/ 페이지 목록 /-->
                            
                        </div>
                        <%--
                        <div class="fr_block">
                            <a href="#chat_window_wrap" class="s_3d_gray01_btn modalAnchor"><em>신규메모</em></a>
                        </div> --%>
                        
                    </div>
                    
                    
                    <!--//페이징 및 신규메모버튼//-->
                </div>
                <div id="RightPane">
                    <!--채팅전체-->
                    <div class="chat_window">
                        <div class="join_em_list">
                        	<span class="fl_block"><em class="title_icon_count"><span id="dtlGrpMemCnt">0</span></em><em><span id="dtlGrpMemNms"></span></em></span>
                        	<a href="javascript:fnObj.doRead();" class="btn_readcheck"><em>메모확인</em></a>
                        </div>
                        <!--대화내용-->
                        <div id="chatContent" class="chat_flow">
                        
                        <%--
                            <div class="communiBox">
                                <div class="pic"></div>
                                <ul class="conBox">
                                    <li class="nametime"><strong>이주훈</strong><span>19:42</span><span class="count">1</span></li>
                                    <li class="bubble"><span class="arrow"></span>고객님께서는 2015년 09월 11일 상품가입시(KB국민 「민」체크카드(비RF)) </li>
                                </ul>
                            </div>
                            <div class="communiBoxRight">
                                <div class="pic"></div>
                                <ul class="conBox">
                                    <li class="nametime"><span>19:42</span><span class="count">1</span></li>
                                    <li class="bubble"><span class="arrow"></span>고객님께서는 2015년 09월 11일 상품가입시(KB국민 「민」체크카드(비RF))</li>                                    
                                </ul>
                            </div>
                           
                            <p class="flow_date"><span>2015년 11월 07일 토요일</span></p>
                            <p class="flow_filedown">이주훈님이 <a href="#">Photos.zip</a>파일을 보냈습니다.</p>
                            
                             --%>
                            
                        </div>
                        <!--// 대화내용 //-->
                        <%--
                        <div class="communi_inputBox">                            
                            <div class="txtArea" style="padding: 10px 3px 3px; background-color:#f5f6f8;"></div>                           
                        </div>
                         --%>
                        
                        <!--대화입력창-->
                        <div class="communi_inputBox">
                            <%--<p class="option_list"><label><input type="checkbox" />중요체크</label><label><input type="checkbox" />SMS알림</label></p> --%>
                            <p class="file_list">
                                <span><a href="javascript:$('#files-upload').click();" class="btn_file"><em>파일선택</em></a></span>
                        
								<span id="file_list" class="file_name"></span>
						
                                <%--
                                <span class="file_name"><em>파일이름</em><a href="#" class="fileDelete"><em>삭제</em></a></span>,
                                <span class="file_name"><em>파일이름2</em><a href="#" class="fileDelete"><em>삭제</em></a></span>,
                                <span class="file_name"><em>파일이름3</em><a href="#" class="fileDelete"><em>삭제</em></a></span>,
                                <span class="file_name"><em>파일이름4</em><a href="#" class="fileDelete"><em>삭제</em></a></span>
                                 --%>
                            </p>
                            <div class="txtArea"><textarea id="memoComment" class="txtArea_b" placeholder="내용을 입력하세요"></textarea><a href="#" onclick="fnObj.addReply();" class="btn_send"><em>보내기</em></a></div>
                        </div>
                        <!--//대화입력창//-->
                        
                    </div>
                    <!--//채팅전체//-->
                </div>
            </div>    
        	<!--//메모리스트 및 메모보내기//-->
            <!--팝업-->
<%--@ include file ="/work/pop_Memo.jsp" --%>
            <!--//팝업//-->                  
        <!--//전체메모영역//-->
    </div>
    <!--//오른쪽 컨텐츠//-->
        
    </div>

<!--// 인물관리목록 //-->


<%-- 파일업로드 --%>
	<form id="multiFile_N_comment" name="fileNcomment" action="<c:url value='/basic/filesUpload4memo.do' />" method="post" encType="multipart/form-data">
		<input type="hidden" id="m_categoryCd" name="categoryCd" value="00005">
		<input type="hidden" id="m_rtn" name="rtn" value="work/ajaxDummy">
		<input id="files-upload" name="files-upload" type="file" multiple style="display:none;">
	</form>
	<%--
	<div style="float:left;padding-left:20px;vertical-align:middle;">
		<a class="btn glass s" onclick="$('#files-upload').click();" style="color:blue;width:60px;font-weight:bold;"><img src="<c:url value='../images/file/fileDisk.png' />" align="absmiddle">File</a>
		<div><table id="file_list"></table></div>
	</div>
	 --%>	
<%-- 파일업로드 --%>



</div>
</body>
</html>







<script type="text/javascript">

//Global variables :S ---------------

//공통코드

var myModal = new AXModal();		// instance


var myGrid = new SGrid();		// instance		new sjs
var myPaging = new SPaging();	// instance		new sjs
//var mySorting = new SSorting();	// instance		new sjs


var curPageNo = 1;				//현재페이지번호
var pageSize = 15;				//페이지크기(상수 설정)


var g_memoType = '';				//''(전체), 'RECV'(수신), 'SEND'(발신), 'MY'(내)

var g_isOnlyNoRead = '';			//미확인건 메모	'Y': 미확인메모만 보기,  그외('','N') 는 모두 보기

var g_isLastReplyOrder = '';		//최신댓글순 정렬 'Y': 최신댓글순,  그외('','N') 는 시간정렬

var g_staffNm = '${userLoginInfo.name}';		//사원명
var g_mainSnb = '';								//ib_comment.main_snb		(메모 건의 대표 row 데이터 ... 0 이면 내가최초등록자)   
var g_sNb = '';									//ib_comment.s_nb			(메모 건의 대표 row 데이터 ... ib_comment 의 시퀀스)


//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		
		//기간
		var periodObj = [{CD:'', NM:'기간'}, {CD:'7', NM:'1주일'}, {CD:'30', NM:'1개월'}, {CD:'90', NM:'3개월'}, {CD:'180', NM:'6개월'}];
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		var periodSelectTag = createSelectTag('selPeriod', periodObj, 'CD', 'NM', '90', 'fnObj.chngPeriod();', colorObj, 60, 'sel_basic w_st06');	//select tag creator 함수 호출 (common.js)
		$("#periodSelectTag").html(periodSelectTag);
		
		//검색어 타입
		var srchTxtTypeObj = [{CD:'', NM:'전체'}, {CD:'CONT', NM:'내용'}, {CD:'SEND', NM:'보낸사람'}, {CD:'RECV', NM:'받는사람'}, {CD:'FILE', NM:'첨부파일'}];
		var colorObj = {};	//{'IT':'#F15F5F', 'ADMIN':'#F2CB61', 'WORK':'#BCE55C', 'USER':'#B2CCFF'};
		var srchTxtTypeSelectTag = createSelectTag('selSrchTxtType', srchTxtTypeObj, 'CD', 'NM', '', null, colorObj, 80, 'sel_basic w_st06');	//select tag creator 함수 호출 (common.js)
		$("#srchTxtTypeSelectTag").html(srchTxtTypeSelectTag);
		
		
		
		
		//$("#inStartDate").val(new Date().yyyy_mm_dd());
		//$("#inStartDate").bindDate({separator:"-",selectType:"d"});		//위에 input tag 로 만들어준다음에 calendar bind
		$("#inStartDate").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			yearRange: 'c-7:c+7'
			//maxDate: '+1m',
			//minDate: '-7d'
		});	
		var nDate = new Date();
		nDate.setDate(nDate.getDate()-90);
		$("#inStartDate").datepicker('setDate', nDate);
		
		$("#inEndDate").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true,
			yearRange: 'c-7:c+7'
			//maxDate: '+1m',
			//minDate: '+0d'
		});
		$("#inEndDate").datepicker('setDate', new Date());
		
		
	},
	
	
	//화면세팅
    pageStart: function(){
    	/* 
    	//화면 분할 스크립트 splitter 적용
    	$("#MySplitter").splitter({
    		type: "v",
    		outline: true,
    		minLeft: 380, sizeLeft: 500, minRight: 420,
    		resizeToWidth: true,
    		cookie: "vsplitter",
    		accessKey: 'I'
    	}); */
    	
    	//return false;
    	
    	
    	//-------------------------- 그리드 설정 :S ----------------------------
    	/* 그리드 설정정보 */
    	var configObj = {
    		
    		targetID : "SGridTarget",		//그리드의 id
    		
    		//그리드 컬럼 정보
    		colGroup : [
			{key:"tmDt",		formatter:function(obj){			//날짜
									var dt = obj.value;
									if(new Date().yyyy_mm_dd() == dt){
										dt = '<b>오늘</b>(' + dt.substring(5) + ')' ;
									}
									return dt;
									
								}},
			{key:"frstReadStts",formatter:function(obj){
            						var tVal = '';
            						if(obj.item.frstReadStts != '00002')
            							tVal = '<span class="closed_letter"><em>안읽음</em></span>';
            						else
            							tVal = '<span class="open_letter"><em>읽음</em></span>';
            						return tVal;
            					}},
            {key:"readStts",	formatter:function(obj){
            						var tVal = '';
            						/*
            						if(obj.value == 'RECV') 		tVal = '수신&nbsp;';		//<font color="#7401DF">
            						else if(obj.value == 'SEND')	tVal = '발신&nbsp;';		//<font color="#B43104">
            						else 							tVal = 'MY&nbsp;';
            						*/
            						if(obj.item.readStts != '00002')
            							tVal = '<span class="closed_letter"><em>안읽음</em></span>';
            						else
            							tVal = '<span class="open_letter"><em>읽음</em></span>';
            						       						
            						return tVal;
            					}},
            {key:"comment",		formatter:function(obj){
            						var tVal = obj.value;
            						if(obj.item.readStts != '00002') tVal = '<strong>' + tVal + '</strong>';
            						if(obj.item.repCnt > 0) tVal += '<span class="num">' + obj.item.repCnt + '&nbsp;</span>';
            						
            						if(obj.item.importance == 3) tVal = '<span class="state_icon_import"><em>중요메모</em></span>' + tVal;
            						else tVal = '<span class="state_icon_normal"><em>일반메모</em></span>' + tVal;
            						
            						if(!isEmpty(obj.item.files)) tVal += '&nbsp;<img src="<c:url value="/images/work/file_s.gif"/>"/>';
            						
            						return tVal;
								}},
            {key:"grpMem",		formatter:function(obj){
            						var tVal = '';
            						if(obj.item.mType == 'RECV') 		tVal = '<span class="contact_from">' + obj.item.sendNm;
            						else if(obj.item.mType == 'SEND')	tVal = '<span class="contact_to">' + (obj.item.recvNms).split(',')[0];
            						else 								tVal = '<span>나';
            						
            						if(obj.item.grpMemCnt > 1)	tVal += '<em onclick="fnObj.showWhoRecv(' + obj.item.newMainSnb + ');" style="cursor:pointer;" class="icon_count_em" title="' + obj.item.grpMemNms + '\n\n*수신확인 -&gt; 클릭">' + obj.item.grpMemCnt + '</em>';	//메모 그룹내 인원표기(2명이상)
            						tVal += '</span>';
            						return tVal;
            					}}
            ],
            
            body : {
                onclick: function(obj, e){
                	/* ***** obj *****
                		obj.c 		- column index,
						obj.index 	- row index,
						obj.item 	- row data object,
						obj.list 	- grid data object
                	*/
                	
                	//if(obj.c < 3){
                		//상세보기
                    	fnObj.doViewMemo(obj.item.newMainSnb, obj.item.grpMemCnt, obj.item.grpMemNms, obj.item.sNb, obj.item.mainSnb, obj.item.readStts );
                	//}
                	
                }
            }
            
    	};
    	
    	
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr>';
    	rowHtmlStr +=	 '<td class="numst">#[0]</td>';				//날짜
    	rowHtmlStr +=	 '<td>#[1]</td>';							//확인
    	rowHtmlStr +=	 '<td>#[2]</td>';							//확인
    	rowHtmlStr +=	 '<td class="txt_left">#[3]</td>';			//내용
    	rowHtmlStr +=	 '<td style="cursor:default;">#[4]</td>';							//대상자    	
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr;
        
    	
    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
    	//-------------------------- 그리드 설정 :E ----------------------------
    	
    	
    	//-------------------------- 페이징 설정 :S ----------------------------
    	 
    	myPaging.setConfig({				//페이징 설정정보 세팅
    		
			targetID		: "btnPageZone",		//대상 페이징 id ... <div>
			pageSize		: pageSize,				//global variable value 
			
			preEndBtnClass	: 'pre_end_btn',		//맨처음 페이지 	버튼 클래스명
			preBtnClass		: 'pre_btn',			//이전 페이지		버튼 
			nextBtnClass	: 'next_btn',			//다음 페이지		버튼 
			nextEndBtnClass	: 'next_end_btn',		//맨마지막 페이지	버튼 클래스명
			
			curPageNoClass	: 'current',			//현재페이지를 표시해주기위한 style Class name
			clickFnName		: 'fnObj.doSearch'		//페이지 이동 함수명(버튼 클릭)
			
    	});
    	
    	//-------------------------- 페이징 설정 :E ----------------------------
    	
    	/* 
    	//-------------------------- 소팅 설정 :S ----------------------------    	
    	mySorting.setConfig({
			colList : ['cstNm', 'cpnNm', 'custTypeNm', 'lastDt', 'rgDt', 'usrNm'],						//['PROJECT_TYPE', 'END_DATE', 'BUDGET_AMT'],
			classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
			classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
			classNameLowToHigh	: 'sort_lowtohigh',				//내림정렬 아이콘 css class
			defaultSortDirection: 'DESC'						//기본 정렬 방향
		});
    	//-------------------------- 소팅 설정 :E ----------------------------
    	
    	
    	//-------------------------- 모달창 :S -------------------------
    	myModal.setConfig({
    		windowID:"myModalCT",
    		//openModalID:"kkkkk",
    		width:740,
            mediaQuery: {
                mx:{min:0, max:767}, dx:{min:767}
            },
    		displayLoading:true,
            scrollLock: true,
    		onclose: function(){
    			//toast.push("모달 close");

				//if(window[myModal.winID].isSaved == false){		//저장을 안한상태로 창이 닫힐때, 이미 업로드한 파일은 삭제
    			//	window[myModal.winID].fnObj.deleteFile();	//팝업창 내 파일삭제함수 호출.
    			//}    			
    		}
    	});
    	//-------------------------- 모달창 :E -------------------------
    	 */
    	 
    	 
    },//end pageStart.
  	//################# init function :E #################
    
    
    //################# else function :S #################
    
  	//검색
    doSearch: function(page){ 
    	
    	if(page==null) page=1;
    	
    	var startDt = $('#inStartDate').val();			//시작일
    	var endDt = $('#inEndDate').val();				//종료일
    	var srchTxtType = $('#selSrchTxtType').val();	//검색어 타입		...	내용, 보낸사람, 받는사람, 파일
    	
    	var srchTxt = $('#srchTxt').val();				//검색어
    	if(!isEmpty(srchTxt) && srchTxt.length==1){		//검색어가 한글자인 경우
    		alert('검색어는 두글자 이상 입력하시기 바랍니다!');
    		$('#srchTxt').focus();
			return;
    	}
    		
    	    	
    	var url = contextRoot + "/work/getMemoList.do";
    	var param = {
		    			pageSize: pageSize,
		    			pageNo:	page,
    			
    					memoType: g_memoType,					//메모타입		''(전체), 'RECV'(수신), 'SEND'(발신), 'MY'(내)
    					startDt: startDt,						//시작일
    					endDt: endDt,							//종료일
    					srchTxtType: srchTxtType,				//검색어 타입
    					srchTxt: srchTxt,						//검색어
    					noRead: g_isOnlyNoRead,					//미확인건 메모	'Y': 미확인메모만 보기,  그외('','N') 는 모두 보기
    					lastRepOrdr: g_isLastReplyOrder			//최신댓글순 정렬 'Y': 최신댓글순,  그외('','N') 는 시간정렬
		    		};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		  
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    	    
    		    		
    		curPageNo = obj.pageNo;			//현재페이지세팅(global variable)
    		
    		
    		var pageObj = {						//페이징 데이터
					pageNo : curPageNo,
					pageSize : pageSize,
					pageCount: obj.pageCount
				};
    		
    		//alert(JSON.stringify(pageObj));
    		//return;
    		
    		//alert(JSON.stringify(list));
    		//return;
    		
    		
    		myPaging.setPaging(pageObj);		//페이징 데이터 세팅	*** 1 ***
    		
    		myGrid.setGridData({				//그리드 데이터 세팅	*** 2 ***
								list: list,		//그리드 테이터
								page: pageObj	//페이징 데이터
    						});
    		
    		//alert(JSON.stringify(list));
    		
    		//mySorting.clearSort();			//소팅초기화
			//mySorting.applySortIcon();		//소팅화면적용
			
			
			//전체 건수 세팅
			$('#total_count').html(obj.totalCount);
    		
			
			//가장 최근것 선택되도록
			$($($('#SGridTarget > tbody').children('tr')[0]).children('td')[1]).trigger('click');
    		
    	};
    	
    	
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	
    	
    	commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	//commonAjax("POST", url, param, callback, true, null, null);
    	
    },//end doSearch
       
    
    //click Tab
    clickTab: function(type){		//''(전체), 'RECV'(수신), 'SEND'(발신), 'MY'(내)
    	
    	g_memoType = type;		//전역변수 세팅
    	fnObj.setTab();			//tab 변경
    
    	g_isOnlyNoRead = '';	//미확인건 보기 초기화.
    	
    	fnObj.doSearch();		//검색
    },
    
    
    //set Tab				g_memoType = '';  ...	''(전체), 'RECV'(수신), 'SEND'(발신), 'MY'(내)
    setTab: function(){
    	
    	$('#liTypeALL').removeClass('on');
    	$('#liTypeRECV').removeClass('on');
    	$('#liTypeSEND').removeClass('on');
    	$('#liTypeMY').removeClass('on');
    	
    	if(g_memoType == ''){
    		$('#liTypeALL').addClass('on');
    	}else{
    		$('#liType' + g_memoType).addClass('on');
    	}
    },
    
    
    //미확인 건 보기
    getNoRead: function(k){
    	
    	if(k==1){
    		g_isOnlyNoRead = 'Y';		//미확인건 보기 전역변수 세팅
    		
    		//버튼 상태 스타일
    		$('#readSttsAll').removeClass('on');
        	$('#readSttsNo').addClass('on');
        	
    	}else{
    		g_isOnlyNoRead = '';		//전체 보기
    		
    		//버튼 상태 스타일
    		$('#readSttsAll').addClass('on');
        	$('#readSttsNo').removeClass('on');
    	}
    	
    	
    	fnObj.doSearch();				//검색
    },
    
    
  	//최신댓글순 보기( 토글 )
    getNewReplyOrder: function(){
    	
    	if(g_isLastReplyOrder==''){
    		g_isLastReplyOrder = 'Y';		//미확인건 보기 전역변수 세팅
    		
    		//버튼 상태 스타일
    		$('#newReplyOrder').addClass('on');
    		$('#newReplyOrderTxt').html('ON');
    		$('#newReplyOrderTxt').css('color', 'red');
    		        	
    	}else{
    		g_isLastReplyOrder = '';		//전체 보기
    		
    		//버튼 상태 스타일
    		$('#newReplyOrder').removeClass('on');
    		$('#newReplyOrderTxt').html('OFF');
    		$('#newReplyOrderTxt').css('color', 'black');
    	}
    	
    	
    	fnObj.doSearch();				//검색
    },
    
    
    //메모 상세 보기
    doViewMemo: function(newMainSnb, grpMemCnt, grpMemNms, sNb, mainSnb, readStts){
    	
    	//전역변수 설정
    	g_mainSnb = mainSnb;				//ib_comment.main_snb		(메모 건의 대표 row 데이터 ... 0 이면 내가최초등록자)   
		g_sNb = sNb;						//ib_comment.s_nb			(메모 건의 대표 row 데이터 ... ib_comment 의 시퀀스)
    	
    	
    	
    	//헤드 라인 세팅
    	$('#dtlGrpMemCnt').html(grpMemCnt);			//대화참여수
    	
    	if(grpMemCnt > 1)							//대화참여자 세팅
    		$('#dtlGrpMemNms').html(grpMemNms);
    	else
    		$('#dtlGrpMemNms').html('나');
    	
    	
    	//메모확인(읽음) 버튼
    	if(readStts == '00001'){
    		$('.btn_readcheck').show();		//보이도록
    	}else{
    		$('.btn_readcheck').hide();		//숨김
    	}
    	
    	
    	
    	//데이터 가져오기
    	    	
    	var url = contextRoot + "/work/getMemoDetail.do";
    	var param = {
		    			mainSnb: newMainSnb
		    		};
    	
    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		  
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
    	    
    		
    		//alert(JSON.stringify(list));
    		//return;
    		
    		
    		//상세 내용 뿌리기 ---------------------------------------------------------------
    		/*
    		<div class="communiBox">
	            <div class="pic"></div>
	            <ul class="conBox">
	                <li class="nametime"><strong>김창희</strong><span>19:42</span><span class="count">1</span></li>
	                <li class="bubble"><span class="arrow"></span>고객님께서는 2015년 09월 11일 상품가입시(KB국민 「민」체크카드(비RF)) </li>
	            </ul>
	        </div>
	        
	        <p class="flow_filedown">이주훈 님이 <a href="#">Photos.zip</a>파일을 보냈습니다.</p>
	        
	        */
	        
	        //채팅창 초기화
	        var chatObj = $('#chatContent'); 
	        chatObj.html('');
	        
	        document.fileNcomment.reset();		//파일 폼 초기화
			$('#file_list').html('');			//파일표시 초기화
			 
	        
	        var oneChat = '';
	        var preNm = '';
	        var timeLineDay = '';
	        
	        for(var i=0; i<list.length; i++){
	        	
	        	if(list[i].dt.substr(0,10) != timeLineDay){			//새로운 날일때 날짜 추가
	        		timeLineDay = list[i].dt.substr(0,10);
	        		
	        		chatObj.append('<p class="flow_date"><span>' + timeLineDay + (timeLineDay==new Date().yyyy_mm_dd()?' (오늘)':'') + '</span></p>');		//time line 추가
	        		
	        		preNm = '';		//이름 초기화 (날이 달라져서 타임라인이 찍히면 무조건 이름을 찍어준다.)
	        	}
	        	
	        	if(list[i].isFile != 'Y'){	// 메모 ----------------------
	        		
	        		oneChat = '<div class="communiBox';
		        	if(list[i].name == g_staffNm)
						oneChat += 'Right">';				//내가 쓴글(오른쪽)
					else
						oneChat += '">';					//다른이 글(왼쪽)
					
					if(preNm != list[i].name && list[i].name != g_staffNm)					
						oneChat += '<div class="pic"></div>';
						
					oneChat += '<ul class="conBox"><li class="nametime">';
					if(preNm != list[i].name && list[i].name != g_staffNm)					
						oneChat += '<strong>' + list[i].name + '</strong>';
					
					oneChat += '<span>' + list[i].dt.substr(10) + '</span></li><li class="bubble"><span class="arrow"></span>';
					oneChat += list[i].comment.replace(/(?:\r\n|\r|\n)/g, '<br />') + '</li></ul></div>';
	        		
	        	}else{		// 파일 ---------------------------------------
	        		
	        		oneChat = '<p class="flow_filedown">' + list[i].name + '님이 <a href="javascript:fnObj.fileDown(\'';
	        		oneChat += list[i].mkNm + '\');">' + list[i].comment + '</a> 파일을 보냈습니다.</p>';	        		
	        	}
	        	
	        	preNm = list[i].name;
	        	
				
				chatObj.append(oneChat);					//한건의 채팅 메모 추가
	        }
	        
	        
	        //채팅창 스크롤 가장아래로 ...최신것보이게
	        chatObj[0].scrollTop = chatObj[0].scrollHeight;
    		
    	};	//callback
    	
    	/*
    	//로딩 이미지 보여주기 위한 리스너 함수 :S -----------
    	var beforeFn = function(){
    		// 로딩 이미지 보여주기 처리
    		$('.wrap-loading', parent.mainFrame.document).removeClass('display-none');
    	};
    	var completeFn = function(){
    		// 로딩 이미지 감추기 처리
	        $('.wrap-loading', parent.mainFrame.document).addClass('display-none');
    	};
    	//로딩 이미지 보여주기 위한 리스너 함수 :E -----------
    	*/
    	
    	//commonAjax("POST", url, param, callback, true, beforeFn, completeFn);
    	commonAjax("POST", url, param, callback, true, null, null);
    	
    },
    
    
    //파일다운
    fileDown: function(mkNm){
    	var url = '../work/downloadProcess.do';
		window.open(url + "?recordCountPerPage=0&makeName=" + mkNm, "_self", "");
    },
    
    
    //기간 칼렌다 버튼
	popCalendar: function(k){
		if(k=='start'){
			$('#inStartDate').datepicker('show');
		}else{
			$('#inEndDate').datepicker('show');
		}
	},
    
    
    //기간콤보변경
    chngPeriod: function(){
    	
    	var nDate = new Date();
		nDate.setDate(nDate.getDate() - $('#selPeriod').val());			//오늘부터 ~일 전의 날짜를 구한다.
		$("#inStartDate").datepicker('setDate', nDate);
    	
		fnObj.doSearch();		//검색
    },
    
    
  	//기간직접변경
    chngPeriodDirect: function(){
    	
    	$('#selPeriod').attr('onchange','');					//이벤트 없애고
    	
    	$('#selPeriod').val('');								//기간을 ''(기간) 으로 바꾼다음
    	
    	$('#selPeriod').attr('onchange','fnObj.chngPeriod()');	//이벤트 재탑재
    	
    },
    
    
    //댓글달기
    addReply: function(){
    	
    	var memoArea = $('#memoComment');
    	if(isEmpty(memoArea.val().trim())){		//검색어가 한글자인 경우
    		alert('내용을 입력하시기 바랍니다!');
    		memoArea.focus();
			return;
    	}
    	
    	
    	//return;
    	
    	//onclick="reply('${workVO.sNb}','${workVO.mainSnb}','${userLoginInfo.name}',this)"
    	//function reply(mainSnb,		rebSnb,				 rgNm, 					th,f){
    	
    	var mainSnb = g_mainSnb;		//ib_comment.main_snb	(메모 건의 대표 row 데이터 ... 0 이면 내가최초등록자)
    	var sNb = g_sNb;				//ib_comment.s_nb		(메모 건의 대표 row 데이터 ... ib_comment 의 시퀀스)
    	var rgNm = g_staffNm;			//사용자명
    	
    	
    	if(isEmpty(sNb) || isEmpty(mainSnb)){		//댓글을 달 메모를 선택한 상태인지
    		alert('메모가 선택되지 않았습니다!');    		
			return;
    	}
    	
    	
    	
		//if(parseInt(mainSnb)>0){		//전달받은 메모에 답장 달때
		var	DATA = {
					sNb: sNb,
					mainSnb: mainSnb,
					sttsCd: '00002'			//읽음상태
					//rgId: $('#rgstId').val(),
					//importance: $(th).next().find('[id^=importance]').val(),
					//focus: obj.find('[id^=MM_]').attr('id').split('_')[1]
					};
		
		var	url = contextRoot + "/work/updateMemoStatus.do";
		
		/*}else{							//최초 내가 작성한 메모에 답글 달때
			
			DATA = {
					mainSnb: sNb,
					sttsCd: '00002',
					rgId: $('#rgstId').val(),
					focus: obj.find('[id^=MM_]').attr('id').split('_')[1]
					};
			url = "../work/checkReply.do";
		}*/
		var fn = function(arg){
			
			//subInsertReply(mainSnb,rebSnb, rgNm, replyMemo,f,arg);
			
			
			
			//--------------------------------------------------
			
			//function subInsertReply(mainSnb,rebSnb, rgNm, replyMemo,f,arg){
				//전달된 메모에 답장달때, 메모전달한 당사자가 답글 달때
				//if(replyMemo.trim()!==''){
					//console.log("메모에 답장달때");
					var param = {
							memoSndName: rgNm,
							mainSnb: mainSnb,
							sNb: sNb,
							comment: memoArea.val()
							//rgId: $('#rgstId').val()
					};
					var url2 = contextRoot + "/work/insertMemoReply.do";
					var fn2 = function(){
						//$('#m_categoryCd').val('00005');
						//memoActAfterSave(f);
						
						var fileHtml = $("#file_list").html();
						//console.log(fileHtml);
						if(fileHtml!='undefined'&&fileHtml!=''){		//첨부하려는 파일이 있을때
							//if(f==='popUpMemo') $("#m_rtn").val('work/popUpMemo');
							//else $("#m_rtn").val('work/selectPrivateWorkV');
							
							//alert('파일등록 추가!!!');
							//$("#multiFile_N_comment").submit();		//파일등록
							
							//$(function(){
								//폼전송
								$('#multiFile_N_comment').ajaxForm({
									//보내기전 validation check가 필요할경우
							        beforeSubmit: function (data, frm, opt) {
										                //alert("전송전!!");
										                //return true;
									              },
						            //submit이후의 처리
						            success: function(responseText, statusText){
						            	//alert("전송성공!!");
						            	
						            	//메모 목록 선택건 읽음전환 후 재클릭(상세보기 반영) 
						    			fnObj.readSelMemoNClick();
					                	
										
										//입력 내용 area 초기화
										memoArea.val('');					//입력메모
										document.fileNcomment.reset();		//파일 폼 초기화
										$('#file_list').html('');			//파일표시 초기화
										
						            },
						            //ajax error
						            error: function(){
						            	alert("파일전송에 실패하였습니다!");
						            }                               
						          });
								
							$("#multiFile_N_comment").submit();		//파일등록
								
							//});
							
						}else{						//첨부하려는 파일이 없을때

							//메모 목록 선택건 읽음전환 후 재클릭(상세보기 반영) 
						    fnObj.readSelMemoNClick();
							
							
							//입력 내용 area 초기화
							memoArea.val('');
							
						}
						
					};
					
					//ajaxModule(param, url2, fn2);
					commonAjax("POST", url2, param, fn2);
					
				/* }else{
					$('#focus').val(arg);
					if(f==='popUpMemo') document.modifyRec.action = "popUpMemo.do";
					else document.modifyRec.action = "selectPrivateWorkV.do";
					document.modifyRec.submit();
				} */
			//}
			
			//--------------------------------------------------
		};
		
		//ajaxModule(DATA, url, fn);
    	commonAjax("POST", url, DATA, fn);
    	    	 
    },
    
    
    //메모 목록 선택건 읽음전환 후 재클릭(상세보기 반영) 
    readSelMemoNClick: function(){
    	
    	//선택한 그리드 row 재클릭(데이터 재로딩 변경 반영)
		var rIdx = myGrid.getSelectRowIndex();
    	
		if(rIdx > -1){
			
			//그리드 데이터(json)를 읽음으로 전환하여 반영한다. (DB에서 다시 읽은것은 아니다... 저장됐다는 결과가 있으니)
			var rDt = myGrid.getList()[rIdx];	//행 데이터
			rDt.readStts = '00002';				//상태값 전환		'00002' 읽음
			myGrid.refresh();					//화면 반영
			myGrid.setSelectRow(rIdx);			//원래 선택상태로
			
			
			var trObj = $($('#SGridTarget > tbody').children('tr')[rIdx]);
			//재클릭 이벤트
			$(trObj.children('td')[1]).trigger('click');
			
			/* 			
			var trObj = $($('#SGridTarget > tbody').children('tr')[rIdx]);
			
			//재클릭
			$(trObj.children('td')[1]).trigger('click');
		
			//행을 읽음 스타일로 (굵은표시 >> 얇게) (상태 오픈 메모)
	    	
	    	var content = trObj.html();
	    	trObj.html(content.replace(/<strong>/gi,'').replace(/<\/strong>/gi,'').replace('closed_letter','open_letter'));	//굵은표시 >> 얇게  && 닫힌편지 >> 열린편지 */
		}
    },
    
    
    //메모 읽음 저장
    doRead: function(){
    	
    	var mainSnb = g_mainSnb;		//ib_comment.main_snb	(메모 건의 대표 row 데이터 ... 0 이면 내가최초등록자)
    	var sNb = g_sNb;				//ib_comment.s_nb		(메모 건의 대표 row 데이터 ... ib_comment 의 시퀀스)
    	    	
    	
    	if(isEmpty(sNb) || isEmpty(mainSnb)){		//댓글을 달 메모를 선택한 상태인지
    		alert('메모가 선택되지 않았습니다!');    		
			return;
    	}
    	
    	
		var	DATA = {
					sNb: sNb,
					mainSnb: mainSnb,
					sttsCd: '00002'
					};
		
		var	url = contextRoot + "/work/updateMemoStatus.do";

		var fn = function(arg){
			
			toast.push("메모확인 되었습니다!");
			
			//fnObj.doSearch();		//재검색
			
			//메모 목록 선택건 읽음전환 후 재클릭(상세보기 반영) 
		    fnObj.readSelMemoNClick();
		};
		
    	commonAjax("POST", url, DATA, fn);
    	
    },
    
    
    //수신확인자 팝업
    showWhoRecv: function(mainSnb){
    
    	var url = contextRoot + "/work/getMemoRecvInfo.do";
    	var param = {mainSnb: mainSnb};
    	
    	    	
    	var callback = function(result){
    		
    		var obj = JSON.parse(result);
    		    		
    		var cnt = obj.resultVal;		//결과수
    		var list = obj.resultList;		//결과데이터JSON
			
    		if(list.length > 0){
    			
				////////////////////////////////팝업 오픈 /////////////////////////////////////
   				var url = "<c:url value='/work/memoRecvInfoPopup.do'/>";
        		var params = {};
				
				params.list = JSON.stringify(list);				//선택한 고객리스트 														/***** param 1 *****/
   	        	   	        	
   	        	myModal.open({
   	        		url: url,
   	        		pars: params,
   	        		titleBarText: '참여자 수신 확인',		//titleBarText 속성 추가하였음.(원 Axisj에는 없었던것)
   	        		method:"POST",
   	        		top: 150,
   	        		width: 300,
   	        		closeByEscKey: true				//esc 키로 닫기
   	        	});
   	        	    	
   	        	$('#myModalCT').draggable();
					
    		}
    	};
    	
    	
    	commonAjax("POST", url, param, callback, true);
    	
    }
    
    
    
  	//################# else function :E #################
  	
  	
    
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearch(1);		//검색
	
});
</script>