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
            <h5>회원 관리</h5>
            <div class="text-right">
              <button type="button" class="button-white">삭제</button>
              <button type="button" class="button-white">저장</button>
            </div>
            <div class="mt-3">
              <table class="table table-sm">
                  <thead class="text-center">
                      <tr style="height: 10px; color:gray">
                          <th style="width: 2%;"><input type="checkbox"></th>
                          <th style="width: 10%;">유저번호</th>
                          <th style="width: 15%;">아이디</th>
                          <th style="width: 8%;">이름</th>
                          <th style="width: 15%;">전화번호</th>
                          <th style="width: 20%;">이메일</th>
                          <th style="width: 12%;">가입일</th>
                          <th style="width: 10%;">계정타입</th>
                          <th style="width: 8%;">탈퇴여부</th>
                      </tr>
                  </thead>
  
                  <tbody class="text-center">
                    <!-- (tr>(td{2022-07-$$}+td{0건}+td{0원}+td*4{0}))*9 -->
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000001</td>
                      <td>아이디1</td>
                      <td>이름1</td>
                      <td>010-0001-0001</td>
                      <td>000001@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000002</td>
                      <td>아이디2</td>
                      <td>이름2</td>
                      <td>010-0002-0002</td>
                      <td>000002@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000003</td>
                      <td>아이디3</td>
                      <td>이름3</td>
                      <td>010-0003-0003</td>
                      <td>000003@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000004</td>
                      <td>아이디4</td>
                      <td>이름4</td>
                      <td>010-0004-0004</td>
                      <td>000004@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000005</td>
                      <td>아이디5</td>
                      <td>이름5</td>
                      <td>010-0005-0005</td>
                      <td>000005@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000006</td>
                      <td>아이디6</td>
                      <td>이름6</td>
                      <td>010-0006-0006</td>
                      <td>000006@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000007</td>
                      <td>아이디7</td>
                      <td>이름7</td>
                      <td>010-0007-0007</td>
                      <td>000007@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000008</td>
                      <td>아이디8</td>
                      <td>이름8</td>
                      <td>010-0008-0008</td>
                      <td>000008@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000009</td>
                      <td>아이디9</td>
                      <td>이름9</td>
                      <td>010-0009-0009</td>
                      <td>000009@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000010</td>
                      <td>아이디10</td>
                      <td>이름10</td>
                      <td>010-0010-0010</td>
                      <td>000010@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000001</td>
                      <td>아이디1</td>
                      <td>이름1</td>
                      <td>010-0001-0001</td>
                      <td>000001@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000002</td>
                      <td>아이디2</td>
                      <td>이름2</td>
                      <td>010-0002-0002</td>
                      <td>000002@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000003</td>
                      <td>아이디3</td>
                      <td>이름3</td>
                      <td>010-0003-0003</td>
                      <td>000003@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000004</td>
                      <td>아이디4</td>
                      <td>이름4</td>
                      <td>010-0004-0004</td>
                      <td>000004@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000005</td>
                      <td>아이디5</td>
                      <td>이름5</td>
                      <td>010-0005-0005</td>
                      <td>000005@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000006</td>
                      <td>아이디6</td>
                      <td>이름6</td>
                      <td>010-0006-0006</td>
                      <td>000006@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000007</td>
                      <td>아이디7</td>
                      <td>이름7</td>
                      <td>010-0007-0007</td>
                      <td>000007@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000008</td>
                      <td>아이디8</td>
                      <td>이름8</td>
                      <td>010-0008-0008</td>
                      <td>000008@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000009</td>
                      <td>아이디9</td>
                      <td>이름9</td>
                      <td>010-0009-0009</td>
                      <td>000009@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
                    </tr>
                    <tr>
                      <th><input type="checkbox" name="user"></th>
                      <td>000010</td>
                      <td>아이디10</td>
                      <td>이름10</td>
                      <td>010-0010-0010</td>
                      <td>000010@naver.com</td>
                      <td>2022-07-22</td>
                      <td>일반회원</td>
                      <td>N</td>
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
      
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
<jsp:include page="/views/common/footer.jsp"/>