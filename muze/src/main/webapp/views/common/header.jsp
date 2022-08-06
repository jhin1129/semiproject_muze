<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- jQuery js -->  
  <script src="${ path }/resources/js/common/jquery-3.6.0.js"></script>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

  <!-- Mainstyle CSS -->
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/common/mainstyle.css?after">

  <title>Header</title>
</head>

<body>
  <!-- 메인 로고와 상단 우측 메뉴 포함한 header> -->
  <header class="blog-header pt-5 py-5">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1"></div>
      <div class="col-4 text-center">
        <img src="${path}/resources/images/common/logo.png" width="200px" onclick="location.href='${path }/' ">
      </div>
      <!-- 상단 우측 메뉴 -->
      <div class="col-4 d-flex justify-content-center align-items-center mt-3">
	      <c:if test="${ empty loginMember }">
		        <a class="mr-4 text-nowrap" href="${path}/member/login">로그인</a>
		        <a class="mr-4 text-nowrap" href="${path}/member/join_method">회원가입</a>
	      </c:if>
	      
			<c:if test="${ not empty loginMember }">
		        <a class="mr-4 text-nowrap" onclick="location.replace('${ path }/member/logout')">로그아웃</a>
		        <c:choose>
					<c:when test="${ memId  == 'admin' }">
						<a class="mr-4 text-nowrap" href="${path}/admin/main">관리자페이지</a>
					</c:when>
					<c:when test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_ARTIST' }">
						<a class="mr-4 text-nowrap" href="${path}/product/write">작품 등록</a>
						<a class="mr-4 text-nowrap" href="${path}/mypage/artist">아티스트 페이지</a>
					</c:when>
					<c:otherwise>
						<a class="mr-4 text-nowrap" href="${path}/mypage/welcome">마이페이지</a>
				        <a href="${path}/cart/view" class="me-5 align-items-center mb-1">
		          			<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-cart2"
		            		viewBox="0 0 16 16">
		            			<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
		          			</svg>
		        </a>
					</c:otherwise>

					</c:choose>
	      </c:if>
	</div>   	
    </div>
</header>

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
          <li><a class="dropdown-item" href="${path}/product/list?type=PORTRAIT">인물</a></li>
          <li><a class="dropdown-item" href="${path}/product/list?type=LANDSCAPE">풍경</a></li>
          <li><a class="dropdown-item" href="${path}/product/list?type=STILL-LIFE">정물</a></li>
          <li><a class="dropdown-item" href="${path}/product/list?type=ABSTRACT">추상</a></li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
          aria-expanded="false" style="padding-right:0px;">
          커뮤니티
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="${path}/board/list?type=REVIEW">리뷰 게시판</a></li>
          <li><a class="dropdown-item" href="${path}/board/list?type=FREE">자유 게시판</a></li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown" href="${path}/event" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
          aria-expanded="false">
          이벤트
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="${path}/event">출석하기</a></li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
          aria-expanded="false">
          고객 지원
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="${path}/support/list?type=NOTICE">공지사항</a></li>
          <li><a class="dropdown-item" href="${path}/support/write?type=QNA">1:1 문의</a></li>
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