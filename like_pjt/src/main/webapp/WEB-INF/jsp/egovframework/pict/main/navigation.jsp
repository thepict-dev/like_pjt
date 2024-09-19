<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 


<header class="header">

	<div class="header-container">
		<h1 class="header-logo"><a href="/"><img src="../../../../../images/pict/logo.png" alt="2023강원 메타버스/XR 전문인력 양성 교육"></a></h1>
		<nav class="header-gnb">
		<c:if test = "${!fn:contains(path, 'admin') && !fn:contains(path, '/board.do')}">
			<ul class="header-gnb-list">
				<c:if test="${intype eq 'pc' || intype eq 'PC'}">
					<li style="margin-right : 25px"><a href="javascript:gnbMove('#main-recruit');" class="header-gnb-lnk">모집안내</a></li>
					<li><a href="javascript:gnbMove('#main-program');" class="header-gnb-lnk">프로그램안내</a></li>
					<li><a href="javascript:gnbMove('#main-ask');" class="header-gnb-lnk">문의하기</a></li>
				</c:if>
				<li><a href="/board.do" class="header-gnb-lnk">공지사항</a></li>
			</ul>
		</c:if>
		<c:if test = "${!fn:contains(path, 'admin') && fn:contains(path, '/board.do')}">
			<ul class="header-gnb-list">
				<c:if test="${intype eq 'pc' || intype eq 'PC'}">
					<li style="margin-right : 25px"><a href="/" class="header-gnb-lnk">모집안내</a></li>
					<li><a href="/" class="header-gnb-lnk">프로그램안내</a></li>
					<li><a href="/" class="header-gnb-lnk">문의하기</a></li>
				</c:if>
				<li><a href="/board.do" class="header-gnb-lnk">공지사항</a></li>
			</ul>
		</c:if>
		<c:if test = "${fn:contains(path, 'admin')}">
			<ul class="header-gnb-list">
				<li style="margin-right : 25px"><a href="/" class="header-gnb-lnk">모집안내</a></li>
				<li><a href="/" class="header-gnb-lnk">프로그램안내</a></li>
				<li><a href="/" class="header-gnb-lnk">문의하기</a></li>
				<li><a href="/board.do" class="header-gnb-lnk">공지사항</a></li>
			</ul>
		</c:if>
			
		</nav>
	</div>
</header>

<script>
	// gnb - 해당 콘텐츠로 이동
	function gnbMove(target) {
		 var offset = $(target).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
	}
</script>