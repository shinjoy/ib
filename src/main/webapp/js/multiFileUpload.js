﻿$(document).ready(function(){
	$("#files-upload").change(function () {
		traverseFiles(this.files);
	});
});

function traverseFiles(files) {
	var fileList = $("#file_list");
	var li, file, input = "", fileInfo = "";
	fileList.html("");
	//var arrName = document.getElementsByName("files-upload");
	var arrName = $('#files-upload').get(0);	//document.getElementsByName("files-upload");
	
	for (var i = 0, il = files.length; i < il; i++) {
	    file = files[i];
	    fileInfo += "<li style=\"list-style-type: none;\"><img src=\"http://"+location.host+"/"+location.pathname.split('/')[1]+"/images/file/fileDiskSlct.png\" align=\"absmiddle\"/> " + file.name;
	    fileInfo += "<span style='color:#999;font-size:9px;font-weight:bold;'> (" + fileSize(file.size) + ")</span></li>";
	    //li.innerHTML = fileInfo;
	    // $("#file_list").appendChild(li);
	  	// input += "<input type='file' style='display:none;' name='upload"+i+"' filename='"+file.name+"'/>";
	};
    fileList.html(fileInfo);
	$("#uploadsubmitbtn").css('display','');
    // $("#m_files").html(input);
}

function fileSize(initSize){
	var rtSize = initSize/1024;
	if(rtSize > 128){
		rtSize /= 1024;
		rtSize = rtSize.toFixed(2) + "MB";
	}else rtSize = rtSize.toFixed(2) + "KB";
	
	return rtSize;
}

function saveComment(cnt,offerSnb){
	var DATA;
	var tmpN1 = 'ajax'
		,SNB = $('#OPsNb'+cnt).val()
		,cateCd = $("#m_categoryCd").val()
		,usrid = $("#selectST").val();
		
	if(cnt==''){//insert
		$("#m_offerSnb").val(offerSnb);
		$("#m_comment").val($('#toast_comment_text').val());
		$("#m_opinion").val($('#toast_recom_cpn').val());
	}else{
		if(offerSnb!=''){//update
			DATA =({ tmpNum1: tmpN1, sNb: SNB, categoryCd: cateCd, usrId: usrid, offerSnb:offerSnb, comment: $('#toast_comment_text'+cnt).val(), opinion: $('#toast_recom_cpn'+cnt).val() });
		}else{//delete
			DATA =({ tmpNum1: tmpN1, sNb: SNB, categoryCd: cateCd });
		}
	}
	if(confirm("적용하시겠습니까?")){
		
		if(cnt=='') {
			$("#multiFile_N_comment").submit();
		}else{
			var url = "http://"+location.host+"/"+location.pathname.split('/')[1]+"/recommend/saveOpinion.do";
			
			//var url = "../recommend/saveOpinion.do";
			var fn = function(){
				//document.comment.action = "comment.do";
				if(cateCd == '00001') document.comment.submit();
				else if(cateCd == '00002') location.href = "http://"+location.host+"/"+location.pathname.split('/')[1]+"/personnel/management/index.do?usrId"+$("#selectST").val();
			};
			
			ajaxModule(DATA,url,fn);
		}
	}
}

function comment_open(th){
	var commentDiv = $(".new_cmt")
		,thisText = $(th).children();
	var dsp = commentDiv.css('display');
	if(dsp == "none") {
		commentDiv.css('display','block');
		thisText.html('▲');
	}else{
		commentDiv.css('display','none');
		thisText.html('▼');
	}
}