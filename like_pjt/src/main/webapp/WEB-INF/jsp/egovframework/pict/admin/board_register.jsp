<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="게시글 등록" />
</c:import>

<body>
	<div class="wrapper">
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<%@include file="../main/navigation.jsp"%>
			<main class="sub-container">
				<!-- <h3 class="contents-title">게시글 등록</h3> -->
    			<div class="board-write">
	    			<table>
	    				<colgroup>
	    					<col style="width:15%;">
	    					<col style="width:auto;">
	    				</colgroup>
						<tbody>
							<tr>
								<th class="title">제목*</th>
								<td>
									<input type="text" id="title" name="title" value="${pictVO.title}" class="board-write-input">
								</td>
							</tr>
							<%-- <tr>
								<th class="title">언론사*</th>
								<td>
									<input type="text" class="board-write-input opt-max-width-200" id="news" name="news" value="${pictVO.news}"/>
								</td>
							</tr>
							<tr>
								<th class="title">타입*</th>
								<td>
									<select id="board_type" name="board_type" class="board-write-input opt-max-width-200">
										<option value="0">타입선택</option>
										<option value="1" <c:if test="${pictVO.board_type eq '1'}"> selected </c:if> >게시글</option>
										<option value="2" <c:if test="${pictVO.board_type eq '2'}"> selected </c:if> >뉴스</option>
									</select>
								</td>
							</tr> --%>
							<tr>
								<th class="title">내용*</th>
								<td>
									<textarea id="text" name="text" cols="130" rows="7" style="width:100%; height:400px;">${pictVO.text}</textarea>
									<script type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
											oAppRef: oEditors,
											elPlaceHolder: "text", //textarea에서 지정한 id와 일치해야 합니다.
											sSkinURI: "/js/SmartEditor2Skin.html",
											fCreator: "createSEditor2"
										});
									</script>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="board-write-btn">
					<c:if test="${pictVO.saveType eq 'update'}">
						<button type="button" onclick="javascript:board_delete()" class="btn-basic btn-default">삭제</button>
					</c:if>
		            <button type="button" onclick="button1_click();" class="btn-basic btn-primary">
						<c:if test="${pictVO.saveType eq 'insert'}">등록</c:if>
						<c:if test="${pictVO.saveType ne 'insert'}">수정</c:if>
					</button>
		        	<button type="button" onclick="javascript:board_list()" class="btn-basic btn-outline">목록보기</button>    
	            </div>
			</main>
			<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
			<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
			<input type='hidden' name="use_at" id="use_at" value='${pictVO.use_at}' />
		</form>
	</div>

	<script>
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/admin/board_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/admin/board_list.do";
		}
		function button1_click() {
			var title = $('#title').val();
			var in_text = $('#text').val()			
			var board_type = $('#board_type').val()
			var saveType = $('#saveType').val();

			if (title == "" || title == undefined) {
				window.alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			if (board_type == "0" || title == undefined) {
				window.alert("게시글 타입을 선택해주세요.");
				$('#board_type').focus();
				return false;
			}
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}
			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			if (confirm(text)) {
				$("#register").attr("action", "/admin/board_save.do");
				$("#register").submit();
			}
		}
		
	</script>

	<script src="../../../../../js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js"
		crossorigin="anonymous"></script>

</body>
</html>