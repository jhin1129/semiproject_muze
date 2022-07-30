<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row" style="text-align: center">
		<div class="col"></div>
            <div class="col-6 ">
                <div class="content_box">
                    <div class="member_wrap">
                        <div class="member_tit">
                            <h2>아이디찾기</h2>
                        </div>
                        <!-- //member_tit -->
                        <div class="member_cont">
                            <form id="formFindId" method="post" action="${ path }/member/find_id" novalidate="novalidate">
                                <div class="find_id_box">
                                    <div class="find_id_sec">
                                        <h3 class="hidden">회원 아이디찾기</h3>
                                        <div class="form_element radio_find_type">            
                                          <input type="radio" id="findIdEmail" name="findIdFl" value="${ member.memberEmail }" checked="checked">            
                                          <label for="findIdEmail" class="choice_s on">이메일</label>            
                                          <input type="radio" id="findIdPhone" name="findIdFl" value="${ member.memberPhonenumber }">            
                                          <label for="findIdPhone" class="choice_s">휴대폰번호</label>            
                                        </div>
                                        <div class="login_input">
                                            <div>
                                                <input type="text" id="userName" name="userName" placeholder="이름">
                                                <input type="text" id="userCellPhoneNum" name="userCellPhoneNum" placeholder="가입휴대폰번호" disabled="disabled" style="display:none;" maxlength="12">                     
                                                <input type="text" id="userEmail" name="userEmail" class="input_email" placeholder="가입메일주소">            
                                                <select id="emailDomain" name="emailDomain" class="email_select">            
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
                                            <button type="submit" class="btn_member_id">아이디 찾기</button>
                                        </div>
                                          <p class="dn js_caution_msg1">일치하는 회원정보가 없습니다. 다시 입력해 주세요.</p> 
                                    </div>
                                    <div class="find_complete_box"><p>"${ loginMember.memberName }" 회원님의 아이디는 <br><strong>"${ loginMember.memberId }"</strong> 입니다</p></div>
                                    <!-- //find_id_sec -->
                                    <div class="btn_member_sec">
                                            <button class="btn_member_white js_btn_find_password">비밀번호 찾기</button>
                                            <button class="btn_comfirm js_btn_login">로그인하기</button>
                                    </div>
                                    <!-- //btn_member_sec -->
                                </div>
                                <!-- //find_id_box -->
                            </form>
                        </div>
                        <!-- //member_cont -->
                    </div>
                    <!-- //member_wrap -->
				</div>
			</div>
		<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<script type="text/javascript">
	$(document).ready(function () {
		$('input').keyup(function () {
			$('.js_caution_msg1', 'form').addClass('dn');
		});
		$('.js_btn_find_password', 'form').click(function (e) {
			e.preventDefault();
			location.href = "${ path }/member/find_password";
		});
		$('.js_btn_login', 'form').click(function (e) {
			e.preventDefault();
			location.href = "${ path }/member/login";
		});
		 $('input[name="findIdFl"]').on('click', function(){            
               if ($(this).val() == 'cellPhone') {            
               $('input[id="userEmail"]').attr('style','display:none !important').prop('disabled', true);
			   $('select[id="emailDomain"]').hide().prop('disabled', true);
               $('input[id="userCellPhoneNum"]').prop('disabled', false).show();            
               $('#cellPhoneCountryCode').show().prop('disabled', false);            
              } else if ($(this).val() == 'email') {            
                $('input[id="userCellPhoneNum"]').hide().prop('disabled', true);            
                $('input[id="userEmail"]').prop('disabled', false).show();
				$('select[id="emailDomain"]').prop('disabled', false).show();
                $('#cellPhoneCountryCode').hide().prop('disabled', true);            
              }            
             })            
                                
           $('input[id="userCellPhoneNum"]').on('keyup', function(){            
           var value = $(this).val();            
           $(this).val(value.replace(/[^\d]/g, ''));            
        })

		$('#formFindId').validate({
			dialog: false,
			rules: {
				userName: {
					required: true
				},
				userEmail: {
					required: true,
					email: true
				  },            
                userCellPhoneNum: {            
                    required: true,
				}
			},
			messages: {
				userName: {
					required: "이름을 입력해주세요."
				},
				userEmail: {
					required: "이메일을 입력해주세요.",
					email: "메일 형식이 틀렸습니다."
				},
				 userCellPhoneNum: {            
                    required: "휴대폰 번호를 입력해주세요.",            
                }
			}, submitHandler: function (form) {
				var params = $(form).serializeArray();
				params.push({name: "mode", value: "findId"});
				$.post('${ path }/member/find_id', params).done(function (data, textStatus, jqXHR) {
					if (data.result) {
						var compiled = _.template($('#templateFindIdResult').html());
						var templateData = {memberId: data.memberId, userName: $('#userName').val()};
						$('.find_id_sec').html(compiled(templateData));
					} else {
						if (data['code'] == 500) {            
                              alert(data['message']);            
                           } else {
						$(form).find('.js_caution_msg1').removeClass('dn').text(data.message);
					}
					}
				});
			}, invalidHandler: function (form, validator) {
				var errors = validator.numberOfInvalids();
				if (errors) {
					$(form.target).find('.js_caution_msg1').removeClass('dn').text(validator.errorList[0].message);
					validator.errorList[0].element.focus();
				}
			}
		});
	});
</script>

<jsp:include page="/views/common/footer.jsp"/>