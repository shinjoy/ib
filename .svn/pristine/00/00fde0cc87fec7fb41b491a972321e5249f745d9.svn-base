<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
	<div class="con_pdst01">

		<table class="pop_tb_basic" id="analTb" summary="운행기록작성">
			<caption>분석자 지정</caption>
			<colgroup>
				<col width="35%"/>
				<col width="*"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="row">분석자</th>
					<th scope="row">진행상태</th>
					<th scope="row">삭제</th>
				</tr>
			</thead>
			<tbody id="analUserListTbArea"></tbody>
		</table>

	  	<!--//서브//-->
		<div class="btn_pop_basic">
			<button type="button" class="btn_pop_white01" onclick="$('.modal-close-btn').trigger('click');">닫기</button>
		</div>
	</div>
</body>
</html>

<script>

var g_analyAllUserList = new Array();

var dealAnalObj = {

	//선로딩코드
	preloadCode : function(){

		//전체 분석자 리스트
		var param = {
				searchType 		: 'analYn',
				division 		: 'SYNERGY',
				deptOrder		: 'N'
			};

		g_analyAllUserList = getCodeInfo('KOR', 'staffSnb', 'usrNm', '', '담당자지정', '담당자지정', "/common/getStaffListNameSort.do", param);
		g_analyAllUserList = addToArray(g_analyAllUserList, 1, {'staffSnb':'${userLoginInfo.staffSnb}', 'usrNm':'★MY'});		//내가찜 추가


	},

	doSearch : function(){

		var str = '';
		for(var i=0; i<g_analyList.length; i++){

			var obj = g_analyList[i];
			str +='<tr>';
			str +='<td>'+obj.userNm+'</td>';

			if(parseInt(obj.analCount) > 0) str +='<td>분석완료 ('+(obj.analPoint)+'.0)</td>';
			else str +='<td>분석중</td>';
			
			str +='<td><button type="button" class="del" onclick="dealAnalObj.deleteAnalyUser('+obj.analUserId+',\''+obj.userNm+'\');">삭제</button></td>';
			
			str +='</tr>';
		}

		str +='<tr><td colspan="3" class="plustab"><span id="analSelectTagArea"></span><button type="button" class="plus mgl03rem" onclick="dealAnalObj.doSaveAnalyUser();">+담당자 추가</button></tr>';


		$("#analTb tbody").html(str);

		//지정 셀렉트
		tagStr = createSelectTag('analUserId', g_analyAllUserList, 'staffSnb', 'usrNm', '','',{},'100','selectHeight');
		$("#analSelectTagArea").html(tagStr);

	},

	//분석자 저장
    doSaveAnalyUser : function(){

    	var userId = $("#analUserId").val();

    	if(userId == ''){
    		alert('분석 담당자를 선택해 주세요');
    		return false;
    	}

    	if(getCountWithValue(g_analyList, 'userId', userId)!=0){
    		alert('이미 지정된 분석 담당자입니다.');
    		return false;
    	}

    	var url = contextRoot + "/recommend/saveAnalyUser.do";

    	var param = {
    					userId 			: userId ,
    					offerId 		: g_dealSnb,
    					cpnNm 			: g_cpnNm,
    					analyUserName 	: $("#analUserId option:selected").text(),
    					cdNm 			: g_cateNm
    	};

    	var callback = function(result){

    		var obj = JSON.parse(result);
    		var cnt = obj.resultVal;		//결과수

    		if(cnt>0){
    			swal("지정되었습니다.");
    			dealDetailObj.getAnalyList();
    			dealAnalObj.doSearch();
    			//$('.modal-close-btn').trigger('click');

    		}else{
    			swal("실패하였습니다.");
    			return false;
    		}

    	};

    	commonAjax("POST", url, param, callback, false);		// false (sync 처리)
    },

  	//담당자 삭제
    deleteAnalyUser : function(analUserId, userNm){

    	swal({
			  title: "",
			  text: "담당자를 삭제 하시겠습니까?",

			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',

			  cancelButtonText: '취소',
			  confirmButtonText: '삭제'
		  },

		  function(isConfirm){

			if(isConfirm) {

				var url = contextRoot + "/recommend/deleteAnalyUser.do";

	    		var param = {
	    				analUserId 		: analUserId,
	    				offerId 		: g_dealSnb,
	    				cpnNm 			: g_cpnNm,
	    				analyUserName 	: userNm,
	    				cdNm 			: g_cateNm
	    		};


	    		var callback = function(result){
	    			swal("삭제되었습니다.");
	    			dealDetailObj.getAnalyList();
	    			dealAnalObj.doSearch();
	    			//$('.modal-close-btn').trigger('click');
	    		};

	    		commonAjax("POST", url, param, callback, true);		// false (sync 처리)

			}
		});

    }

};


$(function(){

	dealAnalObj.preloadCode();
	dealAnalObj.doSearch();

});




</script>