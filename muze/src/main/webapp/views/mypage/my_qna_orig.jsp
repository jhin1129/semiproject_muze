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
        	<jsp:include page="/views/mypage/welcome_side.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10" ">
          <!-- 컨테이너 -->
          <div class="container">
            <!-- 첫번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                <form style="margin-bottom: 3px;">
                  <span id="mySpan01">1 : 1 문의</span> 
                  <hr style="margin-bottom: 10px;">
                </form>
              </div>
            </div>
            
            <!-- 두번째 행 -->
            
<!--             세번째 행
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                  게시글 조회 테이블
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
                    <tr>
                      <td id="my_td01">2022/07/06 </td>
                      <td id="my_td01">배송</td>
                      <td id="my_td01">배송이 안와요...</td>
                      <td id="my_td01">답변 완료</td>
                    </tr>
                  </tbody>
                </table>

              </div>
            </div>
            세번째 행 끝 -->
            
            
            
<!--             세번째 행 -->
                <!-- 조회 테이블 -->
                <br>
                <table class="ordertable">
                  <thead id="my_thead01">
                    <tr>
                      <th class="my_th" id="my_th05">문의 날짜</th>
                      <th class="my_th" id="my_th05">카테고리</th>
                      <th class="my_th" id="my_th02">제목</th>
                      <th class="my_th" id="my_th05">문의 상태</th>
                    </tr>
                  </thead>
                  <tbody>
					<c:if test="${ empty list }">
                  	 	<tr>
                      		<td id="my_td00" colspan="5">
                       			조회 내역이 없습니다.
                      		</td>
                    	</tr>
                   	</c:if>
                   	<c:if test="${ not empty list }">
                   		<c:forEach var="refundByDate" items="${ list }">
		                    <tr>
		                      <td id="my_td01">${ refundByDate.orderDate } <br>
		                        <a href="${ path }/mypage/orderdetail?no=${ refundByDate.orderNo }" id="my_td02">${ refundByDate.orderNo }</a> <br>
		                      </td> 
		                      <td id="my_td01">${ refundByDate.proName }</td>
		                      <td id="my_td01">${ refundByDate.proPrice }원 / ${ refundByDate.orderAmount }개</td>
		                      <td id="my_td01">${ refundByDate.orderStatus }</td>
		                      <td id="my_td01"></td>
		                    </tr>
	                    </c:forEach>
                    </c:if>
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
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>