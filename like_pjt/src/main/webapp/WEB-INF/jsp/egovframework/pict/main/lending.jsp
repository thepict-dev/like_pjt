<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="청년의날 행사"/>
    </c:import>
    <body>
    	<div class="userContainer" id="progress">
    		<div class="userContents">
    			<p class="titleTop1"><span>가운데 버튼</span>을</p>
    			<p class="titleTop2"><span>조금만 더</span></p>
    			<a href="#lnk" class="ccButton" onclick="ab()">
    				<span>이곳이에요!</span>
    				<p>마구마구</p>
    			</a>
    			<p class="titleBottom1">눌러주세요!</p>
    			<p class="titleBottom2">힘내세요!</p>
    		</div>
    	</div>
    </body>
    <script>
	    $(document).ready(function(){
	    	var param = {}
			$.ajax({
				url : "/get_count.do"
				, type : "POST"
				, data : JSON.stringify(param)
				, contentType : "application/json"
				, async : false
				, success : function(data, status, xhr) {
					var cnt = Number(data.rst.cnt);
					console.log(cnt)
					if(cnt > 700){
						$('#progress').addClass('active')
					}
				}
				, error : function(xhr, status, error) {
					console.log(xhr)
					console.log("에러")
				}
			})
			
		});
	    function ab(){
			var param = {}
	
			$.ajax({
				url : "/btn_insert.do"
				, type : "POST"
				, data : JSON.stringify(param)
				, contentType : "application/json"
				, async : false
				, success : function(data, status, xhr) {
					var cnt = Number(data.rst.cnt);
					console.log(cnt)
					if(cnt > 700){
						$('#progress').addClass('active')
					}
				}
				, error : function(xhr, status, error) {
					console.log(xhr)
					console.log("에러")
				}
			})
		}
    </script>
</html>
