<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="게시글 리스트"/>
    </c:import>
    <body>
    	<div class="wrapper">
        	<%@include file="../main/navigation.jsp" %>
			<main class="sub-container">
				<!-- <h3 class="contents-title">게시글 리스트</h3> -->
    			<div class="board-search">
			    	<form action="" id="search_fm" name="search_fm" method="get" class="board-search-form">
			    		<label class="board-search-radio"><input type="radio" name="board_type" value="0" <c:if test="${pictVO.board_type eq '0' || pictVO.board_type eq null || pictVO.board_type eq undefined}"> checked </c:if> >전체</label>
				    	<label class="board-search-radio"><input type="radio" name="board_type" value="1" <c:if test="${pictVO.board_type eq '1'}"> checked </c:if> >게시글</label>
						<label class="board-search-radio"><input type="radio" name="board_type" value="2" <c:if test="${pictVO.board_type eq '2'}"> checked </c:if> >뉴스</label>
						<div class="board-search-input">
							<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요.">
				    		<button type="button" onclick="search();" title="검색하기" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
			    	</form>
			    	<div class="board-search-btn">
						<button type="button" onclick="board_insert();" class="btn-basic btn-primary">게시글 등록</button>
					</div>
			    </div>
    			<div class="board-list">
    				<c:forEach var="resultList" items="${resultList}" varStatus="status">
	    				<div class="board-item">
	    					<a href="javascript:void(0);" class="board-lnk" onclick="board_mod('${resultList.idx}');">
	    						<div class="board-col num">${status.count}</div>
	    						<c:if test="${resultList.board_type eq '2'}">
	    							<div class="board-col type">
	    								<span class="board-badge">${resultList.news}</span>
    								</div>
	    						</c:if>
	    						<div class="board-col title">${resultList.title}</div>
	    						<div class="board-col date">${resultList.reg_date}</div>
	    					</a>
	    				</div>
    				</c:forEach>
    			</div>
			</main>
			<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
				<input type='hidden' name="idx" id="idx" value='' />
				<input type='hidden' name="use_at" id="use_at" value='' />
				<input type='hidden' name="type" id="type" value='' />
			</form>
		</div>
		<script>
			$("input[name='board_type']:radio").change(function () {
		        $("#search_fm").attr("action", "/admin/board_list.do");
				$("#search_fm").submit();
			});

			function board_mod(idx){
				location.href= "/admin/board_register.do?idx="+idx;
			}		
			function board_insert(){
				location.href= "/admin/board_register.do";
			}		
			function search(){
				$("#search_fm").attr("action", "/admin/board_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>