<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row" style="text-align: center">
		<div class="col"></div>
			<div class="col-6 ">
				<div class="member_cont" >
					<div class="member_join_box ">
						<div class="member_join_shop ">
                 			<a href="#" id="btnJoin" class="shop_mall_join"><span>쇼핑몰 회원가입</span></a>
                		</div>
                <!-- 두 번째 행 -->
                <div class="row">
                	<div class="member_sns_join"  >
	                    <a
	                      href="#"
	                      class="btn_kakao_join js_btn_kakao_join"
	                      data-kakao-type="join_method"
	                      data-return-url="#">
	                      <img src="${path}/resources/images/login/kakao.png"  class="img-fluid" alt="카카오 아이디 회원가입"/>
	                    </a>
	                    <a
	                      href="#"
	                      class="btn_naver_join js_btn_naver_join"
	                      data-naver-type="join_method"
	                      data-naver-url="#">
	                      <img src="${path}/resources/images/login/naver.png" class="img-fluid" alt="네이버 아이디 로그인"/>
	                    </a>
                  	</div>
                </div>
                <!-- 세 번째 행 -->
                	<div class="row m-auto">
                  		<strong class="chk_none">
	                    SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다. <br />
	                    이 과정에서 고객님의 데이터는 철저하게 보호됩니다.
	                  	</strong>
                	</div>
              </div>
              <!-- //member_cont -->
		</div>
	        <div class="member_guide_txt">
	        	<p>이미 쇼핑몰 회원이세요? <a href="#" id="btnLoginMember">로그인</a></p>
	        </div>
        </div>
        	<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<jsp:include page="/views/common/footer.jsp"/>