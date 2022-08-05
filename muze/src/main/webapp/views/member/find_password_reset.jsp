<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<style type="text/css">
#pwd_chk1 {
	font-size:13px;
	float:left;
	margin-left:10px;
}

#pwd_chk2 {
	font-size:13px;
	float:left;
	margin-left:10px;
}
</style>


<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row">
        <div class="col"></div>
            <div class="col-6 ">
                <div class="content_box">
                    <form name="formFind" id="formFind" action="${ path }/member/find_password_reset"  method="post">
                        <div class="member_wrap">
                            <div class="member_tit">
                                <h2>비밀번호 찾기</h2>
                            </div>
                            <div class="member_cont">
                                <form name="formReset" id="formReset" action="${ path }/member/find_password_reset" method="post">
                                    <div class="find_password_reset_box">
                                        <h3>비밀번호 변경</h3>
                                        <p>새로운 비밀번호를 등록해 주세요.</p>
                                        <div class="login_input">
                                            <div class="js_input_pw">
                                                <div class="member_warning">
                                                    <input type="password" id="passwordMsg" name="memPw" autocomplete="off" placeholder="영문대/소문자, 숫자, 특수문자 중 2가지 이상 조합, 10자~16자" data-min-length="10" data-max-length="16">
                                                    <label for="" id="pwd_chk1" style=""></label>
                                                </div>
                                            </div>
                                            <div class="js_input_pw">
                                                <div class="member_warning">
                                                    <input type="password" id="newPwRe" name="memPwRe" autocomplete="off" placeholder="새 비밀번호 확인">
                                                    <label for="" id="pwd_chk2"></label>
                                                </div>
                                            </div>
                                            <div class="btn_center_box">
                                                <button type="submit" id="btnConfirm" class="btn_member_ok">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //find_password_reset_box -->
                                </form>
                              </div>
                            <!-- //member_cont -->
                        </div>
                        <!-- //member_wrap -->
                    </form>
                </div>
 			</div> 
		<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<script type="text/javascript">
$(document).ready(function () {
	//첫번째 비밀번호 유효성검사
	$("#passwordMsg").change(function(){
		var p1 = $("#passwordMsg");
		
		if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{10,16}$/.test(p1.val())==false){
			$("#pwd_chk1").html("유효한 비밀번호가 아닙니다.<br>");
			$("#pwd_chk1").attr('style', 'visibility:visible;');
			
		}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{10,16}$/.test(p1.val())==true) {
			$("#pwd_chk1").html("");
			$("#pwd_chk1").attr('style', 'visibility:hidden;');
		}
	});
	
	//두번째 비밀번호 유효성검사
	$("#newPwRe").change(function(){
		var p1 = $("#passwordMsg");
		var p2 = $("#newPwRe");
		
		if(p1.val() != p2.val()){
			$("#pwd_chk2").html("비밀번호가 일치하지 않습니다.");
			$("#pwd_chk2").attr('style', 'visibility:visible;');
		}else{
			$("#pwd_chk2").html("");
			$("#pwd_chk2").attr('style', 'visibility:hidden;');
		}
	});
	
	//제출버튼 클릭시 모든 값 유무 확인
	$("#formFind").submit(function(){
		//비밀번호 유효성 여부결과표시가 나와있으면 return
		if($("#pwd_chk1").css("visibility") != "hidden"){
			alert("비밀번호를 입력 해주세요");
			$("#passwordMsg").focus();
			return false;
		}
		
		if($("#pwd_chk2").css("visibility") != "hidden"){
			alert("동일한 비밀번호를 입력 해주세요");
			$("#newPwRe").focus();
			return false;
		}
	});
});
</script>	

<jsp:include page="/views/common/footer.jsp"/>