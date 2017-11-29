<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Synergy Partners</title>
		<link href="<c:url value='/css/sp/synergy.css'/>" rel="stylesheet" type="text/css">
		<script src="js/sp/synergy_util.js"></script>
		<script src="js/sp/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
		
		<script type="text/javascript" src="js/naver/photo_uploader/popup/jindo.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/naver/photo_uploader/popup/jindo.fileuploader.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/naver/photo_uploader/popup/attach_photo.js" charset="utf-8"></script>
	</head>
	<body>
	<script type="text/javaScript" language="javascript">
		<!--
		var nm = '${NewFileNm}';
	    opener.parent.pasteHTML(nm);
	    self.close();
		-->
	</script>
	
	</body>
</html>