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
        <h2 style="text-align: center; "><a style="text-decoration-line: none;" href="${path }/board/list?type=REVIEW">리뷰 게시판</a></h2>
    </div>

	<c:forEach var="board" items="${ list }" varStatus="status">
		<c:if test="${status.count % 4 == 1}">
			<div class="row my-5">
		</c:if>
		<div class="col-lg-3 col-md-6">
            <div class="card" style="cursor:pointer;" style="width: 16rem;" onclick="location.href='${ path }/board/view?no=${ board.brdNo }&type=${ type }'">
				<div>
                	<img src="${path}/resources/upload/board/temporary/${board.brdImg }" onerror="this.src='${path}/resources/images/common/No-Image.png'" style="width: 100%; height:254px; object-fit:contain;">
				</div>

                <div class="card-body" style="width:100%; height: 140px;">
                    <h5 class="card-title" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${ board.brdTitle }</h5>
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
            <button class="btn btn-light text-nowrap" onclick="location.href='${path}/board/write?type=REVIEW'">글 쓰기</button>
        </div>
    </div>
	
	<div class="search row mb-5">
    	<div class="col-xs-2 col-sm-2">
        	<select id="searchType" name="searchType" class="form-control">
            	<option value="title" selected>제목</option>
                <option value="proName">작품명</option>
                <option value="writer">작성자</option>
            </select>
        </div>

        <div class="col-xs-10 col-sm-10">
            <div class="input-group">
            	<input type="text" name="searchInput" id="searchInput" class="form-control">
                <span class="input-group-btn">
                    <button id="searchBtn" class="btn btn-light text-nowrap">검색</button>
                </span>
            </div>

        </div>

	</div>
</div>

<script>

	$(document).ready(() => {

		$("#searchBtn").on("click", () => {
			var searchType = $("#searchType option:selected").val();
			var searchVal = $("#searchInput").val();
			
			location.href="${path}/board/list?type=REVIEW&searchType="+searchType+"&searchVal="+searchVal+"&isSearch=true";
		});
	});
</script>
<jsp:include page="/views/common/footer.jsp"/>
