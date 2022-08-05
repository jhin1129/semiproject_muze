<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/views/common/header.jsp" />

<div class="container">
	<div class="mt-2">
			<c:if test="${ type == 'PORTRAIT'}">
            	<h2 style="text-align: center;"><a href="${path }/product/write?type=PORTRAIT">인물</a></h2>
           	</c:if>
        	<c:if test="${ type == 'LANDSCAPE'}">
            	<h2 style="text-align: center;"><a href="${path }/product/write?type=LANDSCAPE">풍경</a></h2>
           	</c:if>
        	<c:if test="${ type == 'STILL-LIFE'}">
            	<h2 style="text-align: center;"><a href="${path }/product/write?type=STILL-LIFE">정물</a></h2>
           	</c:if>
        	<c:if test="${ type == 'ABSTRACT'}">
            	<h2 style="text-align: center;"><a href="${path }/product/write?type=ABSTRACT">추상</a></h2>
           	</c:if>
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
			<form action="...">
				<div class="search">
					<input type="text" name="query" value="">
					<button type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
					</button>
				</div>
			</form>
		</div>
	</div>


	<div class="row my-5">

		<c:forEach var="product" items="${ list }">
			<div class="col-lg-3 col-md-6" onclick="location.href='${path}/product/view?proNo=${product.proNo}'">
				<div class="card" style="width: 16rem;">
					<img src='${path}/resources/upload/product/painting/${fn:replace(product.proImg,"\\","/")}' width="100%" height="254px">
					<div class="card-body">
						<h5 class="card-title">${product.proName }</h5>
						<p class="card-text">
							<small> ${loginMember.memberName} <br> ${product.proSize} <br> <fmt:formatNumber value="${product.proPrice }" pattern="#,###"/> P</small>
						</p>
					</div>
				</div>
			</div>

		</c:forEach>




	</div>
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="${path }/product/list?page=1&type=PORTRAIT&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${path }/product/list?page=${pageInfo.prevPage}&type=PORTRAIT&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
						<li class="page-item"><a class="page-link"
							href="${path }/product/list?page=${status.current}&type=PORTRAIT&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>

					</c:if>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="${path }/product/list?page=${pageInfo.nextPage}&type=PORTRAIT&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="${path }/product/list?page=${pageInfo.maxPage}&type=PORTRAIT&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />