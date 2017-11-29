<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>

<link href="<c:url value='/css/new_ib.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css"/>

<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stats.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>" ></script>


<!-- -------------- sjs (JS) :S -------------- -->
<script type="text/javascript" src="${pageContext.request.contextPath}/sjs/SGrid.js"></script>
<!-- -------------- sjs (JS) :E -------------- -->

<style>



/*사모투자 회수내역(161221)*/


/*tab ib*/

.PEFBox { border-left:#d1d7e0 solid 1px; border-right:#d1d7e0 solid 1px; border-top:#d1d7e0 solid 1px;  border-bottom:#d1d7e0 solid 1px; padding:22px 18px; border-radius:5px; }

.btn_month_on { background:url(../images/system/calendar_bg_on.gif) no-repeat; width:43px; height:23px; display:inline-block; vertical-align:middle; margin-right:2px;  font-weight:bold; color:#fff!important; text-align:center; line-height:22px; display:inline-block; }
.btn_month_off { background:url(../images/system/calendar_bg_off.gif) no-repeat; width:43px; height:23px; vertical-align:middle; margin-right:2px;  color:#858585!important; text-align:center; line-height:24px; display:inline-block;  }

.PEF_list_box { position:relative; border-top:#b9c1ce solid 1px; border-left:#b9c1ce solid 1px; border-right:#b9c1ce solid 1px; border-bottom:#9298a2 solid 1px; vertical-align:middle; font-color:#1b3964; }
.PEF_list_box .PEF_scroll_cover { position:absolute; right:0px; top:0px; z-index:4; background:url(../images/common/pef_btn_drop.png) no-repeat center center; width:17px; height:29px;  *width:17px; *height:30px; display:inline-block; }
.PEF_list_box .PEF_scroll_header { overflow-y:scroll; overflow-x:hidden; }
.PEF_total_box { position:relative; vertical-align:middle; font-color:#1b3964; }
.PEF_total_box .PEF_scroll_cover { position:absolute; right:0px; top:0px; z-index:4; background:url(../images/common/pef_total_icon.png) no-repeat center center; width:18px; height:29px; *width:18px; *height:29px; display:inline-block; }
.PEF_total_box .PEF_scroll_header { overflow-y:scroll; overflow-x:hidden; }

.PEF_list_box .PEF_scroll_body { max-height:700px; /*min-height:600px;*/ overflow-y:scroll; overflow-x:hidden; }

.PEF_table { letter-spacing:-1.10px; width:100%; overflow:auto; width:100%;  *width:99%; table-layout:fixed; vertical-align:middle;}

.PEF_table thead th { border-top:#a0a7b3 solid 1px; border-bottom:#a0a7b3 solid 1px; border-left:#d6d6d6 solid 1px; background:#f4f4f4; color:#22374f; font-weight:bold; padding:5px 2px 3px 2px;  font-size:11px; }
.PEF_table thead th:first-child { border-left:none; }

.PEF_table tbody th { background:#fafafa; color:#596775; text-align:center; font-size:11px; border-bottom:#e6e6e6 solid 1px; border-right:#d6d6d6 solid 1px; font-weight:normal; letter-spacing:0.2px; font-family:Dotum; padding:4px 8px; line-height:18px;}
.PEF_table tbody td { border-right:#e6e6e6 solid 1px; border-top:#e6e6e6 solid 1px; border-bottom:#e6e6e6 solid 1px; vertical-align:middle; text-align:center; font-size:11px; color:#596775; letter-spacing:0px;padding:4px 8px; line-height:18px; }
.PEF_table tbody tr.point th { border-top:#b9c1ce solid 1px; }
.PEF_table tbody tr.point td { border-top:#b9c1ce solid 1px; }

.PEF_table .numtype { font-size:11px; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; }
.PEF_table .numtype_right { font-size:11px; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.PEF_table .numtype_right_r { font-size:11px; color:#f43c33; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.PEF_table .numtype_right_b { font-size:11px; color:#0066d7; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.PEF_table .numtype_center { font-size:11px; color:#596775; font-family:Dotum;  text-align:center; }

.total_table { letter-spacing:-1.10px; width:100%; overflow:auto; width:100%;  *width:99%; table-layout:fixed; vertical-align:middle;}

.total_table thead th { border-top:#a0a7b3 solid 1px; border-left:#d6d6d6 solid 1px; background:#f4f4f4; color:#22374f; font-weight:bold; padding:5px 2px 3px 2px;  font-size:11px; }
.total_table thead th:first-child { border-left:none; }

.total_table tbody th { background:#fafafa; color:#596775; text-align:center; font-size:11px; border-bottom:#e6e6e6 solid 1px; border-right:#d6d6d6 solid 1px; font-weight:normal; letter-spacing:0.2px; font-family:Dotum; padding:4px 8px;}
.total_table tbody td { border-right:#e6e6e6 solid 1px; border-top:#e6e6e6 solid 1px; border-bottom:#e6e6e6 solid 1px; vertical-align:middle; text-align:center; font-size:11px; color:#596775; letter-spacing:0px;padding:4px 8px; line-height:18px; }
.total_table tbody tr.point th { border-top:#b9c1ce solid 1px; }
.total_table tbody tr.point td { border-top:#b9c1ce solid 1px; }

.total_table .td { position:absolute; right:0px; top:0px; z-index:4; background:url(../images/common/pef_btn_drop.png) no-repeat center center; width:17px; height:29px; border-bottom:#b1b5ba solid 1px; *width:17px; *height:29px; display:inline-block; }

.total_table .numtype { font-size:11px; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; }
.total_table .numtype_right { font-size:11px; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.total_table .numtype_right_r { font-size:11px; color:#f43c33; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.total_table .numtype_right_b { font-size:11px; color:#0066d7; /*font-family:Tahoma, Geneva, sans-serif;*/ font-family:Dotum; text-align:right; }
.total_table .numtype_center { font-size:11px; color:#596775; font-family:Dotum;  text-align:center; }

/*XLS파일로저장*/
.btn_XLS { background:url(../images/stats/bg_btn_skyblue.gif) repeat-x; font-weight:bold; color:#fff; border:#a1a6ac solid 1px; height:24px; box-sizing:border-box; font-size:11px; border-radius:2px; margin-left:10px;}
.btn_XLS em { color:#555; line-height:1; letter-spacing:-0.1em; }
.unit_box { text-align:right; float:none; *zoom:1; width:100%; margin-bottom:10px; display:inline-block; }
.unit_box:after { content:""; display:block; clear:both; height:0;  }
.unit_box .unit_txt { float:right; font-family:"돋움"; font-size:11px;  }

.icon_XLS {
    background: url(../images/stats/icon_xls.png) no-repeat 0 center;
    margin-left: -1px;
    padding: 2px 5px 2px 34px;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
</head>

<body>
<section id="detail_contents">

      
<div id="ib_sumarry_wrap">
	<div id="navcontainer">
      	<ul class="navlist">
			<li id="active_l2" ><a href="<c:url value='/stats/eisSummary.do' />" >EIS Summary</a></li>
     		<li id="active"><a id="current" href="<c:url value='/stats/eisInvestResult.do' />" >투자 회수 현황</a></li>
     		<li><a href="<c:url value='/stats/eisPeriodRecord.do' />" >기간별 실적현황</a></li>
     		<li><a href="<c:url value='/stats/eisMemberRecord.do' />" >직원별 실적현황</a></li>                        
     		<li id="active_r1" ><a href="<c:url value='/stats/eisMediation.do' />" >중개현황</a></li>
 		</ul>
	</div>
	     
   	 
<div id="ib_sumarry_wrap1">
	
	<h3 class="ib_h3_title">시너지 파트너스 실적현황<span><select id="select_year" onChange="javascript:fnObj.doSearchInSumInvestResult(this.value);" class="select_b mgl25"></select></span></h3>
 <!-- 첫번째 라인 -->
	<div class="divBlockWrap">
     	<div class="PEFBox">
     		<div class="unit_box">
                <ul class="unit_txt">
                    <li>단위 : 억<button type="button" class="btn_XLS" onclick="javascript:fnObj.excelDownload();"><em class="icon_XLS">엑셀로 저장</em></button></li>
                </ul>
            </div>
		
			<div id="excel_data" class="PEF_list_box">
			<span class="PEF_scroll_cover" onclick="javascript:setdayFull('PEF_scroll_body');"></span>
			<div class="PEF_scroll_header">
				<table class="PEF_table" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
					<colgroup>                      
						<col width="280" /> 	<!--투자내용-->
						<col width="100" /> 	<!--제안일 rgDt-->
						<col width="100" /> 	<!--발행일 tmDt-->
						<col width="100" /> 	<!--회수일-->
						<col width="100" />		<!--IB소싱-->
						<col width="100" />		<!--IB소싱-->
						<col width="*" /> 	<!--투자금액-->
						<col width="*" /> 	<!--상승률-->
						<col width="*" /> 	<!--수익율-->
						<col width="*" />	<!--시너지수익-->
						<col width="*" /> 	<!--연수익율-->
						<col width="*" />	<!--연수익-->
						<!--<col width="10%" />		<!--구분-->
						<!--<col width="5%" /> 	<!--실투자금-->
						<!--<col width="5%" /> 	<!--수익-->								                        
					</colgroup>
					
					<thead>				
						<tr>
							<!-- <th scope="col"><a href="#;return false;" onclick="fnObj.doSort(0);" id="sort_column_prefix0" class="sort_normal">투자내용</a></th>
							<th scope="col"><a href="#;return false;" onclick="fnObj.doSort(1);" id="sort_column_prefix1" class="sort_normal">제안일</a></th> -->
							<th scope="col">투자내용</th>
							<th scope="col">제안일</th>
							<th scope="col">발행일</th>
							<th scope="col">회수일</th>
							<th scope="col">IB소싱</th>
							<th scope="col">담당자</th>
							<th scope="col">투자금액</th>
							<th scope="col">상승율</th>
							<th scope="col">수익율</th>
							<th scope="col">시너지수익</th>
							<th scope="col">연수익율</th>
							<th scope="col">연수익금</th>
							<!-- <th scope="col">구분</th>  -->
							<!-- <th scope="col">실 투자금</th>  -->
							<!-- <th scope="col">수익</th>	-->							
						</tr>					
					</thead>
				</table>	
			</div>		
			<div class="PEF_scroll_body">	
				<table class="PEF_table" id="SGridTarget" summary="고객관리 리스트(이름, 업종, 회사, 기본정보, 네트워크, 최근정보, 시너지와의 이력)">
					<caption>구분</caption>
					<colgroup>						                             
						<col width="280" /> 	<!--투자내용-->
						<col width="100" /> 	<!--제안일 rgDt-->
						<col width="100" /> 	<!--발행일 tmDt-->
						<col width="100" /> 	<!--회수일-->
						<col width="100" />		<!--IB소싱-->
						<col width="100" />		<!--IB소싱-->
						<col width="*" /> 	<!--투자금액-->
						<col width="*" /> 	<!--상승률-->
						<col width="*" /> 	<!--상승률-->
						<col width="*" />	<!--시너지수익-->
						<col width="*" /> 	<!--연수익율-->
						<col width="*" />	<!--연수익금-->
						<!--<col width="10%" />		<!--구분-->
						<!--<col width="5%" /> 	<!--실투자금-->
						<!--<col width="5%" /> 	<!--수익-->					         
					</colgroup>
					<tbody></tbody>
				</table>
			</div>
			<div class="PEF_total_box">
			<span class="PEF_scroll_cover"></span>
			<div class="PEF_scroll_header">
				<table class="total_table">
				<caption>지출입력</caption>
					<colgroup>						                             
						<col width="280" /> 	<!--투자내용-->
						<col width="500" /> 	<!--제안일 rgDt-->
						<col width="*" /> 	<!--투자금액-->
						<col width="*" /> 	<!--상승률-->
						<col width="*" /> 	<!--상승률-->
						<col width="*" />		<!--시너지수익-->
						<col width="*" />		<!--시너지수익-->
						<col width="*" />		<!--시너지수익-->
						<!--<col width="10%" />		<!--구분-->
						<!--<col width="5%" /> 	<!--실투자금-->
						<!--<col width="5%" /> 	<!--수익-->						                         
					</colgroup>
					<thead>
						<tr>
							<th scope="col">합계</td>
							<th id="totalResultCount" scope="col"></td>
							<th id="totalInvestAmount" scope="col"></td>
							<th id="totalReturnPer" scope="col"></td>
							<th id="totalReturnRate" scope="col"></td>
							<th id="totalSynergyIncome" scope="col"></td>										
							<th id="totalYearReturnRate" scope="col"></td>
							<th id="totalYearReturnAmount" scope="col"></td>
						</tr>
					</thead>
				</table>
			</div>
			</div>
		</div>
		</div>
	</div>

</div>
</div>
      <%--<img src="/IBsystem/images/imsi/@test.jpg" alt="">--%>  
</section>    

</body>
</html>

<script type="text/javascript">
var currMediOrder;
var currBrokerOrder;

var myGrid = new SGrid();		// instance		new sjs
var mySorting = new SSorting();	// instance		new sjs


var fnObj = {
		
		//################# init function :S #################
		
		//선로딩코드
		preloadCode: function(){
			fnObj.setYearSelectBox();
		},
		
		//화면세팅
	    pageStart: function(){
	    	
	    	//-------------------------- 그리드 설정 :S ----------------------------
	    	/* 그리드 설정정보 */
	    	var configObj = {
	    		
	    		targetID : "SGridTarget",		//그리드의 id
	    		height: 800,
	    		colHeadAlign : "center",
	    		//그리드 컬럼 정보
	    		colGroup : [
					{key:"insunm"},				//투자내용 : 0
					{key:"rgDt"},				//제안일 : 1
					{key:"insunabday"},			//발행일 : 2
					{key:"returndate"},			//회수일 : 3
					{key:"rgNm"},				//IB 소싱 : 4
					{key:"managernm"},			//담당자 : 5
					{key:"insusummoney", 		//투자금액 : 6
						formatter:function(obj)
						{
							var value = obj.item.insusummoney;
							if( value != null && value != '')
								return value+'억';
							else
								return '-';
						}
					},				
					{key:"returnper", 			// 상승율 : 7
						formatter:function(obj)
						{
							var value = obj.item.returnper;						
							
							if( value != null && value != 0 ){
								if( value.indexOf("%") < 0 ){
									value += "%";	
								}
							}
							else 
								value = '-';
							
							
							return value;
						}
					},	
					{key:"returnrate", 			// 수익율 : 8
						formatter:function(obj)
						{
							var value = obj.item.returnrate;
							if( value != null && value != 0 ){
								if( value.indexOf("%") < 0 ){
									value += "%";	
								}
							}
							else 
								value = '-';
							
							return value;
						}
					},				//수익율		
					{key:"realreturnamount", 	// 시너지수익 : 9
						formatter:function(obj)
						{
							var value = obj.item.realreturnamount/100000000;
							
							if( value != null && value != 0 )
								return value.toFixed(2)+'억';
							else return '-';
						}
					},					//장소
					{key:"summoney1", 			// 시너지 실 투자금 : 10
						formatter:function(obj)
						{
							var value = obj.item.summoney1/100000000;						
							if( value != null || value != 0 )
								return value.toFixed(2)+'억';
							else return '-';				
						}
					},				//금액	
					{key:"summoney2", 			// 고객 실 투자금 : 11
						formatter:function(obj)
						{
							var value = obj.item.summoney2/100000000;						
							if( value != null || value != 0 )
								return value.toFixed(2)+'억';
							else return '-';				
						}
					},					//장소
					{key:"realinvestamount", 	// 12
						formatter:function(obj)
						{
							var value = obj.item.realinvestamount/100000000;						
							if( value != null || value != 0 )
								return value.toFixed(2)+'억';
							else return '-';				
						}
					},					//장소
					
					{key:"cpnNm"},				//13
					{key:"tmDt"},				//14
					{key:"investAmount", 		//15
						formatter:function(obj)
						{
							var value = obj.item.investAmount;						
							if( value != null )
								return value+'억';
							else 
								return '-';			
						}
					},					//장소
					{key:"insucd"},				// 16
					{key:"bgcolor",				// 17 
						formatter:function(obj)
						{
							var value = obj.item.returnrate;						
							if( value == null || value == '')
								return 'background-color: yellow;';
							else 
								return '';			
						}
					},
					{key:"returnpercolor", //상승률 색상 , 18
						formatter:function(obj)
						{
							var value = obj.item.returnper;
							if( value == null ) return 'color:#000000;';
							
							if( value > 0 ) return 'color:#ff3300;';
							else if( value < 0 ) return 'color:#0066cc;';
							else return 'color:#000000;';
						}
					},
					{key:"returnratecolor", // 수익률 색상, 19
						formatter:function(obj)
						{
							var value = obj.item.returnrate;		
							if( value == null ) return 'color:#000000;';
							
							if( value > 0 ) return 'color:#ff3300;';
							else if( value < 0 ) return 'color:#0066cc;';
							else return 'color:#000000;';			
						}
					},
					{key:"synergyincome",		// 20
						formatter:function(obj)
						{
							var val_money = obj.item.insusummoney;
							var val_returnrate = obj.item.returnrate;
							
							if( val_money == null && value == '') return 0;
							if( val_returnrate == null ) return '0';
								
							var result = val_money*val_returnrate/100*0.15;
							
							if( result != null && result != 0 )
								return result.toFixed(2) + '억';
							else return '-';								
						}
					},					
					{key:"yearreturnrate",		// 21 : 연간수익율
						formatter:function(obj)
						{
							var value = obj.item.yearreturnrate;
							if( value != null && value != 0 )
								return value.toFixed(2) + "%";
							else return '-';
						}
					},					
					{key:"yearrealreturnamount",	// 22 : 연간수익
						formatter:function(obj)
						{
							var value = obj.item.yearrealreturnamount;
							
							if( value != null && value != 0 )
								return value.toFixed(2)+'억';
							else return '-';
						}
					},
					{key:"realreturnamountcolor", // 수익률 색상, 23
						formatter:function(obj)
						{
							var value = obj.item.realreturnamount;		
							if( value == null ) return 'color:#000000;';
							
							if( value > 0 ) return 'color:#ff3300;';
							else if( value < 0 ) return 'color:#0066cc;';
							else return 'color:#000000;';			
						}
					},
					{key:"yearrealreturnamountcolor", // 수익률 색상, 24
						formatter:function(obj)
						{
							var value = obj.item.yearrealreturnamount;		
							if( value == null ) return 'color:#000000;';
							
							if( value > 0 ) return 'color:#ff3300;';
							else if( value < 0 ) return 'color:#0066cc;';
							else return 'color:#000000;';			
						}
					}
	            ],
	            
	            body : {
	                onclick: function(obj, e){
	                	/* ***** obj *****
	                		obj.c 		- column index,
							obj.index 	- row index,
							obj.item 	- row data object,
							obj.list 	- grid data object
	                	*/
	                }
	            }
	            
	    	};
	    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
	    	var rowHtmlStr = '<tr >';
	    	rowHtmlStr +=	 '<th><b>#[0]</th>';							// 투자내용
	    	rowHtmlStr +=	 '<td class="numtype_center">#[1]</td>';		// 제안일
	    	rowHtmlStr +=	 '<td class="numtype_center">#[2]</td>';		// 발행일
	    	rowHtmlStr +=	 '<td class="numtype_center">#[3]</td>';		// 회수일
	    	rowHtmlStr +=	 '<td class="numtype_center">#[4]</td>';		// IB소싱
	    	rowHtmlStr +=	 '<td class="numtype_center">#[5]</td>';		// 담당자	    	
	    	rowHtmlStr +=	 '<td class="numtype_right">#[6]</td>';			// 투자금액
	    	rowHtmlStr +=	 '<td class="numtype_right_r" style="#[18]">#[7]</td>';		// 상승율
	    	rowHtmlStr +=	 '<td class="numtype_right_r">#[8]</td>';		// 수익율
	    	rowHtmlStr +=	 '<td class="numtype_right_r" style="#[23]">#[9]</td>';		// 시너지수익
	    	rowHtmlStr +=	 '<td class="numtype_right_r">#[21]</td>';	// 연수익율
	    	rowHtmlStr +=	 '<td class="numtype_right_r" style="#[24]">#[22]</td>';		// 연수익금
	    	rowHtmlStr +=	 '</tr>';
	    	
	    	configObj.rowHtmlStr = rowHtmlStr;
	        
	    	myGrid.setConfig(configObj);		//그리드 설정정보 세팅
	    	//-------------------------- 그리드 설정 :E ----------------------------
	    	//-------------------------- 소팅 설정 :S ----------------------------    	
	    	mySorting.setConfig({
				colList : ['insunm', 'insunabday', 'returnper', 'returnrate'],				//['지출일', '항목', '등록자'],
				classNameNormal		: 'sort_normal',				//정렬기본 아이콘 css class
				classNameHighToLow	: 'sort_hightolow',				//오름정렬 아이콘 css class
				classNameLowToHigh	: 'sort_lowtohigh',				//내림정렬 아이콘 css class
				defaultSortDirection: 'DESC'						//기본 정렬 방향
			});
	    },	   
	    
	    setYearSelectBox : function(){
	    	var today = new Date();
	    	var htmlValue = '<option value="all">전체</option>';
	    	for(i=today.getFullYear(); i>= today.getFullYear()-5; i--){
				htmlValue += '<option value="' + i + '">' + i + "년";
	    	}
	    	
	    	$("#select_year").html(htmlValue);
	    },
	    
	 // 사모투자 내역 검색
	    doSearchInSumInvestResult: function(yearVal){
	    	
	    	var url = "<c:url value='/stats/doLoadInvestResult.do' />";
			
	    	var param = {
	    			searchYear : yearVal
	    			/*searchType : vSearchType,
	    			searchyear : vSearchKey,
	    			sNb:vSnb,
	    			
	    			sortCol: myLeftSorting.nowSortCol,
	    			sortVal: myLeftSorting.nowDirection*/
	    	};	
	    	
	    	var callback = function(result){	    		
	    		var obj = JSON.parse(result);
	    		
	    		var resultObject = obj.resultObject;	    		
	    		    		
	    		myGrid.setGridData({					//그리드 데이터 세팅	*** 2 ***
					list: resultObject.investResult		//그리드 테이터
				});	    		
	    			    		
	    		// 총투자금액 & 총투자수익 입력하기
	    		$('#totalResultCount').html(resultObject.investResult.length  + '건');
	    		$('#totalInvestAmount').html(resultObject.totalInvestMoney.toFixed(2) + '억');
	    		$('#totalReturnPer').html(resultObject.totalReturnPer.toFixed(2) + '%');
	    		$('#totalReturnRate').html(resultObject.totalReturnRate.toFixed(2) + '%');
	    		$('#totalSynergyIncome').html(resultObject.totalSynergyIncome.toFixed(2) + '억');
	    		$('#totalYearReturnRate').html(resultObject.totalYearReturnRate.toFixed(2) + '%');
	    		$('#totalYearReturnAmount').html(resultObject.totalYearReturnAmount.toFixed(2) + '억');
	    	};
	    	
	    	var failFn = function(result){	    		
	    		// 검색 실패시 메시지 출력
	    		alert(JSON.stringify('데이타 조회 중 오류가 발생하였습니다.'));
	    	};
	    	
	    	commonAjaxForFail("POST", url, param, callback, failFn, false, '', '');
	    	
	    },//end doSearch
	    
	    excelDownload: function(){
	    	
	       	var str = '<table>';
	       	str+=  ' <tr bgcolor=silver><td bgcolor=white></td>';
	       	str+=   $('#excel_data').html();
	      
	       	str+=  '  </table>';
	       	
	       	if( getBrowserName() == "IE" )
	       		fnObj.downloadExcelIe('excel_data', 'synergy.xls');
	       	else
	       		fnObj.excelDown(str, '시너지수익현황');
	       	
	   	},
	   	
		excelDown: function(htmlStr, fileName, sheetName){	//excelDown(html문자열, 파일명, 시트명)
	    	
	    	var sheetNm = '다운로드';
	    	if(sheetName!=null) sheetNm = sheetName;
	    	
	    	var tableToExcel = (function() {
	        	var uri = 'data:application/vnd.ms-excel;base64,'
	        	, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
	        	, base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))); }
	        	, format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }); };
	        	
	        	return function() {	    	
	    	    	var ctx = {worksheet: sheetNm || 'Worksheet', table: htmlStr};	    	
	        		var link = document.createElement('a');
	    			link.download = fileName +".xls";
	    			link.href = uri + base64(format(template, ctx));
	    			link.click();	    	
	        	};
	        })();	
	    	tableToExcel();
	    },//end excelDown    
	    
	    downloadExcelIe : function(targetId, SaveFileName){
			// ********************** 
			
			// 스타일 변경 outline 스타일 가져와서 적용 가능
			/*
			var targetObj = document.getElementById(targetId);
			var outputCss = targetObj.currentStyle;
			targetObj.style.backgroundColor = outputCss.getAttribute('background-color');
			targetObj.style.borderStyle = outputCss.getAttribute('border-style');
			targetObj.style.border = outputCss.getAttribute('border');
			 */
						
			var cssText = '<style type="text/css">';
			cssText += '.aaaa {font-size:11px; color:#333333; border:2px solid black; padding:10px 5px 8px 5px; background-color:#F3F5E0;}';
			cssText += '</style>';
			
			var output = document.getElementById(targetId).outerHTML;		
			
			SaveFileName = '시너지수익현황.xls';
			
			
			var oWin = window.open("about:blank", "_blank");
			
			oWin.document.write(cssText);
			oWin.document.write(output);
			oWin.document.close();
			// success = true, false
			var success = oWin.document.execCommand('SaveAs', false, SaveFileName);
			oWin.close();
	    },
}
		
function getBrowserName(){
	var agent = navigator.userAgent.toLowerCase();
	
	if (agent.indexOf("msie") != -1 || agent.indexOf("trident") != -1  ) {
		return "IE";
	}
	else{		
		return "CHROME";
	}
}

$(function(){
	fnObj.preloadCode();	//공통코드 or 각종선로딩코드
	fnObj.pageStart();		//화면세팅
	fnObj.doSearchInSumInvestResult('all');			
});

</script>

