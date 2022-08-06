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
        	<jsp:include page="/views/mypage/welcome_side.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" ">
          <!-- 컨테이너 -->
          <div class="container">
            <!-- 첫번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                  <span id="mySpan01">나의 문의</span> 
                  <hr style="margin-bottom: 0;">
              </div>
            </div>
            
            <!-- 두번째 행 -->
        <div class="mt-5">
            <!-- <table class="ordertable" style="margin-top: 0%;"> -->
             <table class="table table-hover" style="margin-top: 0%;">
                 <thead id="my_thead01">
                    <tr>
                        <th class="my_th" id="br_th01"><center>번호</center></th>
                        <th class="my_th" id="br_th02" style="width: 45%"><center>제목</center></th>
                        <th class="my_th" id="br_th03"><center>답변</center></th>
                        <th class="my_th" id="br_th03"><center>작성자</center></th>
                        <th class="my_th" id="br_th04"><center>날짜</center></th>
                        <th class="my_th" id="br_th05"><center>조회수</center></th>
                    </tr>
                </thead>
				
                <tbody>
                	<c:if test="${ empty list }">
                		<tr>
                			<td colspan="6">
                				작성된 게시글이 존재하지 않습니다.
                			</td>
               			</tr>
                	</c:if>
                	<c:if test="${ not empty list }">
                		<c:forEach var="board" items="${ list }">
	                		<tr>
		                        <td id="br_td01">${ board.rowNum }</td>
		                        <td id="br_td01"><a href="${ path }/support/view?brdNo=${ board.brdNo }&type=${ type }">${ board.brdTitle }</a></td>
		                        <td id="br_td01"><c:if test="${ not empty board.brdRepContent }">[답변 완료]</c:if></td>
		                        <td id="br_td01">${ board.brdWriterId }</td>
		                        <td id="br_td01">${ board.brdDate }</td>
		                        <td id="br_td01">${ board.brdReadCount }</td> 
	                    	</tr>
                		</c:forEach>
                	</c:if>
                </tbody>
            </table>
        </div>

        <div class="row" style="margin-top: 10px;">
            <div class="col-5">
<%--                 <ul class="pagination">
                    <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=1&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.prevPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>
                    
                    <!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
		                    <li class="page-item disabled"><a class="page-link" style="color: grey;"  href="#">${ status.current }</a></li>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
		                    <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${status.current}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>
					
						</c:if>
					</c:forEach>
                    
                    <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.nextPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
                    <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.maxPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
                </ul> --%>
            </div>
            <div class="col-4">
            
            </div>

            <div class="col-3 text-right">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/support/write?type=QNA'" id="srhbtn8">글 쓰기</button>
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
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>