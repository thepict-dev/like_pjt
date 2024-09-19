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

	        </main>
	        <script>
	        	let nIntervId;
	        	$(document).ready(function(){
	        		nIntervId = setInterval(bc, 200)
	        	});
		        document.addEventListener('keydown', function(event) {
		    	    // 눌린 키의 코드 값을 가져옵니다
		    	    if(event.key === 'Space' || event.key === ' '){
		    	    	clearInterval(nIntervId);
		    	    }
		    	});
				
				
				function bc(){
					var param = {}
					$.ajax({
						url : "/get_count.do"
						, type : "POST"
						, data : JSON.stringify(param)
						, contentType : "application/json"
						, async : false
						, success : function(data, status, xhr) {
							var cnt = Number(data.rst.cnt);
							
							if(cnt > 10){
								clearInterval(nIntervId);
								//여기여 영상 실행
							}
						}
						, error : function(xhr, status, error) {
							console.log(xhr)
							console.log("에러")
						}
					})
				}
	        </script>
	        <%@include file="./footer.jsp" %>
        </div>
    </body>
</html>
