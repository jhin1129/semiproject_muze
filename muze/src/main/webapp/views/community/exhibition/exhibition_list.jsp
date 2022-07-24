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
        <h2 style="text-align: center;">전시회 소식</h2>
    </div>

    <div class="card my-5" style="width: 100%;" onclick="location.href='${ path }/exhibition/view?no=1'">
        <img style="background-color: black; height: 500px;" class="card-img-top">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's
                content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>

    <div class="card my-5" style="width: 100%;" onclick="location.href='${ path }/exhibition/view?no=2'">
        <img style="background-color: black; height: 500px;" class="card-img-top">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's
                content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>

</div>
<jsp:include page="/views/common/footer.jsp"/>
