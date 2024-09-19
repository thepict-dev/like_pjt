<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form name="messageForm" id="messageForm" method="post" action="${retUrl}">

</form>

<script type="text/javascript">
	<c:if test="${retType eq ':submit'}">
		alert("${fn:replace(message, '<br>', '\\n')}");
		document.messageForm.submit();
	</c:if>
	
	<c:if test="${retType eq ':location'}">
		alert("${fn:replace(message, '<br>', '\\n')}");
		location.href="${retUrl}";
	</c:if>
	
	<c:if test="${retType eq ':exit'}">
		alert("${fn:replace(message, '<br>', '\\n')}");
		self.close()
	</c:if>
</script>