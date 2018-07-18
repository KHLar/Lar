<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
	<title>Error</title>
</head>
<body>
<h1>
	Error Page  
</h1>

<P> ${exception.message} </P>
</body>
</html>
