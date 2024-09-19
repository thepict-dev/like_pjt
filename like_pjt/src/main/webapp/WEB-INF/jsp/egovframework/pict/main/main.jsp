<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="2023 메타버스·XR 전문인력 양성 교육"/>
    </c:import>
    <body>
    	<div class="wrapper">
   			<%@include file="./navigation.jsp" %>
	        <main class="container">
        		<section class="main-box recruit" id="main-recruit">
        			<div class="main-container">
        				<h2 class="main-title">
	        				<span class="desc">2023 메타버스·XR 전문인력 양성 교육</span>
	        				모집안내
	        			</h2>
	        			<div class="main-item">
	        				<div class="main-recruit">
	        					<div class="main-recruit-item img">
	        						<a href="javascript:void(0);" class="main-poster-lnk" title="포스터 크게보기" onclick="poster('open');">
	        							<img src="../../../../../images/pict/main-poster2.png" alt="">
	        						</a>
	        						<a href="https://docs.google.com/forms/d/e/1FAIpQLSfWCMoYCyk1KDMsvNR6P_3czHs4gIEAsGVH2RhJK-qqOCifRw/viewform" target="_blank" title="새창이동" class="recruit-btn mobile">신청하러가기&nbsp;&nbsp;&nbsp;+</a>
	        					</div>
	        					<div class="main-recruit-item desc">
	        						<h3 class="recruit-title">
	        							모션디자인부터 메타버스제작까지
	        							<strong class="strong">하나의 교육에서 여러가지 커리큘럼으로</strong>
        							</h3>
        							<div class="recruit-desc">
        								<div></div>
        								<a href="https://docs.google.com/forms/d/e/1FAIpQLSfWCMoYCyk1KDMsvNR6P_3czHs4gIEAsGVH2RhJK-qqOCifRw/viewform" target="_blank" title="새창이동" class="recruit-btn">신청하러가기&nbsp;&nbsp;&nbsp;+</a>
        							</div>
        							
        							<ul class="recruit-list">
        								<li>도내 메타버스 기업에서 근무하고 있는 강사진들에게 실무에 바로 투입 될 수 있는 프로그램들을 배워보세요!</li>
        								<li>또한 우수 교육생에게는 200만원 상당의 취/창업 지원금까지 제공! 강원자치도내 메타버스 기업 모의면접 기회 제공까지!</li>
        								<li>교육부터 취/창업까지 One-Stop!</li>
        								<li>지금 바로 신청하세요.</li>
        								
        								
        								<!-- 
        								<li>
        									<h3 class="title">교육일정</h3>
        									<div class="desc">2022.06.21 - 2022.11.18</div>
        								</li>
        								<li>
        									<h3 class="title">교육장소</h3>
        									<div class="desc">강원정보문화산업진흥원</div>
        								</li>
        								<li>
        									<h3 class="title">교육혜택</h3>
        									<div class="desc">교육지원금 월 150만 원 * 5개월 (PBL교육생의 경우 지급)</div>
        								</li>
        								<li>
        									<h3 class="title">문의처</h3>
        									<div class="desc">edu@pict.kr / 1644-4845</div>
        								</li>
        								<li>
        									<h3 class="title">커리큘럼</h3>
        									<div class="desc">콘텐츠 기획 과정, 2D 디자인 과정, 메타버스 과정, 인터랙션 IT 개발 과정</div>
        								</li>
        								-->
        							</ul>
        							 
	        					</div>
	        				</div>
	        			</div>
        			</div>
        		</section>
        		<section class="main-box program" id="main-program">
        			<div class="main-container">
        				<h2 class="main-title">
	        				<span class="desc">2023 메타버스·XR 전문인력 양성 교육</span>
	        				프로그램안내
	        			</h2>
	        			<div class="main-item" style="text-align:center;">
	        				<img src="../../../../../images/pict/main-program.jpg" alt="" style="max-width:1000px; width:100%;">
	        			</div>
        			</div>
        		</section>
				<div class="main-poster-layer">
					<div class="main-poster-layer-box">
						<div class="main-poster-layer-item">
							<img src="../../../../../images/pict/main-poster2.png" alt="">
						</div>
					</div>
					<button type="button" title="팝업 닫기" class="main-poster-close" onclick="poster('close');"><i class="fa-solid fa-xmark"></i></button>
				</div>
				<!-- 
        		<section class="main-box promote">
        			<div class="main-container">
        				<h2 class="main-title">
	        				<span class="desc">2023 메타버스·XR 전문인력 양성 교육</span>
	        				홍보영상
	        			</h2>
	        			<div class="main-item">
	        				<video controls autoplay muted class="main-video">
							    <source src="../../../../../images/pict/main-promote.mp4" type="video/mp4">
							</video>				
	        			</div>
        			</div>
        		</section>
        		 -->
        		<section class="main-box ask" id="main-ask">
        			<div class="main-container">
        				<h2 class="main-title">
	        				<span class="desc">2023 강원 메타버스 · XR 전문인력</span>
	        				문의하기
	        			</h2>
	        			<div class="main-item">
	        				<div class="ask-box">
	        					<div class="ask-item">
	        						<h3 class="title">Call</h3>
	        						<div class="desc"><a href="tel:1644-4845" title="전화걸기">1644-4845</a></div>
	        					</div>
	        					<div class="ask-item">
	        						<h3 class="title">E-mail</h3>
	        						<div class="desc"><a href="mailto:edu@pict.kr" title="이메일 보내기">edu@pict.kr</a></div>
	        					</div>
	        				</div>		
	        			</div>
        			</div>
        		</section>
        		<!-- 
        		<section class="main-box related">
        			<div class="main-container">
        				<div class="main-item">
        					<ul class="related-list">
        						<li><a href="https://www.kocca.kr/" target="_blank" title="새창이동"><img src="../../../../../images/pict/related-content.png" alt="한국콘텐츠진흥원"></a></li>
        						<li><a href="https://www.gica.or.kr/Home/intro" target="_blank" title="새창이동"><img src="../../../../../images/pict/related-gica.png" alt="강원정보문화산업진흥원"></a></li>
        						<li><a href="https://thepict.co.kr/" target="_blank" title="새창이동"><img src="../../../../../images/pict/related-pict.png" alt="pict"></a></li>
        					</ul>
        				</div>
        			</div>
        		</section>
        		 -->
	        </main>
	        <script>
	        	// poster open/close
	        	function poster(type) {
	        		const $popup = $(".main-poster-layer");
	        		const $body = $("body");
	        		if(type === "open") {
	        			$popup.addClass("active");
	        			$body.addClass("layer-open");
	        		} else {
	        			$popup.removeClass("active");
	        			$body.removeClass("layer-open");
	        		}
	        	}
	        </script>
	        <%@include file="./footer.jsp" %>
        </div>
    </body>
</html>
