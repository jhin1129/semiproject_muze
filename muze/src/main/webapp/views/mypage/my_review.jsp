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
                <form style="margin-bottom: 3px;">
                  <span id="mySpan01">나의 후기</span> 
                  <hr style="margin-bottom: 10px;">
                </form>
              </div>
            </div>
            
            <!-- 두번째 행 -->
             <c:if test="${ not empty list }">
				<c:forEach var="board" items="${ list }" varStatus="status">
					<c:if test="${status.count % 4 == 1}">
						<div class="row my-5">
					</c:if>
					
					<div class="col-lg-3 col-md-6" onclick="location.href='${ path }/board/view?no=${ board.brdNo }&type=${ type }'">
			            <div class="card" style="width: 13rem; height: 20rem;">
			                <img style="background-color: black;" width="100%" height="70%">
			                <div class="card-body">
			                    <h5 class="card-title">${ board.brdTitle }</h5>
			                    <p class="card-text">${board.brdProName }</p>
			                    <p class="card-text">${board.brdWriterId }</p>
			                </div>
			            </div>
			        </div>
					<c:if test="${status.count %4 == 0 && !status.last}">
					    </div>
					</c:if>
					<c:if test="${status.last}">
					    </div>
					</c:if>
				</c:forEach>
			 </c:if>
	           <c:if test="${ empty list }">
				  <tr>
	                <td colspan="6">
	                	<br>
		                	<p style="font-size : 0.8em;"> 작성된 후기가 존재하지 않습니다. </p>
	                	<br><br><br><br><br>
	                </td>
	             </tr>
			 </c:if>

    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=1&type=REVIEW&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
                <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.prevPage}&type=REVIEW&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>
                
                <!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
                  		<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
                  		<li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${status.current}&type=REVIEW&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>
	
					</c:if>
				</c:forEach>
				  <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.nextPage}&type=REVIEW&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
                  <li class="page-item"><a class="page-link" style="color: grey;" href="${path }/board/list?page=${pageInfo.maxPage}&type=REVIEW&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
            </ul>
        </div>
	<c:if test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_USER' }">
        <div class="col-4 text-right">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/board/write?type=REVIEW'" id="srhbtn8">글 쓰기</button>
        </div>
	 </c:if>
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