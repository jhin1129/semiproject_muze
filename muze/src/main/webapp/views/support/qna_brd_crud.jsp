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
		<h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;">1 : 1 문의</h3>
	</div>

	<form action="${ path }/support/write?type=QNA" method="POST" enctype="multipart/form-data">

		<table class="table-support" style="border: 1px; width: 1000px; height: 600px; margin: auto;">

			<tr>
				<td><b>말머리</b></td>
				<td style="width: 85%;"><select name="brdCategory" style="width: 150px; color: gray;">
						<option>문의 주제 선택</option>
						<option value="상품" >상품</option>
						<option value="주문/결제">주문/결제</option>
						<option value="배송">배송</option>
						<option value="반품/환불">반품/환불</option>
						<option value="이벤트">이벤트</option>
						<option value="회원/정보관리">회원/정보관리</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td style="height: 8%;"><b>작성자</b></td>
				<td><input type="text" name="brdWriterId" style="padding-left: 0.5em;" value="${ loginMember.memberId }" readonly></td>
			</tr>
			<tr>
				<td style="height: 8%;"><b>제목</b></td>
				<td><input type="text" name="brdTitle" size="40" style="padding-left: 0.5em;" placeholder="제목을 입력해 주세요." required></td>
			</tr>
			<tr>
				<td style="height: 68%;"><b>본문</b></td>
				<td><textarea name="brdContent" cols="90%" rows="15" style="padding: 0.5em; resize: none;"
				placeholder="내용을 입력해 주세요."></textarea></td>
			</tr>
			<tr>
				<td style="width: 8%;"><b>첨부파일</b></td>
				<td><input type="text" id="filename" name="upfile" size="20" style="border: 1px solid lightgray;"> 
				<input type="file" id="file"></td>
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