<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
   
<!-- 내용 전체 컨테이너 -->
<div class="container my-5">

    <div>
        <h2 style="text-align: center;"><a href="${path }/board/list?type=REVIEW">리뷰 게시판</a></h2>
    </div>

	<c:forEach var="board" items="${ list }" varStatus="status">
		<c:if test="${status.count % 4 == 1}">
			<div class="row my-5">
		</c:if>
		
		<div class="col-lg-3 col-md-6">
            <div class="card" style="width: 16rem;">
                <img style="background-color: black;" width="100%" height="254px">
                <div class="card-body">
                    <h5 class="card-title">${ board.brdTitle }</h5>
                    <p class="card-text">${board.brdWriterId }</p>
                    <p class="card-text">${board.brdContent }</p>
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

    <div>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>

</div>
<jsp:include page="/views/common/footer.jsp"/>
