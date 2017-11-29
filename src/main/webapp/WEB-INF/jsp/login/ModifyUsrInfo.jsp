<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<link href="<c:url value='/css/new_network.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/content.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/btn.css'/>" rel="stylesheet" type="text/css">
<script type="text/JavaScript" src="<c:url value='/js/html5.js'/>"></script>
<script type="text/JavaScript" src="<c:url value='/js/jquery.min.js'/>" ></script>
<script type="text/JavaScript" src="<c:url value='/js/part/login.js'/>" ></script>
<script>

$(document).ready(function(){
	document.getElementById('usrId').focus();
	jQuery(function () {
	    if (!("placeholder" in document.createElement("input"))) { 
	        jQuery(":input[placeholder]").each(function () {
	            var $this = jQuery(this);
	            var pos = $this.offset();
	            if (!this.id) this.id = "jQueryVirtual_" + this.name;
	            if (this.id) {
	                if (jQuery.browser.version  < 8) {
	                    $this.after("<label for='" + this.id + 
	                        "' id='jQueryVirtual_label_" + this.id + 
	                        "' class='absolute'>" + $this.attr("placeholder") + 
	                        "</label>");
	                    $("#jQueryVirtual_label_" + this.id).
	                        css({"left":(pos.left+5), "margin-top":3, 
	                        "width":$this.width()});
	                }
	                else {
	                    $this.after("<label for='" + this.id + 
	                    "' id='jQueryVirtual_label_" + this.id + 
	                    "' style='left:" + (pos.left+5) + 
	                    "px;margin-top:2px' class='absolute'>" + 
	                    $this.attr("placeholder") + "</label>");
	                }
	            }
	        }).focus(function () {
	            var $this = jQuery(this);
	            $this.addClass("focusbox");
	            jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
	        }).blur(function () {
	            var $this = jQuery(this);
	            $this.removeClass("focusbox");
	            if(!jQuery.trim($this.val())) 
	                jQuery("#jQueryVirtual_label_" + $this.attr("id")).show();
	            else jQuery("#jQueryVirtual_label_" + $this.attr("id")).hide();
	        }).trigger("blur");
	    }
	});
});

</script>

</head>
<body>
	<jsp:scriptlet>
		pageContext.setAttribute("cr", "\r");
		pageContext.setAttribute("lf", "\n");
		pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>
<input type="hidden" id="rgstId" value="${userLoginInfo.id}">
<input type="hidden" id="snb" value="${resultList[0].sNb}">
<input type="hidden" id="id" value="${resultList[0].usrId}">

<form id="modifyRec" name="modifyRec" action="<c:url value='/basic/mainLogo.do' />" method="post"></form>
	<header>
	</header>
	<div class="gtabZone">
		<ul>
	    	<li class="on"><a href="#">내정보</a></li>		        
	    </ul>
	    <ul>
	    	<li class="off"><a href="javascript:goGoogleCalendarLink();">구글캘린더 연동</a></li>
	    </ul>
	</div>
	<section>
		<article>
			<table class="t_skin04">
				<tr>
					<th class="tbColor alignLeft" width="120px">아이디 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input type="text" id="usrId" required="required" pattern="[A-z0-9]{3,20}" class="inputFix" placeholder="<c:out value='${resultList[0].usrId}'/>" readonly /> <!-- readonly 20150706 -->
						<!-- <span class="btn m" style="vertical-align: top;"><a id="chkId">중복체크</a></span> 20150706 아이디는 수정불가능하도록 현재 시스템에 아이디가 밖혀있는곳이 많음 -->
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">비밀번호 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input type="password" id="passwd" required="required" pattern="[A-z0-9]{3,20}" class="inputFix" <%-- <c:out value='${resultList[0].usrPw}'/> --%>/>
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">비밀번호 확인 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input type="password" id="passwd2" required="required" pattern="[A-z0-9]{3,20}" class="inputFix" <%-- <c:out value='${resultList[0].usrPw}'/> --%>/>
					</td>
				</tr>
				<tr>
				<tr>
					<th class="tbColor alignLeft">이름 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input type="text" id="usrNm" class="inputFix" value="<c:out value='${resultList[0].usrNm}'/>"/>
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">email</th>
					<td>
						<input type="text" id="email" class="inputFix" value="<c:out value='${resultList[0].email}'/>"/>
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">email ID</th>
					<td>
						<input type="text" id="emailId" class="inputFix" value="<c:out value='${resultList[0].emailId}'/>"/><font color="red"> * email 자동로그인 설정 정보</font> 
					</td>					
				</tr>
				<tr>
					<th class="tbColor alignLeft">email 비밀번호</th>
					<td>
						<input type="password" id="emailPasswd" class="inputFix" value="<c:out value='${resultList[0].emailPasswd}'/>"/>
					</td>
				</tr>					
				<tr>
					<th class="tbColor alignLeft">휴대전화 <font style="color:red;font-weight:bold">*</font></th>
					<td>
						<input type="text" id="phn_1" class="inputFix" value="<c:out value='${resultList[0].phn1}'/>"/>
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">직통전화</th>
					<td>
						<input type="text" id="phn_2" class="inputFix" value="<c:out value='${resultList[0].phn2}'/>"/>
					</td>
				</tr>
				<tr>
					<th class="tbColor alignLeft">내선전화</th>
					<td>
						<input type="text" id="phn_3" class="inputFix" value="<c:out value='${resultList[0].phn3}'/>"/>
					</td>
				</tr>
			
				<tr>
					<td colspan="4">
					<p class="bsnsR_btn">
						<span class="modifyUsr_btnOk btn s green"><a>저장</a></span>
					</p>
					</td>
				</tr>

			</table>
		</article>
	</section>
</body>
</html>


<script type="text/javaScript" language="javascript">

var g_perSabun = ${PerSabun}; // 사번 저장


function goGoogleCalendarLink(){
	//var sUrl = "GoogleCalendarLink.do";
	//parent.leftIframeOFF();
	//top_menu_new(sUrl, "mainFrame");
	//top_menu("GoogleCalendarLink.do", $(this), "mainFrame");
	
	document.location.href = "${pageContext.request.contextPath}/login/GoogleCalendarLink.do";
}		

function goMenuCard(){
	parent.leftIframeOFF();
	top_menu_new("${pageContext.request.contextPath}/card/cardIndex.do", "mainFrame");
}

function top_menu_new(sUrl, frame) {	
	if (frame=="mainFrame") {
		parent.mainFrame.location.href = sUrl;
	}else if (frame == "leftFrame") {
		parent.leftFrame.location.href = sUrl;
	}
}

function send_to_post(path, params, method, targetTitle){	
	method = method || "post";  //method 부분은 입력안하면 자동으로 post가 된다.
    var form = document.createElement("form");
    form.setAttribute("target", targetTitle);
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    //input type hidden name(key) value(params[key]);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}
</script>
