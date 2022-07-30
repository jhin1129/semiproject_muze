<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">
<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

      <!-- 왼쪽 그리드 -->
      <div class="col-sm-2">
        <!-- 사이드 메뉴바 -->
        <div class="mySideMenu">
          <h5 style="font-weight: 600;">마이 페이지</h5>
          <hr>
          <p id="myListMain"> 대시보드 </p>
          <li id="mylist"><a id="sublist">- 방문자 현황</a></li>
          <li id="mylist"><a id="sublist">- 일자별 요약</a></li>
          <p id="myListMain"> 회원 관리 </p>
          <p id="myListMain"> 콘텐츠 관리 </p>
          <li id="mylist"><a id="sublist">- 게시글 관리</a></li>
          <li id="mylist"><a id="sublist">- 댓글 관리</a></li>
          <p id="myListMain"> 문의/신고 관리</p>
          <p id="myListMain"> 공지사항</p>
        </div>
      </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" style="border: 1px solid lightgray;">
          <!-- 컨테이너 -->
          <div class="summary">
            <h5>콘텐츠 관리 > 게시글 관리</h5>
            <div class="text-right">
              <button type="button" class="button-white" style="margin: 0;">삭제</button>
              <button type="button" class="button-white">저장</button>
            </div>
            <div class="mt-3">
              <table class="table table-sm">
                  <thead class="text-center">
                      <tr style="height: 10px; color:gray">
                          <th style="width: 2%;"><input type="checkbox"></th>
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
                    		<td colspan="9">
                    			조회된 게시글이 없습니다.
                    		</td>
                    	</tr>
                    </c:if>
                    <c:if test="${ not empty list }">
                    	<c:forEach var="board" items="${ list }">
                    	<tr>
                    		<td><input type="checkbox"></td>
                    		<td>${ board.brdNo }</td>
                    		<td>${ board.brdTitle }</td>
                    		<td>${ board.brdWriterId }</td>
                    		<td>${ board.brdCategory }</td>
                    		<td>${ board.brdDate }</td>
                    		<td>${ board.brdReadCount }</td>
                    	</tr>
                    	</c:forEach>
                    </c:if>
                    
 <!--                    
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>1</td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회1</td>
                      <td>작성자1</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
 -->
                  </tbody>
  
              </table>
          </div>
          </div>
          <div class="row" style="margin-bottom: 25px;">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="${ path }/admin/content?page=1">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="${ path }/admin/content?page=${ pageInfo.prevPage }">&lt;</a></li>

                    <!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
		                    <li class="page-item"><a class="page-link" href="${ path }/admin/content?page=${ status.current }">${ status.current }</a></li>
					
						</c:if>
					</c:forEach>
                    
                    <li class="page-item"><a class="page-link" href="${ path }/admin/member?content=${ pageInfo.nextPage }">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="${ path }/admin/member?content=${ pageInfo.maxPage }">&gt;&gt;</a></li>
 
                </ul>
            </div>
        </div>
        </div>
      
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
<jsp:include page="/views/common/footer.jsp"/>