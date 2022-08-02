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

<style>
#wrap .member_warning.prior_wrong + .text_warning {
    display: block;
}

#wrap .text_pass {
    color: #329cff;
    text-align: left;
}

#introduction_chk{
margin-right: 100px;
}
</style>


<!-- 내용 전체 컨테이너 -->
<div class="container">
    <div class="row m-auto">
        <div class="col-12">
        <form id="formJoin" name="formJoin" action="${ path }/member/join" method="post" novalidate="novalidate">	
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
                                            <input type="radio" id="memberFlDefault" name="memberFl" class="ignore" value="MEMBER_ROLE_USER" checked="">
                                            <label for="memberFlDefault" class="choice_s">개인회원</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="memberFlartist" name="memberFl" class="ignore" value="MEMBER_ROLE_ARTIST">
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
                                            <input type="text" id="newMemId" name="memId" required>
                                            <!-- text박스의 id입력한거랑 idTest값이 같으면 중복검사 성공 -->
                                            <input type="hidden" name="idTest" value="0" />
                                            <input type="button" id="checkDuplicate" name="checkDuplicate" class="checkDuplicate" value="중복검사" >
                                            <div class="testwrapper"></div>
                                        </div>
                                    </td>
                    
                                </tr>
                                <tr class="">
                                    <th><span class="important">비밀번호</span></th>
                                    <td class="member_password">
                                        <div class="member_warning">
                                            <input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder="" required> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
                                            <label for="" id="pwd_chk1"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th><span class="important">비밀번호 확인</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="password" id="checkPassword" class="check-id" name="memPwRe" autocomplete="off">
                                            <label for="" id="pwd_chk2"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="member_name">
                                    <th><span class="important">이름</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" id="memNm" name="memNm" value="" maxlength="30" required>
                                            <label for="" id="name_chk"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <div class="member_warning">
                                            <input type="text" name="email" id="email" value="" tabindex="-1" required>
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
                                            <label for="" id="email_chk"></label>
                                            <input type="button" name="emailCheck" id="emailCheck" value="인증하기" />
                                              <br />
						                      <input
						                        type="text"
						                        name="emailConfirm"
						                        id="emailConfirm"
						                        placeholder="인증번호를 입력해주세요."
						                        style="visibility: hidden"
						                      />
						                      <input
						                        type="button"
						                        name="btnEmailConfirm"
						                        id="btnEmailConfirm"
						                        value="인증번호확인"
						                        style="visibility: hidden"
						                      />
						                      <input type="hidden" name="emailTest" value="0" />
						                      <br />
                                        </div>
                                        	
                                        <div class="form_element">
                                            <input type="checkbox" id="maillingFl" name="maillingFl" value="y" checked>
                                            <label for="maillingFl" class="check_s ">정보/이벤트 메일 수신에 동의하시면 1,000 포인트가 추가 지급됩니다.(선택)</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">휴대폰번호</span></th>
                                    <td class="member_address">
                                        <div class="address_phone">
                                            <input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" required>
                                            <label for="" id="phone_chk"></label>
                                        </div>
                                        <div class="form_element">
                                            <input type="checkbox" id="smsFl" name="smsFl" value="y" checked>
                                            <label for="smsFl" class="check_s ">정보/이벤트 SMS 수신에 동의하시면 1,000 포인트가 추가 지급됩니다.(선택)</label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">주소</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="zonecode" readonly="readonly" value="" required>
                                            <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                            <input type="hidden" name="zipcode" value="">
                                        </div>
                                        <div class="address_input">
                                            <div class="member_warning">
                                                <input type="text" id="address" name="address" readonly="readonly" value="" required>
                                                           
                                            </div>
                                            <div class="member_warning js_address_sub">
                                                <input type="text" id="addressSub" name="addressSub" value="">
                                                <label for="" id="address_chk"></label>
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
                                            <input type="file" name="image" id="image"  class="ignore"><br>
                                            <label for="" id="image_chk"></label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="important">소개글</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <textarea rows="5" name="introduction" id="introduction" class="ignore"></textarea>
                                            <label for="" id="introduction_chk"></label>
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
                                            <input type="text" name="busiNo" id="busiNo" maxlength="10" placeholder="- -없이 입력하세요." value="" data-overlap-businofl="y" data-charlen="10" data-oldbusino="" class="ignore">
                                            <div id="busiNo-error" class="text_warning" style="">사업자번호는 10자로 입력해야 합니다.</div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>    
                    </div>

                    <div class="btn_center_box">
                        <button type="button" id="btnCancel" class="btn_member_cancel">취소</button>
                        <button type="submit" id="btnComfirm" class="btn_comfirm js_btn_join" value="회원가입">회원가입</button>
                    </div>
                </div>
            <div class="col"></div>  
            </form>
        </div>          
    </div>
