<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>



        <div class="container">
            <!-- 메인 메뉴 -->
            <ul class="nav justify-content-between">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false" style="font-size: 1.1em">
                    muzé
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">BRAND </a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    작품
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">회화</a></li>
                    <li><a class="dropdown-item" href="#">공예</a></li>
                    <li><a class="dropdown-item" href="#">조소</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    커뮤니티
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">게시판</a></li>
                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    이벤트
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">출석하기</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    고객 지원
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Q&A</a></li>
                    <li><a class="dropdown-item" href="#">FAQ</a></li>
                    <li><a class="dropdown-item" href="#">신고하기</a></li>
                    </ul>
                </li>
                <!-- <ul class="nav justify-content-end" id="search">
                    <form class="d-flex">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown p-0" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <button type="submit" class="btn btn-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-search"
                            viewBox="0 0 16 16">
                            <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                            </svg>
                        </button>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item"><input class="form-control me-2" type="search" placeholder="Search"
                                aria-label="Search"></a></li>
                        </ul>
                    </li>
                    </form>
                </ul> -->
                </ul>
                <hr class="mt-1">
            </div>


    <div class="container">
        <div class="mt-2">
            <h2 class="painting">유화</h2>
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
            <div class="col-md-6">
                <select id="dataPerPage">
                    <option value="10">10개씩보기</option>
                    <option value="20">20개씩보기</option>
                    <option value="30">30개씩보기</option>
            </select>
            </div>
        </div>

        <div class="row">
            <div class="col-sm">
                <div class="product_list">
                    <div class="product_no_data" style="line-height:250px;text-align:center !important;">
                        <strong style="line-height: 300px;">상품이 존재하지 않습니다.</strong>
                    </div>
                </div>
            </div>
        </div>
        
          <jsp:include page="/views/common/footer.jsp"/>