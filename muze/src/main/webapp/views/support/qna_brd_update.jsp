<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/support/support.css">
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">

<!-- 내용 전체 컨테이너 -->
<div class="container my-5">

	<div>
		<h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;">공지사항</h3>
	</div>

	<form action="${ path }/support/update?type=QNA" method="POST" enctype="multipart/form-data">
		
		<!-- no 숨김 처리 -->
		<input type="hidden" name="brdNo" value=${ board.brdNo }>
		<input type="hidden" name="originalFileName	" value=${ board.brdOriginalFileName }>
		<input type="hidden" name="renamedFileName" value=${ board.brdRenamedFileName }>
		
		<table class="table-support" style="border: 1px; width: 1000px; height: 600px; margin: auto;">

			<tr>
				<td style="width: 15%; height: 8%;"><b>작성자</b></td>
				<td><input type="text" name="brdWriterId" style="padding-left: 1em;" value="${ board.brdWriterId }" readonly></td>
			</tr>
			<tr>
				<td style="height: 8%;"><b>제목</b></td>
				<td><input type="text" name="brdTitle" size="40" style="padding-left: 1em;" placeholder="제목을 입력해 주세요."
				value="${ board.brdTitle }"></td>
			</tr>
			<tr>
				<td style="height: 68%;"><b>본문</b></td>
				<td><textarea name="brdContent" cols="90%" rows="15" style="padding: 1em; resize: none;" 
				placeholder="내용을 입력해 주세요.">${ board.brdContent }</textarea></td>
			</tr>
			<tr>
				<td style="height: 8%;"><b>첨부파일</b></td>
				<td>
					<input type="file" name="upfile">
					<c:if test="${ not empty board.brdOriginalFileName }">
						<img src="${ path }/resources/images/board/file.png" width="20px" height="20px">
						<span>${ board.brdOriginalFileName }</span>
					</c:if>
				</td>
			</tr>

		</table>
		<div style="text-align: center; margin-top: 30px; margin-left: 70px;">
			<button type="reset" class="button-white">
				<b>취소</b>
			</button>
			<button type="submit" class="button-black">
				<b>저장</b>
			</button>
		</div>
	</form>
</div>

<jsp:include page="/views/common/footer.jsp" />