<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- header -->
<jsp:include page="/views/common/header.jsp"/>

	<!-- my CSS -->
	<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 
    <!-- 데이트피커 CSS 및 제이쿼리 -->
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage_cal.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${path}/resources/js/Mypage/mypage_02.js" ></script>

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

        <!-- 왼쪽 그리드 -->
        <div class="col-sm-2" >
        	<!--사이드 메뉴 -->
        	<jsp:include page="/views/mypage/side_navi.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" ">
          <!-- 컨테이너 -->
          <div class="container">
            <!-- 첫번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                <form style="margin-bottom: 3px;">
                  <span id="mySpan01">상품문의</span> 
                  <hr style="margin-bottom: 10px;">
                </form>
              </div>
            </div>
            
            <!-- 두번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 30px;">
                <form id="myForm01">
                  <span id="mySpan01"></span> 
                </form>
                <!-- 기간별 검색 -->
                <fieldset class="mySearchDate">
                  <!-- 버튼 -->
                  <div class= "btnsearch" role="group" aria-label="First group">
                    <button type="button" class="btn btn-outline-secondary">오늘</button>
                    <button type="button" class="btn btn-outline-secondary">7일</button>
                    <button type="button" class="btn btn-outline-secondary">15일</button>
                    <button type="button" class="btn btn-outline-secondary">1개월</button>
                    <button type="button" class="btn btn-outline-secondary">3개월</button>
                    <button type="button" class="btn btn-outline-secondary">1년</button>

                    <!-- 날짜 -->
                    <input type="text" class="datepicker" id="datepicker1" >
                    ~
                    <input type="text" class="datepicker" id="datepicker2" >
                    
                    <!-- 조회버튼 -->
                    <button type="button" class="btn btn-outline-secondary">조회</button>
                  </div>
                </fieldset>
                </div>
              </div>
            
            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                <!-- 게시글 조회 테이블 -->
                <table class="qnatable">
                    <thead id="my_thead01">
                      <tr>
                        <th class="my_th" id="my_th05">문의 날짜</th>
                      <th class="my_th" id="my_th05">카테고리</th>
                      <th class="my_th" id="my_th02">제목</th>
                      <th class="my_th" id="my_th05">문의 상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- <tr>
                      <td id="my_td01">2022/07/06 </td>
                      <td id="my_td01"></td>
                      <td id="my_td01"></td>
                      <td id="my_td01"></td>
                    </tr> -->
                    <tr>
                      <td id="my_td00" colspan="5">
                        조회 내역이 없습니다.
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 세번째 행 끝 -->
          </div>
          <!-- 컨테이너 끝 -->
      </div>
      <!-- 오른쪽 그리드 끝 -->
    </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->

    <!-- Java Script -->
    <!-- My JS -->
    <!-- <script src="${path}/resources/js/Mypage_02.js"></script> -->

	<!-- footer -->
	<jsp:include page="/views/mypage/myfooter.jsp"/>