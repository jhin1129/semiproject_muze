<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/views/common/header.jsp"/>

    <div class="container">
        <div class="mt-2">
            <h2 class="painting">회화</h2>
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
                    <div class="input-group">
            	<input type="text" name="searchInput" id="searchInput" class="form-control">
                <span class="input-group-btn">
                    <button id="searchBtn" class="btn btn-light text-nowrap">검색</button>
                </span>
            </div>
                </form>
            </div>
        </div>
        <div class="row my-5">

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style= width="100%" height="254px" src="${ path }/resources/upload/product/painting">
                    <div class="card-body">
                        <h5 class="card-title">${ product.proName}</h5>
                        <p class="card-text">${ product.proSize }
                        					 </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row my-5">

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

        <div class="row my-5">

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row my-5">

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card" style="width: 16rem;">
                    <img style="background-color: black;" width="100%" height="254px">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's
                            content.</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="${path }/product/painting?page=1&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="${path }/product/painting?page=${pageInfo.prevPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&lt;</a></li>
                    
                    <!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
		                    <li class="page-item"><a class="page-link" href="${path }/product/painting?page=${status.current}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">${ status.current }</a></li>
					
						</c:if>
					</c:forEach>
                    
                    <li class="page-item"><a class="page-link" href="${path }/product/painting?page=${pageInfo.nextPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="${path }/product/painting?page=${pageInfo.maxPage}&type=${type}&isSearch=${isSearch}&searchType=${searchType}&searchVal=${searchVal}">&gt;&gt;</a></li>
                </ul>
            </div>
        </div>
            <div class="col-md-6">
	            <div class="text-right mt-1">
	                    <button class="btn btn-light py-0"  onclick="location.href='${ path }/product/writer?type=Pwriter'">작품 등록</button>
	            </div>
            </div>
        </div>
        </div>


  <jsp:include page="/views/common/footer.jsp"/>
</body>
</html>