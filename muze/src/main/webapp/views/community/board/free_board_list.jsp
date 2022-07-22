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
            <h2 style="text-align: center;">자유 게시판</h2>
        </div>

        <div class="mt-5">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th id="th" style="width: 10%;">번호</th>
                        <th id="th" style="width: 50%;">제목</th>
                        <th id="th" style="width: 15%;">작성자</th>
                        <th id="th" style="width: 15%;">날짜</th>
                        <th id="th" style="width: 10%;">조회수</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td id="td">1</td>
                        <td id="td">제목1</td>
                        <td id="td">작성자1</td>
                        <td id="td">날짜1</td>
                        <td id="td">조회수1</td>
                    </tr>

                    <tr>
                        <td id="td">2</td>
                        <td id="td">제목2</td>
                        <td id="td">작성자2</td>
                        <td id="td">날짜2</td>
                        <td id="td">조회수2</td>
                    </tr>

                    <tr>
                        <td id="td">3</td>
                        <td id="td">제목3</td>
                        <td id="td">작성자3</td>
                        <td id="td">날짜3</td>
                        <td id="td">조회수3</td>
                    </tr>

                    <tr>
                        <td id="td">4</td>
                        <td id="td">제목4</td>
                        <td id="td">작성자4</td>
                        <td id="td">날짜4</td>
                        <td id="td">조회수4</td>
                    </tr>

                    <tr>
                        <td id="td">5</td>
                        <td id="td">제목5</td>
                        <td id="td">작성자5</td>
                        <td id="td">날짜5</td>
                        <td id="td">조회수5</td>
                    </tr>

                    <tr>
                        <td id="td">6</td>
                        <td id="td">제목6</td>
                        <td id="td">작성자6</td>
                        <td id="td">날짜6</td>
                        <td id="td">조회수6</td>
                    </tr>

                    <tr>
                        <td id="td">7</td>
                        <td id="td">제목7</td>
                        <td id="td">작성자7</td>
                        <td id="td">날짜7</td>
                        <td id="td">조회수7</td>
                    </tr>

                    <tr>
                        <td id="td">8</td>
                        <td id="td">제목8</td>
                        <td id="td">작성자8</td>
                        <td id="td">날짜8</td>
                        <td id="td">조회수8</td>
                    </tr>

                    <tr>
                        <td id="td">9</td>
                        <td id="td">제목9</td>
                        <td id="td">작성자9</td>
                        <td id="td">날짜9</td>
                        <td id="td">조회수9</td>
                    </tr>

                    <tr>
                        <td id="td">10</td>
                        <td id="td">제목10</td>
                        <td id="td">작성자10</td>
                        <td id="td">날짜10</td>
                        <td id="td">조회수10</td>
                    </tr>
                </tbody>

            </table>
        </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>

            <div class="col-4 text-right">
                <button class="btn btn-light text-nowrap">글 쓰기</button>
            </div>
        </div>


        <div class="search row mb-5">
            <div class="col-xs-2 col-sm-2">
                <select name="searchType" class="form-control">
                    <option value="title" selected>제목</option>
                    <option value="title">작성자</option>
                    <option value="title">내용</option>
                    <option value="title">제목+내용</option>
                </select>
            </div>

            <div class="col-xs-10 col-sm-10">
                <div class="input-group">
                    <input type="text" name="searchInput" id="searchInput" class="form-control">
                    <span class="input-group-btn">
                        <button id="searchBtn" class="btn btn-light text-nowrap">검색</button>
                    </span>
                </div>

            </div>

        </div>
    </div>

</div>
<jsp:include page="/views/common/footer.jsp"/>
