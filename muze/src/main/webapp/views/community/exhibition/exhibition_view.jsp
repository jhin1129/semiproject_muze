<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
   
<!-- 내용 전체 컨테이너 -->
<div class="container mt-5">

    <div>
        <h2 style="text-align: center;">전시회 소식 ${no}</h2>
    </div>
    <!-- 글 전체 -->
    <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">

        <!-- 이미지 -->
        <div>
            <img style="background: black; width: 100%; height: 500px;">
        </div>
        <!-- 내용 -->
        <div class="my-3 px-3">
            <p>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
                전시회 설명~~~~~~~~~~<br>
            </p>

        </div>

    </div>
    <!-- 목록버튼 -->
    <div class="text-center mt-3 mb-5">
        <button class="btn btn-light text-nowrap">목록</button>
    </div>
</div>
    
<jsp:include page="/views/common/footer.jsp"/>
