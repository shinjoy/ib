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


/*검색영역*/
.carSearchBox { background:url(../images/work/bg_memo_search.gif) repeat-x 0 0; border:#b8bfcc solid 1px; box-shadow:0px 1px 0px #eceef1; height:24px; padding:11px 15px 11px 15px; position:relative; vertical-align:middle; }
.carSearchBox .input_b { box-sizing:border-box; width:80px; }
.carSearchBox .input_b2 { box-sizing:border-box; }
.carSearchBox .select_b { box-sizing:border-box; }
.carSearchBox span, .carSearchBox button, .carSearchBox input, .carSearchBox label, .carSearchBox select { vertical-align:middle; }
.carSearchBox .divide_line { border-left:#cfcfcf solid 1px; margin-left:8px; padding-left:18px; }

.carSearchBox .carSearchtitle { font-weight:bold; color:#3a485e; padding-right:5px; }
.carSearchBox .rd_List { display:inline-block; }
.carSearchBox .rd_List label { margin-left:8px; }
.carSearchBox .rd_List label:first-child { margin-left:0px; }
.carSearchBox .rd_List input + span { margin-left:3px; }

/* 액티비티추가삭제 */
.btn_ac_add { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:13px; height:13px; display:inline-block; vertical-align:middle; background-position:-60px 5px; padding:5px 4px 5px 5px; }
.btn_ac_delete { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:13px; height:13px; display:inline-block; vertical-align:middle; background-position:-94px 5px; padding:5px 4px 5px 5px; }
.btn_ac_add em, .btn_ac_delete em { position:absolute; left:-9999999999999px; visibility:hidden; }

.h3_title_basic { background:url(../images/common/bu_h3_title.gif) no-repeat 0 3px; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:16px; letter-spacing:-0.04em; padding-left:12px; margin-bottom:10px; }
.h3_title_basic span { vertical-align:middle; }
.h3_title_basic .sub_desc { font-size:13px; margin-left:6px; color:#6a798e; font-family:'NanumBarun'; font-weight:normal; }

.btn_s_type3 { background:#4e5a72; border:#394960 solid 1px; border-radius:3px; height:20px; min-width:30px; padding:0 7px; font-size:11px; color:#fff!important; font-weight:normal; display:inline-block; vertical-align:middle; line-height:20px; }
.btn_s_type3 .icon_search { background:url(../images/system/icon_search.png) no-repeat right center; padding-right:16px; }

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



/*인사정보등록*/
.tb_regi_basic2 { letter-spacing:-0.08px; width:100%; border-top:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; }
.tb_regi_basic2 thead tr { border-left:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; }
.tb_regi_basic2 thead th { font-weight:normal; text-align:center; padding:7px 0px 8px; background:#d8dce3; color:#3b4354; border-top:#afb7c2 solid 1px; border-bottom:#afb7c2 solid 1px; border-left:#afb7c2 solid 1px;  font-size:12px; }

.tb_regi_basic2 tbody tr { border-left:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; }
.tb_regi_basic2 tbody th { font-weight:bold; text-align:left; padding:7px 10px 8px; background:#d8dce3; color:#3b4354; border-top:#afb7c2 solid 1px; border-left:#afb7c2 solid 1px;  font-size:12px; }

.tb_regi_basic2 tbody td { font-family:"돋움"; border-top:#d0d1d1 solid 1px; border-left:#d0d1d1 solid 1px; line-height:16px; padding:7px 10px 8px; color:#6d6c74; text-align:left;  font-size:12px; }
.tb_regi_basic2 tbody td  a { color:#6d6c74; }
.tb_regi_basic2 tbody tr:first-child th, .tb_regi_basic2 tbody tr:first-child td { border-top:none; }
.tb_regi_basic2 tbody th:first-child { border-left:none; }
.tb_regi_basic2 tbody td.dot_line { border-top:#c7cdd6 dotted 1px; }
.tb_regi_basic2 .bg_skyblue { background:#f1f2f4; border-right:#d0d1d1 solid 1px; text-align:center; }
.tb_regi_basic2 .bg_skyblue2 { background:#f1f2f4; border-left:#d0d1d1 solid 1px; border-right:#d0d1d1 solid 1px; border-top:#d0d1d1 solid 1px; text-align:left; font-weight:normal; }
.tb_regi_basic2 .bg_skyblue3 { background:#e3e4e8; }
.tb_regi_basic2 span.star { color:#ff6240; margin-left:3px; font-weight:bold; font-family:Tahoma, Geneva, sans-serif; font-size:11px; }
.tb_regi_basic2 .tdaddress { border-top: none; padding-top:0px; }
.tb_regi_basic2 .picpro { text-align:center; background:url(../images/support_m/img_pro_bg.gif) no-repeat center center; }
.tb_regi_basic2 .picpro img { width:100%; height:auto; }
.tb_regi_basic2 .vt { vertical-align:top; }
.tb_regi_basic2 .vm { vertical-align:middle; }
.tb_regi_basic2 .vm span, .tb_regi_basic2 .vm em, .tb_regi_basic2 .vm label, .tb_regi_basic2 .vm input { vertical-align:middle; }

.tb_regi_basic2 .level_second { background:url(../images/business/bg_table_second_level.gif) no-repeat 20px -35px; padding:7px 10px 8px 32px; }
.tb_regi_basic2 .code_ttbg { background:#eeeff1; }
.tb_regi_basic2 .code_ttbg td { font-weight:bold; color:#3b4354; }
.tb_regi_basic2 .no_leftline { border-left:none; }
.tb_regi_basic2 tr.second_depth th { background:#f7f7f7; border-top:#7c889b dotted 1px; }
.tb_regi_basic2 tr.second_depth td { border-top:#7c889b dotted 1px; }
.tb_regi_basic2 tr.second_depth th.level_second { background:url(../images/business/bg_table_second_level2.gif) no-repeat 20px -35px #f8f8f8; padding:7px 10px 8px 32px; }
.tb_regi_basic2 tr.second_depth td.level_second { background:url(../images/business/bg_table_second_level2.gif) no-repeat 20px -35px; padding:7px 10px 8px 32px; }

.tb_regi_basic2 tr.second_depth_last th { background:#f7f7f7; border-top:#7c889b dotted 1px; }
.tb_regi_basic2 tr.second_depth_last td { border-top:#7c889b dotted 1px; }
.tb_regi_basic2 tr.second_depth_last th.level_second { background:url(../images/business/bg_table_second_level.gif) no-repeat 20px -35px #f8f8f8; padding:7px 10px 8px 32px; }
.tb_regi_basic2 tr.second_depth_last td.level_second { background:url(../images/business/bg_table_second_level.gif) no-repeat 20px -35px; padding:7px 10px 8px 32px; }

.tb_regi_basic2 tbody .bg_gray { background:#f8f8f8; }


/*직원성과기준set*/
.set_tempWrap { width:1000px; padding:30px; }
#tempmodalPOP { position:absolute; left:100px; top:100px; z-index:5; background:#fff; box-shadow:10px 10px 10px rgba(0,0,0, 0.5); }

.modalWrap2 h1 { background:#20304a; color:#fff; padding:8px 15px; height:26px; font-size:12px; line-height:16px; height:16px; }

.modalWrap2 .btn_modal_min { position:absolute; right:53px; top:11px; background:url(../images/common/btn_modal_min.gif) no-repeat; width:10px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_max { position:absolute; right:34px; top:11px; background:url(../images/common/btn_modal_max.gif) no-repeat; width:11px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_close { position:absolute; right:15px; top:11px; background:url(../images/common/btn_modal_close.gif) no-repeat; width:11px; height:9px; display:inline-block; }
.modalWrap2 .btn_modal_max em, .modalWrap2 .btn_modal_min em, .modalWrap2 .btn_modal_close em { position:absolute; left:-999999999999999999px; overflow:hidden; width:0px; height:0px; }

.modalWrap2 .mo_container { margin:0 15px; padding:20px 0 25px; }
.modalWrap2 .mo_container2 { margin:0; padding:0px; }
.modalWrap2 .mo_footer { border-top:#dadada solid 1px; padding-bottom:30px; }

.modalWrap2 .gtabZone { border-left:none; }
.modalWrap2 .gtabZone ul { margin-top:12px; margin-left:16px; }

.modalWrap2 h2.title { font-size:12px; font-weight:bold; color:#242424; line-height:1.6; margin-bottom:8px; }
.modalWrap2 h2.title_arrow { float:none; *zoom:1; background:url(../images/common/h2_mo_title.gif) no-repeat 0 3px; line-height:1.6; font-size:12px; font-weight:bold; color:#345698; vertical-align:middle; padding-left:10px; margin-bottom:5px; position:relative; }
.modalWrap2 h2.title_arrow:after { content:""; display:block; clear:both; height:0px; }


.stat_memberListBox { position:relative; border:1px solid #c1c1c1; border-top-left-radius:3px; border-top-right-radius:3px; background:#f9f9f9; overflow:auto; overflow-x:hidden; max-height:109px; border-bottom:none; }
.stat_memberListBox .stat_member_dlList { /*box-shadow: 0 2px 2px 0 rgba(0,0,0,0.16), 0 0 0 1px rgba(0,0,0,0.08);*/ padding:8px 12px; }
.stat_memberListBox .stat_member_dlList dt { font-weight:bold; color:#202020; margin-bottom:1px; border-top:#b1b1b1 dotted 1px; padding-top:8px; margin-top:6px; font-size:11px; }
.stat_memberListBox .stat_member_dlList dt:first-child { border-top:none; padding-top:0px; margin-top:0px; }
.stat_memberListBox .stat_member_dlList dd { color:#797979; }
.stat_memberListBox .noList { height:50px; line-height:50px; vertical-align:middle; text-align:center; color:#898989; }
.stat_memberListBox .stat_member_ulList { float:none; *zoom:1; margin-left:-5px; }
.stat_memberListBox .stat_member_ulList:after { content:""; display:block; clear:both; height:0; }
.stat_memberListBox .stat_member_ulList li { float:left; vertical-align:middle; border:#d0d0d0 solid 1px; border-radius:20px; padding:0 5px; box-sizing:border-box; background:#fff; margin:2px 0 2px 5px; }
.stat_memberListBox .stat_member_ulList li span { vertical-align:middle; letter-spacing:-0.05em; }
.stat_memberListBox .stat_member_ulList li .memberst span { vertical-align:middle; color:#797979; } /*이름*/
.stat_memberListBox .stat_member_ulList li .memberst em { vertical-align:middle; font-size:11px; color:#939393; margin-left:3px; } /*직급*/
.stat_memberListBox .stat_member_ulList li .btn_delete { background:url(../images/mypage/icon_delete.gif) no-repeat center center; width:12px; height:16px; display:inline-block; vertical-align:middle; margin-left:2px; cursor:pointer; }
.stat_memberListBox .stat_member_ulList li .btn_delete em { display:none; }
.memberBox_controll { border:1px solid #c1c1c1; border-bottom-left-radius:3px; border-bottom-right-radius:3px; height:11px; background:#f5f5f5; }
.memberBox_controll:hover { background:#f0f0f0; }
.memberBox_controll em { position:absolute; left:-99999999999999px; visibility:hidden; font-size:0; }
.memberBox_controll .btn_td_close { background:url(../images/common/btn_td_close.gif) no-repeat center 3px; height:11px; width:100%; display:block; }
.memberBox_controll .btn_td_open { background:url(../images/common/btn_td_open.gif) no-repeat center 3px; height:11px; width:100%; display:block; }


.stat_memberListBox2 { position:relative; border:1px solid #afb7c2; border-top-left-radius:3px; border-top-right-radius:3px; background:url(../images/work/bg_memo_search.gif) repeat-x 0 0;  padding:6px 12px; border-bottom:none; }
.stat_memberListBox2 .stat_member_ulList { float:none; *zoom:1; margin-left:-5px; }
.stat_memberListBox2 .stat_member_ulList:after { content:""; display:block; clear:both; height:0; }
.stat_memberListBox2 .stat_member_ulList li { float:left; vertical-align:middle; border:#9aaacc solid 1px; border-radius:20px; padding:0 5px; box-sizing:border-box; background:#f7f9fc; margin:2px 0 2px 5px; }
.stat_memberListBox2 .stat_member_ulList li span { vertical-align:middle; letter-spacing:-0.05em; }
.stat_memberListBox2 .stat_member_ulList li .code { vertical-align:middle; color:#3d5da1; }
.stat_memberListBox2 .stat_member_ulList li .btn_delete { background:url(../images/mypage/icon_delete2.gif) no-repeat center center; width:12px; height:16px; display:inline-block; vertical-align:middle; margin-left:2px; cursor:pointer; opacity:0.7; }
.stat_memberListBox2 .stat_member_ulList li .btn_delete em { display:none; }
.stat_memberListBox2 .noList { vertical-align:middle; text-align:center; color:#898989; }

.popup_ListBox { position:relative; border:1px solid #c1c1c1; border-top-left-radius:3px; border-top-right-radius:3px; background:#f9f9f9; overflow:auto; overflow-x:hidden; max-height:109px; border-bottom:none; }
.labelList_st { float:none; *zoom:1; padding:15px; margin-left:-15px; }
.labelList_st:after { content:""; display:block; clear:both; height:0; }
.labelList_st li { float:left; vertical-align:middle; min-width:20%; margin-left:15px; }
.labelList_st li label { display:inline-block; vertical-align:middle; }
.labelList_st li input { vertical-align:middle; }
.labelList_st li span { vertical-align:middle; margin-left:4px; }
</style>

<div class="set_tempWrap">
	<!--연도별선택-->
		<div class="carSearchBox">
			<label>
				<span class="carSearchtitle"><label for="IDNAME01">직원성과 기준표</label></span>
				<select class="select_b w_date" id="IDNAME01" title="연도선택">
					<option selected="">2016</option>
					<option>2015</option>
					<option>2014</option>
					<option>2013</option>
					<option>2012</option>
				</select>
			</label>
		</div>
		<!--//연도별선택//-->
		<!--대상자선택-->
		<h3 class="h3_title_basic mgt30"><span>대상자 선택</span><a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type3 mgl10"><em class="icon_search">직원선택</em></a></h3>
		<div class="stat_memberListBox">
			<%--<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>--%>
			<dl class="stat_member_dlList">
				<dt>시스템기획팀</dt>
				<dd>
					<ul class="stat_member_ulList">
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
					</ul>
				</dd>
				<dt>시스템기획팀</dt>
				<dd>
					<ul class="stat_member_ulList">
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
					</ul>
				</dd>
				<dt>시스템기획팀</dt>
				<dd>
					<ul class="stat_member_ulList">
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
						<li><span class="memberst"><span>박정인</span><em>(과장)</em></span><span class="btn_delete"><em>삭제</em></span></li>
					</ul>
				</dd>
			</dl>
			<%--<div class="noList">"대상자를 선택해주세요"</div>--%>
		</div>
		<div class="memberBox_controll"><!--닫기버튼<a href="#" class="btn_td_close"><em>닫기</em></a>--><!--열기버튼--><a href="#" class="btn_td_open"><em>열기</em></a></div>
		<!--//대상자선택//-->
		
		<!--기본기준설정-->
		<h3 class="h3_title_basic mgt30"><span>기본 기준설정</span><span class="sub_desc">(메자닌은 투자자문의 성과보수를 기준으로 함)</span></h3>
		<table class="tb_regi_basic2" summary="CODE 등록 (정렬값, 영문코드, 한글명, 추가/삭제)">
			<caption>CODE 등록</caption>
			<colgroup>
				<col width="215" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="IDNAME01">당해 투자분의 수익률 추정</label></th>
					<td><input type="num" class="input_b w50px" value="10" placeholder="숫자입력" id="IDNAME02" /> <span>%</span></td>
				</tr>
				<tr>
					<th scope="row"><label for="IDNAME02">시너지 수익</label></th>
					<td><span>투자수익률에 근거한 투자금액의 성과보수 = </span> <input type="num" class="input_b w50px" value="10" placeholder="숫자입력" id="IDNAME02" /> <span>%</span></td>
				</tr>
				<tr>
					<th scope="row"><label for="IDNAME03">BEP 설정</label></th>
					<td class="vm"><span>연봉의</span> <input type="num" class="input_b w50px" value="10" placeholder="숫자입력" id="IDNAME03" /> <span>배수로 함</span> <span>( 전체 수익 계산 후 <strong class="f_redPoint">2</strong> 배수 차감 )</span></td>
				</tr>
			</tbody>
		</table>
		<!--//기본기준설정//-->
		
		<!--딜관련수익성과금-->
		<h3 class="h3_title_basic mgt30"><span>딜 관련 수익성과급</span><a href="javascript:showlayer(tempmodalPOP);" class="btn_s_type3 mgl10">유형선택</a></h3>
		<div class="stat_memberListBox2">
			<ul class="stat_member_ulList">
				<li><span class="code">CB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">EB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">Pre-IPO</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">M&amp;A</span><span class="btn_delete"><em>삭제</em></span></li>
			</ul>
		</div>
		<table class="tb_regi_basic2" summary="딜 관련 수익성과급 등록 (역할선택, 수익률입력)">
			<caption>딜 관련 수익성과급 등록</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="2">역할선택</th>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//딜관련수익성과금//-->
		
		<!--자문수수료/중개수수료/투자수익-->
		<h3 class="h3_title_basic mgt30"><span>자문수수료 / 중개수수료 / 투자수익</span><span class="sub_desc">(투자 손실딜은 반영하지 않음)</span><a href="javascript:showlayer(tempmodalPOP);" class="btn_s_type3 mgl10">유형선택</a></h3>
		<div class="stat_memberListBox2">
			<div class="noList">"유형을 선택해주세요"</div>
		</div>
		<table class="tb_regi_basic2" summary="딜 관련 수익성과급 등록 (역할선택, 수익률입력)">
			<caption>딜 관련 수익성과급 등록</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="2">역할선택</th>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//자문수수료/중개수수료/투자수익//-->
		
		<!--M&A-->
		<h3 class="h3_title_basic mgt30">M&amp;A</h3>
		<table class="tb_regi_basic2" summary="M&A 배분율입력(딜소싱, 분석, 펀딩, 투자룸배정)">
			<caption>M&amp;A 배분율입력</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">성과보수 계산</th>
					<td class="vm" colspan="2"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<th scope="row" rowspan="3">역할선택</th>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option selected>딜소싱</option>
							<option>분석</option>
							<option>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option selected>분석</option>
							<option>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<th scope="row">투자룸 배정</th>
					<td class="vm" colspan="2"><span class="radio_list2"><label><input type="radio" name="s01" checked=""><span>Yes</span></label><label><input type="radio" name="s01"><span>No</span></label></span><span class="mgl10">(투자룸배정시 성과급 대체)</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//M&A//-->
		
		
		<!--preIPO-->
		<h3 class="h3_title_basic mgt30">Pre-IPO (or LP모집펀드)</h3>
		<table class="tb_regi_basic2" summary="Pre-IPO 배분율입력(딜소싱, 분석, 펀딩, 투자룸배정)">
			<caption>Pre-IPO 배분율입력</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="3">역할선택</th>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option selected>딜소싱</option>
							<option>분석</option>
							<option>펀딩</option>
						</select>
					</th>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option selected>분석</option>
							<option>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="Pre-IPO 역할선택">
							<option>딜소싱</option>
							<option>분석</option>
							<option selected>펀딩</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<th scope="row">투자룸 배정</th>
					<td class="vm" colspan="2"><span class="radio_list2"><label><input type="radio" name="s01" checked=""><span>Yes</span></label><label><input type="radio" name="s01"><span>No</span></label></span><span class="mgl10">(투자룸배정시 성과급 대체)</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//preIPO//-->
		
		<!--자기자본투자-->
		<h3 class="h3_title_basic mgt30">자기자본투자 (바이오)</h3>
		<table class="tb_regi_basic2" summary="자기자본투자 (바이오) 배분율입력 (소싱, 분석, 협상, 관리)">
			<caption>자기자본투자 (바이오) 배분율입력</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" colspan="2">구분</th>
					<th scope="col">TIPS 관련</th>
					<th scope="col">TIPS 비관련</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row" rowspan="4">역할선택</th>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="자기자본투자 역할선택">
							<option selected>소싱</option>
							<option>분석</option>
							<option>협상</option>
							<option>관리</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="자기자본투자 역할선택">
							<option>소싱</option>
							<option selected>분석</option>
							<option>협상</option>
							<option>관리</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="자기자본투자 역할선택">
							<option>소싱</option>
							<option>분석</option>
							<option selected>협상</option>
							<option>관리</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td class="bg_skyblue2">
						<select class="select_b w100pro" title="자기자본투자 역할선택">
							<option>소싱</option>
							<option>분석</option>
							<option>협상</option>
							<option selected>관리</option>
						</select>
					</td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="vm"><span>시너지 수익의</span> <input type="text" class="input_b w50px" value="" title="배분률 입력" /> <span>%</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//자기자본투자//-->
		
		
		<!--즉시지급성과급-->
		<h3 class="h3_title_basic mgt30">즉시 지급 성과급</h3>
		<table class="tb_regi_basic2" summary="즉시 지급 성과급 입력(임원급유치, 직원유치, 샵인샵유치)">
			<caption>즉시 지급 성과급 입력</caption>
			<colgroup>
				<col width="105" />
				<col width="110" />
				<col width="*" />
				<col width="70" />
			</colgroup>
			<tbody>
				<tr>
					<th rowspan="3">역할선택</th>
					<td scope="row" class="bg_skyblue2">
						<select class="select_b w100pro" title="즉시지급성과 종류선택">
							<option selected>임원급 유치</option>
							<option>직원 유치</option>
							<option>샵인샵 유치</option>
						</select>
					</td>
					<td class="vm"><span>근무</span> <input type="text" class="input_b w50px" value="" title="기준 근무개월입력" /> <span>개월 후</span> <input type="text" class="input_b w100px" value="" title="성과급입력" /> <span>원 지급 (</span> <input type="text" class="input_b w50px" value="" title="기준 근무년 입력" /> <span>년 근무기준 )</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<th scope="row" class="bg_skyblue2">
						<select class="select_b w100pro" title="즉시지급성과 종류선택">
							<option>임원급 유치</option>
							<option selected>직원 유치</option>
							<option>샵인샵 유치</option>
						</select>
					</th>
					<td class="vm"><span>근무</span> <input type="text" class="input_b w50px" value="" title="기준 근무개월입력" /> <span>개월 후</span> <input type="text" class="input_b w100px" value="" title="성과급입력" /> <span>원 지급 (</span> <input type="text" class="input_b w50px" value="" title="기준 근무년 입력" /> <span>년 근무기준 )</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
				<tr>
					<td scope="row" class="bg_skyblue2">
						<select class="select_b w100pro" title="즉시지급성과 종류선택">
							<option>임원급 유치</option>
							<option>직원 유치</option>
							<option selected>샵인샵 유치</option>
						</select>
					</td>
					<td class="vm" class="bg_skyblue2"><span>근무</span> <input type="text" class="input_b w50px" value="" title="기준 근무개월입력" /> <span>개월 후</span> <input type="text" class="input_b w100px" value="" title="성과급입력" /> <span>원 지급 (</span> <input type="text" class="input_b w50px" value="" title="기준 근무년 입력" /> <span>년 근무기준 )</span></td>
					<td class="txt_center"><a href="#" class="btn_ac_add"><em>추가</em></a><a href="#" class="btn_ac_delete"><em>삭제</em></a></td>
				</tr>
			</tbody>
		</table>
		<!--//즉시지급성과급//-->											
		<div class="btn_baordZone2">
			<a href="#" class="btn_blueblack"><strong>등록/수정</strong></a>
			<a href="#" class="btn_witheline">취소</a>
			<a href="javascript:void(window.open('/business/business_info_regist.jsp', 'popup','resizable=no,width=968,height=720,scrollbars=yes'))" class="btn_blueblack2">미리보기</a>
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