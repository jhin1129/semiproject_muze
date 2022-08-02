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
                  <span id="mySpan01">회원탈퇴</span> 
                  <hr style="margin-bottom: 10px;">
                </form>
              </div>
            </div>

            <!-- 두번째 행 -->
            <div class="row">
            
              <div class="col-sm-12" style="margin-top: 30px;">
                <form style="margin-bottom: 50px;">
                  <span id="mySpan01">01. 회원 탈퇴 안내</span> 
                  <div style="border: 1px solid lightgray; padding: 20px; margin-top: 10px;">
                    <p style=" color: grey; font-size: 0.85em; ">
                      muzé 탈퇴 안내 <br>
                      <br>
                      회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. <br>
                      불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다. <br>
                      <br>
                      ■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다. <br>
                      1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 <br>
                      고객정보 보호정책에따라 관리 됩니다. <br>
                      2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다 <br>
                    </p>
                  </div>
                </form>
              </div>
            </div>
            
            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12">
                <form >
                  <span id="mySpan01">02. 회원 탈퇴 하기</span> 
                  <!-- 테이블 -->
                  <table class="myinputtable" style="margin-top: 10px;">
                    <thead id="my_thead01" >
                      <tr>
                        <th class="my_th" id="my_th01" >탈퇴사유</th>
                        <td id="my_td03" rowspan="2">
                          <div style="padding-top: 10px;">
                            <label><input type="checkbox" value="sati-service"> 교환 / 환불 / 반품 불만 &nbsp; &nbsp;</label>
                            <label><input type="checkbox" value="sati-price"> 상품가격 불만 &nbsp; &nbsp;</label>
                            <label><input type="checkbox" value="sati-deliv"> 배송 불만</label> <br>
                            <label><input type="checkbox" value="sati-service"> 고객서비스 불만 &nbsp; &nbsp;</label>
                            <label><input type="checkbox" value="sati-visit"> 방문 빈도가 낮음 &nbsp; &nbsp;</label>
                            <label><input type="checkbox" value="sati-privacy"> 개인 정보유출 우려</label>
                          </div>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th class="my_th" id="my_th01">남기실 말씀</th>
                        <td id="my_td03" rowspan="2" >
                          <textarea class="mytextarea"></textarea>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- 테이블 끝 -->
                  <p style="text-align: center; margin-top: 10px; margin-left: 70px;">
                    <button type="button" class="btn btn-outline-secondary" id="btnDelete" value="탈퇴">탈퇴</button>
                  </p>
                </form>
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
			$("#btnDelete").on("click", ()=>{
				if(confirm("확인을 누르면 탈퇴가 완료됩니다.")){
					location.replace("${ path }/mypage/deleteinfo");
				}
			});
		});
	
	</script>
	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>