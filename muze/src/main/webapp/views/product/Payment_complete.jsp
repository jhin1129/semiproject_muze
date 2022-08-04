<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>


    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-3">
                <h2 class="basket">주문서작성/결제</h2>
            </div>
            <div class="col-md-6 mt-3">
                <div id="page">
                    <p>
                        <strong>01 장바구니</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>02 주문서작성/결제</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>03 주문완료</strong>
                    </p>
                </div>
        </div>
        </div>
        <hr class="mt-4">

        <!-- order_tit -->

        <input type="hidden" value="${ list }" name="list">

                    <div class="row">
                        <div class="col-sm">
                            <div class="product_list">
                                <div class="product_no_data" style="line-height:250px;text-align:center !important;">
                                    <strong style="line-height: 300px;">구매가 완료 되었습니다.</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    
<jsp:include page="/views/common/footer.jsp"/>