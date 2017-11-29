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

.h3_title_basic { background:url(../images/common/bu_h3_title.gif) no-repeat 0 3px; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:16px; letter-spacing:-0.04em; padding-left:12px; margin-bottom:10px; }
.h3_title_basic span { vertical-align:middle; }
.h3_title_basic .sub_desc { font-size:13px; margin-left:6px; color:#6a798e; font-family:'NanumBarun'; font-weight:normal; }


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

/*tab*/
.tabZone_st03 { float:none; *zoom:1; width:100%; height:35px; padding-top:3px; padding-left:3px; background:#547197; border:#3c5e8a solid 1px; /*background:#7d8fa2; border:#63788e solid 1px;*/ box-sizing:border-box; }
.tabZone_st03:after { content:""; display:block; clear:both; height:0; }
.tabZone_st03 li { float:left; background:url(../images/common/board/bg_tab03_divide.gif) no-repeat right 8px; /*background:url(../images/common/bg_tabdiv3.png) no-repeat right 9px;*/ height:29px; overflow:hidden; }
.tabZone_st03 li a {font-size:13px; line-height:15px; height:15px; vertical-align:middle; padding:5px 1.8em 9px; display:inline-block; color:#fff; letter-spacing:-0.05em; }
.tabZone_st03 li.current { border-bottom:#fff solid 2px; }
.tabZone_st03 li.current a { color:#303030; background:#FFF; font-size:14px; font-weight:bold; padding:8px 30px 6px; }

/*테이블*/
.datagrid_input { font-family:"돋움"; letter-spacing:-0.08px; width:100%; border-bottom:#c3c3c3 solid 1px; border-right:#c3c3c3 solid 1px; border-left:#c3c3c3 solid 1px; border-top:#c3c3c3 solid 1px; font-size:12px; }
.datagrid_input tbody tr.tr_divide_line td, .datagrid_input tbody tr.tr_divide_line th { border-top:#c1c1c1 solid 1px; background:#f8f9f9; }
.datagrid_input tbody th.bg_gary { border-right:#c1c1c1 solid 1px; background:#f8f9f9; }
.datagrid_input thead th { background:#efefef!important; font-weight:normal; color:#3b4354!important; line-height:16px; padding:6px 10px 7px; text-align:center!important; border-right:#d4d4d4 solid 1px; border-top:#d4d4d4 solid 1px; border-bottom:#d4d4d4 solid 1px; border-left:#d4d4d4 solid 1px; text-align:left; font-weight:normal!important; }
.datagrid_input tbody th { background:#efefef; font-weight:normal; color:#3b4354; line-height:16px; padding:6px 10px 7px; text-align:center; border-right:#d4d4d4 solid 1px; border-top:#d4d4d4 solid 1px; border-bottom:#d4d4d4 solid 1px; border-left:#d4d4d4 solid 1px; text-align:left;  }
.datagrid_input tbody td { border-top:#dfdfdf solid 1px; border-left:#dfdfdf solid 1px; line-height:16px; padding:6px 10px 7px; color:#6d6c74; text-align:center; letter-spacing:-0.5px; letter-spacing:-0.5px; line-height:16px; text-align:left;  word-break:break-all; }
.datagrid_input tbody tr th:first-child, .datagrid_input tbody tr td:first-child { border-left:none; }
.datagrid_input tbody tr:first-child td, .datagrid_input tbody tr:first-child th { border-top:none; }
.datagrid_input tbody tr:last-child th { border-bottom:none; }


/* 직원성과 시뮬레이션 */
.grid_title2 { font-weight:bold; color:#3b4354; font-size:12px; margin-bottom:6px; }
.output_simul_memBox { border:#c8cbce solid 1px; border-top:none; border-bottom-left-radius:3px;border-bottom-right-radius:3px; padding:5px 15px; background:url(../images/common/bg_detailcon.png) repeat-x 0 0; float:none; *zoom:1;}
.output_simul_memBox:after { content:""; display:block; height:0px; clear:both; }
.output_simul_memBox li { float:left; display:inline-block; line-height:1.8; margin-left:20px;word-break:keep-all; vertical-align:middle; }
.output_simul_memBox li strong { color:#242424; font-weight:normal; }
.output_simul_memBox li em { margin-left:5px; font-size:11px; }
.output_simul_memBox label, .output_simul_memBox input { vertical-align:middle; line-height:1.8; letter-spacing:-0.03em!important; }
.output_simul_memBox input { margin-right:4px; }

.output_simul_memBox2 { border:#c8cbce solid 1px; border-radius:3px; padding:5px 15px; float:none; *zoom:1;}
.output_simul_memBox2:after { content:""; display:block; height:0px; clear:both; }
.output_simul_memBox2 li { float:left; display:inline-block; margin-left:8px;word-break:keep-all; vertical-align:middle; background:url(../images/common/bu_simul_dot.png) no-repeat left center; padding-left:10px; }
.output_simul_memBox2 li:first-child { background:none; margin-left:0px; padding-left:0px; }
.output_simul_memBox2 li strong { color:#555; font-weight:normal; letter-spacing:-0.03em; }
.output_simul_memBox2 li em { margin-left:3px; font-size:11px; color:#999; letter-spacing:-0.03em; }
.output_simul_memBox2 li.current a { background:url(../images/common/icon_check.png) no-repeat left center; padding-left:12px; font-weight:bold; color:#202020; }


.datagrid_input td.spanspace span { margin-right:10px; display:inline-block; }
.datagrid_input td.spanspace span + input { margin-right:10px; display:inline-block; }
.datagrid_input .resultBEP { color:#202020; }
.icon_goal { display:inline-block; vertical-align:middle; border-radius:2px; padding:3px 5px; width:47px; display:inline-block; color:#fff; font-size:11px; text-align:center; line-height:1.2; letter-spacing:-0.03em;  }
.icon_goal.g_exceed { background:#2c5186; }
.icon_goal.bep_exceed { background:#387cc8; }
.icon_goal.shortfall { background:#fc6a6a; }
.conditiontext { vertical-align:middle; margin-left:15px; }
.conditiontext .equalsign { color:#a9a9a9; }
.conditiontext .result { color:#202020; }
.conditiontext em { color:#777; margin-left:5px; vertical-align:middle; }

.output_simul_tb { letter-spacing:-0.08px; width:100%; border:#b9c1ce solid 1px;  font-size:12px; }
.output_simul_tb thead th {background:#d8dce3; font-weight:bold; color:#3b4354; line-height:16px; padding:6px 5px 6px; text-align:center; border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; }
.output_simul_tb thead th em { font-size:11px; color:#616b7e; margin-left:3px; }
.output_simul_tb thead th:first-child { border-left:none; }
.output_simul_tb tbody th { font-weight:normal; background:#f3f4f7; padding:4px 8px 4px; border-top:#d6d7d9 solid 1px; border-right:#d6d7d9 solid 1px; }
.output_simul_tb tbody td { font-family:"돋움"; border-top:#e6e6e6 solid 1px; border-left:#e6e6e6 solid 1px; line-height:16px; padding:4px 5px 4px; color:#6d6c74; text-align:center; letter-spacing:-0.5px; color:#6d6c74; letter-spacing:-0.5px; line-height:16px;}
.output_simul_tb tfoot tr { background:#ebedf1; }
.output_simul_tb tfoot th { border-top:#d2d3d5 solid 1px; font-weight:bold; color:#3b4354; padding:5px 5px 5px; text-align:center; }
.output_simul_tb tfoot em { font-weight:normal; }
.output_simul_tb tfoot td { border-left:#d2d3d5 solid 1px; border-top:#d2d3d5 solid 1px; color:#484e5b; padding:5px 5px 5px; text-align:center; }
.output_simul_tb tfoot .sum_result { color:#F00; }
.sum_result { color:#eb2b2b; }
.output_simul_tb .txt_income { text-align:right; letter-spacing:0; color:#2069dd;}
.output_simul_tb .txt_num_st { text-align:right; letter-spacing:0; }
.output_simul_tb .txt_goal { text-align:right; letter-spacing:0; }
.output_simul_tb .txt_conti_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.output_simul_tb .txt_total_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.output_simul_tb input { height:20px; line-height:20px; border:#dadada solid 1px; text-indent:4px; box-sizing:border-box; vertical-align:middle; *text-indent:0px; }
.output_simul_tb input[readonly] { background: #eee; color: #676767; text-shadow: 0px 1px #fff; }

.simulation { background:#fffee0; }
.simtype { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:80px;}
.simtype2 { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:100%; }
.btn_s_type3 { background:#4e5a72; border:#394960 solid 1px; border-radius:3px; height:20px; min-width:30px; padding:0 7px; font-size:11px; color:#fff!important; font-weight:normal; display:inline-block; vertical-align:middle; line-height:20px; }

.h3_simtitle_st { background:url(../images/common/board/bg_tab06_repeat.gif) repeat-x 0 bottom; border:#b8bfcc solid 1px; border-top-left-radius:5px; border-top-right-radius:5px; padding:7px 15px 9px; }
.h3_simtitle_st .title { background:url(../images/common/bu_h3_title.gif) no-repeat 0 center; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:17px; letter-spacing:-0.02em; padding-left:12px; line-height:1; vertical-align:middle; }
.h3_simtitle_st span, .h3_simtitle_st a, .h3_simtitle_st ul { vertical-align:middle; }

.h4_title_basic { background:url(../images/common/bu_h4_title.gif) no-repeat left center; padding-left:18px; color:#2a3a5b; font-family:'NanumBarunL'; font-weight:bold; font-size:13px; line-height:1.2; letter-spacing:-0.04em; vertical-align:middle; }
.h4_title_basic span, .h4_title_basic em, .h4_title_basic a, .h4_title_basic button { vertical-align:middle; }
.h5_title_basic { background:url(../images/common/bu_h5_title.gif) no-repeat left center; padding-left:7px; color:#3673b7; font-family:'NanumBarunL'; font-weight:bold; font-size:12.5px; line-height:1.2; letter-spacing:-0.04em; vertical-align:middle; }
.h5_title_basic span, .h5_title_basic em, .h5_title_basic a, .h5_title_basic button { vertical-align:middle; }
.h5_title_basic .btn_s_type_g { height:inherit; line-height:1; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; }

.simul_boxWrap { border:#b8bfcc solid 1px;  border-top:none; background:url(../images/common/bg_detailcon.png) repeat-x 0 0; }
.simmul_dllist { border-top:#c1c1c1 dashed 1px; }
.simmul_dllist:first-child { border-top:none; }
.simmul_dllist dt { float:left; width:120px; padding:12px 0px 15px 13px; box-sizing:border-box; }
.simmul_dllist dd { width:auto; overflow:hidden; border-left:#dadada solid 1px; padding:12px 18px 15px 18px; box-sizing:border-box; }
.simmul_dllist dd h5 { margin-bottom:8px; margin-top:20px; }
.simmul_dllist dd h5:first-child { margin-top:2px; }
.simul_memberBox { border:#c8cbce solid 1px; border-radius:3px; padding:5px 10px; float:none; *zoom:1; }
.simul_memberBox:after { content:""; display:block; height:0px; clear:both; }

.stat_type_ulList { float:none; *zoom:1; display:inline-block; }
.stat_type_ulList:after { content:""; display:block; clear:both; height:0; }
.stat_type_ulList li { float:left; vertical-align:middle; border:#9aaacc solid 1px; border-radius:20px; font-size:11px; padding:0 5px; box-sizing:border-box; background:#f7f9fc; margin:2px 0 2px 5px; }
.stat_type_ulList li span { vertical-align:middle; letter-spacing:0em; }
.stat_type_ulList li .code { vertical-align:middle; color:#3d5da1; }
.stat_type_ulList li .btn_delete { background:url(../images/mypage/icon_delete2.gif) no-repeat center center; width:12px; height:16px; display:inline-block; vertical-align:middle; margin-left:2px; cursor:pointer; opacity:0.7; }
.stat_type_ulList li .btn_delete em { display:none; }

.sim_btnZone { text-align:right; margin-top:-30px; margin-bottom:10px; }
.sim_btnZone a { margin-left:6px; background:url(../images/common/bg_btn_gra_s.gif) repeat-x 0 center; border:#c4c4c4 solid 1px; border-radius:2px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:13px; }
.sim_btnZone a strong { color:#242424; }
.sim_btnZone a:first-child { margin-left:0px; }

.total_wk_tb_wrap { text-align:right; }

.total_wk_perform { border-bottom:#9298a2 solid 1px; display:inline-block; border:#b9c1ce solid 1px; font-size:12px; }
.total_wk_perform th { font-weight:normal; background:#d8dce3; padding:4px 10px 4px; border-top:#b9c1ce solid 1px; border-left:#b9c1ce solid 1px; line-height:1; text-align:center;  }
.total_wk_perform th.bg_gray { background:#e7e9ec; font-weight:normal; }
.total_wk_perform td { border-top:#b9c1ce solid 1px; border-left:#dadada solid 1px; padding:10px 7px 5px 7px; color:#797979; text-align:right; font-size:14px; min-width:90px; font-weight:bold; }
.total_wk_perform th:first-child { border-left:none; font-weight:bold; }
.total_wk_perform tr:first-child th, .total_wk_perform tr:first-child td { border-top:none; }
.total_wk_perform .txt_money_red { color:#eb2b2b; }
.total_wk_perform .txt_money_black { color:#202020; }
.ib_AllWrap { width:1200px; margin:0 auto; }
.employee_list { color:#84888d; font-size:11px; letter-spacing:-0.5px; margin-left:3px; }
.employee_list span { color:#6d6c74; margin-right:2px; }
.btn_delete_employee { background:url(../images/common/board/btn_board_collection.gif) no-repeat; width:13px; height:13px; line-height:13px; display:inline-block; vertical-align:middle; background-position:5px 5px; padding:5px 4px; }
.btn_delete_employee em { position:absolute; left:-9999999999999px; visibility:hidden; }
.btn_s_type_g { background:url(../images/approve/bg_btn_gra_s.gif) repeat-x 0 center; border:#c4c4c4 solid 1px; border-radius:2px; height:23px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:13px; }


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

.popup_ListBox { position:relative; border:1px solid #c1c1c1; border-top-left-radius:3px; border-top-right-radius:3px; background:#f9f9f9; overflow:auto; overflow-x:hidden; max-height:109px; border-bottom:none; }
.labelList_st { float:none; *zoom:1; padding:15px; margin-left:-15px; }
.labelList_st:after { content:""; display:block; clear:both; height:0; }
.labelList_st li { float:left; vertical-align:middle; min-width:20%; margin-left:15px; }
.labelList_st li label { display:inline-block; vertical-align:middle; }
.labelList_st li input { vertical-align:middle; }
.labelList_st li span { vertical-align:middle; margin-left:4px; }

.memberBox_controll { border:1px solid #c1c1c1; border-bottom-left-radius:3px; border-bottom-right-radius:3px; height:11px; background:#f5f5f5; }
.memberBox_controll:hover { background:#f0f0f0; }
.memberBox_controll em { position:absolute; left:-99999999999999px; visibility:hidden; font-size:0; }
.memberBox_controll .btn_td_close { background:url(../images/common/btn_td_close.gif) no-repeat center 3px; height:11px; width:100%; display:block; }
.memberBox_controll .btn_td_open { background:url(../images/common/btn_td_open.gif) no-repeat center 3px; height:11px; width:100%; display:block; }

</style>

	<div class="ib_AllWrap">
		<div class="carSearchBox">
			<span class="carSearchtitle"><label for="IDNAME01">직원성과평가 시스템</label></span>
			<select class="select_b w_date" id="IDNAME01" title="연도선택">
				<option selected="">2016</option>
				<option>2015</option>
				<option>2014</option>
				<option>2013</option>
				<option>2012</option>
			</select>
		</div>
		<ul class="tabZone_st03 mgt20">
			<li class="current"><a href="#">전체</a></li>
			<li><a href="#">Mezzanine</a></li>
			<li><a href="#">M&amp;A</a></li>
			<li><a href="#">TIPS</a></li>
		</ul>
		<h3 class="h3_simtitle_st mgt20">
			<span class="title">Mezzanine</span>
			<a href="javascript:showlayer(tempmodalPOP);" class="btn_s_type3 mgl30">유형선택</a>
			<ul class="stat_type_ulList mgl10">
				<li><span class="code">CB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">EB</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">Pre-IPO</span><span class="btn_delete"><em>삭제</em></span></li>
				<li><span class="code">M&amp;A</span><span class="btn_delete"><em>삭제</em></span></li>
			</ul>
		</h3>
		<div class="simul_boxWrap">
			<dl class="simmul_dllist">
				<dt><h4 class="h4_title_basic">IB투자_영업</h4></dt>
				<dd>
					<h5 class="grid_title2"><span>[대상자선택]</span><a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g mgl10">직원선택</a></h5>
					<div class="simul_memberBox">
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</div>
					<h5 class="grid_title2">[성과금설정]</h5>
					<div class="sim_btnZone"><a href="#">초기화</a><a href="#">시뮬레이션</a><a href="#"><strong>설정값 저장</strong></a></div>
					<table class="datagrid_input" summary="Mezzanine 설정(BEP, 구간금액, 구간비중, PS배분율, PI배분율)">
						<caption>Mezzanine 설정</caption>
						<colgroup>
							<col width="100"> <!--구분-->
							<col width="*"> <!--입력-->
							<col width="100"> <!--구간비중-->
							<col width="250"> <!--BEF구분-->
							<col width="130"> <!--입력-->
							<col width="150"> <!--입력-->
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">BEP</th>
								<td class="spanspace"><span>개별연봉</span><span>x</span><input type="text" class="input_b simulation simtype" title="몇배" /><span>=</span><span class="resultBEP"><strong>? </strong>억</span></td>
								<th scope="row" rowspan="3">구간배분</th>
								<td><span class="icon_goal shortfall">BEP미달</span><span class="conditiontext"><em class="result">실적</em><em class="equalsign">&le;</em><em>BEP</em></span></td>
								<td rowspan="3"><input type="text" class="input_b simulation simtype" title="금액입력" value="" /> 억당</td>
								<td class="txt_center"><input type="text" class="input_b simulation simtype" value="0" title="금액입력" disabled readonly  /> 백만원</td>
							</tr>
							<tr>
								<th scope="row">PS 배분율</th>
								<td><input type="text" class="input_b simulation simtype" title="PS배분율입력" value="30" /> %</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span><span class="conditiontext"><em>BEP</em><em class="equalsign">&lt;</em><em class="result">실적</em><em class="equalsign">&le;</em><em>목표</em></span></td>
								<td class="txt_center"><input type="text" class="input_b simulation simtype" title="PS배분금액 입력" value="15" /> 백만원</td>
							</tr>
							<tr>
								<th scope="row">PI 배분율</th>
								<td><input type="text" class="input_b simtype" value="70" title="PI배분율" disabled readonly /> %</td>
								<td><span class="icon_goal g_exceed">목표초과</span><span class="conditiontext"><em>BEP</em><em class="equalsign">&lt;</em><em>목표</em><em class="equalsign">&le;</em><em class="result">실적</em></span></td>
								<td class="txt_center"><input type="text" class="input_b simulation simtype" title="PS배분금액 입력" value="20" /> 백만원</td>
							</tr>
						</tbody>
					</table>
					<table class="output_simul_tb mgt15" summary="IB투자 성과보수 안내 (직원명, 연봉, BEP, 목표, 실적, 성과기준, 평가, 적용비율, 기여수익, PS배분, PI배분, PS+PI)">
						<caption>IB투자 성과보수 안내</caption>
						<colgroup>
							<col width="100"> <!--직원-->
							<col width="9%"> <!--연봉-->
							<col width="9%"> <!--BEP-->
							<col width="9%"> <!--목표-->
							<col width="9%"> <!--실적-->
							<col width="*"> <!--성과기준-->
							<col width="8%"> <!--평가-->
							<col width="8.5%"> <!--기여수익-->
							<col width="8.5%"> <!--PS배분-->
							<col width="8.5%"> <!--PI배분-->
							<col width="8.5%"> <!--PS+PI배분-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">직원</th>
								<th scope="col">연봉</th>
								<th scope="col">BEP</th>
								<th scope="col">목표</th>
								<th scope="col">실적</th>
								<th scope="col">성과기준<em>(실적-BEP)</em></th>
								<th scope="col">평가</th>
								<th scope="col">기여수익</th>
								<th scope="col">PS배분</th>
								<th scope="col">PI배분</th>
								<th scope="col">PS+PI</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">이명철</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.50" /></td>
								<td class="txt_num_st">225.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
								<td class="txt_num_st">820.00</td>
								<td class="txt_num_st">595.00</td>
								<td><span class="icon_goal g_exceed">목표초과</span></td>
								<td class="txt_conti_st">1.19</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.83</td>
								<td class="txt_total_st">1.01</td>
							</tr>
							<tr>
								<th scope="row">이주훈</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="1.20" /></td>
								<td class="txt_num_st">180.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="800.00" /></td>
								<td class="txt_num_st">772.60</td>
								<td class="txt_num_st">592.60</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.89</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.62</td>
								<td class="txt_total_st">0.80</td>
							</tr>
							<tr>
								<th scope="row">박종서</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.90" /></td>
								<td class="txt_num_st">135.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="400.00" /></td>
								<td class="txt_num_st">136.8</td>
								<td class="txt_num_st">1.80</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.00</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.00</td>
								<td class="txt_total_st">0.18</td>
							</tr>
							<tr>
								<th scope="row">정상호</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.70" /></td>
								<td class="txt_num_st">105.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="400.00" /></td>
								<td class="txt_num_st">261.0</td>
								<td class="txt_num_st">156.00</td>
								<td><span class="icon_goal bep_exceed">BEP초과</span></td>
								<td class="txt_conti_st">0.23</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.16</td>
								<td class="txt_total_st">0.34</td>
							</tr>
							<tr>
								<th scope="row">김자점</th>
								<td class="txt_income"><input type="text" class="input_b simulation simtype2" title="연봉입력" value="0.80" /></td>
								<td class="txt_num_st">120.00</td>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="목표금액입력" value="200.00" /></td>
								<td class="txt_num_st">445.0</td>
								<td class="txt_num_st">325.00</td>
								<td><span class="icon_goal g_exceed">목표초과</span></td>
								<td class="txt_conti_st">0.65</td>
								<td class="txt_num_st">0.18</td>
								<td class="txt_num_st">0.46</td>
								<td class="txt_total_st">0.63</td>
							</tr>
						</tbody>	
						<tfoot>	
							<tr>
								<th scope="row">합계</th>
								<td class="txt_income"><strong>5.10</strong></td>
								<td class="txt_num_st">765.00</td>
								<td class="txt_goal"><strong>2,600.00</strong></td>
								<td class="txt_num_st">2,435.40</td>
								<td class="txt_num_st">1,670.40</td>
								<td>&nbsp;</td>
								<td class="txt_conti_st"><strong>2.97</strong></td>
								<td class="txt_num_st">0.89</td>
								<td class="txt_num_st">2.08</td>
								<td class="txt_total_st"><strong>2.97</strong></td>
							</tr>
						</tfoot>
					</table>
					<div class="total_wk_tb_wrap mgt15 mgb10">
						<table class="total_wk_perform" summary="전체">
							<caption>전체</caption>
							<colgroup>
								<col width="100">
								<col width="*" span="4">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="2">IB 투자</th>
									<th scope="col" class="bg_gray">총 성과급</th>
									<th scope="col" class="bg_gray">PS합계</th>
									<th scope="col" class="bg_gray">PS배당</th>
									<th scope="col" class="bg_gray">PI배분</th>
								</tr>
								<tr>
									<td class="txt_money_red"><strong>2.97</strong></td>
									<td>0.89</td>
									<td>0.18</td>
									<td>2.08</td>
								</tr>
							</tbody>
						</table>
					</div>
				</dd>
			</dl>
			<dl class="simmul_dllist">
				<dt><h4 class="h4_title_basic">기업분석</h4></dt>
				<dd>
					<h5 class="grid_title2"><span>[대상자선택]</span><a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g mgl10" style="height:inherit;">직원선택</a></h5>
					<div class="simul_memberBox">
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(대리)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</div>
					<h5 class="grid_title2">[성과금설정]</h5>
					<div class="sim_btnZone"><a href="#">초기화</a><a href="#">시뮬레이션</a><a href="#"><strong>설정값 저장</strong></a></div>
					<table class="datagrid_input" summary="Mezzanine 설정(BEP, 구간금액, 구간비중, PS배분율, PI배분율)">
						<caption>Mezzanine 설정</caption>
						<colgroup>
							<col width="100"> <!--구분-->
							<col width="*"> <!--입력-->
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">팀할당액</th>
								<td class="spanspace"><span>IB투자합계</span><span>x</span><input type="text" class="input_b simulation simtype" title="분자입력" value="3" /><span>/</span><input type="text" class="input_b simulation simtype" title="분모입력" value="7" />
								<span>=</span><span class="resultBEP"><strong>1.27 </strong>억</span></td>
							</tr>
							<tr>
								<th scope="row">소싱성과금</th>
								<td class="spanspace"><span>투자결정금액</span><span>x</span><input type="text" class="input_b simulation simtype" title="투자결정금액의 몇퍼센트" value="100" /><span>%</span><span>x</span><input type="text" class="input_b simulation simtype" title="수수료입력" value="0.15" /></td>				
							</tr>
						</tbody>
					</table>
					<table class="output_simul_tb mgt15" summary="IB투자 성과보수 안내 (직원명, 연봉, BEP, 목표, 실적, 성과기준, 평가, 적용비율, 기여수익, PS배분, PI배분, PS+PI)">
						<caption>IB투자 성과보수 안내</caption>
						<colgroup>
							<col width="100"> <!--직원-->
							<col width="*"> <!--ROLE RATE-->
							<col width="18%"> <!--PS배분-->
							<col width="18%"> <!--실적-->
							<col width="18%"> <!--PI배분-->
							<col width="18%"> <!--PS+PI배분-->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">직원</th>
								<th scope="col">ROLE RATE</th>
								<th scope="col">PS배분</th>
								<th scope="col">실적</th>
								<th scope="col">PI배분</th>
								<th scope="col">PS+PI</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">이명철</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.4" /></td>
								<td class="txt_num_st">0.51</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.51</td>
							</tr>
							<tr>
								<th scope="row">김영도</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.3" /></td>
								<td class="txt_num_st">0.38</td>
								<td class="txt_num_st">40</td>
								<td class="txt_num_st">0.06</td>
								<td class="txt_total_st">0.44</td>
							</tr>
							<tr>
								<th scope="row">장영재</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.2" /></td>
								<td class="txt_num_st">0.25</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.25</td>
							</tr>
							<tr>
								<th scope="row">김도연</th>
								<td class="txt_goal"><input type="text" class="input_b simulation simtype2" title="기여도입력" value="0.1"></td>
								<td class="txt_num_st">0.13</td>
								<td class="txt_num_st">0</td>
								<td class="txt_num_st">0</td>
								<td class="txt_total_st">0.13</td>
							</tr>
						</tbody>	
						<tfoot>	
							<tr>
								<th scope="row">합계</th>
								<td class="txt_goal"><strong>1.0</strong></td>
								<td class="txt_num_st">1.27</td>
								<td class="txt_num_st">40.00</td>
								<td class="txt_num_st">0.06</td>
								<td class="txt_total_st"><strong>1.33</strong></td>
							</tr>
						</tfoot>
					</table>
					<div class="total_wk_tb_wrap mgt15 mgb10">
						<table class="total_wk_perform" summary="전체">
							<caption>전체</caption>
							<colgroup>
								<col width="100">
								<col width="*" span="4">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="2">기업분석</th>
									<th scope="col" class="bg_gray">총 성과급</th>
									<th scope="col" class="bg_gray">PS합계</th>
									<th scope="col" class="bg_gray">실적</th>
									<th scope="col" class="bg_gray">PI배분</th>
								</tr>
								<tr>
									<td class="txt_money_red"><strong>1.33</strong></td>
									<td>1.27</td>
									<td>40.00</td>
									<td>0.06</td>
								</tr>
							</tbody>
						</table>
					</div>
				</dd>
			</dl>
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
		
	</div>