<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- header -->
<jsp:include page="/views/common/header.jsp"/>

    <!-- my CSS -->
	<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

        <!-- 왼쪽 그리드 -->
        <div class="col-sm-2" >
        	<!--사이드 메뉴 -->
        	<jsp:include page="/views/mypage/side_navi.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" ">
          <!-- 컨테이너 -->
          <div class="container">
            <!-- 첫번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                <form style="margin-bottom: 3px;">
                  <span id="mySpan01">나의 게시글</span> 
                  <hr style="margin-bottom: 0%;">
                </form>
              </div>
            </div>
            
            <!-- 두번째 행 -->
        <div class="mt-5">
            <table class="table table-hover" style="margin-top: 0%;">
                <thead>
                    <tr>
                        <th id="th" style="width: 10%;">번호</th>
                        <th id="th" style="width: 50%;">제목</th>
                        <th id="th" style="width: 15%;">작성자</th>
                        <th id="th" style="width: 15%;">날짜</th>
                        <th id="th" style="width: 10%;">조회수</th>
                    </tr>
                </thead>
				
                <tbody>
                	<c:if test="${ empty list }">
                		<tr>
                			<td colspan="6">
                				조회된 게시글이 없습니다.
                			</td>
               			</tr>
                	</c:if>
                	<c:if test="${ not empty list }">
                		<c:forEach var="board" items="${ list }">
	                		<tr>
		                        <td id="td">${ board.rowNum }</td>
		                        <td id="td"><a href="${ path }/board/view?no=${ board.brdNo }&type=${ type }">${ board.brdTitle }</a></td>
		                        <td id="td">${ board.brdWriterId }</td>
		                        <td id="td">${ board.brdDate }</td>
		                        <td id="td">${ board.brdReadCount }</td>
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
                    <li class="page-item"><a class="page-link" href="${path }/board/list?page=1&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="${path }/board/list?page=${pageInfo.prevPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>
                    
                    <!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
		                    <li class="page-item"><a class="page-link" href="${path }/board/list?page=${status.current}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>
					
						</c:if>
					</c:forEach>
                    
                    <li class="page-item"><a class="page-link" href="${path }/board/list?page=${pageInfo.nextPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="${path }/board/list?page=${pageInfo.maxPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
                </ul>
            </div>

            <div class="col-4 text-right">
                <button class="btn btn-light text-nowrap" onclick="location.href='${path}/board/write?type=FREE'">글 쓰기</button>
            </div>
        </div>
            
            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">


              
              </div>
            </div>
            <!-- 세번째 행 끝 -->
          </div>
          <!-- 컨테이너 끝 -->
      </div>
      <!-- 오른쪽 그리드 끝 -->
    </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
	<!-- footer -->
	<jsp:include page="/views/mypage/myfooter.jsp"/>