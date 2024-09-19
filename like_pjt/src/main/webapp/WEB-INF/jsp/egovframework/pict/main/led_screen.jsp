<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="스크린"/>
    </c:import>
    <body>
	    <div class="warpper">
	        <div class="gaugeContainer">
	            <div id="gameArea"></div>
	            <div class="percent">
	                <svg width="334" height="240" viewBox="0 0 334 240" fill="none" xmlns="http://www.w3.org/2000/svg">
	                    <path d="M0.5 -20.5H333.5V165.854L167 239.453L0.5 165.854V-20.5Z" fill="#1149CC" stroke="url(#paint0_linear_3_2225)"/>
	                    <path d="M10.5 -7.5H323.5V159.022L167 226.456L10.5 159.022V-7.5Z" fill="url(#paint1_linear_3_2225)" stroke="url(#paint2_linear_3_2225)"/>
	                    <defs>
	                    <linearGradient id="paint0_linear_3_2225" x1="167" y1="-21" x2="167" y2="290" gradientUnits="userSpaceOnUse">
	                    <stop stop-color="#0099FF"/>
	                    <stop offset="1" stop-color="white"/>
	                    </linearGradient>
	                    <linearGradient id="paint1_linear_3_2225" x1="167" y1="-8" x2="167" y2="277" gradientUnits="userSpaceOnUse">
	                    <stop stop-color="white"/>
	                    <stop offset="1" stop-color="#319FFE"/>
	                    </linearGradient>
	                    <linearGradient id="paint2_linear_3_2225" x1="167" y1="-8" x2="167" y2="277" gradientUnits="userSpaceOnUse">
	                    <stop stop-color="#008AB0"/>
	                    <stop offset="1" stop-color="#00AEFF"/>
	                    </linearGradient>
	                    </defs>
	                    <rect id="fillRect" x="10.5" y="226.456" width="313" height="0" fill="#AEDCFF"/>
	                </svg>
	                <div class="countGauge">
	                    <div class="gaugeMask"></div>
	                </div>
	            </div>
	            <div class="count">
	                <span>0</span>%
	            </div>
	          	<div class="videoWrapper">
	          		<video src="/img/test.mp4" type="video/mp4"></video>
	          	</div>
	        </div>
	        <button class="btn">버튼</button>
	    </div>
	
	    <script>
	    	let intervalCount;
	    	var current_cnt = 0;
	    	function getCount(){
	    		var param = {}
				$.ajax({
					url : "/get_count.do"
					, type : "POST"
					, data : JSON.stringify(param)
					, contentType : "application/json"
					, async : false
					, success : function(data, status, xhr) {
						var cnt = Number(data.rst.cnt);
						current_cnt = cnt;
						console.log(cnt)
						if(cnt > 1000){
							clearInterval(intervalCount);
							//여기여 영상 실행
						}
					}
					, error : function(xhr, status, error) {
						console.log(xhr)
						console.log("에러")
					}
				})
	    	}
		    $(document).ready(function() {
		    	intervalCount = setInterval(getCount, 100);
		    	 document.addEventListener('keydown', function(event) {
		    	    // 눌린 키의 코드 값을 가져옵니다
		    	    if(event.key === 'Space' || event.key === ' '){
		    	    	clearInterval(intervalCount);
		    	    }
		    	});
		    	
		        var Game = {
		            init: function(circlesPerClick) {
		            	console.log("ok?")
		                this.gameArea = $('#gameArea');
		                this.btn = $('.btn');
		                this.message = $('#message');
		                this.countSpan = $('.count span');
		                this.gaugeMask = $('.gaugeMask');
		                this.videoWrapper = $('.videoWrapper');
		                this.video = this.videoWrapper.find('video')[0];
		                
		                this.circles = [];
		                this.gameAreaSize = this.gameArea[0].getBoundingClientRect();
		                this.circleSize = 200;
		                this.circlesPerClick = circlesPerClick;
		                this.maxCircles = 1000;
		                this.currentCircles = 0;
		                
		                this.gaugeMask.height(0);
		                this.imageUrl = '/img/circle.png';
						this.createMultipleCircles(this)
		            },
	
		            createMultipleCircles: function() {
		            	console.log('1111')
		                if(current_cnt < 1000){
		                	console.log('2222')
		            		this.createCircle();
		                }
		            },
	
		            createCircle: function() {
		                if (current_cnt >= this.maxCircles) {
		                    this.endGame();
		                    return;
		                }
	
		                var circle = $('<img>')
		                    .addClass('circle')
		                    .attr('src', this.imageUrl);
		                
		                var position = this.getRandomPosition();
		                circle.css({
		                    left: position.x + 'px',
		                    top: position.y + 'px'
		                });
		                
		                this.gameArea.append(circle);
		                
		                gsap.fromTo(circle[0], 
		                    {
		                        width: 0,
		                        height: 0,
		                        y: "-=500",
		                        opacity: 0
		                    },
		                    {
		                        width: this.circleSize,
		                        height: this.circleSize,
		                        y: 0,
		                        opacity: 1,
		                        duration: 1,
		                        ease: "back.out(1.7)",
		                        onComplete: this.updatePercentage.bind(this)
		                    }
		                );
		                this.currentCircles++;
		            },
	
		            getRandomPosition: function() {
		                return {
		                    x: Math.random() * (this.gameAreaSize.width - this.circleSize),
		                    y: Math.random() * (this.gameAreaSize.height - this.circleSize)
		                };
		            },
	
		            updatePercentage: function() {
		            	console.log("ggogogo" + current_cnt)
		                var percentage = Math.min((this.currentCircles / this.maxCircles) * 100, 100);
		                this.countSpan.text(Math.floor(percentage));
		                
		                var minHeight = 2;
		                var maxHeight = 233;
		                var maskHeight = Math.max(minHeight, maxHeight * (percentage / 100));
		                this.gaugeMask.height(maskHeight);
	
		                if (percentage >= 100) {
		                    this.endGame();
		                }
		            },
	
		            endGame: function() {
		                this.btn.prop('disabled', true);
		                if (this.message.length) {
		                    this.message.show().text('게임 종료!');
		                }
		                
		                // videoWrapper에 active 클래스 추가
		                this.videoWrapper.addClass('active');
		                
		                // 비디오 자동 재생 (소리 포함)
		                if (this.video) {
		                    this.video.muted = false; // 소리 켜기
		                    this.video.play()
		                        .then(() => {
		                            console.log("비디오 재생 시작");
		                        }
	                        )
		                }
		            }
		        };
	
		        Game.init(100);
		    });	
	    </script>
    </body>
</html>
