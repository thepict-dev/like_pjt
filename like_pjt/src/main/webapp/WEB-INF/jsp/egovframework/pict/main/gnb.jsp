<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>



<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>
<c:set var="connection_status" value="${fn:indexOf(url, 'connection_status')}"/>
<c:set var="connection_user" value="${fn:indexOf(url, 'connection_user')}"/>
<c:set var="lecture" value="${fn:indexOf(url, 'lecture')}"/>


<c:set var="user" value="${fn:indexOf(url, 'user_')}"/>

<c:set var="gnb" value="${fn:indexOf(url, 'gnb')}"/>
<c:set var="intro" value="${fn:indexOf(url, 'intro')}"/>

<c:set var="event" value="${fn:indexOf(url, 'event')}"/>

<c:set var="board" value="${fn:indexOf(url, 'board')}"/>



<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
        	<%
				pageContext.setAttribute("sessionid", session.getAttribute("id"));
			%>
			          
			<c:if test="${sessionid eq 'pict' || sessionid eq 'finecom' || sessionid eq 'knuadmin'}">
	            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="true" aria-controls="collapseLayouts2">
	                <div class="sb-nav-link-icon">
	                <i class="fas fa-columns"></i></div>사용자 정보
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse <c:if test="${connection_status ne -1 || connection_user ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <!-- <a class="nav-link" href="/status/connection_status.do">사용자 접속현황</a> -->
	                    <a class="nav-link" onclick="javascript:tttt()">사용자 접속현황</a>
	                </nav>
	            </div>
	            <div class="collapse <c:if test="${connection_status ne -1 || connection_user ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/status/connection_user.do">사용자 리스트</a>
	                </nav>
	            </div>
	            
	            <!-- 게시판 -->
	            <%-- <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts5" aria-expanded="true" aria-controls="collapseLayouts5">
	                <div class="sb-nav-link-icon">
	                <i class="fas fa-columns"></i></div>배너 정보
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse <c:if test="${board ne -1}">show</c:if>" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/board/board_register.do">배너 등록</a>
	                </nav>
	            </div>
	            
	            <div class="collapse <c:if test="${board ne -1}">show</c:if>" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/board/board_list.do">배너 리스트</a>
	                </nav>
	            </div> --%>
            </c:if>
            
            
        	<a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
                <div class="sb-nav-link-icon">
                <i class="fas fa-columns"></i></div>강의실 정보
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse <c:if test="${lecture ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/lecture/lecture_list.do">강의실 리스트</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${lecture ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/lecture/lecture_register.do">수업 등록</a>
                </nav>
            </div>
            
            
			
			<%-- 			
			<c:if test="${sessionid eq 'pict' || sessionid eq 'finecom' || sessionid eq 'knuadmin'}">
				<!-- 유저 영역  -->
	            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts3">
	                <div class="sb-nav-link-icon">
	                	<i class="fas fa-columns"></i>
                	</div>관리자 정보
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                
	            </a>
	            <div class="collapse <c:if test="${user ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/user_list.do">관리자 리스트</a>
	                </nav>
	            </div>
	            <div class="collapse <c:if test="${user ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/user_register.do">관리자 등록</a>
	                </nav>
	            </div>
            </c:if> 
            --%>
            
            <%-- <c:if test="${sessionid eq 'pict' || sessionid eq 'finecom' || sessionid eq 'knuadmin'}">
				<!-- 유저 영역  -->
	            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts4">
	                <div class="sb-nav-link-icon">
	                	<i class="fas fa-columns"></i>
                	</div>이벤트 정보
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                
	            </a>
	            <div class="collapse <c:if test="${event ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/event/event_list.do">이벤트 리스트</a>
	                </nav>
	            </div>
	            <div class="collapse <c:if test="${event ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link" href="/event/event_register.do">이벤트 등록</a>
	                </nav>
	            </div>
            </c:if> --%>
		</div>
	</div>
</nav>
<script>
	function tttt() {
		alert("준비중입니다.")
	}
</script>

<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>