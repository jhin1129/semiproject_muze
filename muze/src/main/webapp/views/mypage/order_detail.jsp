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
              <div class="col-sm-12" style="margin-top: 50px;">
                <form id="myForm01">
                  <span id="mySpan01">주문 / 배송 상세</span> 
                </form>
                <!-- 조회 테이블 -->
                <table class="ordertable">
                  <thead id="my_thead01">
                    <tr>
                      <th class="my_th" id="my_th05">날짜/주문번호</th>
                      <th class="my_th" id="my_th02">상품명/옵션</th>
                      <th class="my_th" id="my_th05">상품금액/수량</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td id="my_td01">${ myOrder.orderDate } <br>
                        <a href="${ path }/mypage/orderdetail" id="my_td02">${ myOrder.orderNo }</a> <br>
                        <button type="button" class="btn btn-outline-secondary" id="mycbtn">주문 취소</button>
                      </td> 
                      <td id="my_td01">${ myOrder.proName }</td>
                      <td id="my_td01">${ myOrder.proPrice } 원 / ${ myOrder.orderAmount } 개 </td>
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
                          ${ orderDetail.orderName }
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">주소</th>
                        <td id="my_td04">
                          ${ orderDetail.orderAddr }
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">연락처</th>
                        <td id="my_td04">
                          ${ orderDetail.orderPhone } 
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">이메일</th>
                        <td id="my_td04">
                          ${ orderDetail.email }
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
                          ${ orderDetail.orderPrice } 원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">배송비</th>
                        <td id="my_td04">
                          ${ orderDetail.delFee } 원 
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">할인혜택</th>
                        <td id="my_td04">
                          마일리지 (-) ${ orderDetail.mileage }원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">총 결제 금액</th>
                        <td id="my_td04">
                          ${ orderDetail.totalPrice } 원
                        </td>
                      </tr>
                      <tr>
                        <th class="my_th" id="my_th06">결제 수단</th>
                        <td id="my_td04" style="padding: 10px;">
                          <b>무통장 입금</b> <br>
                          입금은행 : 우리은행 <br>
                          입금계좌 : 1002-844-568858 <br>
                          예금주명 : (주)무제 <br>
                          입금금액 : ${ orderDetail.totalPrice } 원 <br>
                          입금자명 : ${ orderDetail.orderName } <br>
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
	<script>
		$(document).ready(() => {
			$("#mycbtn").on("click", () => {
				if(confirm("확인을 누르면 주문이 취소됩니다.")) {
					location.replace("${ path }/mypage/cancel");
				}
			});
		});
	</script>

	<!-- footer -->
	<jsp:include page="/views/mypage/myfooter.jsp"/>