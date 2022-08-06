<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<style type="text/css">

#name_chk {
font-size : 13px;
color : #ab3e55;
float:left;
margin-right: 5px;
}

#email_chk {
font-size : 13px;
color : #ab3e55;
float:left;
}

</style>

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
                                          <input type="radio" id="findIdEmail" name="findIdFl" value="email" checked>            
                                          <label for="findIdEmail" class="choice_s">이메일</label>            
                                          <input type="radio" id="findIdPhone" name="findIdFl" value="cellPhone">            
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
                                              <label for="" id="name_chk"></label>
                                              <label for="" id="email_chk"></label>
                                    </div>

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
              } else if ($(this).val() == 'email') {            
                $('input[id="userCellPhoneNum"]').hide().prop('disabled', true);            
                $('input[id="userEmail"]').prop('disabled', false).show();
				$('select[id="emailDomain"]').prop('disabled', false).show();           
              }            
           });            
                                
           $('input[id="userCellPhoneNum"]').on('keyup', function(){            
           var value = $(this).val();            
           $(this).val(value.replace(/[^\d]/g, ''));            
        });   
           
           $("#userName").change(function(){
        		var $userName = $("#userName");
        		
        		if(/^[가-힣]{2,}$/.test($userName.val()) == false){
        			$("#name_chk").html("이름은 한글 2글자 이상이어야 합니다.");
        			$("#name_chk").attr('style', 'visibility:visible;');
        			return false;
        		}else{
        			$("#name_chk").html("");
        			$("#name_chk").attr('style', 'visibility:hidden;');
        		}
        	});
           
           $("#userEmail").change(function(){
       		var $userEmail = $("#userEmail");
       		
       		if (/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test($userEmail.val()) == false) {
       			$("#email_chk").html("유효한 이메일을 입력해주세요.");
       			$("#email_chk").attr('style', 'visibility:visible;');
       			return false;
       		}else{
       			$("#email_chk").html("");
       			$("#email_chk").attr('style', 'visibility:hidden;');
       		}
		});
           
         //제출버튼 클릭시 모든 값 유무 확인
         $("#formFindId").submit(function(){
        	 
         	//이름 유효성 여부표시가 나와있으면 return
	   		if($("#name_chk").css("visibility") != "hidden"){
	   			alert("이름을 제대로 입력 해주세요");
	   			$("#userName").focus();
	   			return false;
	   		}
       		
	   	//이메일 유효성 여부표시가 나와있으면 return
	   		if($("#email_chk").css("visibility") != "hidden"){
	   			alert("이메일을 제대로 입력 해주세요");
	   			$("#userEmail").focus();
	   			return false;
	   		}
       	});
	});
       
	

</script>

<jsp:include page="/views/common/footer.jsp"/>