<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../includeJSP/header.jsp" %>

<style>
#toast{
	position: fixed;
	top: 85%;
	left: 50%;
	width: 200px;
	font-size: 20px;
	background-color: #21438b;
	color:white;
	margin-left: -100px;
	border: 1px solid #666;
	padding: 10px 0 ;
	text-align:center;
	opacity: .9;

	/* opacity time */
	-webkit-transition: opacity 0.5s ease-out;
	-moz-transition: opacity 0.5s ease-out;
	-ms-transition: opacity 0.5s ease-out;
	-o-transition: opacity 0.5s ease-out;
	transition: opacity 0.5s ease-out;
	
	/* round border */
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;	
}
.search-list{ background:#59647a; border:#4b566b solid 1px; border-radius:0.25rem; font-size:0.813rem; color:#fff!important; letter-spacing:-0.1em; display:inline-block; text-align:center; padding:0.5rem 0.75rem 0.438rem 0.75rem; box-sizing:border-box; line-height:1;  font-weight:bold; margin-left:0.5rem; }
</style>
</head>

<body>
<div id="carLogView" class="relative" style="display:none; width: 96%;"></div>

<!-- 리스트 팝업 -->
<div style="display:none; position:absolute; width: 100%;  height: expression( this.scrollHeight > 99 ? 200px : auto );  z-index:10000;" id="logListArea" >
</div>
<fmt:formatDate var="nowDay" value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>
	<div id="wrap" class="firstDiv">
    	<div class="mb_sub_location">
    		<button type="button" class="back" onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전</em></button>
    		<a href="#" class="depth01">차량운행</a>
    		<a href="#" class="depth02"><span id="topTitle">운행정보입력</span></a>
    	</div>
        <!--서브-->
        <div class="containerWrap"> 
        	<!--서브컨텐츠1-->
            <section id="firstSection" class="contentsWrap con_pdst01">
                <!--운행정보입력-->
                <article>
                    <table class="tb_input_basic02" summary="운행기록작성">
                        <caption>운행기록작성</caption>
                        <colgroup>
							<col width="75" />
							<col width="*" />
						</colgroup>
                        <tr>
                            <th scope="row"><label for="inputUseDate">날짜선택</label></th><!-- onclick="fnObj.divClear();" -->
                            <td>
                            	<input type="date" id="inputUseDate" class="input_basic wdate" value="${nowDay}" onchange="javascript:fnObj.dateChk();return false;"  onblur='$("#dateError").empty();return false;'>
                            	<div id="dateError" class="redpoint"></div>
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="carSelect">차량선택</label></th>
                            <td>
                                <span id="carSelect"></span><span><button type="button" class="search-list" onclick="javascript:fnObj.carLogListView();">조회</button></span>
                           </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="IDNAME04">업무내용</label></th>
                            <td>
                           		<div id="scheSelectTxt" class="select_basic" style="border:1px solid #ccc;display:none;" >
	                            	<span id="scheTxt">등록된 일정이 없습니다.</span>
	                            </div> 
                            	
                            	<div id="scheSelect">
                            		<select id="scheSeqSelect" class="select_basic" style="width: 100%;" onchange="javascript:fnObj.setDate();">
                            			<option value="0">일정에서 선택</option>
                            		</select> 
                            	</div> 
	                           
                            	<textarea cols="5" rows="2"  id="memoArea" class="textarea_basic w100pro" placeholder="세부내용을 입력해주세요." style="margin-top:0.5rem;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="totalDistance">운행거리</label></th>
                            <td><input type="number" id="totalDistance" class="input_basic car_dashboard_off" style="width:40%;"  placeholder="최종주행거리" /><span>km</span>
                            	<div id="maxDis" class="redpoint"></div>
                            </td>
                            <input type="hidden" id="focusType" value="0"> 
                        </tr>
                    </table>
                </article>
                <!--//운행정보입력//-->
                <div class="btn_box_basic">
                	<ul class="btn_b_list btn_count2">
                    	<li><button type="button" class="btn_mobile_gray01" onclick="location.href='${pageContext.request.contextPath}/m/main.do'">취소</a></li>
                        <li><button type="button" class="btn_mobile_blue01" onclick="fnObj.doSave();">저장</a></li>
                    </ul>
                </div>               
            </section>
            <!--//서브컨텐츠1//-->
       </div>
        <!--//서브//-->
        <!--퀵메뉴-->
        <%@ include file ="../includeJSP/quickmenu.jsp" %> 
        <!--//퀵메뉴//-->
    </div>
</body>
</html>


<script type="text/javascript">

window.onpageshow = function(event) {
    if (event.persisted) {
        location.href="${pageContext.request.contextPath}/m/car/carRecord.do";
    }
};

//Global variables :S ---------------

//공통코드

var sNb='${userLoginInfo.staffSnb}'; 		  //로그인 유저의 sNb
var sabun='${userLoginInfo.sabun}'; 		  //로그인 유저의 사번 
var scheSeq=0;
var g_gridListStr;							  //그리드 데이터 string (객체화되기전 문자열 json... JSON.parse 로 객체로 만들어사용) (증권사 필터링을 위해..)
var g_divZidx=0;

//Global variables :E ---------------
var carList;
var scheList;
var inputDate;
var listCount=0;
var todaySche=0;
/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObj = {
	

	//선로딩코드
	preloadCode: function(){
		//공통코드
		
		var colorObj = {};
	
		fnObj.backClear();
		fnObj.getCarList();
		
		
		//$("#inputUseDate").focus();
		fnObj.setSchedule();
		fnObj.setmaxDis();
	
		
	},


	//두번째 화면세팅
    pageStart: function(worklogId){
    			
    
    },//end pageStart.
    
    //검색
    doSearch: function(){ 
    	
    
    	
    },//end doSearch
    
    dateChk: function(){ 
    	
     	$("#dateError").empty();
		var selectDate=$("#inputUseDate").val();
	
		if(new Date().yyyy_mm_dd()<selectDate){
			$("#dateError").html("오늘 이후 날짜는 선택하실 수 없습니다.");
			$("#inputUseDate").val(new Date().yyyy_mm_dd());
		}else{
			if(selectDate!=inputDate){
				fnObj.setSchedule();
				//$("totalDistance").focus();
				//fnObj.setmaxDis();
			}
			$("#scheSeqSelect").val("0");
			$("#scheTxt").html("등록된 일정이 없습니다.");
			
		}
	
	},//end dateChk
	
    setDate: function(){ 
    	var Seq=$("#scheSeqSelect").val();
    	var scheTitle="";
    	var selectDate="";
    
    	if(Seq!=0){
	    	for(var i=0;i<scheList.length;i++){
	    		if(Seq==scheList[i].ScheSeq){
	    			inputDate=scheList[i].ScheEDate;
	    			selectDate=scheList[i].ScheEDate;
	    			scheTitle=scheList[i].ScheTitle;
	    		}
	    	}
	    	
	    	$("#inputUseDate").val(selectDate);
	       
    	}else{
			$("#memoArea").focus();
		}	
    	 fnObj.setmaxDis(); 
    	
	},//end setDate
	
	setmaxDis :function(){
		$("#maxDis").empty();
		var seq=$("#scheSeqSelect").val();
     	if(seq==null||seq==undefined){
     		
     		seq=0;
     	}
   
        var url = contextRoot + "/m/car/disMaxValue.do";
       	var param = {
       			        carId   : $("#carId").val(),
       			        useDate : $("#inputUseDate").val(),
       			  		scheSeq : seq
       			     
   		    		};
       
       	var callback = function(result){
       		var obj = JSON.parse(result);
       		var sub = obj.resultObject;	
      		var maxDis = sub.maxDis;
      	
     		if(maxDis<0){maxDis=0;};
      		$("#maxDis").html("최종 입력 주행거리: "+Number(maxDis).toLocaleString()+"km");
      			
       		
       	};
       	commonAjax("POST", url, param, callback, true, null, null);  
     },
    
    getCarList: function(){ 
    
        var url = contextRoot + "/car2/carList.do";
     	var param = { sNb : sNb , enable : 'Y' , belongCompany : 'Y' , sabun : '${userLoginInfo.sabun}'};
     	
     	var callback = function(result){
     		var obj = JSON.parse(result)
     		carList = obj.resultList;
     		
     		for(var i=0; i<carList.length; i++){
				carList[i].carModel =  carList[i].carNumber + '&nbsp;-&nbsp;' + carList[i].carModel; 
			}
			
			var cstSelectTag = createSelectTag('carId', carList, 'carId', 'carModel','', 'fnObj.focusMove();', {}, 180, 'select_basic w70');		
			$("#carSelect").html(cstSelectTag);
     		
     	};
     	
     	commonAjax("POST", url, param, callback);
     	
     },//end getCarList

  	setSchedule: function(){
  		
		  var url = contextRoot + "/car2/popUpmemoAjax.do";
		  var date = $("#inputUseDate").val();
		  var params = {date: date,sNb :sNb,sabun:sabun};
	      var newList=new Array();		
		  var callback = function(result){
				
			  	var obj = JSON.parse(result);
		    	var cnt = obj.resultVal;		//결과수
		    	var list = obj.resultList;		//결과데이터JSON
		    	scheList=list;
		    	var optionStr='';
		    	listCount=list.length;
		    	
		    	if(0<list.length){
		    		$('#scheSelectTxt').hide()
		    		$('#scheSeqSelect').show()
		    		
		    		var index=getRowIndexWithValue(list,"ScheEDate",$("#inputUseDate").val());
	    			if(index==-1){ ///해당 날짜 스케쥴이 없음.
	    				todaySche=0;
	    			}else{
	    				todaySche=1;
	    			}
	    			for(var i=list.length-1;0<=i;i--){
	    				
	    				if(list[i].ScheEDate==date){
	    					newList.push(list[i]);
	    					list.remove(i);
	    				}
	    			}
					
					sortByKey(list,'ScheEDate','ASC');
					var sumList = $.merge( newList, list );	
					scheList= sumList;
					for(var i=0;i<sumList.length;i++){
						if(i==0){
		    				if($("#inputUseDate").val()==sumList[i].ScheEDate){
		    					optionStr+= '<option value="0">직접 입력</option>';
		    					optionStr+= "<option style='background-color: #B2EBF4;' value='"+sumList[i].ScheSeq+"' selected='\"selected\"'>"+sumList[i].ScheTitle+"</option>";
		    					
		    				 }else{
		    					optionStr+= '<option value="0" selected="selected">직접 입력</option>';
		    					optionStr+= "<option value='"+sumList[i].ScheSeq+"' >"+sumList[i].ScheTitle+"</option>";
		    				} 
		    			}else{
		    				optionStr+= "<option value='"+sumList[i].ScheSeq+"'>"+sumList[i].ScheTitle+"</option>";
		    			}
					}	
				
		    		$('#scheSeqSelect').html(optionStr);
		    		fnObj.setDate();
		    	}else{
		    		
		    		$('#scheSelectTxt').show();
		    		$('#scheSeqSelect').hide()
		    		$("#scheSeqSelect").val("0");
		    		fnObj.setmaxDis();
		    	}
		    	
		    	
		    };
	     	
	     commonAjax("POST", url, params, callback, true, null, null);
	     
	  	
     },//end setSchedule
     
     carLogListView : function(){
    	
    	var url=contextRoot+"/m/car/carLogList.do";
     	
     	var params = {
     					type 		: 	'1',
     					carId		:	$("#carId").val(),
     					workId		:	0,
     					useDate 	: 	$("#inputUseDate").val().substring(0,7)
     					
     	};
    	
     	var callback = function(result){
      		modal({
                type: 'customer',
                title: '차량현황',
                text: result,
            });
      	}
      	
      	$.ajax({
    		type	: "POST",        			//"POST" "GET"
    		url		: url,    					//PAGEURL
    		data	: params,					//parameter object
    		dataType: "html",
    		timeout : 100000,       			//제한시간 지정(millisecond)
    		cache 	: false,        			//true, false
    		success	: callback,					//SUCCESS FUNCTION
    		async	: false,
    		error	: function whenError(x,e){	//ERROR FUNCTION			
    			swall("서버오류!!");			
    		}
     	});
    },
    //################# else function :E #################
     //저장
     doSave: function(){ 
    		
     	var memo=$("#memoArea").val();
     	var totalDistance=$("#totalDistance").val();
     	var useDate = $("#inputUseDate").val();
     	var seq=$("#scheSeqSelect").val();
     	if(seq==null||seq==undefined){
     		
     		seq=0;
     	}
 
     	if(seq=="0" && memo==""){
     	   swal("업무내용을 입력해주세요.");
     	  $("#memoArea").focus();
     	   return false;
        }
        if(totalDistance==""||totalDistance=="0"||!strInNum(totalDistance)){
        	swal("주행후 거리를 확인해주세요.");
     	  $("#totalDistance").focus();
			return false;
        }
        if(seq!=0){
	        for(var i=0;i<scheList.length;i++){
	    		if(seq==scheList[i].ScheSeq){
	    			
	    			if(scheList[i].ScheEDate!=useDate){
	    				swal("선택하신 날짜와 일정의 날짜가 일치하지 않습니다.");
	    				$("#inputUseDate").focus();
	    				return false;
	    			}
	    		}
	    	}
        }
        var url = contextRoot + "/car2/insertCarLog.do";
     	var param = {
     			        carId   : $("#carId").val(),
     			        useDate : useDate,
     			        type    : 'Y',
     					totalDistance : totalDistance,
     					memo    :$("#memoArea").val(),
     					scheSeq :seq,
     					sNb     :sNb
 		    		};
     	//	alert(JSON.stringify(param));
     	var callback = function(result){
     		
     		var obj = JSON.parse(result);
     		var sub = obj.resultObject;	
     		var cnt = sub.cnt;
     		var errDis = sub.errDis;
     		 
     		if(cnt == -8){
     			 
     			 
     			
     		}else if(cnt > 0){
     			
     			fnObj.drawToast("등록되었습니다!");
     			$("#scheSeqSelect").val("0");
     			setTimeout(function(){
     				location.href="${pageContext.request.contextPath}/m/car/carLogList.do?carId="+$("#carId").val()+"&workId="+cnt;
     			}, 600)
     		
     	    }else{
     			if(cnt==-2){
     				swal("입력하신 주행후 거리가 전날의 최종거리 보다 같거나 작습니다. 주행후 거리를 확인해주세요. /n [전날 최종거리:"+Number(errDis).toLocaleString()+"KM]");
     				$("#totalDistance").focus();
     				return;
     			}
     			if(cnt==-3){
     				swal("입력하신 주행후 거리가  다음날의 최종거리 보다 같거나 큽니다. 주행후 거리를 확인해주세요. /n[다음날 최종거리:"+Number(errDis).toLocaleString()+"KM]" );
     				$("#totalDistance").focus();
     				return;
     			}
     			if(cnt==-4){
     				swal("이미 등록된 최종 거리가 있습니다. 주행후 거리를 확인해주세요. " );
     				$("#totalDistance").focus();
     				return;
     			}
     			
     		}
     	};
     	commonAjax("POST", url, param, callback, true, null, null);  
     },//end doSave
   
     focusMove: function(){
    	 if(listCount==0){
 	    	$("#memoArea").focus();
 	    }else{
 	    		
 	    	if(todaySche==0){
 	    		$("#memoArea").focus();
 	    	}else{
 	    		$("#scheSeqSelect").focus();
 	    	}
 	    }
 	   
 	    fnObj.setmaxDis(); 
 	  },//end focusMove

     divClear: function(){
    	
    	var optionStr= '<option value="0" selected="selected">일정에서 선택</option>';

		$('#scheSeqSelect').html(optionStr);
		$("#scheSeqSelect").val("0");
	 },//end divClear
	 
	 //뒤로가기시 남아있는 데이터 초기화
     backClear: function(){
    	$("#inputUseDate").val(new Date().yyyy_mm_dd());
		$("#totalDistance").val("");
		$("#memoArea").val("");
		
     },//end backClear
  
    ///토스트
    hideToast : function(){
    	var alert = document.getElementById("toast");
    	alert.style.opacity = 0;
    	clearInterval(intervalCounter);
    },//end hideToast
    
	drawToast : function(message){
    	
    	var alert = document.getElementById("toast");
    	
    	if (alert == null){
    		var toastHTML = '<div id="toast">' + message + '</div>';
    		document.body.insertAdjacentHTML('beforeEnd', toastHTML);
    	}
    	else{
    		alert.style.opacity = .9;
    	}
    	intervalCounter = setInterval("fnObj.hideToast()", 200);
    }//end drawToast
 
};//end fnObj.


/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObj.preloadCode();		//선코딩
	fnObj.pageStart();
});
</script>