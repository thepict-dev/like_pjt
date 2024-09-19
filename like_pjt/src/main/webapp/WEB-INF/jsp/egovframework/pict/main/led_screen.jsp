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
	        <button class="btn" style="display : none">버튼</button>
	    </div>
	
	    <script>
		    $(document).ready(function() {
		        let intervalCount;
		        var origin_cnt = 0;
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
		                    if(current_cnt != origin_cnt){
		                        Game.createMultipleCircles()
		                    }
		                    origin_cnt = current_cnt
		                    if(cnt >= 500){
		                        clearInterval(intervalCount);
		                        Game.endGame();
		                    }
		                }
		                , error : function(xhr, status, error) {
		                    console.log(xhr)
		                    console.log("에러")
		                }
		            })
		        }
		        
		        intervalCount = setInterval(getCount, 200);
		        
		        document.addEventListener('keydown', function(event) {
		            if(event.key === ' ' || event.code === 'Space'){
		                clearInterval(intervalCount);
		                Game.fillToMax();
		            }
		        });
		        
		        var Game = {
		            init: function() {
		                console.log("Game initialized")
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
		                this.circlesPerClick = 1;
		                this.maxCircles = 200;
		                this.currentCircles = 0;
		                this.gameEnded = false;
		                
		                this.gaugeMask.height(0);
		                this.imageUrl = '/img/circle.png';
		                this.createMultipleCircles()
		            },
	
		            createMultipleCircles: function() {
		                for (let i = 0; i < this.circlesPerClick; i++) {
		                    if (current_cnt <= 500 && !this.gameEnded) {
		                        this.createCircle();
		                    }
		                }
		            },
	
		            createCircle: function() {
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
		                var percentage = Math.floor((current_cnt / 500) * 100);
		                this.countSpan.text(Math.floor(percentage));
		                
		                var minHeight = 2;
		                var maxHeight = 233;
		                var maskHeight = Math.max(minHeight, maxHeight * (percentage / 100));
		                this.gaugeMask.height(maskHeight);
	
		                if (percentage >= 100 && !this.gameEnded) {
		                    this.endGame();
		                }
		            },
	
		            fillToMax: function() {
		                if (!this.gameEnded) {
		                    current_cnt = 500;
		                    this.updatePercentage();
		                    for (let i = this.currentCircles; i < 500; i++) {
		                        this.createCircle();
		                    }
		                    this.endGame();
		                }
		            },
	
		            endGame: function() {
		                if (this.gameEnded) return;
		                this.gameEnded = true;
		                console.log("Game ended");
		                this.btn.prop('disabled', true);
		                this.videoWrapper.addClass('active');
		                
		                if (this.video) {
		                    this.video.muted = true; // 음소거 상태로 시작
		                    var playPromise = this.video.play();
		                    
		                    if (playPromise !== undefined) {
		                        playPromise.then(() => {
		                            console.log("비디오 재생 시작 (음소거)");
		                            this.addUnmuteListener();
		                        }).catch(error => {
		                            console.error("비디오 재생 실패:", error);
		                        });
		                    }
		                }
		            },
	
		            addUnmuteListener: function() {
		                $(document).one('click', () => {
		                    if (this.video) {
		                        this.video.muted = false;
		                        console.log("음소거 해제");
		                    }
		                });
		            },
		        };
	
		        Game.init();
		    });
	    </script>
    </body>
</html>
