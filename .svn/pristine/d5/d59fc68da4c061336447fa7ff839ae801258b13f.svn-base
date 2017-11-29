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


/* 직원성과 시뮬레이션 */
.mgt3 { margin-top:3px; }
.w42px { width:42px; }
.simulation { background:#fffee0; }
.simtype { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:80px;}
.simtype2 { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; width:100%; }
.simtype_b { font-family:Tahoma, Geneva, sans-serif!important; font-size:12px; letter-spacing:0!important; text-align:right!important; padding-right:4px; box-sizing:border-box; }
.btn_s_type3 { background:#4e5a72; border:#394960 solid 1px; border-radius:3px; height:20px; min-width:30px; padding:0 7px; font-size:11px; color:#fff!important; font-weight:normal; display:inline-block; vertical-align:middle; line-height:20px; }


.ib_AllWrap { width:1200px; margin:0 auto; font-family:"돋움",Dotum,"굴림",Gulim,arial,sans-serif; color:#555; }
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


.simul_set_tb { letter-spacing:-0.08px; width:100%; border:#b9c1ce solid 1px; }
.simul_set_tb thead th {background:#d8dce3; font-weight:normal; color:#3b4354; font-size:12px; line-height:16px; padding:4px 5px 4px; text-align:center; border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; }
.simul_set_tb thead th em { font-size:11px; color:#616b7e; margin-left:3px; }
.simul_set_tb thead th:first-child { border-left:none; }
.simul_set_tb tbody th { font-size:12px; font-weight:bold; background:#f3f4f7; padding:4px 8px 4px; border-top:#d6d7d9 solid 1px; border-right:#d6d7d9 solid 1px;  color:#444e63; }
.simul_set_tb tbody td { font-size:12px; border-top:#e6e6e6 solid 1px; border-left:#e6e6e6 solid 1px; line-height:16px; padding:4px 10px 4px; color:#6d6c74; text-align:center; letter-spacing:-0.5px; color:#6d6c74; letter-spacing:-0.5px; line-height:16px; }
.simul_set_tb tbody tr.tr_divide_line td, .simul_set_tb tbody tr.tr_divide_line th { border-top:#b9c1ce solid 1px; }

.simul_set_tb .total_row { background:#f9f9f9; }
.simul_set_tb .total_row th { background:none; border-top:#e6e6e6 solid 1px; border-right:#e6e6e6 solid 1px; font-weight:normal; font-size:11px; text-align:right; font-family:Tahoma, Geneva, sans-serif; } 
.simul_set_tb .total_row td { text-align:right; letter-spacing:0; }
.simul_set_tb .total_row .input_next { padding-right:25px; }

.simul_set_tb .btn_s_type_g { background:url(../images/approve/bg_btn_gra_s.gif) repeat-x 0 center; border:#c4c4c4 solid 1px; border-radius:2px; height:21px; min-width:30px; padding:4px 6px; font-size:11px; color:#666!important; font-weight:normal; display:inline-block; vertical-align:middle; letter-spacing:-0.05em; box-sizing:border-box; line-height:1; }
.simul_set_tb .vm, .simul_set_tb .vm input, .simul_set_tb .vm em, .simul_set_tb .vm span, .simul_set_tb .vm label, .simul_set_tb .vm button, .simul_set_tb .vm a { vertical-align:middle; }
.simul_set_tb .cate_st01 { text-align:center; color:#3d5da1; /*color:#2e6bbd;*/ }
.simul_set_tb .cate_st01 em { font-size:11px; }
.simul_set_tb .cate_st02 { text-align:right; color:#6d7c9b; }
.simul_set_tb .cate_st02 em { font-size:11px; }
.simul_set_tb .txt_target { vertical-align:top; text-align:left; }
.simul_set_tb .employee_list { display:inline-block; }
.simul_set_tb td.spanspace span { margin-right:5px; display:inline-block; }
.simul_set_tb td.spanspace span + input { margin-right:5px; display:inline-block; }
.simul_set_tb .txt_right { text-align:right; }


.simul_set_tb tfoot tr { background:#ebedf1; }
.simul_set_tb tfoot th { border-top:#d2d3d5 solid 1px; font-weight:bold; color:#3b4354; padding:5px 5px 5px; text-align:center; }
.simul_set_tb tfoot em { font-weight:normal; }
.simul_set_tb tfoot td { border-left:#d2d3d5 solid 1px; border-top:#d2d3d5 solid 1px; color:#484e5b; padding:5px 5px 5px; text-align:center; }
.simul_set_tb tfoot .sum_result { color:#eb2b2b; }
.simul_set_tb .txt_income { text-align:right; letter-spacing:0; color:#2069dd;}
.simul_set_tb .txt_num_st { text-align:right; letter-spacing:0; }
.simul_set_tb .txt_goal { text-align:right; letter-spacing:0; }
.simul_set_tb .txt_conti_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.simul_set_tb .txt_total_st { text-align:right; letter-spacing:0; color:#eb2b2b; }
.simul_set_tb input { height:20px; line-height:20px; border:#dadada solid 1px; text-indent:4px; box-sizing:border-box; vertical-align:middle; *text-indent:0px; }
.simul_set_tb input[readonly] { background: #eee; color: #676767; text-shadow:0px 1px #fff; }


/*업무지원-통계*/
.tb_statistics { width:100%; border-bottom:#b2bac5 solid 1px; }
.tb_statistics thead tr { background:#6a798e; border:#495b74 solid 1px; }
.tb_statistics thead th { border-left:#516279 solid 1px; font-weight:bold; color:#fff; text-align:center; font-weight:bold; font-size:12px; padding:8px 0; letter-spacing:0.5px; }

.tb_statistics tbody tr { border-left:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; }
.tb_statistics tbody th { text-align:left; padding:9px 12px 9px 32px; border-right:#b9c1ce solid 1px; border-bottom:#b9c1ce solid 1px; color:#3b4354; letter-spacing:-0.03em; font-size:12px;}
.tb_statistics tbody td { padding:9px 12px; border-left:#d6dbe3 solid 1px; border-bottom:#b9c1ce solid 1px; color:#6d6c74; font-size:12px; }

.tb_statistics tfoot tr { background:#d8dce3; border-left:#b2bac5 solid 1px; border-right:#b2bac5 solid 1px; }
.tb_statistics tfoot th { padding:7px 10px; color:#3b4354; border-top:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; font-size:12px; }
.tb_statistics tfoot td { padding:7px 10px; color:#3b4354; border-top:#c3c6cd solid 1px; border-left:#c3c6cd solid 1px; text-align:right; font-weight:bold; font-size:12px; }
.tb_statistics tfoot .txt_sum_money { color:#eb2700; font-weight:bold; }

.tb_statistics .team_row { background:#ededee; }
.tb_statistics .team_row th { background:url(../images/support_w/th_team_open.gif) no-repeat 12px center; font-weight:normal; color:#000; border-right:#c1c1c1 solid 1px; border-bottom:#c1c1c1 solid 1px; }
.tb_statistics .team_row td { text-align:right; color:#333; border-left:#dadada solid 1px; border-bottom:#c1c1c1 solid 1px; }
.tb_statistics .team_row .txt_sum_money { color:#eb2700; }

.tb_statistics .team_row.select_row th { background:url(../images/support_w/th_team_closed.gif) no-repeat 12px center; font-weight:bold; }
.tb_statistics .team_row.select_row td { font-weight:bold; }
.tb_statistics .team_row.select_row .txt_sum_money { color:#eb2700; font-weight:bold; }

.tb_statistics .title_row th { background:url(../images/support_w/th_icon_closed.gif) no-repeat 18px center #f6f7f9; font-weight:normal; padding-left:34px; color:#444e63; }
.tb_statistics .title_row td { text-align:right; color:#6f7175; }
.tb_statistics .title_row .txt_sum_money { color:#eb2700; }
.tb_statistics .title_row.select_row th { background:url(../images/support_w/th_icon_open.gif) no-repeat 18px center #e7eaed; font-size:12px; padding-left:34px; font-weight:bold; }
.tb_statistics .title_row.select_row td { background:#f0f2f4; font-size:12px; font-weight:bold; }
.tb_statistics .title_row.select_row .txt_sum_money { color:#eb2700; }

.tb_statistics .sub_row th { font-weight:normal; border-bottom:none; padding:5px 12px 5px 36px; background:url(../images/support_w/th_subrow_line.gif) no-repeat 23px center #e7eaed; color:#6f757c;  letter-spacing:-0.08em; font-size:11px; }
.tb_statistics .sub_row td { padding:5px 12px; border-bottom:#b9c1ce dotted 1px; text-align:right; color:#757a83; background:#f0f2f4; font-size:11px; }
.tb_statistics .sub_row.sub_last th { background:url(../images/support_w/th_subrowlast_line.gif) no-repeat 23px -43px #e7eaed; border-bottom:#b9c1ce solid 1px; }
.tb_statistics .sub_row.sub_last td { border-bottom:#b9c1ce solid 1px; }
.tb_statistics .sub_row .txt_sum_money { color:#60656e; }


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
			<li class="current"><a href="/mypage/eis_admin3.jsp">설정</a></li>
			<li><a href="/mypage/eis_view_mezzanine.jsp">Mezzanine</a></li>
			<li><a href="#">M&amp;A</a></li>
			<li><a href="#">자기자본투자</a></li>
			<li><a href="#">블락딜중개</a></li>
			<li><a href="#">M&amp;A중개</a></li>
			<li><a href="#">펀드</a></li>
			<li><a href="#">분석</a></li>
			<li><a href="/mypage/eis_view_all.jsp">전체</a></li>
		</ul>
		
		<h3 class="h3_title_basic mgt20"><span>시너지 성과관리 셋팅화면</span><span class="sub_desc">( 메자닌, M&amp;A, 자기자본투자, 워런트/블록딜, M&amp;A 자문중개, 펀드, 분석 )</span></h3>
		<table class="simul_set_tb" summary="인물, 회사분류 (구분, 사용여부)">
			<caption>인물, 회사분류</caption>
			<colgroup>
				<col width="120" /> 	<!--구분-->
				<col width="150" /> 	<!--BEP기준-->
				<col width="120" /> 	<!--적용기준-->
				<col width="100" /> 	<!--투자구분-->
				<col width="100" /> 	<!--투자구분 세부항목-->
				<col width="130" /> 	<!--지급비율-->
				<col width="*" /> 		<!--대상-->
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2" scope="col"><strong>구분</strong></th>
					<th rowspan="2" scope="col"><strong>BEP 기준</strong></th>
					<th rowspan="2" scope="col"><strong>적용기준</strong></th>
					<th colspan="4" scope="col"><strong>성과급계산</strong></th>
				</tr>
				<tr>
					<th colspan="2" scope="col">투자구분</th>
					<th scope="col">지급비율 설정</th>
					<th scope="col">대상</th>
				</tr>
			</thead>
			<tbody>
				<!--메자닌(수익기준후지급)-->
				<tr>
					<th rowspan="10">메자닌</th>
					<td rowspan="10" class="vm">
						<p><span>딜소싱 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="몇배"  value="150" /></p>
					</td>
					<td rowspan="8">수익기준 후지급<br><em>(IB투자팀 적용)</em></td>
					<td rowspan="4" class="cate_st01">펀드/일임</td>
					<td class="cate_st02">IB투자팀<em>(소싱)</em></td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="7.50" /> <span>%</span></td>
					<td class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</td>
				</tr>
				
				<tr>
					<td class="cate_st02">분석팀</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="3.75" /> <span>%</span></td>
					<td class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">기타부서</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="3.75" /> <span>%</span></td>
					<td></td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td class="input_next">15.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="4" class="cate_st01">자기자본</td>
					<td class="cate_st02">IB투자팀<em>(소싱)</em></td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="5" /> <span>%</span></td>
					<td class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">분석팀</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="1" /><span>%</span></td>
					<td class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">기타부서</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="1" /> <span>%</span></td>
					<td></td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td class="input_next">15.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<!--/메자닌(수익기준후지급)/-->
				<!--메자닌(소싱기준선지급)-->
				<tr>
					<td rowspan="2">소싱기준 후 지급<br><em>(IB투자팀외 적용)</em></td>
					<td class="cate_st01"><span>500억</span> 이하</td>
					<td class="cate_st02"><span>100억</span>당</td>
					<td class="vm"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="1500"> <span>만원</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st01"><span>500억</span> 이상</td>
					<td class="cate_st02"><span>100억</span>당</td>
					<td class="vm"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="2000"> <span>만원</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/메자닌(소싱기준선지급)/-->
				<!--M&A-->
				<tr class="tr_divide_line">
					<th rowspan="5">M&amp;A</th>
					<td rowspan="5" class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="배수입력" value="2.5" /></p>
					</td>
					<td rowspan="4">수익기준 후지급<br>(M&amp;A팀 적용)</td>
					<td colspan="2" class="cate_st01">전체 딜규모의</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="2" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="3" class="cate_st01">역할별</td>
					<td class="cate_st02">소싱</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="1" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st02">분석</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="0.50" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st02">협상</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="0.50" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td>수익기준 후지급<br>(M&amp;A팀 적용)</td>
					<td colspan="2" class="cate_st01">전체 딜규모의</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="2" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/M&A/-->
				<!--자기자본 투자-->
				<tr class="tr_divide_line">
					<th>자기자본 투자</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="배수입력" value="2.5" /></p>
					</td>
					<td></td>
					<td colspan="2" class="cate_st01">전체 투자수익의 <em>(메자닌 외)</em></td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="7" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/자기자본 투자/-->
				<!--워런트/블럭딜-->
				<tr class="tr_divide_line">
					<th>워런트/블록딜</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="배수입력" value="2.5" /></p>
					</td>
					<td>중개수수료</td>
					<td colspan="2" class="cate_st01">실제 수익의</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="10" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/워런트/블럭딜/-->
				<!--M&amp;A 자문중개-->
				<tr class="tr_divide_line">
					<th>M&amp;A 자문중개</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="배수입력" value="2.5" /></p>
					</td>
					<td>중개수수료</td>
					<td colspan="2" class="cate_st01">실제 수익의</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="20" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/M&amp;A 자문중개/-->
				<!--펀드-->
				<tr class="tr_divide_line">
					<th rowspan="10">펀드</th>
					<td rowspan="10" class="vm"><span>수익금액 기준연봉</span><br><span>x</span> <input type="text" class="input_b simulation simtype_b w42px" title="배수입력" value="2.5" /></td>
					<td>운용보수</td>
					<td colspan="2" class="cate_st01">BEP를 초과하는 운용보수의</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="10" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="9">성과보수</td>
					<td colspan="2" class="cate_st01">배분성과 보수비율</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="50" /> <span>%</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td colspan="3" class="cate_st01">배분성과 보수비율 <span class="fontRed">(50%)</span>을 역할별로 배분</td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="5" class="cate_st01">운영부분</td>
					<td class="cate_st02">소싱</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="10" /> <span>%</span></td>
					<td rowspan="4" class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em><a href="#" class="btn_delete_employee"><em>삭제</em></a></span>
					</td>
				</tr>
				<tr>
					<td class="cate_st02">분석</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="20" /> <span>%</span></td>
					
				</tr>
				<tr>
					<td class="cate_st02">펀딩</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="20" /> <span>%</span></td>
					
				</tr>
				<tr>
					<td class="cate_st02">네트워크</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="20" /> <span>%</span></td>
					
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td class="input_next">70.00 %</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2" class="cate_st01">관리부분</td>
					<td class="cate_st02">관리</td>
					<td class="txt_left"><input type="text" class="input_b simulation simtype" title="지급비율입력" value="30" /> <span>%</span></td>
					<td class="txt_target">
						<a href="javascript:void(window.open('/network/pop_employee_tree.jsp', 'newcr','resizable=no,width=500,height=520,scrollbars=yes'));" class="btn_s_type_g">직원선택</a>
					</td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td class="input_next">30.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<!--/펀드/-->
				<!--분석-->
				<tr class="tr_divide_line">
					<th>분석</th>
					<td colspan="6">딜소싱과 연계 / 펀드운용과 연계 수익/손해 / 평균수익률/디폴트 등 종합관리</td>
				</tr>
				<!--/분석/-->
			</tbody>
		</table>
		<!--버튼영역-->
		<div class="btn_baordZone2">
			<a href="#" class="btn_blueblack">설정저장</a><a href="#" class="btn_witheline">설정초기화</a><a href="/mypage/eis_admin3_preview.jsp" class="btn_blueblack2">미리보기</a>
		</div>
		<!--/버튼영역/-->
		
		
		
		
		
		
		
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
			<li><a href="/mypage/eis_admin3.jsp">설정</a></li>
			<li><a href="/mypage/eis_view_mezzanine.jsp">Mezzanine</a></li>
			<li><a href="/mypage/eis_view_mna.jsp">M&amp;A</a></li>
			<li><a href="/mypage/eis_view_invest.jsp">자기자본투자</a></li>
			<li><a href="/mypage/eis_view_mediate01.jsp">블락딜중개</a></li>
			<li><a href="/mypage/eis_view_mediate02.jsp">M&amp;A중개</a></li>
			<li><a href="/mypage/eis_view_fund.jsp">펀드</a></li>
			<li><a href="/mypage/eis_view_anal.jsp">분석</a></li>
			<li class="current"><a href="/mypage/eis_view_all.jsp">전체</a></li>
		</ul>
		
		<h3 class="h3_title_basic mgt20"><span>시너지 성과기준표</span><span class="sub_desc">( 메자닌, M&amp;A, 자기자본투자, 워런트/블록딜, M&amp;A 자문중개, 펀드, 분석 )</span></h3>
		<table class="simul_set_tb" summary="시너지 성과기준표 ( 메자닌, M&amp;A, 자기자본투자, 워런트/블록딜, M&amp;A 자문중개, 펀드, 분석 )">
			<caption>시너지 성과기준표</caption>
			<colgroup>
				<col width="120" /> 	<!--구분-->
				<col width="150" /> 	<!--BEP기준-->
				<col width="120" /> 	<!--적용기준-->
				<col width="100" /> 	<!--투자구분-->
				<col width="100" /> 	<!--투자구분 세부항목-->
				<col width="130" /> 	<!--지급비율-->
				<col width="*" /> 		<!--대상-->
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2" scope="col"><strong>구분</strong></th>
					<th rowspan="2" scope="col"><strong>BEP 기준</strong></th>
					<th rowspan="2" scope="col"><strong>적용기준</strong></th>
					<th colspan="4" scope="col"><strong>성과급계산</strong></th>
				</tr>
				<tr>
					<th colspan="2" scope="col">투자구분</th>
					<th scope="col">지급비율 설정</th>
					<th scope="col">대상</th>
				</tr>
			</thead>
			<tbody>
				<!--메자닌(수익기준후지급)-->
				<tr>
					<th rowspan="10">메자닌</th>
					<td rowspan="10" class="vm">
						<p><span>딜소싱 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <span>150</span></p>
					</td>
					<td rowspan="8">수익기준 후지급<br><em>(IB투자팀 적용)</em></td>
					<td rowspan="4" class="cate_st01">펀드/일임</td>
					<td class="cate_st02">IB투자팀<em>(소싱)</em></td>
					<td class="txt_right"><span>7.50 %</span></td>
					<td class="txt_target">
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span> 
					</td>
				</tr>
				
				<tr>
					<td class="cate_st02">분석팀</td>
					<td class="txt_right"><span>3.75 %</span></td>
					<td class="txt_target">
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">기타부서</td>
					<td class="txt_right"><span>3.75 %</span></td>
					<td></td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td>15.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="4" class="cate_st01">자기자본</td>
					<td class="cate_st02">IB투자팀<em>(소싱)</em></td>
					<td class="txt_right"><span>5 %</span></td>
					<td class="txt_target">
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">분석팀</td>
					<td class="txt_right"><span>1 %</span></td>
					<td class="txt_target">
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span> 
					</td>
				</tr>
				<tr>
					<td class="cate_st02">기타부서</td>
					<td class="txt_right"><span>1 %</span></td>
					<td></td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td>7.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<!--/메자닌(수익기준후지급)/-->
				<!--메자닌(소싱기준선지급)-->
				<tr>
					<td rowspan="2">소싱기준 후 지급<br><em>(IB투자팀외 적용)</em></td>
					<td class="cate_st01"><span>500억</span> 이하</td>
					<td class="cate_st02"><span>100억</span>당</td>
					<td class="txt_right"><span>1500 만원</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st01"><span>500억</span> 이상</td>
					<td class="cate_st02"><span>100억</span>당</td>
					<td class="txt_right"><span>2000 만원</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/메자닌(소싱기준선지급)/-->
				<!--M&A-->
				<tr class="tr_divide_line">
					<th rowspan="5">M&amp;A</th>
					<td rowspan="5" class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <span>2.5</span></p>
					</td>
					<td rowspan="4">수익기준 후지급<br>(M&amp;A팀 적용)</td>
					<td colspan="2" class="cate_st01">전체 딜규모의</td>
					<td class="txt_right"><span>2 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="3" class="cate_st01">역할별</td>
					<td class="cate_st02">소싱</td>
					<td class="txt_right"><span>1 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st02">분석</td>
					<td class="txt_right"><span>0.50 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td class="cate_st02">협상</td>
					<td class="txt_right"><span>0.50 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td>수익기준 후지급<br>(M&amp;A팀 적용)</td>
					<td colspan="2" class="cate_st01">전체 딜규모의</td>
					<td class="txt_right"><span>2 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/M&A/-->
				<!--자기자본 투자-->
				<tr class="tr_divide_line">
					<th>자기자본 투자</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <span>2.5</span></p>
					</td>
					<td></td>
					<td colspan="2" class="cate_st01">전체 투자수익의 <em>(메자닌 외)</em></td>
					<td class="txt_right"><span>7 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/자기자본 투자/-->
				<!--워런트/블럭딜-->
				<tr class="tr_divide_line">
					<th>워런트/블록딜</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <span>2.5</span></p>
					</td>
					<td>중개수수료</td>
					<td colspan="2" class="cate_st01">실제 수익의</td>
					<td class="txt_right"><span>10 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/워런트/블럭딜/-->
				<!--M&amp;A 자문중개-->
				<tr class="tr_divide_line">
					<th>M&amp;A 자문중개</th>
					<td class="vm">
						<p><span>수익금액 기준연봉</span></p>
						<p class="mgt3"><span>x</span> <span>2.5</span></p>
					</td>
					<td>중개수수료</td>
					<td colspan="2" class="cate_st01">실제 수익의</td>
					<td class="txt_right"><span>20 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<!--/M&amp;A 자문중개/-->
				<!--펀드-->
				<tr class="tr_divide_line">
					<th rowspan="10">펀드</th>
					<td rowspan="10" class="vm"><span>수익금액 기준연봉</span><br><span>x</span> <span>2.5</span></td>
					<td>운용보수</td>
					<td colspan="2" class="cate_st01">BEP를 초과하는 운용보수의</td>
					<td class="txt_right"><span>10 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="9">성과보수</td>
					<td colspan="2" class="cate_st01">배분성과 보수비율</td>
					<td class="txt_right"><span>50 %</span></td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td colspan="3" class="cate_st01">배분성과 보수비율 <span class="fontRed">(50%)</span>을 역할별로 배분</td>
					<td class="txt_left"></td>
				</tr>
				<tr>
					<td rowspan="5" class="cate_st01">운영부분</td>
					<td class="cate_st02">소싱</td>
					<td class="txt_right"><span>10 %</span></td>
					<td rowspan="4" class="txt_target">
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>,
						<span class="employee_list"><span>박정인</span><em>(과장)</em></span>
					</td>
				</tr>
				<tr>
					<td class="cate_st02">분석</td>
					<td class="txt_right"><span>20 %</span></td>
					
				</tr>
				<tr>
					<td class="cate_st02">펀딩</td>
					<td class="txt_right"><span>20 %</span></td>
					
				</tr>
				<tr>
					<td class="cate_st02">네트워크</td>
					<td class="txt_right"><span>20 %</span></td>
					
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td>70.00 %</td>
					<td></td>
				</tr>
				<tr>
					<td rowspan="2" class="cate_st01">관리부분</td>
					<td class="cate_st02">관리</td>
					<td class="txt_right"><span>30 %</span></td>
					<td class="txt_target"></td>
				</tr>
				<tr class="total_row">
					<th>Total</th>
					<td>30.00 %</td>
					<td class="txt_left"></td>
				</tr>
				<!--/펀드/-->
				<!--분석-->
				<tr class="tr_divide_line">
					<th>분석</th>
					<td colspan="6">딜소싱과 연계 / 펀드운용과 연계 수익/손해 / 평균수익률/디폴트 등 종합관리</td>
				</tr>
				<!--/분석/-->
			</tbody>
		</table>
		<!--버튼영역-->
		<div class="btn_baordZone2">
			<a href="/mypage/eis_admin3.jsp" class="btn_blueblack">수정</a>
		</div>
		<!--/버튼영역/-->
		
		
		
		
		<!--시너지전체 성과표-->
		<h3 class="h3_title_basic mgt20"><span>시너지전체 성과표</span><span class="sub_desc"></span></h3>
		<table class="tb_statistics" summary="시너지전체 성과표 (메자닌, M&amp;A, 자기자본투자, 워런트//블록딜, M&amp;A 자문중개, 펀드, 분석)">
			<caption>시너지전체 성과표</caption>
			<colgroup>
				<col width="*" />
				<col width="*" span="7" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>메자닌</th>
					<th>M&amp;A</th>
					<th>자기자본투자</th>
					<th>워런트/블록딜</th>
					<th>M&amp;A 자문중개</th>
					<th>펀드</th>
					<th>분석</th>
					<th>합계</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th scope="row">합계</th>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td>6,485,012</td>
					<td class="txt_sum_money">80,100,309</td>
				</tr>
			</tfoot>
			<tbody>
				<!--시스템기획팀-->
				<tr class="team_row select_row">
					<th scope="row">시너지전체</th>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td class="txt_sum_money">18,728,875</td>
				</tr>
				<tr class="title_row select_row">
					<th scope="row">IB투자팀</th>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td class="txt_sum_money">18,728,875</td>
				</tr>
				<tr class="sub_row">
					<th scope="row">이주훈</th>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td>1,434,700</td>
					<td class="txt_sum_money">27,807,009</td>
				</tr>
				<tr class="sub_row">
					<th scope="row">박종서</th>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td>2,461,512</td>
					<td class="txt_sum_money">3,899,740</td>
				</tr>
				<tr class="sub_row">
					<th scope="row">정상호</th>
					<td>199,000</td>
					<td>199,000</td>
					<td>199,000</td>
					<td>199,000</td>
					<td>199,000</td>
					<td>199,000</td>
					<td>199,000</td>
					<td class="txt_sum_money">6,369,274</td>
				</tr>
				<tr class="sub_row sub_last">
					<th scope="row">최진혁</th>
					<td>833,020</td>
					<td>833,020</td>
					<td>833,020</td>
					<td>833,020</td>
					<td>833,020</td>
					<td>833,020</td>
					<td>833,020</td>
					<td class="txt_sum_money">57,936,512</td>
				</tr>
				<tr class="title_row">
					<th scope="row">기업분석팀</th>
					<td>335,900</td>
					<td>335,900</td>
					<td>335,900</td>
					<td>335,900</td>
					<td>335,900</td>
					<td>335,900</td>
					<td>335,900</td>
					<td class="txt_sum_money">5,278,750</td>
				</tr>
				<tr class="title_row">
					<th scope="row">이명철</th>
					<td>405,300</td>
					<td>405,300</td>
					<td>405,300</td>
					<td>405,300</td>
					<td>405,300</td>
					<td>405,300</td>
					<td>405,300</td>
					<td class="txt_sum_money">9,381,940</td>
				</tr>
				<tr class="title_row">
					<th scope="row">김영도</th>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td class="txt_sum_money">7,031,141</td>
				</tr>
				<tr class="title_row">
					<th scope="row">장영재</th>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td>791,700</td>
					<td class="txt_sum_money">201,500</td>
				</tr>
				<tr class="title_row">
					<th scope="row">김도연</th>
					<td>15,600</td>
					<td>15,600</td>
					<td>15,600</td>
					<td>15,600</td>
					<td>15,600</td>
					<td>15,600</td>
					<td>15,600</td>
					<td class="txt_sum_money">626,200</td>
				</tr>
				<tr class="team_row">
					<th scope="row">경영지원팀</th>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td class="txt_sum_money">18,728,875</td>
				</tr>
				<tr class="team_row">
					<th scope="row">분석팀</th>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td>4,936,512</td>
					<td class="txt_sum_money">18,728,875</td>
				</tr>
			</tbody>
		</table>
		<!--//시너지전체 성과표//-->
		<br/><br/>
	</div>