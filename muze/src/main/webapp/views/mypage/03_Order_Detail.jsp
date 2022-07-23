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
        <div class="col-sm-10">
        	<!-- 컨테이너 -->
        	<div class="container">
          
            <!-- 첫번째 행 -->
			<jsp:include page="/views/mypage/welcome_row.jsp" flush="false"/>

            <!-- 두번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                <form id="myForm01">
                  <span id="mySpan01">주문 / 배송 상세</span> 
                </form>
                <!-- 조회 테이블 -->
                <table class="ordertable">
                  <thead id="my_thead01">
                    <tr>
                      <th class="my_th" id="my_th01">날짜/주문번호</th>
                      <th class="my_th" id="my_th02">상품명/옵션</th>
                      <th class="my_th" id="my_th03">상품금액/수량</th>
                      <th class="my_th" id="my_th04">주문상태</th>
                      <th class="my_th" id="my_th05">확인</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td id="my_td01">2022/07/06 <br>
                        <a href="../mypage/order_list.php" id="my_td02">2207069324820</a> <br>
                        <button type="button" class="btn btn-outline-secondary" id="mycbtn">주문 취소</button>
                      </td> 
                      <td id="my_td01">상품 01</td>
                      <td id="my_td01">42,000원 / 1개</td>
                      <td id="my_td01">결제완료</td>
                      <td id="my_td01"></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 30px;">
                <!-- 테이블 1 -->
                <form id="myForm01">
                  <span id="mySpan01">주문자 정보</span> 
                </form>
                  <table class="mydetailtable" style="margin-top: 5px;">
                      <tr>
                        <th class="my_th" id="my_th06">이름</th>
                        <td id="my_td04">
                          홍길동
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">주소</th>
                        <td id="my_td04">
                          서울시 용산구 이태원로 334 - 37
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">연락처</th>
                        <td id="my_td04">
                          010 - 1234 - 5678 
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">이메일</th>
                        <td id="my_td04">
                          abc1234@gmail.com
                        </td>
                      </tr>
                  </table>
                </div>
                <!-- 테이블1 끝 -->
                <!-- 테이블 2 -->
                <div class="col-sm-12" style="margin-top: 30px; margin-bottom: 50px">
                <form id="myForm01">
                  <span id="mySpan01">결제 정보</span> 
                </form>
                  <table class="mydetailtable" style="margin-top: 5px;">
                      <tr>
                        <th class="my_th" id="my_th06" >상품 합계 금액</th>
                        <td id="my_td04">
                          29,000 원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">배송비</th>
                        <td id="my_td04">
                          2,500 원 
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">할인혜택</th>
                        <td id="my_td04">
                          마일리지 (-) 1000원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">총 결제 금액</th>
                        <td id="my_td04">
                          30,500 원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">결제 수단</th>
                        <td id="my_td04" style="padding: 10px;">
                          <b>무통장 입금</b> <br>
                          입금은행 : 우리은행 <br>
                          입금계좌 : 1002-844-568858 <br>
                          예금주명 : (주)무제 <br>
                          입금금액 : 31,500원 <br>
                          입금자명 : 홍길동 <br>
                        </td>
                      </tr>
                  </table>
                </div>
                <!-- 테이블2 끝 -->

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