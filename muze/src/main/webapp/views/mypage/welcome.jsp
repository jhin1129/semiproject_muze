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
	<script src="${path}/resources/js/mypage/mypage_01.js" ></script>

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

        <!-- 왼쪽 그리드 -->
        <div class="col-sm-2" >
        	<!--사이드 메뉴 -->
        	<jsp:include page="/views/mypage/welcome_side.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10">
        	<!-- 컨테이너 -->
        	<div class="container">
            <!-- 첫번째 행 -->
			<jsp:include page="/views/mypage/welcome_row_common.jsp" flush="false"/>
            <!-- 두번째 행 -->
            <c:if test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_USER' }">
				<jsp:include page="/views/mypage/welcome_status.jsp" flush="false"/>
				<jsp:include page="/views/mypage/welcome_rec.jsp" flush="false"/>
            </c:if>
            <c:if test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_ARTIST' }">
				<jsp:include page="/views/mypage/welcome_row_artist.jsp" flush="false"/>
			</c:if>
          </div>
          <!-- 컨테이너 끝 -->
      </div>
      <!-- 오른쪽 그리드 끝 -->
    </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
    <!-- Bootstrap Js 4.6 -->
    <!-- 부트스트랩 제이쿼리 활성화 시 제이쿼리 데이트피커 동작 안함 -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>