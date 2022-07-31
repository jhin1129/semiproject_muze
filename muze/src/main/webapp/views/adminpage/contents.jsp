<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/views/common/header.jsp" />
<jsp:include page="/views/common/adminSidebar.jsp" />
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
		<form name="contentMgmt" action="${ path }/admin/delete" method="get">
			<div class="text-right">
				<button type="button" class="button-white" id="contentDelete"
					style="margin: 0;">삭제</button>
				<button type="button" class="button-white">공개</button>
				<input type="submit" name="btn" class="button-white" value="saveOpen">
				<input type="submit" name="btn" class="button-white" value="saveDelete">
				
			</div>
			<div class="mt-3">
				<table class="table table-sm">
					<thead class="text-center">
						<tr style="height: 10px; color: gray">
							<th style="width: 2%;"></th>
							<th style="width: 10%;">번호</th>
							<th style="width: 30%;">제목</th>
							<th style="width: 18%;">작성자</th>
							<th style="width: 15%;">카테고리</th>
							<th style="width: 15%;">작성일</th>
							<th style="width: 10%;">조회수</th>
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
									<td><input type="checkbox" id="checkbox" name="deleteContent"
										value="${ board.brdNo }"></td>
									<td>${ board.brdNo }</td>
									<td>${ board.brdTitle }</td>
									<td>${ board.brdWriterId }</td>
									<td>${ board.brdType }</td>
									<td>${ board.brdDate }</td>
									<td>${ board.brdReadCount }</td>
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

</div>
<!-- 내용 전체 컨테이너 끝 -->

<script>
    
    function(contentDelete) {
    	var cnt = $(input[name='selected']:checked").length;
    	var arr = Array();
    }
    
    $('input:checkbox').change(function() {
    	$("input[name='selected']").removeProp("checked");
    }
    
    </script>

<jsp:include page="/views/common/footer.jsp" />