<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/views/common/header.jsp" />


<div class="container">
	<div class="row">
		<div class="col-md-6 mt-3">
			<h2 class="basket">주문서작성/결제</h2>
		</div>
		<div class="col-md-6 mt-3">
			<div id="page">
				<p>
					<strong>01 장바구니</strong>&nbsp&nbsp&nbsp
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-caret-right-fill"
						viewBox="0 0 16 16">
                            <path
							d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
                        </svg>
					&nbsp&nbsp&nbsp <strong>02 주문서작성/결제</strong>&nbsp&nbsp&nbsp
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-caret-right-fill"
						viewBox="0 0 16 16">
                            <path
							d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
                        </svg>
					&nbsp&nbsp&nbsp <strong>03 주문완료</strong>
				</p>
			</div>
		</div>
	</div>
	<hr class="mt-4">

	<!-- order_tit -->
	<form id="frmCart" name="frmCart" method="post" action="${path}/product/complete">
		<input type="hidden" value="${ list }" name="list"> 
		<input type="hidden" value="${ totalPrice }" name="totalPrice">

		<!-- 장바구니 상품리스트 시작 -->
		<div class="cart_cont_list">
			<div class="order_cart_tit"></div>
			<!-- //order_cart_tit -->
			<div class="order_table_type">
				<table>
					<colgroup>

						<col>
						<!-- 상품명/옵션 -->
						<col style="width: 5%">
						<!-- 수량 -->
						<col style="width: 10%">
						<!-- 상품금액 -->
						<col style="width: 13%">
						<!-- 할인/적립 -->
						<col style="width: 10%">
						<!-- 합계금액 -->
						<col style="width: 10%">
						<!-- 배송비 -->
					</colgroup>
					<thead>
						<tr>
							<th>상품/옵션 정보</th>
							<th>수량</th>
							<th>상품금액</th>
							<th>할인/적립</th>
							<th>합계금액</th>
							<th>배송비</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="product" items="${ list }">

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
										<span class="pick_add_img"> <a href=""><img src=""
												width="40" alt="${product.proName }"
												title="[FRAME] At the fair" class="middle"></a>
										</span>
										<div class="pick_add_info">
											<em><a href="">${product.proName }</a></em>
											<!-- //icon_pick_list -->
										</div>
									</div> <!-- //pick_add_cont --> <!-- //pick_add_list -->
								</td>
								<td class="td_order_amount">
									<div class="order_goods_num">
										<strong>${product.payQuantity }</strong>
									</div>
								</td>
								<td><strong class="order_sum_txt price">${product.proPrice }</strong>
									<p class="add_currency"></p></td>
								<td class="td_benefit">
									<ul class="benefit_list">
									</ul>
								</td>
								<td><strong class="order_sum_txt">${product.payQuantity * product.proPrice}</strong>
									<p class="add_currency"></p></td>
								<td class="td_delivery" rowspan="1">기본 - 금액별배송비<br> 0원

									<br> (택배)
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
							<dt>
								총 <strong id="totalGoodsCnt">${fn:length(list)}</strong> 개의 상품금액
							</dt>
							<dd>
								<strong id="totalGoodsPrice">${totalPrice}</strong>원
							</dd>
						</dl>
					</div>
					<span></span>
					<div class="col-md-4 mb-4">
						<dl>
							<dt>배송비</dt>
							<dd>
								<strong id="totalDeliveryCharge">0</strong>원
							</dd>
						</dl>
					</div>
					<div class="col-md-4 mb-4">
						<dl class="price_total">
							<dt>합계</dt>
							<dd>
								<strong id="totalSettlePrice">${totalPrice }</strong>원
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
		<br>
		<br>
		<div class="order_info">
			<div class="order_zone_tit">
				<h4>주문자 정보</h4>
			</div>
			<hr>

			<div class="order_table_type">
				<table class="table_left">
					<colgroup>
						<col style="width: 35%;">
						<col style="width: 65%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="width: 150px; height: 35px; margin-right: 20px;"><span class="important">주문하시는 분</span></th>
							<td><input type="text" name="orderName" id="orderName" value="" data-pattern="gdEngKor" maxlength="20"></td>
						</tr>
						<tr>
							<th scope="row" style="height: 35px; margin-right: 20px;"><span class="important">휴대폰 번호</span></th>
							<td><input type="text" id="mobileNum" name="orderCellPhone" value="" maxlength="20"></td>
						</tr>
						<tr>
							<th scope="row" style="height: 35px; margin-right: 20px;"><span class="important">이메일</span></th>
							<td class="member_email"><input type="text" name="orderEmail" value=""></td>
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
						<col style="width: 20%;">
						<col style="width: 80%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="width: 150px; height: 35px; margin-right: 20px;"><span class="important">받으실분</span></th>
							<td><input type="text" name="receiverName" data-pattern="gdEngKor" maxlength="20"></td>
						</tr>
						<tr>
							<th scope="row" style="height: 35px; margin-right: 20px;"><span class="important">연락처</span></th>
							<td><input type="text" id="receiverCellPhone" name="receiverCellPhone"></td>
						</tr>
						<tr>
							<th rowspan="1" scope="row" style="height: 35px; margin-right: 20px;"><span class="important">받으실 곳</span></th>
							<td class="member_address">
								<input type="text" id="sample6_postcode" style="height: 35px;" placeholder="우편번호"> 
								<input type="button" onclick="sample6_execDaumPostcode()" style="height: 35px; margin-right: 20px;" value="우편번호 찾기">
							</td>
						</tr>
						<tr>
							<th></th>		
							<td>
								<input type="text" id="sample6_address" style="height: 35px;" placeholder="주소"> 
								<input type="text" id="sample6_detailAddress" style="height: 35px; margin-right: 20px;" placeholder="상세주소">
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
						<col style="width: 15%;">
						<col style="width: 85%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="width: 150px; height: 35px; margin-right: 20px;">상품 합계 금액</th>
							<td><strong id="totalGoodsPrice" class="order_payment_sum">${totalPrice}</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">배송비</th>
							<td><span id="totalDeliveryCharge">0</span>원 <span
								class="multi_shipping_text"></span></td>
						</tr>

						<tr>
							<th scope="row">마일리지 사용</th>
							<td>
								<div class="order_money_use">
									<b><input type="text" name="useMileage"> 원</b>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<div class="form_element">
									<span class="money_use_sum">(보유 마일리지 : 1,000 원)</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">최종 결제 금액</th>
							<td><input type="hidden" name="settlePrice"
								value="1,490,000"> <input type="hidden"
								name="overseasSettlePrice" value="0"> <input
								type="hidden" name="overseasSettleCurrency" value="KRW">
								<strong id="totalSettlePrice" class="order_payment_sum">${totalPrice }</strong>원
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
					<dd>
						<span><strong id="totalSettlePriceView">${totalPrice}</strong>원</span>
					</dd>
				</dl>
				<hr>
			</div>
			<div class="payment_final_check">
				<div class="form_element">
					<input type="checkbox" id="termAgree_orderCheck" class="require">
					<label for="termAgree_orderCheck" class="check_s"><em><b>(필수)</b>
							구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</em></label>
				</div>
			</div>
			<hr>
			<div class="btn_center_box">
				<button class="btn_order_buy order-buy">
					<em>결제하기</em>
				</button>
			</div>
	</form>
</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<jsp:include page="/views/common/footer.jsp" />