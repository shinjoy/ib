<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
</head>
<script>
$(document).ready(function(){
	alert("로그아웃 되었습니다.");
	location.href = "${pageContext.request.contextPath}/m/login.do";
	
});
</script>

</html>
