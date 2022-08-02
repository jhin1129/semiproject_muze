<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <!-- 내용 전체 컨테이너 -->
  <div class="container">
    <div class="row">

      <!-- 왼쪽 그리드 -->
      <div class="col-sm-2">
        <!-- 사이드 메뉴바 -->
        <div class="mySideMenu">
          <h5 style="font-weight: 600;">관리자 페이지</h5>
          <hr>
          <p id="myListMain"><a href="${ path }/admin/main"> 대시보드 </a></p>
          <li id="mylist"><a id="sublist" href="${ path }/admin/main">- 방문자 현황 </a></li>
          <li id="mylist"><a id="sublist" href="${ path }/admin/main">- 일자별 요약 </a></li><br>
          <p id="myListMain"><a href="${ path }/admin/member"> 회원 관리 </a></p><br>
          <p id="myListMain"><a href="${ path }/admin/content"> 콘텐츠 관리 </a></p>
          <li id="mylist"><a id="sublist" href="${ path }/admin/content">- 게시글 관리 </a></li>
          <li id="mylist"><a id="sublist" href="${ path }/admin/content">- 댓글 관리 </a></li><br>
          <p id="myListMain"><a href="${ path }/admin/qna?type=QNA"> 1 : 1 문의 </a></p><br>
          <p id="myListMain"><a href="${ path }/support/list?type=NOTICE"> 공지사항 </a></p>
        </div>
      </div>