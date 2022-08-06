<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                <form id="myForm01">
                  <span id="mySpan01">최근 주문 정보</span> 
                  <span id="mySpan02">최근 30일 내 주문하신 내역입니다.</span>
                </form>
                <!-- 조회 테이블 -->
                <table class="ordertable" style="margin-bottom:30px;">
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
                  	<c:if test="${ empty list }">
                  	 	<tr>
                      		<td id="my_td00" colspan="5">
                       			최근 주문한 내역이 존재하지 않습니다.
                      		</td>
                    	</tr>
                   	</c:if>
                   	<c:if test="${ not empty list }">
                   		<c:forEach var="getOrderRec" items="${ list }">
		                    <tr>
		                      <td id="my_td01" style = "padding: 3px;">${ getOrderRec.orderDate } <br>
		                        <a href="${ path }/mypage/orderdetail?no=${ getOrderRec.orderNo }" id="my_td02">${ getOrderRec.orderNo }</a><br>
		                      </td> 
		                      <td id="my_td01"><a href="${path}/product/view?proNo=${ getOrderRec.proNo }">${ getOrderRec.proName }</td>
		                      <td id="my_td01"><fmt:formatNumber value="${ getOrderRec.proPrice }" pattern="#,###"/> p / ${ getOrderRec.orderAmount } 개</td>
		                      <td id="my_td01">${ getOrderRec.orderStatus }</td>
		                      <td id="my_td01">
		                      	  <c:if test="${ getOrderRec.orderStatus != '환불' && getOrderRec.orderStatus != '구매확정' && getOrderRec.orderStatus != '취소'}">
		                        	<button type="button" class="btn btn-outline-secondary" id="mycbtn" onclick="location.href='${path}/mypage/cancel?no=${ getOrderRec.orderNo }' " >주문취소 </button>
		                       	  </c:if>
		                      </td>
		                    </tr>
	                    </c:forEach>
                    </c:if>
                  </tbody>
                </table>
              </div>
            </div>