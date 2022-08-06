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
    <!-- 순서와 위치 주의!! -->
    <script src="${path}/resources/js/mypage/mypage_02.js" ></script>
    <script src="${path}/resources/js/mypage/mypage_01.js" ></script>
  
      <!-- 내용 전체 컨테이너 -->
      <div class="container">
        <div class="row">
  
        <!-- 왼쪽 그리드 -->
        <div class="col-sm-2" >
        	<!--사이드 메뉴 -->
        	<jsp:include page="/views/mypage/welcome_side.jsp" flush="false"/>
        </div>
  
        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10">
        	<!-- 컨테이너 -->
        	<div class="container">
          
            <!-- 첫번째 행 -->
			<jsp:include page="/views/mypage/welcome_row_common.jsp" flush="false"/>

           <!-- 두번째 행 -->
			<div class="row">
			 <div class="col-sm-12" style="margin-top: 30px;">
			   <form id="myForm01">
			     <span id="mySpan01">주문목록 / 배송조회</span> 
			   </form>
			   	  <!-- 기간별 검색 -->
			      <fieldset class="mySearchDate">
					  <div class= "btnsearch" role="group" aria-label="First group">
						<jsp:include page="/views/mypage/list_datepick.jsp" flush="false"/>
						<!-- 조회버튼 -->
			       		<button type="submit" class="btn btn-outline-secondary" id="srhbtn7">조회</button>
			          </div>
  				 </fieldset>
			  </div>
            </div>

            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;" >
                <c:if test="${empty list }">
	                <form id="myForm01">
	                  <span id="mySpan01">주문목록 / 배송조회</span> 
	                </form>
                </c:if>
                <c:if test="${ not empty list }">
	                <form id="myForm01">
 	                  <span id="mySpan01">주문목록 / 배송내역</span> 
	                </form>
                </c:if>
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
                       			조회 내역이 존재하지 않습니다.
                      		</td>
                    	</tr>
                   	</c:if>
                   	<c:if test="${ not empty list }">
                   		<c:forEach var="orderByDate" items="${ list }">
		                    <tr>
		                      <td id="my_td01" style ="padding : 5px;">${ orderByDate.orderDate } <br>
	   							<a href="${path}/mypage/orderdetail?no=${ orderByDate.orderNo }" id="my_td02">${ orderByDate.orderNo }</a><br>
		                      </td> 
		                      <td id="my_td01"><a href="${path}/product/view?proNo=${ orderByDate.proNo }">${ orderByDate.proName }</a></td>
		                      <td id="my_td01"> <fmt:formatNumber value="${ orderByDate.proPrice }" pattern="#,###"/> p / ${ orderByDate.orderAmount } 개</td>
		                      <td id="my_td01">${ orderByDate.orderStatus }</td>
		                      <td id="my_td01">
		                        <c:if test="${ orderByDate.orderStatus != '환불' && orderByDate.orderStatus != '구매확정'}">
		                        	<button type="button" class="btn btn-outline-secondary" id="mycbtn" onclick="location.href='${path}/mypage/cancel?no=${ orderByDate.orderNo }' " >주문취소 </button>
		                       	</c:if>
		                      </td>
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
    
    <script>
    $(document).ready(()=>{
    	
		$('#mycbtn').click(function() { 
			if(confirm('주문을 취소하시겠습니까..?')) {
				location.replace('${path}/mypage/cancel');
			}
		});
		
	    $("#srhbtn7").on("click", () => {
			let datepicker1 = $('#datepicker1').val();
			let datepicker2 = $('#datepicker2').val();
			location.href="${path}/mypage/list?type=ORDER"+"&dateFrom="+datepicker1+"&dateTo="+datepicker2;
		});
    }); 
    </script>

	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>