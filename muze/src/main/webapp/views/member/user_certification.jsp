<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row">
        <div class="col"></div>
            <div class="col-6 ">
                <div class="content_box">
                    <form name="formFind" id="formFind" action="${ path}/member/user_certification"  method="post">
                        <div class="member_wrap">
                            <div class="member_tit">
                                <h2>비밀번호 찾기</h2>
                            </div>
						</div>
						<div class="member_cont">
							<div class="user_certify_box">
									<div class="user_certify_tit">
										<h3>인증수단 선택</h3>
                                            <p>본인인증 방법을 선택해 주세요. </p>
                                            
                                    </div>
                                    <!-- //user_certify_tit -->
									<div class="login_input">
										<div class="form_element">
											<ul class="user_certify_list">
												<li>
													<input type="radio" id="authEmail" name="authTypeEmail" value="${ member.memberEmail }" checked>
                                                    <label class="choice" for="authEmail">이메일 인증</label>
	                                                    <strong>
	                                                    <c:set var="name"       value="${member.memberEmail}" />
	                                                    <c:set var="totalLength" value="${fn:length(name) }" />
	                                                    <c:set var="first"      value="${fn:substring(name, 0, 4) }" />
	                                                    <c:set var="last"      value="${fn:substring(name, 8, totalLength) }" />
	                                                    <td><c:if test="${!empty  name}"><c:out value="(${first}*${last})"/></c:if></td>
	                                                    </strong>
                                                    <span>가입시 등록한 이메일로 인증번호가 발송됩니다.</span>
                                                </li>
                                                <li>
                                                    <input type="radio" id="authSms" name="authTypeSms" value="${ member.memberPhonenumber }" class="radio">
                                                    <label class="choice" for="authSms">SMS 인증</label>
	                                                    <strong>
	                                                    <c:set var="name"       value="${member.memberPhonenumber}" />
	                                                    <c:set var="totalLength" value="${fn:length(name) }" />
	                                                    <c:set var="first"      value="${fn:substring(name, 0, 4) }" />
	                                                    <c:set var="last"      value="${fn:substring(name, 8, totalLength) }" />
	                                                    <td><c:if test="${!empty  name}"><c:out value="(${first}****${last})"/></c:if></td>

	                                                    </strong>
                                                </li>
											<!-- <p id="errorMessage" class="dn"></p>  -->
											</ul>
										</div>
									</div>
									
								<div class="btn_member_sec">                      
									<button type="submit">다음</button>
	                            </div> 
								<!-- //btn_member_sec -->
							</div>
						</div>
						<!-- //user_certify_list -->
					</form>
				</div>
				<!-- //user_certify_box -->  
			</div>
			<!-- //member_wrap -->
		<div class="col"></div>
	</div> 
</div>           
<!-- //본문 끝 contents -->

<jsp:include page="/views/common/footer.jsp"/>