<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/process.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/stock.js'/>" ></script>

<script>var contextRoot="${pageContext.request.contextPath}";</script>
<script type="text/JavaScript" src="<c:url value='/js/sys/utils.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/ajaxRequest.js'/>" ></script>

<script type="text/JavaScript">

function resize_iframe(){
	var height = document.documentElement.clientHeight || window.innerHeight || document.body.clientHeight;
	var stockCstFrame = document.getElementById("stockCstFrame").offsetTop;
	//document.getElementById("staffName").style.height=parseInt(height-stockCstFrame-50)+"px";
	document.getElementById("stockFirmIBs").style.height=parseInt(height-stockCstFrame-67)+"px";
	document.getElementById("stockCstFrame").style.height=parseInt(height-stockCstFrame-67)+"px";
}

//window.onresize = resize_iframe;

function insertStockFirmIbYN(){
	return "Y";
}

//로딩후 기본 검색
$(document).ready(function(){
	selectStockFirmIb('',this,'C','');
	resize_iframe();
});


//담당자 일괄 지정
function addIt(){
	var chkList = $("input:checkbox[name=mCheck]:checked");		//체크한 증권사 고객
	
	if(chkList.length == 0){
		alert('등록할 증권사 IB 고객을 체크하시기 바랍니다.');
		return;
	}
	
	var usrId = $('#selStaff').val();			//선택한 담당자 id
	if(usrId == ''){
		alert('담당자를 선택하시기 바랍니다.');
		$('#selStaff').focus();
		return;
	}
	
	var cstSnbList = '';			//고객 id list
	for(var i=0; i<chkList.length; i++){
		if(chkList[i].checked){		//체크한 증권사IB 고객
			cstSnbList += ',' + chkList[i].value;
   		}       		
   	}
	
	
	//등록 프로세스 진행
	if(confirm('등록 하시겠습니까?')){
		
		var url = contextRoot + "/stockFirmManage/doSaveCstManager.do";
    	var param = {
    			cstList : cstSnbList,	//고객 id list (sequence list)
    			usrId	: usrId			//담당자 id (로긴id)
    	}
    	
    	var callback = function(result){
    			
    		var obj = JSON.parse(result);
    		
    		var cnt = obj.resultVal;	//결과수
    		
    		if(obj.result == "SUCCESS"){
    			
    			alert("등록 되었습니다.");
    			//parent.toast.push("저장OK!");
    		}else{
    			//alertMsg();
    		}
    		
    	};
    	
    	commonAjax("POST", url, param, callback);
	}
}

//증권사 만 보기
function checkStockCpn(){
	var isStockOnly = '';
	
	var checkStock = document.getElementsByName('checkStockCpn')[0];
		if(checkStock.checked){
		isStockOnly = 'Y';
	}
	
	parent.leftFrame.selectStockFirmIbNew(parent.leftFrame.g_selUserNm, null, 'C', parent.leftFrame.g_selUserId, parent.leftFrame.g_sortCol, isStockOnly);
}

</script>


<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
    
}
.wrap-loading div{ /*로딩 이미지*/
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
}
.display-none{ /*감추기*/
    display:none;
}
        
</style>
 
<div class="wrap-loading display-none">
    <div><img src="<c:url value='/images/ajax_loading.gif'/>" /></div>
</div>

</head>
<body onload="resize_iframe();">

	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>

<input type="hidden" id="rgstId" value="<c:out value='${userLoginInfo.id}'/>">	
	<header>
	</header>
	<section>
		<article>
			<table class="t_skin04">
				<thead>
					<tr>
						<th class="cent bgYlw" style="width:700px;text-align:left;">
							<label><input type="checkbox" name="checkStockCpn" onclick="checkStockCpn();" />증권사</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>증권사(회사) IB 정보</b>
						</th>
						<th class="cent bgYlw" style="width:400px;text-align:left;">
							<c:if test="${userLoginInfo.permission > '00019'}">
							<b>담당자 지정&nbsp;</b>
							<select name="selStaff" id="selStaff" style="height:25px;width:70px;font-size:12px;">
								<option value="">선택</option>
							<c:forEach var="staff" items="${userList}">
								<option value="${staff.usrId}">
									${staff.usrNm }
								</option>
							</c:forEach>
							</select>
							<input type="button" onclick="addIt();" value=" 등 록 " style="cursor:pointer;height:25px;font-size:12px;" />
							</c:if>
						<th class="cent bgYlw">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr style="vertical-align:top;">
						<%--<td>
							<div id="staffName" style="height:700px;overflow-y:scroll;overflow-x:hidden;border:2px solid gray;">
								<table class="t_skin04_cstNcpn">
								
								<tr style="padding:5px 7px;">
									<td class="cent bgYlw" height="30"><b>담당자</b></td>
									</tr>
								
								<c:forEach var="staff" items="${userList}">
									<tr class="link LK1st" onclick="selectStockFirmIb('${staff.usrNm }',this,'C','${staff.usrId }');resize_iframe();"><td align="center" style="padding:5px 7px;width:113px;">
										${staff.usrNm }
									</td></tr></c:forEach>
								</table>
							</div>
						</td> --%>
						<td rowspan="2" colspan="2" style="width:1100px;">
							<div id="stockFirmIBs" style="height:400px;overflow-y:hidden;overflow-x:hidden;border:2px solid gray;"></div>
						</td>
						<td rowspan="2">		<%--src="<c:url value='/person/index.do'/>?part=bondIbPart" --%>
							<iframe style="width:100%;height:500px;" id="stockCstFrame" name="stockCstFrame" src="" marginwidth="0" marginheight="0" frameborder="no" scrolling-x="no"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</article>
	</section>

</body>
</html>