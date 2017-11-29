$(document).ready(function(){
//	(function(){
//		if(!/*@cc_on!@*/0) return;
//		var e = "abbr,article,aside,audio,canvas,datagrid,datalist,details,dialog," +
//		"eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output," +
//		"progress,section,time,video".split(','),i=0,length=e.length;
//		while(i<length){
//			document.createElement(e[i++]);
//		}
//	})();
		
	function top_menu(sUrl, ori_obj, frame){
		jQuery.each($(document).find('[class]'), function(){
			var sub_obj = $(this);
			var name = sub_obj.attr('class');
			// var name = sub_obj.attr('name')
			switch(name){
				case 'current':
					sub_obj.removeAttr('class');
				break;
			}
		});
		ori_obj.attr('class','current');
		if(frame=="mainFrame")
			mainFrame.location.href = sUrl;
		else if(frame=="leftFrame")
			leftFrame.location.href = sUrl;
	};
	function left_menu(sUrl){
		parent.mainFrame.location.href = sUrl;
	};
	

///////// main top menu
	$('#login').click(function(){
		top_menu("basic/selectLeft.do",$(this),"leftFrame");
		top_menu("login/ibLoginUsr.do",$(this),"mainFrame");
	});
	$('#mainHome').click(function(){
		top_menu("basic/selectLeft.do",$(this),"leftFrame");
		top_menu("basic/selectContent.do",$(this),"mainFrame");
	});

		
	$('#mainWork').click(function(){
		top_menu("work/selectLeft.do",$(this),"leftFrame");
		top_menu("work/selectWorkV.do",$(this),"mainFrame");
	});
	$('#mainCompany').click(function(){
		top_menu("company/selectLeft.do",$(this),"leftFrame");
		top_menu("company/main.do",$(this),"mainFrame");
	});
	$('#mainPerson').click(function(){
		top_menu("person/main.do",$(this),"leftFrame");
		top_menu("person/main.do",$(this),"mainFrame");
	});
	$('#mainNetwork').click(function(){
		top_menu("network/main.do",$(this),"leftFrame");
		top_menu("network/main.do",$(this),"mainFrame");
	});
///////// main top menu
	
///////// work left menu
	$('#leftWorkC').click(function(){//업무일지 등록
		left_menu("selectWorkC.do");
	});
	$('#leftWorkV').click(function(){//업무일지 열람
		left_menu("selectWorkV.do");
	});
	$('#leftWorkDealS').click(function(){//제안
		left_menu("selectWorkDealS.do");
	});
	$('#leftWorkDealR').click(function(){//제안받은딜
		left_menu("selectWorkDealR.do");
	});
	$('#leftWorkMnA').click(function(){//M&A
		left_menu("selectWorkMnA.do");
	});
///////// work left menu
///////// work main menu
	function displayNdeal(dsp){
		document.getElementById('info').style.display=dsp;
		document.getElementById('price').style.display=dsp;
		document.getElementById('invest').style.display=dsp;
		document.getElementById('comp1').style.display=dsp;
		document.getElementById('name1').style.display=dsp;
		document.getElementById('team1').style.display=dsp;

		document.getElementById('input4').style.display=dsp;
		document.getElementById('input5').style.display=dsp;
		document.getElementById('input6').style.display=dsp;
		document.getElementById('input7').style.display=dsp;
		document.getElementById('input8').style.display=dsp;
	}
	function displayDeal(dsp){
		document.getElementById('name0').style.display=dsp;
		document.getElementById('team0').style.display=dsp;
		
		document.getElementById('input2').style.display=dsp;
		document.getElementById('input3').style.display=dsp;
	}
	$('#workMeet').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workIR').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workVisit').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workAnalysis').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workSurvey').click(function(){
		displayNdeal("none");
		displayDeal("");
	});
	$('#workDealS').click(function(){
		displayNdeal("");
		displayDeal("none");
	});
	$('#workDealR').click(function(){
		displayNdeal("");
		displayDeal("none");
	});
	
