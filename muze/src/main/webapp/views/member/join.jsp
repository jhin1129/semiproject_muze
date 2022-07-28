<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/views/common/header.jsp"/>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
    <div class="row m-auto">
        <div class="col-12">
            <div class="location_wrap hidden">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a>" > 회원가입 > 정보입력"</em>
                </div>
            </div>
            <!-- //location_wrap -->
        <div class="content_box">
            <div class="join_base_wrap">
                <div class="member_tit">
                    <h2>회원가입</h2>
                    <ol>
                        <li><span>01</span> 약관동의<span><img src="${path}/resources/images/login/icon_join_step_off.png" alt=""></span></li>
                        <li class="page_on"><span>02</span> 정보입력<span><img src="${path}/resources/images/login/icon_join_step_on.png" alt=""></span></li>
                        <li><span>03</span> 가입완료</li>
                    </ol>
                </div>    
                <div class="member_cont">
                    <div class="join_type_box">
                        <h3>회원종류</h3>
                            <div class="type_select_sec">
                                <div class="form_element">
                                    <ul>
                                        <li>
                                            <input type="radio" id="memberFlDefault" name="memberFl" class="ignore" value="personal" checked="">
                                            <label for="memberFlDefault" class="choice_s">개인회원</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="memberFlartist" name="memberFl" class="ignore" value="artist">
                                            <label for="memberFlartist" class="choice_s">아티스트 회원</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- //type_select_sec -->
                    </div>
                </div> 
            </div>
        </div>    
    </div>

    <div class="base_info_box">
        <div class="row">
            <div class="col"></div>
                <div class="col-8">  
                <form id="formJoin" name="formJoin" action="${ path }/member/join" method="post" novalidate="novalidate">
                        <input type="hidden" name="rncheck" value="none">
                        <input type="hidden" name="dupeinfo" value="">
                        <input type="hidden" name="pakey" value="">
                        <input type="hidden" name="foreigner" value="">
                        <input type="hidden" name="adultFl" value="">
                        <input type="hidden" name="mode" value="join">
                    <h3>기본정보</h3>
                    <div class="important" id="base_info_p">표시는 반드시 입력하셔야 하는 항목입니다.</div>
                        <div class="base_info_sec">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <colgroup>
                                    <col width="25%">
                                    <col width="75%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><span class="important">아이디</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" id="newMemId" name="memId" data-pattern="gdMemberId">
                                            <input type="button" id="checkDuplicate" name="checkDuplicate" class="checkDuplicate" value="중복검사" >
                                        </div>
                                    </td>
                    
                                </tr>
                                <tr class="">
                                    <th><span class="important">비밀번호</span></th>
                                    <td class="member_password">
                                        <div class="member_warning">
                                            <input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder=""> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
                                        </div>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th><span class="important">비밀번호 확인</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="password" class="check-id" name="memPwRe" autocomplete="off">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="member_name">
                                    <th><span class="important">이름</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" name="memNm" data-pattern="gdEngKor" value="" maxlength="30">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <div class="member_warning">
                                            <input type="text" name="email" id="email" value="" tabindex="-1">
                                            <select id="emailDomain" name="emailDomain" class="chosen_select">
                                                <option value="self" selected="selected">직접입력</option>
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
                                        <div class="address_phone">
                                            <input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="">
                                        </div>
                                        <div class="form_element">
                                            <input type="checkbox" id="smsFl" name="smsFl" value="y">
                                            <label for="smsFl" class="check_s ">정보/이벤트 SMS 수신에 동의하시면 1,000 포인트가 추가 지급됩니다.</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">주소</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="zonecode" readonly="readonly" value="">
                                            <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                            <input type="hidden" name="zipcode" value="">
                                        </div>
                                        <div class="address_input">
                                            <div class="member_warning">
                                                <input type="text" name="address" readonly="readonly" value="">
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
                    <div class="artist_info_box">
                        <h3>아티스트 정보</h3>
                        <div class="artist_info_sec">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <colgroup>
                                    <col width="25%">
                                    <col width="75%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><span class="important">이미지</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="file" name="image"  data-pattern="gdMemberNmGlobal" class="ignore">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">소개글</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <textarea rows="5" name="introduction" data-pattern="gdMemberNmGlobal" id="introduction" class="ignore"></textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>상호</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" name="company" value="" maxlength="50" data-pattern="gdMemberNmGlobal" class="ignore">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>사업자번호</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" name="artistNo" id="artistNo" data-pattern="gdNum" maxlength="10" placeholder="- -없이 입력하세요." value="" data-overlap-businofl="y" data-charlen="10" data-oldbusino="" class="ignore">
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>    
                    </div>
