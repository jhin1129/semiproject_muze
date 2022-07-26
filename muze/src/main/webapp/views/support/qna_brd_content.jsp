<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>

    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

        <div>
            <h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;">1 : 1 문의</h3>
        </div>

        <div class="notice-content" style="height: 100%;">

            <table class="table" style="border: 1px; width: 1000px; height: 100%; margin: auto; font-size: 1em;">
            
                <tr>
                    <td style="width: 15%; height: 8%;"><b>제목</b></td>
                    <td colspan="3">${ board.brdTitle }</td>
                </tr>
                <tr>
                    <td style="height: 8%;"><b>작성자</b></td>
                    <td colspan="3">${ board.brdWriterId }</td>
                </tr>                
                <tr>
                    <td style="height: 8%;"><b>작성일</b></td>
                    <td style="width: 35%;">${ board.brdDate }</td>
                    <td style="width: 15%;"><b>조회수</b></td>
                    <td>${ board.brdReadCount }</td>
                </tr>                
                <tr>
                    <td colspan="4" style="height: 76%;">
                       <p style="padding-top: 30px;">
                            ${ board.brdContent }
                        </p>
                    </td>
                </tr>
            </table>
            <p style="text-align: center; margin-top: 10px;">
                <button type="button" class="button-white" style="margin: 0;"
                onclick="location.href='${ path }/board2/list'"><b>목록</b></button>
            </p>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp"/>