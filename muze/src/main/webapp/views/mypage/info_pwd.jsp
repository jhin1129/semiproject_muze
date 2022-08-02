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
                  <span id="mySpan01">회원 인증</span> 
                  <hr style="margin-bottom: 100px;">
                </form>
              </div>
            </div>

            <!-- 두번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 30px;">
                <form style="margin-bottom: 50px;">
                  <span id="span01" style="font-size: 0.85em;"><center>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 입력 해주세요.</center></span> 
                </form>
              </div>
            </div>
            
            <!-- 세번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 50px;">
                <center>
                 <c:if test="${ type == 'DELETE' }">
                	<form name="checkpwdfrm" action="${ path }/mypage/checkinfo" method="post">
                  		<input type="password" style="border: 1px solid lightgrey; border-radius: 0%; height: 34px;" name= "userpwd" id="userpwd">
                  		<input type="hidden" name= "type" value="DELETE">
                  		<button type="submit" class="btn btn-outline-secondary" id="srhbtn7">확인</button>
	                </form>
                 </c:if>
                 <c:if test="${ type == 'UPDATE' }">
                	<form name="checkpwdfrm" action="${ path }/mypage/checkinfo" method="post">
                  		<input type="password" style="border: 1px solid lightgrey; border-radius: 0%; height: 34px;" name= "userpwd" id="userpwd">
                  		<input type="hidden" name= "type" value="UPDATE">
                  		<button type="submit" class="btn btn-outline-secondary" id="srhbtn7">확인</button>
	                </form>
                 </c:if>
                </center>
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

	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>