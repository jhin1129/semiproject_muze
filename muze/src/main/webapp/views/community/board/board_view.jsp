<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<style>
	 #comment p {
	     margin: 0px;
	 }
	
	 textarea:focus {
	     outline: none;
	 }
	
	 table th,
	 table td {
	     white-space: nowrap;
	 }
	
	 #th,
	 #td {
	     padding-top: 10px;
	     padding-bottom: 10px;
	 }
</style>
    <!-- 내용 전체 컨테이너 -->
    <div class="container mt-5">

        <div>
        	<c:if test="${ type == 'REVIEW'}">
	            <h2 style="text-align: center;">리뷰 게시판</h2>
        	</c:if>
        	<c:if test="${ type == 'FREE'}">
	            <h2 style="text-align: center;">자유 게시판</h2>
        	</c:if>
        </div>
        <!-- 후기글 전체 -->
        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">

            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">제목</th>
                            <td style="width: 50%;">${board.brdTitle }</td>
                            <td style="width: 15%;"></td>
                            <td style="width: 15%;"></td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="table-active">작성자</th>
                            <td>${board.brdWriterId }</td>
                            <th class="table-active">작성일</th>
                            <td>${board.brdDate }</td>
                        </tr>
                    </tbody>

                </table>
            </div>


            <!-- 이미지 -->
            <div>
                <img style="background: black; width: 100%; height: 500px;">
            </div>
            <!-- 내용 -->
            <div class="my-3 px-3">
                <p>
                    ${ board.brdContent }
                </p>
                <div class="text-right">
                    <button class="btn btn-light py-0">수정</button>
                    <button class="btn btn-light py-0">삭제</button>
                </div>
            </div>

            
            <c:if test="${ type == 'REVIEW'}">
            
	            <hr style="border-style: dotted;">
	            <!-- 리뷰 속 작품 -->
	            <div class="px-3 pb-3">
	                <h4>리뷰 속 작품</h4>
	
	                <div class="card">
	                    <div class="row g-0">
	                        <!-- 이미지 -->
	                        <div class="col-md-4" style="min-width: 254px;">
	                            <img style="background-color: black; width: 254px; height: 254px;" class="rounded-start">
	                        </div>
	                        <!-- 이미지 상세내용 -->
	                        <div class="col-md-8">
	                            <div class="card-body">
	                                <h5 class="card-title">Card title</h5>
	                                <p class="card-text">This is a wider card with supporting text below as a natural
	                                    lead-in to
	                                    additional
	                                    content. This content is a little bit longer.</p>
	                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
            </c:if>

            <hr style="border-style: dotted;">
            <!-- 댓글 -->
            <div class="px-3">
                <h4>댓글</h4>

                <div id="comment">
                    <hr>
                    <p style="font-weight: bold;">USER1</p>
                    <p>댓글을 작성합니다.</p>
                    <div class="row m-0">
                        <p class="mt-2 col p-0" style="font-size: 11px;">2022.07.15 05:30</p>
                        <div>
                            <button class="btn btn-light py-0">수정</button>
                            <button class="btn btn-light py-0">삭제</button>
                        </div>
                    </div>

                    <hr>
                </div>

                <div class="mb-3">
                    <form action="">
                        <div class="form-control" style="height: 85px;">
                            <p style="font-weight: bold; margin: 0px;">USER2</p>
                            <hr style="margin: 0px;">
                            <textarea style="border: none; resize: none; width: 100%;"
                                placeholder="댓글을 작성해주세요"></textarea>
                        </div>
                        <div class="text-right mt-1">
                            <button class="btn btn-light py-0">작성</button>
                        </div>
                    </form>

                </div>
            </div>

        </div>
        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-light text-nowrap">목록</button>
        </div>
    </div>
<jsp:include page="/views/common/footer.jsp"/>
