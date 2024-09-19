<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="공지사항"/>
    </c:import>
    <body>
    	<div class="wrapper">
   			<%@include file="../main/navigation.jsp"%>
	        <main class="sub-container">
    			<h3 class="contents-title">공지사항</h3>
    			<div class="board-list">
    				<c:forEach var="resultList" items="${resultList}" varStatus="status">
	    				<div class="board-item">
	    					<a href="javascript:void(0);" class="board-lnk" onclick="boardView(this);">
	    						<div class="board-col num">${length - status.index}</div>
	    						<div class="board-col title">${resultList.title}</div>
	    						<c:if test="${intype eq 'pc' || intype eq 'PC'}">
	    							<div class="board-col date">${resultList.reg_date_for}</div>
    							</c:if>
	    					</a>
	    					<div class="js-board-cont board-cont">
	    						${resultList.text}
	    					</div>
	    				</div>
    				</c:forEach>

    			</div>
	        </main>
	        
        </div>
    </body>
</html>
