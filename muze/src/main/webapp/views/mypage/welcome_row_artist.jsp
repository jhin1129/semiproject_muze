<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

            <!-- 두번째 행 -->
			<form name="statusc" action="${ path }/mypage/artist_status" method="get">
			<div class="row">
			 <div class="col-sm-12" style="margin-top: 30px;">
			     <span id="mySpan01">주문 / 배송 관리</span> 
			     <span id="mySpan02">선택하신 거래의 상태를 변경할 수 있습니다.</span>
			   	  <!-- 기간별 검색 -->
			      <fieldset class="mySearchDate">
					  <div class= "btnsearch" role="group" aria-label="First group">
						   <!-- 버튼 -->
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="결제완료"> &emsp;
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="상품준비중"> &emsp;
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="배송중"> &emsp;
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="배송완료"> &emsp;
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="취소"> &emsp;
					       <input type="submit" class="btn btn-outline-secondary" name="status" value="환불"> &emsp;
			          </div>
  				 </fieldset>
			  </div>
            </div>

			<!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                  <span id="mySpan01">주문 / 배송 내역</span> 
                  <span id="mySpan02">최근 30일 내 판매하신 내역입니다.</span>
                <!-- 조회 테이블 -->
                <table class="ordertable" style="margin-bottom:30px;">
                  <thead id="my_thead01">
                    <tr>
                      <th class="my_th" id="my_th05">선택</th>
                      <th class="my_th" id="my_th05">날짜/주문번호</th>
                      <th class="my_th" id="my_th02">상품명/옵션</th>
                      <th class="my_th" id="my_th03">상품금액/수량</th>
                      <th class="my_th" id="my_th04">주문상태</th>
                    </tr>
                  </thead>
                  <tbody>
                   	<c:if test="${ empty list }">
                  	 	<tr>
                      		<td id="my_td00" colspan="5">
                       			최근 판매한 내역이 존재하지 않습니다.
                      		</td>
                    	</tr>
                   	</c:if> 
                    	<c:if test="${ not empty list }"> 
                   		<c:forEach var="getOrderRec" items="${ list }"> 
		                    <tr>
		                      <td id="my_td01">
					      		<c:if test="${ getOrderRec.orderStatus != '환불' }">
		                      		<input type="checkbox" name="orderNo" value="${ getOrderRec.orderNo }">
								</c:if>
		                      </td>
		                      <td id="my_td01"> ${ getOrderRec.orderDate } <br>
		                        <a href="${ path }/mypage/orderdetail?no=${ getOrderRec.orderNo }" id="my_td02">${ getOrderRec.orderNo }</a> <br>
		                      </td> 
			                      <td id="my_td01"><a href="${path}/product/view?proNo=${ getOrderRec.proNo }">${ getOrderRec.proName }</td>
			                      <td id="my_td01">
		                     		 <fmt:formatNumber value="${ getOrderRec.proPrice }" pattern="#,###"/> p / ${ getOrderRec.orderAmount } 개</td>
			                      <td id="my_td01">${ getOrderRec.orderStatus }</td>
		                    </tr>
 	                    </c:forEach>
                      </c:if> 
                    </tbody>
                  </table>
                </div>
              </div>
            </form>