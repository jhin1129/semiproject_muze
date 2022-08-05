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
		<h5>콘텐츠 관리 > 게시글 관리</h5>
		<form name="contentMgmt" action="${ path }/admin/content/mgmt" method="get">
			<div class="text-right">
				<input type="submit" name="btn" style="width: 50px; height: 30px; margin: 0; 
				background-color: white; color: black; border: 1px solid lightgray;" value="공개">
				<input type="submit" name="btn" style="width: 50px; height: 30px; margin: 0; 
				background-color: white; color: black; border: 1px solid lightgray;" value="숨김">
			</div>
			<div class="mt-3">
				<table class="table table-sm">
					<thead class="text-center">
						<tr style="height: 10px; color: gray">
							<th style="width: 10%;">번호</th>
							<th style="width: 28%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 10%;">카테고리</th>
							<th style="width: 14%;">작성일</th>
							<th style="width: 8%;">조회수</th>
							<th style="width: 8%;">공개여부</th>
							<th style="width: 6%;">공개</th>
							<th style="width: 6%;">숨김</th>
						</tr>
					</thead>

					<tbody class="text-center">
						<c:if test="${ empty list }">
							<tr>
								<td colspan="7">조회된 게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ not empty list }">
							<c:forEach var="board" items="${ list }">
								<tr>
									<td>${ board.brdNo }</td>
									<td>${ board.brdTitle }</td>
									<td>${ board.brdWriterId }</td>
									<td>${ board.brdType }</td>
									<td>${ board.brdDate }</td>
									<td>${ board.brdReadCount }</td>
									<td>${ board.brdStatus }</td>
									<td><input type="checkbox" id="checkbox" name="openContent"
										value="${ board.brdNo }"></td>
									<td><input type="checkbox" id="checkbox" name="hideContent"
										value="${ board.brdNo }"></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>

				</table>
			</div>
		</form>
	</div>
	<div class="row" style="margin-bottom: 25px;">
		<div class="col-4"></div>
		<div class="col-4">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/content?page=1">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/content?page=${ pageInfo.prevPage }">&lt;</a></li>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
						<li class="page-item"><a class="page-link"
							href="${ path }/admin/content?page=${ status.current }">${ status.current }</a></li>

					</c:if>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="${ path }/admin/content?page=${ pageInfo.nextPage }">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/content?page=${ pageInfo.maxPage }">&gt;&gt;</a></li>

			</ul>
		</div>
	</div>
</div>

<!-- 내용 전체 컨테이너 끝 -->

<jsp:include page="/views/common/footer.jsp" />