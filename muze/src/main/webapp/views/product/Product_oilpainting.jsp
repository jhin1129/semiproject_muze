<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>


    <div class="container">
        <div class="container">
            <div class="mt-2">
                <h2 class="oilpainting">유화</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div id="product_order_list">
                            <p>
                                <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                                <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                                <a href="javascript:pricelistdesc();">높은가격</a>
                            </p>
                        </div>
                </div>
                <div class="col-md-6">
                </div>
            </div>
           <div class="row my-5">

       	<c:forEach var="product" items="${ list }">
			<div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img src='${path}/resources/upload/product/painting/${fn:replace(product.proImg,"\\","/")}' width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">${product.proName }</h5>
                        <p class="card-text"> ${product.proDescription} </p>
                    </div>
                </div>
            </div>
		</c:forEach>
		</div>
    
        <div class="row">
            <div class="col-4"></div>
                <div class="col-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="${path }/product/oilpainting?page=1&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
                        <li class="page-item"><a class="page-link" href="${path }/product/oilpainting?page=${pageInfo.prevPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>
                        
                        <!--  10개 페이지 목록 -->
                        <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                            <c:if test="${ status.current == pageInfo.currentPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
                            </c:if>
                            <c:if test="${ status.current != pageInfo.currentPage }">
                                <li class="page-item"><a class="page-link" href="${path }/product/oilpainting?page=${status.current}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>
                            </c:if>
                        </c:forEach>
                        
                        <li class="page-item"><a class="page-link" href="${path }/product/oilpainting?page=${pageInfo.nextPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
                        <li class="page-item"><a class="page-link" href="${path }/product/oilpainting?page=${pageInfo.maxPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
                    </ul>
                </div>

            <div class="col-4 text-right">
                <button class="btn btn-light text-nowrap" onclick="location.href='${ path }/product/writer?type=Owriter'">작품 등록</button>
            </div>
        </div>
            <div class="search row mb-5">
                <div class="col-xs-2 col-sm-2">
                    <select id="searchType" name="searchType" class="form-control">
                        <option value="pro_name" selected>제목</option>
                    </select>
                </div>

                <div class="col-xs-10 col-sm-10">
                    <div class="input-group">
                        <input type="text" name="searchinput" id="searchInput" class="form-control">
                        <span class="input-group-btn">
                            <button type="submit" id="searchBtn" class="btn btn-light text-nowrap">검색</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>

	$(document).ready(() => {

		$("#searchBtn").on("click", () => {
			var searchType = $("#searchType option:selected").val();
			var searchVal = $("#searchInput").val();
			
			location.href="${path}/product/oilpainting?type=oilpainting&searchType="+searchType+"&searchVal="+searchVal+"&isSearch=true";
		});
	});
	
	</script>

<jsp:include page="/views/common/footer.jsp"/>