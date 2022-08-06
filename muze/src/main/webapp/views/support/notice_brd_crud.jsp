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
		<h2 style="text-align: center; "><a style="text-decoration-line: none;" href="${path }/support/list?type=NOTICE">공지사항</a></h2>
	</div><br>

	<form action="${ path }/support/write?type=NOTICE" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="brdNo" value=${ board.brdNo }>
		<table class="table-support" style="border: 1px; width: 1000px; height: 600px; margin: auto;">

			<tr>
				<td style="height: 8%;"><b>작성자</b></td>
				<td><input type="text" name="brdWriterId" style="padding-left: 0.5em;" value="${ loginMember.memberId }" readonly></td>
			</tr>
			<tr>
				<td style="height: 8%;"><b>제목</b></td>
				<td><input type="text" name="brdTitle" size="40" style="padding-left: 0.5em;" placeholder="제목을 입력해 주세요."></td>
			</tr>
			<tr>
				<td style="height: 68%;"><b>본문</b></td>
				<td><textarea name="brdContent" cols="90%" rows="15" style="padding: 0.5em; resize: none;" 
				placeholder="내용을 입력해 주세요."></textarea></td>
			</tr>
			<tr>
				<td style="width: 8%;"><b>첨부파일</b></td>
				<td><input type="file" id="filename" name="upfile" size="20" style="border: 1px solid lightgray;"></td>
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