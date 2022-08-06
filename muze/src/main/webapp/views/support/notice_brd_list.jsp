<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/support/support.css">
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">

    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

        <div>
            <h2 style="text-align: center; "><a style="text-decoration-line: none;" href="${path }/support/list?type=NOTICE">공지사항</a></h2>
        </div>

        <div class="mt-5">
            <table class="table table-hover" style="font-size: 1em;">
                <thead>
                    <tr>
                        <th class="py-0.5" style="width: 10%;">번호</th>
                        <th class="py-0.5" style="width: 50%;">제목</th>
                        <th class="py-0.5" style="width: 15%;">작성자</th>
                        <th class="py-0.5" style="width: 15%;">날짜</th>
                        <th class="py-0.5" style="width: 10%;">조회수</th>
                    </tr>
                </thead>

                <tbody>
                   <c:if test="${ empty list }">
	                    <tr>
	                        <td colspan="5">
	                        	조회된 게시글이 없습니다.
	                        </td>
	                    </tr>
					</c:if>
                	<c:if test="${ not empty list }">
                		<c:forEach var="board" items="${ list }">
	                    <tr>
	                        <td>${ board.rowNum }</td>
	                        <td><a style="display: block;" href="${ path }/support/view?brdNo=${ board.brdNo }&&type=${ type }">${ board.brdTitle }</a></td>
	                        <td>${ board.brdWriterId }</td>
	                        <td>${ board.brdDate }</td>
	                        <td>${ board.brdReadCount }</td>
	                    </tr>
	                    </c:forEach>
					</c:if>
                </tbody>

            </table>
        </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="${ path }/support/list?page=1&&type=${ type }">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="${ path }/support/list?page=${ pageInfo.prevPage }&&type=${ type }">&lt;</a></li>
                    
                    <!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
		                    <li class="page-item"><a class="page-link" href="${ path }/support/list?page=${ status.current }&&type=${ type }">${ status.current }</a></li>
					
						</c:if>
					</c:forEach>
                    
                    <li class="page-item"><a class="page-link" href="${ path }/support/list?page=${ pageInfo.nextPage }&&type=${ type }">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="${ path }/support/list?page=${ pageInfo.maxPage }&&type=${ type }">&gt;&gt;</a></li>
                </ul>
            </div>

			<c:if test="${loginMember.memberRole == 'MEMBER_ROLE_ADMIN'}">
            <div class="col-4 text-right">
                <button class="btn btn-light text-nowrap" onclick="location.href='${ path }/support/write?type=NOTICE'">글 쓰기</button>
            </div>
            </c:if>
        </div>

    </div>

<jsp:include page="/views/common/footer.jsp"/>