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
                    <form action="...">
                        <div class="search">
                            <input type="text" name="query" value="">
                            <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg></button>
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
                <div class="col-md-6">
	            <div class="text-right mt-1">
	                    <button class="btn btn-light py-0"  onclick="location.href='${path}/product/oilpainting/writer'">작품 등록</button>
	            </div>
            </div>
            </div>
            </div>
        </div>
        
          <jsp:include page="/views/common/footer.jsp"/>