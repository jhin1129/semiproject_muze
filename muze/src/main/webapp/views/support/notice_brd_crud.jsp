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
            <h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;"  >공지사항</h3>
        </div>

        <div class="mt-ss5">

            <table class="table-support" style="border: 1px; width: 1000px; height: 600px; margin:auto;">
            
                <tr>
                    <td style="height: 8%;"><b>작성자</b></td>
                    <td>관리자</td>
                </tr>                
                <tr>
                    <td style="height: 8%;"><b>제목</b></td>
                    <td><input type="text" size="40" style="padding-left: 1em;"></td>
                </tr>                
                <tr>
                    <td style="height: 68%;"><b>본문</b></td>
                    <td>
                        <textarea name="" id="" cols="90%" rows="15" style="padding: 1em; resize: none;"></textarea>
                    </td>
                </tr>                
                <tr>
                    <td style="width: 8%;"><b>첨부파일</b></td>
                    <td>
                        <input type="text" id="filename" size="20" style="border: 1px solid lightgray;">
                        <input type="file" id="file">
                    </td>
                </tr>

            </table>
            <p style="text-align: center; margin-top: 30px; margin-left: 70px;">
                <button type="button" class="button-white"><b>이전</b></button>
                <button type="button" class="button-black"><b>저장</b></button>
            </p>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp"/>