<!--                <div class="addition_info_box">
                      <h3>부가 정보</h3>
                      <div class="addition_info_sec">
                          <table border="0" cellpadding="0" cellspacing="0">
                              <colgroup>
                                  <col width="25%">
                                  <col width="75%">
                              </colgroup>
                              <tbody>
                              <tr>
                                  <th><span>성별</span></th>
                                  <td>
                                      <div class="member_warning">
                                          <div class="form_element">
                                              <ul>
                                                  <li>
                                                      <input type="radio" id="sexFlMan" name="sexFl" class="ignore" value="m">
                                                      <label for="sexFlMan" class="choice_s ">남자</label>
                                                  </li>
                                                  <li>
                                                      <input type="radio" id="sexFlWoman" name="sexFl" class="ignore" value="w">
                                                      <label for="sexFlWoman" class="choice_s ">여자</label>
                                                  </li>
                                              </ul>
                                          </div>
                                      </div>
                                  </td>
                              </tr>
                              <tr>
                                  <th><span>생일</span></th>
                                  <td class="member_birthday">
                                      <div class="member_warning">
                                      </div>
                                      <div class="member_warning">
                                          <input type="text" id="birthDt" name="birthDt" class="anniversary js_datepicker" value="" placeholder="예시) 19991224">
                                      </div>
                                  </td>
                              </tr>
                              </tbody>
                          </table>
                      </div>
                  </div>
                  -->
                    <div class="btn_center_box">
                        <button type="button" id="btnCancel" class="btn_member_cancel">취소</button>
                        <button type="button" id="btnComfirm" class="btn_comfirm js_btn_join" value="회원가입">회원가입</button>
                    </div>
                    </form>
                </div>
            <div class="col"></div>  
        </div>          
    </div>
</div>  

<script type="text/javascript">
var $formJoin;

$(document).ready(function () {
	$('#btnCancel').click(function (e) {
		e.preventDefault();
		location.href = '${path}/';
	});
	$('#btnComfirm').click(function (e) {
		e.preventDefault();
		location.href = '${path}/member/join_ok';
	});

	// 아티스트 유형 클릭시
	$(':radio[name="memberFl"]').change(function() {
		var $artistinfo = $('.artist_info_box');
		if (this.value == 'artist') {
			$artistinfo.removeClass('dn');
			$artistinfo.find('input, select').removeClass('ignore');
		} else {
			$artistinfo.addClass('dn');
			$artistinfo.find('input, select').addClass('ignore');
		}
	});
	
	$(':radio[name="memberFl"]:checked').trigger('change');
	
	// 아이디 중복 검사
	$('#checkDuplicate').on('click', () => {
		let memId = $("#newMemId").val().trim();
		
		// DB를 통해 중복검사
		$.ajax({
			type: "POST",
			url: "${ path }/member/idCheck",
			dataType: "json",
			data: {
				memId
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate === true) {
					alert("이미 사용중인 아이디 입니다.")
				} else {
					alert("사용 가능한 아이디 입니다.")
				}
			}, 
			error: (error) => {
				console.log(error);
			}
		});	
	});
});

</script>

<jsp:include page="/views/common/footer.jsp"/>