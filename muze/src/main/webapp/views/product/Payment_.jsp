<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

        
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-3">
                <h2 class="basket">주문서작성/결제</h2>
            </div>
            <div class="col-md-6 mt-3">
                <div id="page">
                    <p>
                        <strong>01 장바구니</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>02 주문서작성/결제</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>03 주문완료</strong>
                    </p>
                </div>
        </div>
        </div>
        <hr class="mt-4">

        <!-- order_tit -->

            
                <!-- 장바구니 상품리스트 시작 -->
                <div class="cart_cont_list">
                    <div class="order_cart_tit">
                    </div>
                    <!-- //order_cart_tit -->
                    <div class="order_table_type">
                        <table>
                            <colgroup>
                                <col style="width:72%">					<!-- 상품명/옵션 -->
                                <col style="width:12%">  <!-- 수량 -->
                                <col style="width:10%"> <!-- 상품금액 -->
                                <col style="width:10%"> <!-- 합계금액 -->
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>상품/옵션 정보</th>
                                    <th>수량</th>
                                    <th>상품금액</th>
                                    <th>합계금액</th>
                                </tr>
                                </thead>
                                <tbody>
                                	
                       	            <c:forEach var="product" items="${ list }">
                                	<input type="hidden" name="proNo" value="${product.proNo}">
                                	<input type="hidden" name="payQuantity" value="${product.payQuantity }">
                                    <tr>
                                        <!-- AceCounter eCommerce (Cart_Inout) v8.0 Start -->
                                        <script language="javascript">
                                            var _products=(function(){
                                                var c={pd:'1163545', pn:'[FRAME] At the fair', am:'1,490,000원'.replace(/[^0-9]/g,''), qy:'1', ct:''};
                                                var u=(!_products)?[]:_products; u['@'+c.pd]=c;return u;
                                            })();
                                        </script>
                                        <!-- AceCounter eCommerce (Cart_InOut) v8.0 End -->
                                        <td class="td_left">
                                            
                                            <div class="pick_add_cont">
                                                <span class="pick_add_img">
                                                    <a href=""><img src='${path}/resources/upload/product/painting/${fn:replace(product.proImg,"\\","/")}' width="40" alt="${product.proName }" title="[FRAME] At the fair" class="middle"></a>
                                                </span>
                                                <div class="pick_add_info">
                                                    <em><a href="">${product.proName }</a></em>
                                                    <!-- //icon_pick_list -->
                                                                                                    </div>
                                            </div>
                                            <!-- //pick_add_cont -->
                                            <!-- //pick_add_list -->
                                        </td>
                                        <td class="td_order_amount">
                                            <div class="order_goods_num">
                                                <strong>${product.payQuantity }</strong>
                                            </div>
                                        </td>
                                        <td>
                                            <strong class="order_sum_txt price">${product.proPrice }</strong>P
                                        </td>

                                        <td>
                                            
                                            <strong class="order_sum_txt">${product.payQuantity * product.proPrice}</strong>P
                                        </td>

                                    </tr>
        							</c:forEach>
                                    </tbody>
        
        
                                </table>
                            </div>
        
                        </div>
                        <!-- //cart_cont_list -->
                        <!-- 장바구니 상품리스트 끝 -->
        
        
                    
                    <hr>
        
        
                    
                    <div class="price_sum">
                        <div class="price_sum_cont">
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <dl>
                                        <dt>총 <strong id="totalGoodsCnt">${fn:length(list)}</strong> 개의 상품금액 </dt>
                                        <dd><strong id="totalGoodsPrice">${totalPrice}</strong>P</dd>
                                    </dl>
                                </div>
                                <span></span>
                                <div class="col-md-4 mb-4">
                                    <dl>
                                        <dt>배송비</dt>
                                        <dd><strong id="totalDeliveryCharge">0</strong>P</dd>
                                    </dl>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <dl class="price_total">
                                        <dt>합계</dt>
                                        <dd><strong id="totalSettlePrice">${totalPrice }</strong>P
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <em id="deliveryChargeText" class="tobe_mileage"></em>
                        </div>
                        <!-- //price_sum_cont -->
                    </div>
                    <!-- //price_sum -->
                    <hr>
                    <br><br>
                    
                <form id="frmCart" name="frmCart" method="post" action="${path}/product/complete">
                    <input type="hidden" value="${ totalPrice }" name="totalPrice">
                    <input type="hidden" id="proNoList" name="proNoList">
                    <input type="hidden" id="payQuantityList" name="payQuantityList">
                    <div class="order_info">
                        <div class="order_zone_tit">
                            <h4>주문자 정보</h4>
                        </div>
                        <hr>

                        <div class="order_table_type">
                            <table class="table_left">
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:85%;">
                                </colgroup>
                                <tbody>
                               
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">주문하시는 분</span></th>
                                    <td><input type="text" name="orderName" id="orderName" value="" data-pattern="gdEngKor" maxlength="20" placeholder="ex) 홍길동">            
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">주소</span></th>
                                    <td><input type="text" name="orderAddress" id="orderAddress" value="" data-pattern="gdEngKor" maxlength="300" placeholder="ex) 서울 강남구 영동대로 513">            
                                </td>
                                </tr>

                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="mobileNum" name="orderCellPhone" value="" maxlength="20" placeholder="ex) 010-0000-0000">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <input type="text" id="orderEmail" name="orderEmail" value="" placeholder="ex) Email11@naver.com">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <!-- //order_info -->

                    <div class="delivery_info">
                        <div class="order_zone_tit">
                            <h4>배송정보</h4>
                        </div>

                        <div class="order_table_type shipping_info">
                            <table class="table_left shipping_info_table">
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:85%;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">받으실분</span></th>
                                    <td><input type="text" id="receiverName" name="receiverName" data-pattern="gdEngKor" maxlength="20" placeholder="ex) 홍길동"></td>
                                </tr>
                                <tr>
                                    <th style="height: 35px; width: 100px;"><span class="important">주소</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="zonecode" readonly="readonly" placeholder="우편번호" value="" required>
                                            <button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
                                            <input type="hidden" name="zipcode" value="">
                                        </div>
                                        <div class="address_input">
                                            <div class="member_warning">
                                                <input type="text" id="address" name="address" readonly="readonly" value="" placeholder="주소" required>
                                                           
                                            </div>
                                            <div class="member_warning js_address_sub">
                                                <input type="text" id="addressSub" name="addressSub" placeholder="상세주소" value="">
                                                <label for="" id="address_chk"></label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="receiverCellPhone" name="receiverCellPhone" placeholder="ex) 010-0000-0000">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <!-- //delivery_info -->

                    <!-- //addition_info -->

                    <div class="payment_info">
                        <div class="order_zone_tit">
                            <h4>결제정보</h4>
                        </div>

                        <div class="order_table_type">
                            <table class="table_left">
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:85%;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;">상품 합계 금액</th>
                                    <td>
                                        <strong id="totalGoodsPrice" class="order_payment_sum">${totalPrice}P</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;">배송비</th>
                                    <td>
                                        <span id="totalDeliveryCharge">0</span>P
                                        <span class="multi_shipping_text"></span>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;">보유 마일리지</th>
                                    <td>
                                        <div class="order_money_use">
                                            <b><fmt:formatNumber value="${mileage }" pattern="#,###"/>P</b>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" style="height: 35px; width: 100px;">최종 결제 금액</th>
                                    <td>
                                        <input type="hidden" name="settlePrice" value="1,490,000">
                                        <input type="hidden" name="overseasSettlePrice" value="0">
                                        <input type="hidden" name="overseasSettleCurrency" value="KRW">
                                        <strong id="totalSettlePrice" class="order_payment_sum">${totalPrice }P</strong>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 
                    <hr>
                     -->
                    <!-- //payment_info -->
					<!-- 
                    <div class="payment_progress">
                        <div class="order_zone_tit">
                            <h4>결제수단 선택 / 결제</h4>
                        </div>

                        <div class="payment_progress_list">
                            <div class="js_pay_content">
					 -->


                                <!-- N : 일반결제 시작 -->
                                <!-- 
                                <div id="settlekind_general" class="general_payment">
                                    <dl>
                                        <dt>일반결제</dt>
                                        <dd>
                                            <div class="form_element">
                                                <ul class="payment_progress_select">
                                                    <li id="settlekindType_gb">
                                                        <input type="radio" id="settleKind_gb" name="settleKind" value="gb">
                                                        <label for="settleKind_gb" class="choice_s on">무통장 입금</label>
                                                    </li>
                                                    <li id="settlekindType_pb">
                                                        <input type="radio" id="settleKind_pb" name="settleKind" value="pb">
                                                        <label for="settleKind_pb" class="choice_s">계좌이체</label>
                                                    </li>
                                                </ul>
                                            </div>
                                 -->

                                            <!-- N : 무통장입금 -->
                                            <!-- 
                                             <div id="settlekind_general_gb" class="pay_bankbook_box" style="display: block;">
                                                <em class="pay_bankbook_txt">( 무통장 입금 의 경우 입금확인 후부터 배송단계가 진행됩니다. )</em>
                                                <ul>
                                                    <li>
                                                        <strong>계좌 번호</strong>
                                                        <input type="text" name="bankSender">
                                                    </li>
                                                    <li>
                                                        <strong>입금은행 : 카카오뱅크 3333-00-0000000 (주)project muze </strong>

                                                    </li>
                                                </ul>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                                             -->
                                <!-- //general_payment -->
                                <!-- N : 일반결제 끝 -->
                        <!-- //payment_progress_list -->
                        <div class="payment_final">
                            <div class="payment_final_total">
                                <hr>
                                <dl>
                                    <dt>최종 결제 금액</dt>
                                    <dd><span><strong id="totalSettlePriceView">${totalPrice}P</strong></span></dd>
                                </dl>
                                <hr>
                            </div>
                            <div class="payment_final_check">
                                <div class="form_element" id="termAgree_orderCheck_div">
                                    <input type="checkbox" id="termAgree_orderCheck" class="require">
                                    <label for="termAgree_orderCheck" class="check_s"><em><b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</em></label>
                                </div>
                            </div>
                            <hr>
                            <div class="btn_center_box">
                                <button class="btn_order_buy order-buy"><em>결제하기</em></button>
                            </div>
        				</form>
                        </div>
         
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>               
<script>
	$(document).ready(function(){
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
		
		$("#frmCart").submit(function(e){
			// 입력 x시 반환
			if($("#orderName").val().length==0){alert("주문자명을 입력하세요.");$("#orderName").focus();return false;}
			if($("#orderAddress").val().length==0){alert("주문자 주소를 입력하세요.");$("#orderAddress").focus();return false;}
			if($("#mobileNum").val().length==0){alert("휴대폰번호를 입력하세요.");$("#mobileNum").focus();return false;}
			if($("#orderEmail").val().length==0){alert("이메일을 입력하세요.");$("#orderEmail").focus();return false;}
			if($("#receiverName").val().length==0){alert("받으실 분 성함 을 입력하세요.");$("#receiverName").focus();return false;}
			if($("#address").val().length==0){alert("우편번호를 검색해 주세요.");$("#address").focus();return false;}
			if($("#addressSub").val().length==0){alert("세부 주소를 입력하세요.");$("#addressSub").focus();return false;}
			if($("#receiverCellPhone").val().length==0){alert("받으실 분 전화번호를 입력하세요.");$("#receiverCellPhone").focus();return false;}
			if ($("#termAgree_orderCheck_div").length>0){if(!$('#termAgree_orderCheck').prop('checked')){pass = false;alert("필수 조건에 동의해 주세요.");$("#termsAgreeDiv").attr("tabindex",-1).focus();return false;}}
			if(${mileage} < ${totalPrice}){
				alert("보유 마일리지가 부족합니다.");
				e.preventDefault();
			}else{
				var proNoList = new Array();
				var payQuantityList = new Array();
				var productList = new Array();
				$("input:hidden[name='proNo']").each(function(){
					var proNo = $(this).val();
					proNoList.push(proNo);
	
				});
				$("input:hidden[name='payQuantity']").each(function(){
					var payQuantity = $(this).val();
					payQuantityList.push(payQuantity);
				});
				
				
				for(var i=0; i< proNoList.length; i++){
					var product = {
							proNo : proNoList[i],
							payQuantity : payQuantityList[i]
					};
					productList.push(product);
				}
				$("#proNoList").val(proNoList);
				$("#payQuantityList").val(payQuantityList);
			}
			
			
		});
	});
	
</script>
          <jsp:include page="/views/common/footer.jsp"/>