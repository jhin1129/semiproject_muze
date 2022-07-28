<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/support/support.css">
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">

    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

        <div>
            <h3 style="text-align: left; margin-bottom: 30px;">자주 묻는 질문 - <small><i>"홈페이지 주요 기능 설명 예정"</i></small></h3>
        </div>

        <div style="text-align: center; margin-bottom: 30px;">
            <button type="button" id="subject-faq" class="btn btn-outline-secondary" style="display: inline-block;">배송문의</button>
            <button type="button" id="subject-faq" class="btn btn-outline-secondary" style="display: inline-block;">주문결제</button>
            <button type="button" id="subject-faq" class="btn btn-outline-secondary" style="display: inline-block;">회원관리</button>
            <button type="button" id="subject-faq" class="btn btn-outline-secondary" style="display: inline-block;">기타</button>
        </div>

        
            <table class="table" style="width: 1000px; margin:auto;">
            
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>
                <tr>
                    <td style="width: 5%;"><b>Q.</b></td>
                    <td style="width: 95%;"><p><b>현재 작품활동을 하는 작가입니다. 제 작품을 작품을 판매하고 싶으면 어떻게 해야 하나요?</b></p>
                    <p style="color:darkgray">회원가입 후 게시글을 등록하시면 관리자가 검토 후 등록시켜 드립니다.</p></td>
                </tr>

            </table>

    </div>

<jsp:include page="/views/common/footer.jsp"/>