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
            <h3 style="text-align: left;">공지사항</h3>
        </div>

        <div class="mt-5">
            <table class="table table-hover" style="font-size: 1em;">
                <thead>
                    <tr>
                        <th class="py-0.5" style="width: 10%;">번호</th>
                        <th class="py-0.5" style="width: 50%;">제목</th>
                        <th class="py-0.5" style="width: 15%;">작성자</th>
                        <th class="py-0.5" style="width: 15%;">날짜</th>
                        <th class="py-0.5" style="width: 10%;">조회수</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>상품평 운영정책 개정 관련 사전 안내</td>
                        <td>관리자</td>
                        <td>2022-07-17</td>
                        <td>88</td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>제목2</td>
                        <td>작성자2</td>
                        <td>날짜2</td>
                        <td>조회수2</td>
                    </tr>

                    <tr>
                        <td>3</td>
                        <td>제목3</td>
                        <td>작성자3</td>
                        <td>날짜3</td>
                        <td>조회수3</td>
                    </tr>

                    <tr>
                        <td>4</td>
                        <td>제목4</td>
                        <td>작성자4</td>
                        <td>날짜4</td>
                        <td>조회수4</td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td>제목5</td>
                        <td>작성자5</td>
                        <td>날짜5</td>
                        <td>조회수5</td>
                    </tr>

                    <tr>
                        <td>6</td>
                        <td>제목6</td>
                        <td>작성자6</td>
                        <td>날짜6</td>
                        <td>조회수6</td>
                    </tr>

                    <tr>
                        <td>7</td>
                        <td>제목7</td>
                        <td>작성자7</td>
                        <td>날짜7</td>
                        <td>조회수7</td>
                    </tr>

                    <tr>
                        <td>8</td>
                        <td>제목8</td>
                        <td>작성자8</td>
                        <td>날짜8</td>
                        <td>조회수8</td>
                    </tr>

                    <tr>
                        <td>9</td>
                        <td>제목9</td>
                        <td>작성자9</td>
                        <td>날짜9</td>
                        <td>조회수9</td>
                    </tr>

                    <tr>
                        <td>10</td>
                        <td>제목10</td>
                        <td>작성자10</td>
                        <td>날짜10</td>
                        <td>조회수10</td>
                    </tr>
                </tbody>

            </table>
        </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#"><<</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">>></a></li>
                </ul>
            </div>

            <div class="col-4 text-right">
                <button class="btn btn-light text-nowrap">글 쓰기</button>
            </div>
        </div>

    </div>

<jsp:include page="/views/common/footer.jsp"/>