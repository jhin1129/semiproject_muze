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
		<h5>1 : 1 문의</h5>
			<div class="mt-3">
				<table class="table table-sm">
					<thead class="text-center">
						<tr>
							<th class="py-0.5" style="width: 10%; text-align: center;">번호</th>
							<th class="py-0.5" style="width: 40%; text-align: center;">제목</th>
							<th class="py-0.5" style="width: 15%; text-align: center;">답변
								상태</th>
							<th class="py-0.5" style="width: 15%; text-align: center;">작성자</th>
							<th class="py-0.5" style="width: 20%; text-align: center;">날짜</th>
						</tr>
					</thead>

					<tbody class="text-center">
						<c:if test="${ empty list }">
							<tr>
								<td colspan="5">조회된 게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ not empty list }">
							<c:forEach var="board" items="${ list }">
								<tr>
									<td style="text-align: center;">${ board.brdNo }</td>
									<td style="text-align: center;"><a style="display: block;"
										href="${ path }/support/view?brdNo=${ board.brdNo }&&type=${ type }">${ board.brdTitle }</a></td>
									<td style="text-align: center;"><c:if test="${ not empty board.brdRepContent }">[답변 완료]</c:if></td>
									<td style="text-align: center;">${ board.brdWriterId }</td>
									<td style="text-align: center;">${ board.brdDate }</td>
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
					href="${ path }/admin/qna?page=1&&type=QNA">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/qna?page=${ pageInfo.prevPage }&&type=QNA">&lt;</a></li>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
						<li class="page-item"><a class="page-link"
							href="${ path }/admin/qna?page=${ status.current }&&type=QNA">${ status.current }</a></li>
					</c:if>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="${ path }/admin/qna?page=${ pageInfo.nextPage }&&type=QNA">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${ path }/admin/qna?page=${ pageInfo.maxPage }&&type=QNA">&gt;&gt;</a></li>

			</ul>
		</div>
	</div>
</div>

<!-- 내용 전체 컨테이너 끝 -->

<jsp:include page="/views/common/footer.jsp" />