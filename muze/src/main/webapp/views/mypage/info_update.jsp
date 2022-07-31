<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<!-- header -->
	<jsp:include page="/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<!-- Login CSS -->
	<link rel="stylesheet" href="${path}/resources/css/login/Login.css">	

    <!-- my CSS -->
	<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 
	
	<style>
	.important{
		font-weight : 400;
	
	}
	
	</style>
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
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                <form style="margin-bottom: 3px;">
                  <span id="mySpan01" >회원 정보 수정</span> 
                  <hr style="margin-bottom: 10px;">
                </form>
              </div>
            </div>

            <!-- 두번째 행 -->
            <form id="memberFrm" action="${ path }/mypage/updateinfo" method="post">
            <div class="row">
              <div class="col-sm-12" style="margin-top: 10px;">
                <div style="margin-left: 50px;">
    			  <div class="base_info_box">
                     <div class="col-11" >  
                        <div class="base_info_sec" style=" border-color: lightgrey;" >
                            <table>
                                <colgroup >
                                    <col width="25%">
                                    <col width="75%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><span class="important" >아이디</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" id="memId" name="memId" data-pattern="gdMemberId" value="${ loginMember.memberId }" readonly required>
                                        </div>
                                    </td>
                    			
                                </tr>
                                <tr class="">
                                    <th><span class="important" >비밀번호</span></th>
                                    <td class="member_password">
                                        <div class="member_warning">
                                            <input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder="" required> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
                                        </div>
                                    <div id="newPassword-error" class="text_warning" style="display: block">필수항목 입니다.</div>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th><span class="important">비밀번호 확인</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="password" class="check-id" name="memPwRe" autocomplete="off" required>
                                        </div>
                                    <div id="memPwRe-error" class="text_warning" style="display: block">필수항목 입니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">이름</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" name="memNm" data-pattern="gdEngKor" maxlength="30" value="${ loginMember.memberName }" required>
                                        </div>
                                    <div id="memNm-error" class="text_warning" style="display: block">필수항목 입니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <div class="member_warning">
                                            <input type="text" name="email" id="email" tabindex="-1" value="${ loginMember.memberEmail }" required>
                                            <select id="emailDomain" name="emailDomain" class="chosen_select">
                                                <option value="self">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="icloud.com">icloud.com</option>
                                            </select>
                                        </div>
                                        <div class="member_warning js_email"></div>
                                        <div class="form_element">
                                            <input type="checkbox" id="maillingFl" name="maillingFl" value="y">
                                            <label for="maillingFl" class="check_s ">정보/이벤트 메일 수신에 동의하시면 1,000 포인트가 추가 지급됩니다.</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">휴대폰번호</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="${ loginMember.memberPhonenumber }" required>
                                        </div>
                                        <div class="form_element">
                                            <input type="checkbox" id="smsFl" name="smsFl" value="y">
                                            <label for="smsFl" class="check_s ">정보/이벤트 SMS 수신에 동의하시면 1,000 포인트가 추가 지급됩니다.</label>
                                        </div>
                                        <div id="cellPhone-error" class="text_warning" style="display: block">필수항목 입니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">주소</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="zonecode" value="">
                                            <button type="button" id="btnPostcode" class="btn_post_search" style="background-color: white; border: 1px solid lightgrey; " >우편번호검색</button>
                                            <input type="hidden" name="zipcode" value="">
                                        </div>
                                        <div class="address_input">
                                            <div class="member_warning">
                                                <input type="text" name="address" value="${ loginMember.memberAddress }" required>
                                            </div>
                                            <div class="member_warning js_address_sub">
                                                <input type="text" name="addressSub" value="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>  
                    <div class="btn_center_box">
                        <button type="submit" class="btn_comfirm js_btn_join" 
                        		style="background-color: white; color:black; border: 1px solid lightgrey; font-weight:300; font-size:1em;">정보수정</button>
                        <button type="reset" class="btn_comfirm js_btn_join"
                        		style="background-color: white; color:black; border: 1px solid lightgrey; font-weight:300; font-size:1em;">취소</button>
                        </div>
                      </div>
	                </div>          
	              </div>
                </div>
              </div>
            </form>
          </div>
          <!-- 컨테이너 끝 -->
      </div>
      <!-- 오른쪽 그리드 끝 -->
    </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->

	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>