///동적 table
    // 옵션추가 버튼 클릭시
    $(".addItemBtn").click(function(){
        // item 의 최대번호 구하기
    	var obj = $(this);
    	var tmp_arr = obj.attr('name').split('_');
    	var idx = tmp_arr[tmp_arr.length-1];
/*    	
    	var id_tbl = '#dynamic' + idx;
    	var lastItemNo = $(id_tbl+" tr:last").attr("class").replace(idx+"item", "");
    	var newitem = $(id_tbl+" tr:eq(0)").clone();
        newitem.removeClass();
        newitem.find("td:eq(0)").attr("rowspan", "1");
        newitem.addClass(idx+"item"+(parseInt(lastItemNo)+1));
        $(id_tbl).append(newitem);
*/
        var id_div = '#dynamicDIV' +idx;
        var lastItemNo0 = $(id_div+" ul:last").attr("class").replace(idx+"item", "");
        var newitem0 = $(id_div+" ul:eq(0)").clone();
        newitem0.removeClass();
        newitem0.find("li:eq(0)").attr("rowspan", "1");
        newitem0.addClass(idx+"item"+(parseInt(lastItemNo0)+1));
        
        $(id_div).append(newitem0);
    });

/*
    // 항목추가 버튼 클릭시
    $(".addBtn").live("click", function(){
        var clickedRow = $(this).parent().parent();
        var cls = clickedRow.attr("class");

        // tr 복사해서 마지막에 추가
        var newrow = clickedRow.clone();
        newrow.find("td:eq(0)").remove();
        newrow.insertAfter($("#dynamic ."+cls+":last"));

        // rowspan 조정
        resizeRowspan(cls);
    });
*/     
     
    // 삭제버튼 클릭시
    $(".delBtn").live("click", function(){
        var clickedRow = $(this).parent().parent();
        var cls = clickedRow.attr("class");
/*         
        // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
        if( clickedRow.find("li:eq(0)").attr("rowspan") ){
            if( clickedRow.next().hasClass(cls) ){
                clickedRow.next().prepend(clickedRow.find("li:eq(0)"));
            }
        }
*/
        clickedRow.remove();

        // rowspan 조정
        resizeRowspan(cls);
    });

    // cls : rowspan 을 조정할 class ex) item1, item2, ...
    function resizeRowspan(cls){
        var rowspan = $("."+cls).length;
        $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
    }
///동적 table
	
///////// work main menu
    
///////// jquery ajax searching left menu
    $('#nameSearch').keyup(function(){
    	  $.ajax({
    	   type:"POST",        //POST GET
    	   url:"../company/searchName.do",     //PAGEURL
		   //  dataType: "html",       //HTML XML SCRIPT JSON
    	   data : ({companyName: $("#nameSearch").val()}),
    	   timeout : 30000,       //제한시간 지정
    	   cache : false,        //true, false
    	   success: function whenSuccess(args){  //SUCCESS FUNCTION
    	    $("#idchk_commit").val("");
    	    switch(args){
    	     case("true"):
    	      show_args="<font color='blue'>사용 가능합니다.</font>";
    	      $("#idchk_commit").val("Y");
    	     break;
    	     case("false"):
    	      show_args="<font color='red'>이미 사용중인 아이디 입니다.</font>";
    	     break;
    	     default:
    	     case("none"):
    	      show_args="<font color='red'>아이디를 입력 해주세요.</font>";
    	     break;
    	     case("short"):
    	      show_args="<font color='red'>아이디는 4자 이상으로 입력 해주세요.</font>";
    	     break;
    	     case("long"):
    	      show_args="<font color='red'>아이디는 16자 미만으로 입력 해주세요.</font>";
    	     break;
    	    }
    	    $('#resultDIV').html(show_args);
    	   },
    	   error: function whenError(e){    //ERROR FUNCTION
    	    alert("code : " + e.status + "\r\nmessage : " + e.responseText);
    	   }
    	  });
    	 });
///////// jquery ajax searching left menu
	


});