</div>  

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	$('#btnCancel').click(function (e) {
		e.preventDefault();
		location.href = '${path}/';
	});

	// 아티스트 유형 클릭시
	$(':radio[name="memberFl"]').change(function() {
		var $artistinfo = $('.artist_info_box');
		if (this.value == 'MEMBER_ROLE_ARTIST') {
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
		
		var $memId = $("#newMemId");
		if (/^[a-zA-Z0-9_]{4,}$/.test($memId.val()) == false) {
			alert("유효한 아이디를 입력해주세요.");
			return;
		} 
		
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
					$('#newMemId').val("").focus();
					alert("이미 사용중인 아이디 입니다.")
				} else {
					$("[name=idTest]").val("1");
					alert("사용 가능한 아이디 입니다.")
				}
			}, 
			error: (error) => {
				console.log(error);
			}
		});	
		
		//아이디 중복검사 이후 id값 변경시 다시 중복검사 하게끔
		$("#newMemId").change(function(){
			$("[name=idTest]").val("0");
		});
	});
	
	//첫번째 비밀번호 유효성검사
	$("#newPassword").change(function(){
		var p1 = $("#newPassword");
		
		if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{10,16}$/.test(p1.val())==false){
			$("#pwd_chk1").html("10자~16자, 최소 하나의 문자 및 하나의 숫자를 입력해주세요.<br>");
			$("#pwd_chk1").attr('style', 'visibility:visible;');
			
		}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{10,16}$/.test(p1.val())==true) {
			$("#pwd_chk1").html("");
			$("#pwd_chk1").attr('style', 'visibility:hidden;');
		}
	});
	
	//두번째 비밀번호 유효성검사
	$("#checkPassword").change(function(){
		var p1 = $("#newPassword");
		var p2 = $("#checkPassword");
		
		if(p1.val() != p2.val()){
			$("#pwd_chk2").html("비밀번호가 일치하지 않습니다.");
			$("#pwd_chk2").attr('style', 'visibility:visible;');
		}else{
			$("#pwd_chk2").html("");
			$("#pwd_chk2").attr('style', 'visibility:hidden;');
		}
	});
	
	//이름 유효성검사
	$("#memNm").change(function(){
	var $memNm = $("#memNm");
	
		if(/^[가-힣]{2,}$/.test($memNm.val()) == false){
			$("#name_chk").html("이름은 한글 2글자 이상이어야 합니다.");
			$("#name_chk").attr('style', 'visibility:visible;');
			return false;
		}else{
			$("#name_chk").html("");
			$("#name_chk").attr('style', 'visibility:hidden;');
		}
	});
	
	//이메일 인증하기 구현 
	$(emailCheck).click(function(){
		var eamilId = $('#email').val();
		var $email = $("#email");
		
		if (/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test($email.val()) == false) {
			$("#email_chk").html("유효한 이메일을 입력해주세요.");
			$("#email_chk").attr('style', 'visibility:visible;');
			return false;
		}else{
			$("#email_chk").html("");
			$("#email_chk").attr('style', 'visibility:hidden;');
		}
		
		// 보낼 인증번호 담는곳
		var confirmCode;
		$.ajax({
			url: "${ path }/member/emailCheck",
			data : {
				"email" : eamilId
				},
			method: "POST",
			dataType: "text",
			
			//성공했을시
			success: function(data){
				if(data=="overlap"){
					alert("이미 가입된 이메일 입니다.");
					return;
				}
				
			confirmCode = data;
			
			//인증번호 박스, 버튼나타나기			
			$("#emailConfirm, #btnEmailConfirm").attr('style', 'visibility:visible;');
			
			
				//인증번호 확인눌렀을 시 구현
				$(btnEmailConfirm).click(function(){
					var memberConfirmCode = $('#emailConfirm').val();
					
					
					if(confirmCode==memberConfirmCode){
						alert("인증에 성공하셨습니다");
						$("[name=emailTest]").val("1"); //인증에 성공하면 value를 1로바꿈
						$('#email, #emailConfirm').attr('readonly', true); //인증성공하면 이메일 + 인증번호창 readonly
					}else{
						alert("인증에 실패하셨습니다");
					}
				});
			},
			error: function(xhr, status, error){
				console.log("error call!");
				console.log(xhr, status, error);
			}
		});
	});
	
	// 주소 api
	$("#btnPostcode").click(function() {
		new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            
            $("[name=zonecode]").val(data.zonecode);
            $("[name=address]").val(fullRoadAddr);
            
            document.getElementById('zonecode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullRoadAddr;
            
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addressSub").focus();
			}
		}).open();
	});
	
	// 휴대폰 유효성검사
	$("#cellPhone").change(function(){
	var $cellPhone = $("#cellPhone");
		
		if(/^010[0-9]{8}$/.test($cellPhone.val()) == false){
			$("#phone_chk").html("유효한 전화번호가 아닙니다.");
			$("#phone_chk").attr('style', 'visibility:visible;');
				return false;
		} else {
			$("#phone_chk").html("");
			$("#phone_chk").attr('style', 'visibility:hidden;');
			
		}
	});
	
	//아티스트 이미지 유효성검사
	$("#image").change(function(){
		if($("#image").get(0).files.length === 0){
			$("#image_chk").html("이미지를 첨부해주세요.");
			$("#image_chk").attr('style', 'visibility:visible;');
			return false;
		}else{
			$("#image_chk").html("");
			$("#image_chk").attr('style', 'visibility:hidden;');
		}
	});
	
	//아티스트 소개글 유효성검사
	$("#introduction").change(function(){
	
		if(!$("#introduction").val()){
			$("#introduction_chk").html("소개글을 등록해주세요.");
			$("#introduction_chk").attr('style', 'visibility:visible;');
			return false;
		}else{
			$("#introduction_chk").html("");
			$("#introduction_chk").attr('style', 'visibility:hidden;');
		}
	});

	//제출버튼 클릭시 모든 값 유무 확인
	$("#formJoin").submit(function(){
		
		//중복검사 실시 유무
		if($("[name=idTest]").val() != "1"){
			alert("중복검사를 해주세요");
			$("#newMemId").focus();
			return false;
		}
		
		//비밀번호 유효성 여부결과표시가 나와있으면 return
		if($("#pwd_chk1").css("visibility") != "hidden"){
			alert("비밀번호를 제대로 입력 해주세요");
			$("#newPassword").focus();
			return false;
		}
		
		if($("#pwd_chk2").css("visibility") != "hidden"){
			alert("비밀번호를 제대로 입력 해주세요");
			$("#checkPassword").focus();
			return false;
		}
		
		//이름 유효성 여부표시가 나와있으면 return
		if($("#name_chk").css("visibility") != "hidden"){
			alert("이름을 제대로 입력 해주세요");
			$("#memNm").focus();
			return false;
		}
		
		//이메일 인증 실시 유무
		if($("[name=emailTest]").val() != "1"){
			alert("이메일 인증을 해주세요");
			return false;
		}
		
		//이메일유효성 hidden이면 인증하기
		if($("#btnEmailConfirm").css("visibility") == "hidden"){
			alert("이메일 인증을 해주세요");
			$("#email").focus();
			return false;
		}
		
		//휴대폰유효성 여부표시가 나와있으면 return
		if($("#phone_chk").css("visibility") != "hidden"){
			alert("휴대폰번호를 제대로 입력 해주세요");
			$("#cellPhone").focus();
			return false;
		}
		
		//주소 상세주소가 비어있으면 return
		if($("#address_chk").val == '') {
			alert("상세 주소를 입력해주세요");
			$("#addressSub").focus();
			return false;
		}
		
		//아티스트 이미지가 비어있으면 return
		if($("#image_chk").val == '') {
			alert("이미지를 첨부해주세요.");
			$("#image").focus();
			return false;
		}
		
		//아티스트 소개글이 비어있으면 return
		if($("#introduction_chk").val == '') {
			alert("소개글을 등록해주세요");
			$("#introduction").focus();
			return false;
		}
	});
});




</script>

<jsp:include page="/views/common/footer.jsp"/>