<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<!-- -------- each page css :S -------- -->
<style type="text/css">
#selSosRelation{
	height:23px;
}

#SGridTarget_pop td{color:#555; text-decoration:none; vertical-align:middle;}
#SGridTarget_pop td:visited{color:#555;}
#SGridTarget_pop td:hover, #SGridTarget_pop  td:focus {font-weight:bold; color:#555;}
</style>
<!-- -------- each page css :E -------- -->

</head>
<body style="padding:5px; background-color:white;">
	<div style="padding:0px;">
	<div style="text-align: right;padding-right:5px;background-color:#fff;"><button type="button" onclick="$('#scheListArea').css('display','none');"><b>close</b></button></div>
	<input type="hidden" id="dateValue" name="dateValue" value="${date}">
	<input type="hidden" id="popcarNick" name="popcarNick" value="${carNick}">
	<table id="SGridTarget_pop" cellpadding="0" cellspacing="0" class="network_tb_st" style="width:370px;border-left:0px;border:1px solid #ccc!important;">
    	<colgroup>    	
		<col width="335" /><col />
		<col width="35" /><col />
		</colgroup>
		<thead>		
		<tr><th colspan="2">일정</th><th>차량<br>계획</th></tr>
		</thead>
		<tbody>
			  <div  style="overflow: auto; overflow-x:hidden;" >
			  </div>
 		</tbody>
	</table>
	
	
	</form>
	</div>

</body>
</html>



<script type="text/javascript">

//Global variables :S --------------- 
//사용자언어
var myGridPopup = new SGrid();		// instance		new sjs

//공통코드(외,코드)

var nowList=new Array();



//Global variables :E ---------------


/*
 * 화면세팅에 관한함수(pageStart)와, 각종 함수들을 정의하는 fnObj(function object).
 */
var fnObjPopup = {
	
	//################# init function :S #################
	
	//선로딩코드
	preloadCode: function(){
		//공통코드
	
		
	},
	
	//화면세팅
    pageStart: function(){
    	var selectDate=$("#inputUseDate").val();
    	
    	var configObj = {
    		
    		targetID : "SGridTarget_pop",	
    		
    		//그리드 컬럼 정보
    		colGroup : [    		
            
            {key:"ScheSeq",formatter:function(obj){
        		if(obj.item.ScheSeq==-1){return 'background-color:#dfe3e8;border-width:2px;" colspan="3"';}
        		else{return 'cursor:pointer;border:1px;" colspan="2"';}
        	}},
            {key:"ScheTitle",formatter:function(obj){
            	if(obj.item.ScheSeq==-1){return "<b>"+obj.item.ScheTitle+"</b>";}
            	else{
            		
            		return '<table cellpadding="0" cellspacing="0" style="border:0px;"><tr><td style="border:0px;padding-left:0px;"><input type="checkbox"/></td><td style="text-align:left!important;border:0px;padding:0px;">' + obj.item.ScheTitle + '</td></table>';
            	}
        	}},
        	{key:"carYn", formatter:function(obj){
        		if(obj.item.carYn==1){return '<td  style="border-left:1px solid #ccc!important"><i class="axi axi-directions-car"></i></td>';}
        		else if(obj.item.carYn!=1&&obj.item.ScheSeq!=-1){return '<td style="border-left:1px solid #ccc!important"></td>';}
        	}}
            ],
            
            body : {
                onclick: function(obj, e){fnObj.setMemo(obj.item.ScheSeq,obj.item.ScheEDate,obj.item.ScheTitle); }
			}
            
    	};
    	/* 그리드 한건 데이터 HTML 포맷 (** 1.tbody 내에 들어갈 tr 태그,  2.#[n] 의 위치에 colGroup 의 순서대로 데이터 세팅) */
    	var rowHtmlStr = '<tr style="border:1px solid #ccc!important">';
    	rowHtmlStr +=	 '<td  class="left_txt" style="#[0] >#[1]</td>';
    	rowHtmlStr +=	 '#[2]';
    	rowHtmlStr +=	 '</tr>';
    	configObj.rowHtmlStr = rowHtmlStr; 
       
    	
    	myGridPopup.setConfig(configObj);
    		
    },//end pageStart.
	
	 //스케쥴 가져오기
    getUserscheList: function(){
    
		var url = contextRoot+"/car2/popUpmemoAjax.do";
		var date = $("#dateValue").val();
		var carNick = $("#popcarNick").val();
		var sNb = $("#sNb").val();
		var sabun =$("#sabun").val();
		var carNick = $("#popcarNick").val();
		var param = {date:date,carNick:carNick,sNb:sNb,sabun:sabun};
	
		
		var callback = function(result){
			
			var obj = JSON.parse(result);
			//세션로그아웃 >> 재로그인
			if(obj.result=='FAIL' && obj.resultVal=='SESSION'){
				window.open('<c:url value="/login/loginPop.do" />', 'loginPop', 'width=500 height=200');
				return;
			}
			var cnt = obj.resultVal;	//결과수
			var list = obj.resultList;	//결과데이터JSON
		 	var selectDate=$("#inputUseDate").val();
			for(var i=list.length-1;0<=i;i--){
				
				if(list[i].ScheEDate==selectDate){
					if(nowList.length==0){
						nowList.push({"ScheEDate":'1900-01-01' , "ScheSeq":-1, "ScheTitle": '▶ '+selectDate,"carYn":0});
					} 
					nowList.push(list[i]);
					list.remove(i);
				}
			}
			sortByKey(list,'ScheEDate','ASC');
			 if(list.length>0){
				var arr= $("#inputUseDate").val().split("-");
			   	//3일후
				var afDate = new Date(arr[0], arr[1]-1, arr[2]);
			    afDate.setDate(afDate.getDate()+3);
			    var afDateStr =afDate.getFullYear() + '-' + fillzero(afDate.getMonth()+1, 2) +'-'+fillzero(afDate.getDate(), 2);
			    //3일전
			    var beDate = new Date(arr[0], arr[1]-1, arr[2]);
			    beDate.setDate(beDate.getDate()-3);
			    var beDateStr =beDate.getFullYear() + '-' + fillzero(beDate.getMonth()+1, 2) +'-'+fillzero(beDate.getDate(), 2);
			  	//오늘 이후 인지 판별
			    if(new Date().yyyy_mm_dd()<=afDateStr){
			    	afDateStr=new Date().yyyy_mm_dd();
			    }
			    nowList.push({"ScheEDate":0 , "ScheSeq":-1, "ScheTitle":'▶ '+beDateStr+ ' ~ '+afDateStr,"carYn":0});
			} 
			myGridPopup.setGridData({list:$.merge( nowList, list )});
    	};
		
		commonAjax("POST", url, param, callback);
    },
    

   
};//end fnObj.



/*
 * 화면로딩완료후, 자바스크립트 화면세팅 과 그외동작들 호출.
 */
$(function(){
	fnObjPopup.preloadCode();	//공통코드 or 각종선로딩코드
	fnObjPopup.pageStart();
	fnObjPopup.getUserscheList();

});

</script>