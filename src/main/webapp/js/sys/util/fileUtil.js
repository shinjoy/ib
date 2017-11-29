/**
 * fileUtil.js
 * 
 * 파일 관련
 */



/**
 * 파일 다운로드
 * 
 */
function downloadFileItem(filId){    //업로드된 목록을 클릭했을 때 이벤트 콜백함수
	
	window.open(contextRoot + "/file/download.do?fileSeq="+filId, "_self", "width=500,height=500");
	
}


//글삭제
function tryDeleteFileItem(fileSeqArray){
	dialog.push({
	    body:'<b>Caution</b>&nbsp;&nbsp;삭제하시겠습니까?', top:0, type:'Caution', buttons:[
            {buttonValue:'삭제', buttonClass:'Red', onClick:deleteFileItem, data:fileSeqArray},	//Red W100
            {buttonValue:'취소', buttonClass:'Blue', onClick:function(){}, data:'data2'},
            //{buttonValue:'button3', buttonClass:'Green', onClick:fnObj.btnClick, data:'data3'}
	    ]});
}


/**
 * 파일 삭제
 * 
 * @param	fileSeqArray 	: 파일 id 배열 객체
 * @param	isConfirm 		: 물어보고 삭제할지 여부 (boolean) ... default : true
 * @param	callback 		: 콜백함수
 */
function deleteFileItem(fileSeqArray, isConfirm, callback){
	
	var isCon = true;
	if(isConfirm != undefined){
		isCon = isConfirm;
	}
	
	
	if(isCon){
		if(!confirm('Caution!  삭제하시겠습니까??')){
			return;		//취소를 눌렀을때는 중단하고 끝낸다.
		}
	}
	
	
	//콜백함수
	var successFn;
	if(callback == undefined){
		successFn = function(){};
	}else{
		if(typeof callback == 'string'){
			successFn = new Function(callback);		//문자열로 받은 함수객체를 함수로			
		}else{
			successFn = callback;
		}
	}
	
	//삭제
	if(fileSeqArray.length>0){		//업로드한 파일이 있을때.
		$.ajax({
			type	: "POST",        							//"POST" "GET"
			url		: contextRoot + '/file/deleteFile.do', 	//PAGEURL
			data	: {fileSeqList : fileSeqArray.toString()},					//parameter object
			timeout : 30000,       								//제한시간 지정(millisecond)
			cache 	: false,        							//true, false
			success	: successFn,								//SUCCESS FUNCTION
			error	: function whenError(x,e){					//ERROR FUNCTION
				alert(x.responseText);
				alertMsg("[FAIL!!]\n\n실패하였습니다!\n\n재시도후 문의바랍니다!");
			}
		});
	}
	
}