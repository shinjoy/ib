<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/new_style.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript">
//레이어 보였다 안보였다
	function showlayer(id)
	   {if(id.style.display == 'none')
		   {id.style.display='block';}
		   else{id.style.display = 'none';}
	   }
</script>
<style>
body {font-size:0.75em; line-height:160%; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; color:#555;}

.vm_typho { vertical-align:middle; }
.vm_typho input, label { vertical-align:middle; }
/******************인풋, 셀렉트모음********************/
.input_s_b { border:#b5b5b5 solid 1px; vertical-align:middle; height:28px; box-sizing:border-box; font-size:12px; letter-spacing:-0.05em; color:#787878; padding:5px; line-height:18px; }
.sel_basic { border:#b5b5b5 solid 1px; vertical-align:middle; height:28px; box-sizing:border-box; font-size:12px; letter-spacing:-0.05em; color:#787878; padding:5px; line-height:18px; }
.w_date { width:82px; }
.w200px { width:200px; }
.w240px { width:240px; }
.w20pro { width:20%; }
.w30pro { width:30%; }
.w100pro { width:100%; }
.f_redPoint { color:#fc5262; }
.f_bluePoint { color:#4565d0; }

/* 게시판 인풋관련 */
.money_input_b { width:165px; border:#dadada solid 1px; height:21px; font-family:Tahoma, Geneva, sans-serif; font-size:11px; letter-spacing:0; text-align:right; margin-right:6px; padding-right:4px; color:#666666; }
.yesno_select { border:#c2c2c2 solid 1px; width:38px; height:23px; color:#858585; box-sizing:border-box; }
.select_b { border:#c2c2c2 solid 1px; height:23px; color:#858585; box-sizing:border-box; }
.period { font-size:11px; letter-spacing:-0.6px; }
.input_b {height:23px; border:#c2c2c2 solid 1px!important; text-indent:4px; box-sizing:border-box; }
.input_b[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_b2 {height:23px; border:#c2c2c2 solid 1px; text-indent:4px; box-sizing:border-box; }
.input_b2[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b2[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_b3 {height:23px; border:#c2c2c2 solid 1px; padding-left:4px; box-sizing:border-box; }
.input_b3[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_b3[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.input_mrb {height:23px; border:#c2c2c2 solid 1px; box-sizing:border-box; text-align:right; padding-right:4px; }
.input_mrb[disabled] { border:#c2c2c2 solid 1px; background:#f3f3f3; }
.input_mrb[readonly] { border:#c2c2c2 solid 1px; background:#f3f3f3; }

.radio_list { margin-right:10px; }
.radio_list label { margin-left:25px;  *margin-left:10px; }
.radio_list label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list label:first-child { margin-left:0px; }

.radio_list2 label { margin-left:15px;  *margin-left:10px; vertical-align:middle; display:inline-block; }
.radio_list2 label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list2 label:first-child { margin-left:0px; }
.radio_list2 label input, .radio_list2 label span, .radio_list2 label em { vertical-align:middle; }

.radio_list3 { float:none; *zoom:1; width:100%; }
.radio_list3:after { content:""; display:block; clear:both; height:0;}
.radio_list3 label { margin-right:15px;  *margin-right:10px; vertical-align:middle; display:inline-block; float:left; }
.radio_list3 label input { margin-right:3px; border:none; *margin-right:0px; *paddnig:0px; }
.radio_list3 label input, .radio_list3 label span, .radio_list3 label em { vertical-align:middle; }

.txtarea_b { border:#c2c2c2 solid 1px; height:90px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b2 { border:#c2c2c2 solid 1px; height:150px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b3 { border:#c2c2c2 solid 1px; height:60px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }
.txtarea_b4 { border:#c2c2c2 solid 1px; height:240px; line-height:16px; color:#858585; padding:4px; box-sizing:border-box; text-align:left; }

/* 버튼모음 */
.btn_baordZone2 { margin-top:20px; text-align:center; margin-bottom:20px; }
.btn_baordZone2 a { border-radius:2px; letter-spacing:-0.8px; color:#fff; padding:6px 15px 7px; line-height:16px; height:16px; font-size:12px; vertical-align:middle; margin-left:10px; display:inline-block; min-width:60px;  }
.btn_baordZone2 a:first-child { margin-left:0px; }

.btn_blueblack { background:#59647a; }
.btn_blueblack2 { background:#33577b; }
.btn_witheline { border:#bdc3d1 solid 1px; color:#232c3f!important; }
.btn_grayline { background:#efefef; border:#bfbfbf solid 1px; color:#232c3f!important;  }


.btnZoneBox { text-align:center; margin-top:25px; }
.btnZoneBox a { display:inline-block; margin-left:9px; text-align:center; vertical-align:middle; line-height:1.6; }
.btnZoneBox a:first-child { margin-left:0px; }
.btnPageZone + .btnZoneBox { border-top:#7f7f7f solid 1px; padding-top:25px; }

.p_blueblack_btn { background:#59647a; border:#4f5a6f solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_blueblack2_btn { background:#33577b; border:#58637b solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_bluelight_btn { background:#2574ab; border:#1b6fa9 solid 1px; border-radius:2px; color:#ffffff!important; padding:4px 12px 3px; min-width:56px; }
.p_withelin_btn { border:#bdc3d1 solid 1px; color:#232c3f!important; border-radius:2px; padding:4px 12px 3px; min-width:56px; }
.p_grayline_btn {background:#efefef; border:#bfbfbf solid 1px; color:#232c3f!important; border-radius:2px; padding:4px 12px 3px; min-width:56px; }

/* 지출입력 메모팝업 */
.memoAreaWrap { border-top:#dadada dashed 1px; margin-top:12px; margin-bottom:10px; }
.memoAreaWrap h4.memotitle { font-weight:bold; color:#202020; margin-top:10px; margin-bottom:5px; font-size:11px; }
.memoAreaWrap .btnzone { text-align:center; margin-top:10px; }
.memoAreaWrap .btnzone a { display:inline-block; margin-left:5px; vertical-align:middle; height:18px; border:#cfcfcf solid 1px; border-radius:2px; }
.memoAreaWrap .btnzone a:first-child { margin-left:0px; }
.memoAreaWrap .btnzone .btn_s_type_g { background:#fff; border:#c4c4c4 solid 1px; border-radius:2px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:1; }


.memoWrap2 { border:#3054a1 solid 2px; position:relative; background:#fff; z-index:3; zoom:1; /*box-shadow:8px 8px 6px rgba(0, 0, 0, 0.5); border:#20304a solid 1px;*/ }
.memoWrap2 h1 { background:#20304a; color:#3054a1; padding:7px 15px; height:26px; font-size:12px; line-height:16px; height:16px; }
.memoWrap2 .mo_container { margin:0 15px; padding:0px 0 25px; }
.memoWrap2 .mo_footer { border-top:#dadada solid 1px; padding-bottom:30px; }
.memoWrap2 .pop_title { height:17px; line-height:17px; background:#3054a1 url(../images/common/memo_dot_poptitle.gif) no-repeat 15px center; color:#fff; font-size:14px; border-bottom:#d5d8db solid 2px; padding:15px 15px 15px 30px; font-weight:bold; font-family:"나눔고딕"; }
.memoWrap2 .popup_close { background:url(../images/common/memo_popup_close.gif) no-repeat; width:13px; height:13px; padding:5px; position:absolute; right:10px; top:15px; display:inline-block; }
.memoWrap2 .popup_close em { display:none; }

.tb_memo { width:100%; border-collapse:collapse; border-spacing:0; }
.tb_memo caption { height:0; width:0; overflow:hidden; display:none; }
.tb_memo tbody td { padding:9px 12px; text-align:left; vertical-align:top; text-align:left; font-size:11px; color:#737373; font-weight:bold; font-size:12px; }
#memoSpending {  }

/*직원상세보기*/
.set_tempWrap2 { padding:30px; }
.wk_perform_title { font-family:"돋움"; border-bottom:#516279 solid 3px; background:#6a798e; padding:11px 0px 9px 15px; border-top-left-radius:8px; border-top-right-radius:8px; color:#fff; vertical-align:middle; }
.wk_perform_title .name { font-weight:bold; font-size:14px; line-height:14px;  }
.wk_perform_title .select_b { height:21px; line-height:21px; border:none; }
.wk_perform_title .sp_des { font-size:12px; line-height:14px; vertical-align:middle; font-weight:normal; color:#c4ccd7; margin-left:10px; }

.wk_perform_tb { width:100%; }
.wk_perform_tb tr { background:#f3f5f6; border:#c8ced8 solid 1px; border-top:none; }
.wk_perform_tb th { text-align:left; letter-spacing:-0.05em; padding:7px 0; color:#3b4354; font-size:12px;  }
.wk_perform_tb td { text-align:right; letter-spacing:0em; padding:7px 0; color:#6f7175; font-size:12px;  }
.wk_perform_tb td .sub_title { border-left:#cfcfcf solid 1px; padding:0 15px 0 15px; color:#797979; }
.wk_perform_tb td .sub_moneysum {   padding:0 40px 0 0; color:#3b4354; }
.wk_perform_tb td .sub_moneysum.red { color:#eb2700; }

.wk_perform_tb .title_row th { background:url(../images/support_w/th_icon_closed.gif) no-repeat 15px center; padding-left:31px; }
.wk_perform_tb .title_row .txt_sum_money { color:#eb2700; }

.wk_perform_tb .title_row + tr { border:none; }
.wk_perform_tb .title_row + tr td { padding:0; }
.wk_perform_tb .title_row + tr td .wk_performance_wrap  { display:none; }

.wk_perform_tb .title_row.select_row { background:url(../images/mypage/bg_wk_perform_tb.gif) repeat-x center center; border-bottom:#999ca1 solid 1px; }
.wk_perform_tb .title_row.select_row + tr { border:#b8bfcc solid 1px; }
.wk_perform_tb .title_row.select_row + tr td { padding:7px 0; }
.wk_perform_tb .title_row.select_row + tr td .wk_performance_wrap { display:block; }

.wk_perform_tb .title_row.select_row th { background:url(../images/support_w/th_icon_open.gif) no-repeat 15px center; font-size:12px; padding-left:31px; color:#101010; letter-spacing:0em; }
.wk_perform_tb .title_row.select_row td { font-size:12px; }
.wk_perform_tb .title_row.select_row .txt_sum_money { color:#eb2700; }
.wk_perform_tb .title_row.select_row + tr th, .wk_perform_tb .title_row.select_row + tr td { padding:0; background:#fff; }

.wk_performance_wrap { overflow:hidden; width:100%;  }
.wk_perform_tb2 { width:100%; }
.wk_perform_tb2 tr { border:none; }
.wk_perform_tb2 thead th { text-align:center; border-left:#cecece solid 1px; border-bottom:#cecece solid 1px; background:url(../images/mypage/bg_wk_performance_wrap_top.gif) repeat-x 0 -1px #e8e8e8!important; color:#4c4c4c; padding:7px!important; font-size:11px; }
.wk_perform_tb2 thead th:first-child { border-left:none; }
.wk_perform_tb2 thead tr:first-child th { border-top:none; }
.wk_perform_tb2 tbody tr:first-child th, .wk_perform_tb2 tbody tr:first-child td { border-top:none; }
.wk_perform_tb2 tbody th { text-align:center; border-top:#dadada solid 1px; border-right:#cecece solid 1px; }
.wk_perform_tb2 tbody td {text-align:center;  border-left:#e6e6e6 solid 1px; border-top:#dadada solid 1px; padding:4px 7px!important; vertical-align:top; color:#797979; }
.wk_perform_tb2 .memoBtn { background:url(../images/mypage/icon_memo_add.gif) no-repeat center center; width:25px; height:17px; display:inline-block; margin-left:-5px; }
.wk_perform_tb2 .memoBtn em { display:none; }
.wk_perform_tb2 .memoCon a { color:#0a6eae; }
.wk_perform_tb2 .txt_left { text-align:left; }
.wk_perform_tb2 .txt_right { text-align:right; }
.wk_perform_tb2 .txt_center { text-align:right; }
.wk_perform_tb2 .txt_money  { text-align:right; color:#eb2700; }
.wk_perform_tb2 .txt_invest_money { color:#202020; text-align:right;}
.wk_perform_tb2 .icon_cowork { background:url(../images/mypage/icon_cowork.gif) no-repeat center center; width:24px; height:15px; display:inline-block; vertical-align:middle; margin-right:4px; }
.wk_perform_tb2 .icon_cowork em { display:none; }
.wk_perform_tb2 .vm { vertical-align:middle; }
.wk_perform_tb2 .vm input, .wk_perform_tb2 .vm span { vertical-align:middle; }
.wk_perform_tb2 .vm input + span { margin-left:2px; }

.wk_perform_tb2 tfoot th { padding:5px 7px!important; color:#3b4354; border-top:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; background:url(../images/mypage/bg_wk_performance_wrap_bottom.gif) repeat-x 0 bottom #f9f9f9!important; text-align:center; }
.wk_perform_tb2 tfoot td { padding:5px 7px!important; color:#3b4354; border-top:#c3c6cd solid 1px; border-left:#c3c6cd solid 1px; text-align:center; background:url(../images/mypage/bg_wk_performance_wrap_bottom.gif) repeat-x 0 bottom #f9f9f9!important; }
.wk_perform_tb2 tfoot .txt_sum_money { color:#eb2700; font-weight:bold; text-align:right; }

.total_wk_tb_wrap { margin-top:20px; text-align:right; }

.total_wk_perform { border-bottom:#9298a2 solid 1px; display:inline-block; border:#b9c1ce solid 1px; }
.total_wk_perform th { font-weight:normal; background:#d8dce3; padding:5px 10px 5px; border-top:#b9c1ce solid 1px; border-left:#b9c1ce solid 1px; line-height:1.4; text-align:center; font-size:12px;  }
.total_wk_perform th.bg_gray { background:#e7e9ec; font-weight:normal; font-size:12px; }
.total_wk_perform td { border-top:#b9c1ce solid 1px; border-left:#dadada solid 1px; padding:15px 7px 8px 7px; color:#797979; text-align:right; font-size:14px; min-width:100px; font-weight:bold; }
.total_wk_perform th:first-child { border-left:none; font-weight:bold; }
.total_wk_perform tr:first-child th, .total_wk_perform tr:first-child td { border-top:none; }
.total_wk_perform .txt_money_red { color:#eb2b2b; }
.total_wk_perform .txt_money_black { color:#202020; }
.txt_center { text-align:center!important; }
</style>

<div class="set_tempWrap2">
	<!--직원성과 상세보기-->
	<h4 class="wk_perform_title">
		<span class="name"><label for="IDNAME01">유대준 성과표</label></span>
		<select class="select_b w_date mgl20" id="IDNAME01" title="연도선택">
			<option>2015년</option>
			<option>2015년</option>
			<option>2015년</option>
		</select>
		<span class="sp_des mgl10">(수익기준 : 당해투자분 10%)</span>
	</h4>
	<%--<h3 class="h3_table_title"><label for="IDNAME01">유대준 성과표</label>
		<select class="select_b w_date" id="IDNAME01" title="연도선택">
			<option selected="">2016</option>
			<option>2015</option>
			<option>2014</option>
			<option>2013</option>
			<option>2012</option>
		</select><span class="mgl10">(수익기준 : 당해투자분 10%)</span></h3>--%>
	<table class="wk_perform_tb" summary="직원성과 상세안내(규묘, 수익, 기여수익, 합계)">
		<caption>업무성과 상세안내</caption>
		<colgroup>
			<col width="12%" />
			<col width="80" />
			<col width="5%" />
			<col width="80" />
			<col width="5%" />
			<col width="105" />
			<col width="5%" />
			<col width="*" />
		</colgroup>
		<tr class="title_row">
			<th scope="row">메자닌</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="메자닌 성과안내">
						<caption>메자닌 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--종목-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--투자구분-->
							<col width="*" /> <!--규모-->
							<col width="4%" /> <!--수익률-->
							<col width="*" /> <!--시너지수익-->
							<col width="5%" /> <!--소싱-->
							<col width="5%" /> <!--매각-->
							<col width="5%" /> <!--역할-->
							<col width="4%" /> <!--배분-->
							<col width="*" /> <!--기여수익-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">회사</th>
								<th scope="col">유형</th>
								<th scope="col">투자구분</th>
								<th scope="col">규모</th>
								<th scope="col">수익률</th>
								<th scope="col">시너지수익</th>
								<th scope="col">소싱</th>
								<th scope="col">분석</th>
								<th scope="col">역할</th>
								<th scope="col">배분</th>
								<th scope="col">기여수익</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="7" scope="row">상장</th>
								<td>2016/02/24</td>
								<td>다날</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>코아로직</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>파인디앤씨</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>진원생명과학</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>코디엠</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>디아이씨</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>SGA솔류션즈</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<th rowspan="2" scope="row">비상장</th>
								<td>2016/02/24</td>
								<td>500V</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>네오리젠바이오텍</td>
								<td>CB</td>
								<td>직접투자</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>20,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>	
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_invest_money" colspan="5"><strong>2,500</strong></td>
								<td class="txt_sum_money" colspan="2">37.50</td>
								<td class="txt_sum_money" colspan="5">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
		<tr class="title_row">
			<th scope="row">중개</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="중개 성과안내">
						<caption>중개 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--종목-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--투자구분-->
							<col width="*" /> <!--규모-->
							<col width="*" /> <!--매각-->
							<col width="*" /> <!--시너지수익-->
							<col width="5%" /> <!--소싱-->
							<col width="5%" /> <!--매각-->
							<col width="5%" /> <!--역할-->
							<col width="4%" /> <!--배분-->
							<col width="*" /> <!--기여수익-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">종목</th>
								<th scope="col">유형</th>
								<th scope="col">투자구분</th>
								<th scope="col">규모</th>
								<th scope="col">매각</th>
								<th scope="col">시너지수익</th>
								<th scope="col">소싱</th>
								<th scope="col">매각</th>
								<th scope="col">역할</th>
								<th scope="col">배분</th>
								<th scope="col">기여수익</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="2" scope="row">중개</th>
								<td>2016/02/24</td>
								<td>드래곤플라이</td>
								<td>CB</td>
								<td>중개</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>2,000</span></span></td>
								<td class="txt_right">510.00</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">7.00%</td>
								<td class="txt_money">0.70</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/07/04</td>
								<td>형지엘리트</td>
								<td>&nbsp;</td>
								<td>중개</td>
								<td class="txt_invest_money">500</td>
								<td class="txt_right">2,040.00</td>
								<td class="txt_money">7.50</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">7.00%</td>
								<td class="txt_money">2.80</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_invest_money" colspan="5"><strong>2,500</strong></td>
								<td class="txt_sum_money" colspan="2">37.50</td>
								<td class="txt_sum_money" colspan="5">3.50</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
		<tr class="title_row">
			<th scope="row">M&amp;A</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="M&A 성과안내">
						<caption>M&amp;A 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--종목-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--투자구분-->
							<col width="*" /> <!--규모-->
							<col width="4%" /> <!--수익률-->
							<col width="*" /> <!--시너지수익-->
							<col width="5%" /> <!--소싱-->
							<col width="5%" /> <!--매각-->
							<col width="5%" /> <!--역할-->
							<col width="4%" /> <!--배분-->
							<col width="*" /> <!--기여수익-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">종목</th>
								<th scope="col">유형</th>
								<th scope="col">투자구분</th>
								<th scope="col">규모</th>
								<th scope="col">수익률</th>
								<th scope="col">시너지수익</th>
								<th scope="col">소싱</th>
								<th scope="col">매각</th>
								<th scope="col">역할</th>
								<th scope="col">배분</th>
								<th scope="col">기여수익</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="2" scope="row">M&amp;A</th>
								<td>2016/02/24</td>
								<td>드래곤플라이</td>
								<td>CB</td>
								<td>중개</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>2,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a><div id="memo_3643" class="memoInnerArea"><div id="memoArea" class="memoAreaWrap">	<h4 class="memotitle">[비고입력]</h4> 	<div id="memoSpending"><textarea class="txtarea_b w100pro" id="memoText" placeholder="비고내용을 입력해주세요." value=""></textarea></div>	<div class="btnzone">	<a href="javascript:fnObj.regMemo();" id="memoSave" class="btn_s_type_g" style="cursor:pointer;">등록</a>	<a href="javascript:fnObj.eleMemoDiv(3643);" class="btn_s_type_g" style="cursor:pointer;">닫기</a></div></div></div></span></td>
							</tr>
							<tr>
								<td>2016/07/04</td>
								<td>형지엘리트</td>
								<td>&nbsp;</td>
								<td>중개</td>
								<td class="txt_invest_money">500</td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">7.50</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>투자룸</td>
								<td class="txt_right">-</td>
								<td class="txt_money">-</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_invest_money" colspan="5"><strong>2,500</strong></td>
								<td class="txt_sum_money" colspan="2">37.50</td>
								<td class="txt_sum_money" colspan="5">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
		<tr class="title_row">
			<th scope="row">PRE-IPO</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="PRE-IPO 성과안내">
						<caption>PRE-IPO 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--종목-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--투자구분-->
							<col width="*" /> <!--규모-->
							<col width="4%" /> <!--수익률-->
							<col width="*" /> <!--시너지수익-->
							<col width="5%" /> <!--소싱-->
							<col width="5%" /> <!--분석-->
							<col width="5%" /> <!--역할-->
							<col width="4%" /> <!--배분-->
							<col width="*" /> <!--기여수익-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">종목</th>
								<th scope="col">유형</th>
								<th scope="col">투자구분</th>
								<th scope="col">규모</th>
								<th scope="col">수익률</th>
								<th scope="col">시너지수익</th>
								<th scope="col">소싱</th>
								<th scope="col">분석</th>
								<th scope="col">역할</th>
								<th scope="col">배분</th>
								<th scope="col">기여수익</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="2" scope="row">M&amp;A</th>
								<td>2016/02/24</td>
								<td>드래곤플라이</td>
								<td>CB</td>
								<td>중개</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>2,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>매각</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a><div id="memo_3643" class="memoInnerArea"><div id="memoArea" class="memoAreaWrap">	<h4 class="memotitle">[비고입력]</h4> 	<div id="memoSpending"><textarea class="txtarea_b w100pro" id="memoText" placeholder="비고내용을 입력해주세요." value=""></textarea></div>	<div class="btnzone">	<a href="javascript:fnObj.regMemo();" id="memoSave" class="btn_s_type_g" style="cursor:pointer;">등록</a>	<a href="javascript:fnObj.eleMemoDiv(3643);" class="btn_s_type_g" style="cursor:pointer;">닫기</a></div></div></div></span></td>
							</tr>
							<tr>
								<td>2016/07/04</td>
								<td>형지엘리트</td>
								<td>&nbsp;</td>
								<td>중개</td>
								<td class="txt_invest_money">500</td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">7.50</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>투자룸</td>
								<td class="txt_right">-</td>
								<td class="txt_money">-</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_invest_money" colspan="5"><strong>2,500</strong></td>
								<td class="txt_sum_money" colspan="2">37.50</td>
								<td class="txt_sum_money" colspan="5">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
		<tr class="title_row">
			<th scope="row">바이오</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="바이오 성과안내">
						<caption>바이오 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--종목-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--투자구분-->
							<col width="*" /> <!--규모-->
							<col width="4%" /> <!--수익률-->
							<col width="*" /> <!--시너지수익-->
							<col width="5%" /> <!--소싱-->
							<col width="5%" /> <!--분석-->
							<col width="5%" /> <!--역할-->
							<col width="4%" /> <!--배분-->
							<col width="*" /> <!--기여수익-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">종목</th>
								<th scope="col">유형</th>
								<th scope="col">투자구분</th>
								<th scope="col">규모</th>
								<th scope="col">수익률</th>
								<th scope="col">시너지수익</th>
								<th scope="col">소싱</th>
								<th scope="col">분석</th>
								<th scope="col">역할</th>
								<th scope="col">배분</th>
								<th scope="col">기여수익</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="2" scope="row">M&amp;A</th>
								<td>2016/02/24</td>
								<td>드래곤플라이</td>
								<td>CB</td>
								<td>중개</td>
								<td class="txt_invest_money"><span class="vm"><span class="icon_cowork"><em>공동</em></span><span>2,000</span></span></td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">30.00</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>소싱</td>
								<td class="txt_right">1.50%</td>
								<td class="txt_money">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a><div id="memo_3643" class="memoInnerArea"><div id="memoArea" class="memoAreaWrap">	<h4 class="memotitle">[비고입력]</h4> 	<div id="memoSpending"><textarea class="txtarea_b w100pro" id="memoText" placeholder="비고내용을 입력해주세요." value=""></textarea></div>	<div class="btnzone">	<a href="javascript:fnObj.regMemo();" id="memoSave" class="btn_s_type_g" style="cursor:pointer;">등록</a>	<a href="javascript:fnObj.eleMemoDiv(3643);" class="btn_s_type_g" style="cursor:pointer;">닫기</a></div></div></div></span></td>
							</tr>
							<tr>
								<td>2016/07/04</td>
								<td>형지엘리트</td>
								<td>&nbsp;</td>
								<td>중개</td>
								<td class="txt_invest_money">500</td>
								<td class="txt_right">10.00%</td>
								<td class="txt_money">7.50</td>
								<td>정형돈</td>
								<td>유대준</td>
								<td>분석</td>
								<td class="txt_right">-</td>
								<td class="txt_money">-</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_invest_money" colspan="5"><strong>2,500</strong></td>
								<td class="txt_sum_money" colspan="2">37.50</td>
								<td class="txt_sum_money" colspan="5">0.45</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
		<tr class="title_row select_row">
			<th scope="row">임직원유치</th>
			<td><span class="sub_title">규모 :</span></td>
			<td><span class="sub_moneysum">82,150</span></td>
			<td><span class="sub_title">수익 :</span></td>
			<td><span class="sub_moneysum red">1,232.25</span></td>
			<td><span class="sub_title">기여수익 :</span></td>
			<td><span class="sub_moneysum red">86.26</span></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8">
				<div class="wk_performance_wrap">
					<table class="wk_perform_tb2" summary="임직원유치 성과안내">
						<caption>임직원유치 성과안내</caption>
						<colgroup>
							<col width="*" /> <!--분류-->
							<col width="5%" /> <!--제안일-->
							<col width="*" /> <!--유형-->
							<col width="4%" /> <!--직원-->
							<col width="5%" /> <!--입사일-->
							<col width="*" /> <!--성과급-->
							<col width="5%" /> <!--지급일-->
							<col width="4%" /> <!--본인확인-->
							<col width="16%" /> <!--이견-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">제안일</th>
								<th scope="col">유형</th>
								<th scope="col">직원</th>
								<th scope="col">입사일</th>
								<th scope="col">성과급</th>
								<th scope="col">지급일</th>
								<th scope="col">본인확인</th>
								<th scope="col">이견</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="3" scope="row">임직원유치</th>
								<td>2016/02/24</td>
								<td>임원유치</td>
								<td>정형돈</td>
								<td>2016/02/24</td>
								<td class="txt_money">30.00</td>
								<td>2016/02/24</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a><div id="memo_3643" class="memoInnerArea"><div id="memoArea" class="memoAreaWrap">	<h4 class="memotitle">[비고입력]</h4> 	<div id="memoSpending"><textarea class="txtarea_b w100pro" id="memoText" placeholder="비고내용을 입력해주세요." value=""></textarea></div>	<div class="btnzone">	<a href="javascript:fnObj.regMemo();" id="memoSave" class="btn_s_type_g" style="cursor:pointer;">등록</a>	<a href="javascript:fnObj.eleMemoDiv(3643);" class="btn_s_type_g" style="cursor:pointer;">닫기</a></div></div></div></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>직원유치</td>
								<td>정형돈</td>
								<td>2016/02/24</td>
								<td class="txt_money">30.00</td>
								<td>2016/02/24</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
							<tr>
								<td>2016/02/24</td>
								<td>샵인샵유치</td>
								<td>정형돈</td>
								<td>2016/02/24</td>
								<td class="txt_money">30.00</td>
								<td>2016/02/24</td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left"><span class="vm"><a class="memoBtn" onclick="fnObj.openMemo(this,'3643');" style="cursor:pointer;"><em>비고입력</em></a></span></td>
							</tr>
						</tbody>	
						<tfoot>
							<tr>
								<th>합계</th>
								<td class="txt_sum_money" colspan="5">0.45</td>
								<td></td>
								<td><span class="vm"><label><input type="checkbox" /><span>OK</span></label></span></td>
								<td class="txt_left">&nbsp;</td>
							</tr>
						</tfoot>	
					</table>
				</div>
			</td>
		</tr>
	</table>
	<div class="total_wk_tb_wrap">
		<table class="total_wk_perform" summary="시너지 전체">
			<caption>전체</caption>
			<colgroup>
				<col width="100" />
				<col width="*" span="2" />
			</colgroup>
			<tr>
				<th scope="row" rowspan="2">전체</th>
				<th scope="col" class="bg_gray">투자규모</th>
				<th scope="col" class="bg_gray">시너지수익</th>
			</tr>
			<tr>
				<td class="txt_money_black"><strong>60000</strong></td>
				<td class="txt_money_red"><strong>1500</strong></td>
			</tr>
		</table>
		<table class="total_wk_perform mgl30" summary="전체">
			<caption>전체</caption>
			<colgroup>
				<col width="100" />
				<col width="*" span="4" />
			</colgroup>
			<tr>
				<th scope="row" rowspan="2">유대준</th>
				<th scope="col" class="bg_gray">총기여수익</th>
				<th scope="col" class="bg_gray">연봉</th>
				<th scope="col" class="bg_gray">BEP</th>
				<th scope="col" class="bg_gray">성과배분</th>
				<th scope="col" class="bg_gray">본인확인 전체</th>
			</tr>
			<tr>
				<td class="txt_money_red"><strong>1500</strong></td>
				<td><strong>1250</strong></td>
				<td><strong>1254</strong></td>
				<td class="txt_money_red"><strong>1500</strong></td>
				<td class="txt_center"><span class="vm"><label><input type="checkbox" /></label></span></td>
			</tr>
		</table>
	</div>

	<div class="total_tb_listwrap">
		<%--<table id="SGridTargetSum" class="total_tb_list_basic" summary="지출 목록 총합계(영업관련, 복리후생, 교통비, 차량유지, 운반비, 구입비)">
			<caption>지출 목록</caption>
			<colgroup>
				<col width="*">  <!--세부항목-->
				<col width="*">  <!--구분-->
				<col width="*">  <!--금액-->
			</colgroup>
			<tbody id="detailSum"><tr><th rowspan="6">세<br>부<br>항<br>목</th><th class="bg_gray">영업관련</th><td class="txt_money"><span>0</span><em>원</em></td></tr><tr><th class="bg_gray">복리후생</th><td class="txt_money"><span>20,000</span><em>원</em></td></tr><tr><th class="bg_gray">교통비</th><td class="txt_money"><span>0</span><em>원</em></td></tr><tr><th class="bg_gray">차량유지</th><td class="txt_money"><span>0</span><em>원</em></td></tr><tr><th class="bg_gray">운반비</th><td class="txt_money"><span>0</span><em>원</em></td></tr><tr><th class="bg_gray">구입비</th><td class="txt_money"><span>0</span><em>원</em></td></tr></tbody>
			<tfoot>
				<tr>
					<th colspan="2">전체총계</th>
					<td class="txt_money"><span id="totalSum">84,650</span><em>원</em></td>
				</tr>
			</tfoot>    
		</table>--%>
	</div>	
	<div class="btn_baordZone2">
		<a href="#" class="btn_blueblack"><strong>저장</strong></a>
		<a href="#" class="btn_witheline">취소</a>
	</div>
	</div>
	
	
	
	
	
	
	
	<div id="tempmodalPOP" style="display:none;">
		<div class="modalWrap2">
			<h1><strong>[0420 화면번호입력]</strong> 유형선택</h1>
			<div class="mo_container">
				<h3 class="h3_title_basic">유형선택</h3>				
				<div class="popup_ListBox">
					<ul class="labelList_st">
						<li><label><input type="checkbox"><span>CB</span></label></li>
						<li><label><input type="checkbox"><span>EB</span></label></li>
						<li><label><input type="checkbox"><span>BW</span></label></li>
						<li><label><input type="checkbox"><span>유증</span></label></li>
						<li><label><input type="checkbox"><span>블록딜</span></label></li>
						<li><label><input type="checkbox"><span>실권주</span></label></li>
						<li><label><input type="checkbox"><span>워런트</span></label></li>
						<li><label><input type="checkbox"><span>프리IPO</span></label></li>
						<li><label><input type="checkbox"><span>벤처</span></label></li>
						<li><label><input type="checkbox"><span>M&amp;A</span></label></li>
						<li><label><input type="checkbox"><span>스팩</span></label></li>
						<li><label><input type="checkbox"><span>RCPS</span></label></li>
					</ul>
				</div>
				<div class="memberBox_controll"><!--닫기버튼<a href="#" class="btn_td_close"><em>닫기</em></a>--><!--열기버튼--><a href="#" class="btn_td_open"><em>열기</em></a></div>
				<div class="btnZoneBox"><a href="#" class="p_blueblack_btn"><strong>저장</strong></a><a href="#" class="p_withelin_btn">취소</a></div>	
			</div>
			
				
			<a href="#" class="btn_modal_min"><em>창 최소화</em></a>
			<a href="#" class="btn_modal_max"><em>창 최대화</em></a>
			<a href="#" class="btn_modal_close"><em>창 닫기</em></a>
		</div>
	</div>