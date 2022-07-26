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
              <div class="col-sm-12" style="margin-top: 30px;">
                <form id="myForm01">
                  <span id="mySpan01">진행 중인 주문</span> 
                  <span id="mySpan02">최근 30일 내 진행중인 주문정보입니다.</span>

                </form>
                <!-- 주문상태 -->
                <fieldset class="mySearchDate2">
                  <div class="container">
                    <div class="row row-cols-6">
                      <div class="col" id="mying1">입금대기</div>
                      <div class="col" id="mying1">결제완료</div>
                      <div class="col" id="mying1">상품준비중</div>
                      <div class="col" id="mying1">배송중</div>
                      <div class="col" id="mying1">배송완료</div>
                      <div class="col" id="mying1">구매확정</div>
                    </div>
                  </div>
                  <div class="container">
                    <div class="row row-cols-12">
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">1</div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">0</div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">0</div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">0</div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">0</div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying3"></div>
                      <div class="col" id="mying2">0</div>
                      <div class="col" id="mying3"></div>
                    </div>
                  </div>
                </fieldset>
              </div>
            </div>

            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                <form id="myForm01">
                  <span id="mySpan01">최근 주문 정보</span> 
                  <span id="mySpan02">최근 30일 내 주문하신 내역입니다.</span>
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
                      <td id="my_td01">고객요청취소</td>
                      <td id="my_td01"></td>
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

    <!-- Bootstrap Js 4.6 -->
    <!-- 부트스트랩 제이쿼리 활성화 시 제이쿼리 데이트피커 동작 안함 -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<!-- footer -->
	<jsp:include page="/views/mypage/myfooter.jsp"/>