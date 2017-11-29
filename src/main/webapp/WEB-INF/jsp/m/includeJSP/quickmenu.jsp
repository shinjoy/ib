
        <div class="quick_mn_zone">
        	<ul class="quick_mn_list">
            	<!--<li class="icon_menu"><button type="button"><em>메뉴</em></button></li>-->
                <li class="icon_home"><a href="${pageContext.request.contextPath}/m/main.do"><em>메인으로</em></a></li>
                <li class="icon_prev"><button type="button"  onclick='location.href="${pageContext.request.contextPath}/m/main.do"'><em>이전화면</em></button></li>
                <li class="icon_next"><button type="button"  onclick="history.go(1);"><em>다음화면</em></button></li>
                <li class="icon_refresh"><button type="button" onclick="history.go(0);"><em>새로고침</em></button></li>
                <li class="icon_pcver"><button type="button" onclick="callPcWeb();"><em>PC버전</em></button></li>
                <li class="icon_alarm"><button type="button" onclick='commonPopAllObj.alarmListMain();'><em>알림목록</em>
                <span id="alarmCountArea" class="new" style="display:none;"></span>
                </button></li>
                <!--<li class="icon_mypage"><a href="/index.jsp"><em>PC버전</em></a></li>-->
                <!--<li class="icon_mobilever"><button type="button"><em>PC버전</em></button></li>-->
                <!--<li class="icon_pcver"><button type="button"><em>PC버전</em></button></li>-->
                <!--<li class="icon_setting"><button type="button"><em>셋팅</em></button></li>-->
                <!--<li class="icon_power"><button type="button"><em>로그아웃</em></button></li>-->
            </ul>
        </div>
        
<script>

$(document).ready(function(){

	quickObj.getAlarmCount();
	
});

var quickObj = {
	
	getAlarmCount : function(){
		
		
		var url = contextRoot + "/m/alarm/getNoReadCount.do";
		var param = {
				countYn : 'Y'
				
		};
		
		var callback = function(result){
			var obj = JSON.parse(result);
			var cnt = obj.resultVal;
			
			
			//딜 갯수
			if(cnt*1 >0){
				if(cnt*1>99) cnt ='99+';
				$("#alarmCountArea").html(cnt);
				$("#alarmCountArea").show();
				
			}else{
				$("#alarmCountArea").html(cnt);
				$("#alarmCountArea").hide();
			}
			
		};
		
		commonAjax("POST", url, param, callback, false);
		
	}
	
	
};


</script>