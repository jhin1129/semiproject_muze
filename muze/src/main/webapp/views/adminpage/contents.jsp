<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">
    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

      <!-- 왼쪽 그리드 -->
      <div class="col-sm-2">
        <!-- 사이드 메뉴바 -->
        <div class="mySideMenu">
          <h5 style="font-weight: 600;">마이 페이지</h5>
          <hr>
          <p id="myListMain"> 대시보드 </p>
          <li id="mylist"><a id="sublist">- 방문자 현황</a></li>
          <li id="mylist"><a id="sublist">- 일자별 요약</a></li>
          <p id="myListMain"> 회원 관리 </p>
          <p id="myListMain"> 콘텐츠 관리 </p>
          <li id="mylist"><a id="sublist">- 게시글 관리</a></li>
          <li id="mylist"><a id="sublist">- 댓글 관리</a></li>
          <p id="myListMain"> 문의/신고 관리</p>
          <p id="myListMain"> 공지사항</p>
        </div>
      </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" style="border: 1px solid lightgray;">
          <!-- 컨테이너 -->
          <div class="summary">
            <h5>콘텐츠 관리 > 게시글 관리</h5>
            <div class="text-right">
              <button type="button" class="button-white" style="margin: 0;">삭제</button>
              <button type="button" class="button-white">저장</button>
            </div>
            <div class="mt-3">
              <table class="table table-sm">
                  <thead class="text-center">
                      <tr style="height: 10px; color:gray">
                          <th style="width: 2%;"><input type="checkbox"></th>
                          <th style="width: 40%;">제목</th>
                          <th style="width: 18%;">작성자</th>
                          <th style="width: 15%;">카테고리</th>
                          <th style="width: 15%;">작성일</th>
                          <th style="width: 10%;">조회수</th>
                      </tr>
                  </thead>
  
                  <tbody class="text-center">
                    <!-- (tr>(td>input[type=checkbox])+td{제목$}+td{작성자$}+td{자유게시판}+td{2022-07-22}+td{99})*20 -->
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회1</td>
                      <td>작성자1</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회2</td>
                      <td>작성자2</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회3</td>
                      <td>작성자3</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회4</td>
                      <td>작성자4</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회5</td>
                      <td>작성자5</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회6</td>
                      <td>작성자6</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회7</td>
                      <td>작성자7</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회8</td>
                      <td>작성자8</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회9</td>
                      <td>작성자9</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회10</td>
                      <td>작성자10</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회11</td>
                      <td>작성자11</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회12</td>
                      <td>작성자12</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회13</td>
                      <td>작성자13</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회14</td>
                      <td>작성자14</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회15</td>
                      <td>작성자15</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회16</td>
                      <td>작성자16</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회17</td>
                      <td>작성자17</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회18</td>
                      <td>작성자18</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회19</td>
                      <td>작성자19</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox"></td>
                      <td>콘텐츠 관리를 위한 모든 게시글 조회20</td>
                      <td>작성자20</td>
                      <td>자유게시판</td>
                      <td>2022-07-22</td>
                      <td>99</td>
                    </tr>

                  </tbody>
  
              </table>
          </div>
          </div>
          <div class="row" style="margin-bottom: 25px;">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
                </ul>
            </div>
        </div>
        </div>
      
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
<jsp:include page="/views/common/footer.jsp"/>