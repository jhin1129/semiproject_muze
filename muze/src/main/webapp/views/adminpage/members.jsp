<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/views/common/header.jsp" />
<jsp:include page="/views/adminpage/sidebar.jsp" />
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/mypage_main.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

<!-- 오른쪽 그리드 -->
<div class="col-sm-10" style="border: 1px solid lightgray;">
	<!-- 컨테이너 -->
	<div class="summary">
		<h5>회원 관리</h5>
		<div class="text-right">
			<button type="button" class="button-white">삭제</button>
			<button type="button" class="button-white">저장</button>
		</div>
		<div class="mt-3">
			<table class="table table-sm">
				<thead class="text-center">
					<tr style="height: 10px; color: gray">
						<th style="width: 2%;"><input type="checkbox"></th>
						<th style="width: 10%;">유저번호</th>
						<th style="width: 15%;">아이디</th>
						<th style="width: 8%;">이름</th>
						<th style="width: 15%;">전화번호</th>
						<th style="width: 20%;">이메일</th>
						<th style="width: 12%;">가입일</th>
						<th style="width: 10%;">계정타입</th>
						<th style="width: 8%;">회원여부</th>
					</tr>
				</thead>

				<tbody class="text-center">
					<c:if test="${ empty list }">
						<tr>
							<td colspan="9">조회된 회원이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${ not empty list }">
						<c:forEach var="board" items="${ list }">
							<tr>
								<td><input type="checkbox"></td>
								<td>${ member.memberNo }</td>
								<td>${ member.memberId }</td>
								<td>${ member.memberName }</td>
								<td>${ member.memberPhoneNumber }</td>
								<td>${ member.memberEmail }</td>
								<td>${ member.enrollDate }</td>
								<td>${ member.memberRole }</td>
								<td>${ member.ismember }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>
		</div>
	</div>
	<div class="row" style="margin-bottom: 25px;">
		<div class="col-4"></div>
		<div class="col-4">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/member?page=1">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/member?page=${ pageInfo.prevPage }">&lt;</a></li>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
						<li class="page-item"><a class="page-link"
							href="${ path }/admin/member?page=${ status.current }">${ status.current }</a></li>

					</c:if>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="${ path }/admin/member?page=${ pageInfo.nextPage }">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/member?page=${ pageInfo.maxPage }">&gt;&gt;</a></li>

			</ul>
		</div>
	</div>
</div>

<!-- 내용 전체 컨테이너 끝 -->

<jsp:include page="/views/common/footer.jsp" />