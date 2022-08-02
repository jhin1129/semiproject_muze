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
                <h2 class="basket">주문서작성/결재</h2>
            </div>
            <div class="col-md-6 mt-3">
                <div id="page">
                    <p>
                        <strong>01 장바구니</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>02 주문서작성/결재</strong>&nbsp&nbsp&nbsp<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                            <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        </svg>&nbsp&nbsp&nbsp
                        <strong>03 주문완료</strong>
                    </p>
                </div>
        </div>
        </div>
        <hr class="mt-4">

        <!-- order_tit -->
        <form id="frmCart" name="frmCart" method="post" target="ifrmProcess">
            <input type="hidden" name="mode" value="">
            <input type="hidden" name="cart[cartSno]" value="">
            <input type="hidden" name="cart[goodsNo]" value="">
            <input type="hidden" name="cart[goodsCnt]" value="">
            <input type="hidden" name="cart[addGoodsNo]" value="">
            <input type="hidden" name="cart[addGoodsCnt]" value="">
            <input type="hidden" name="cart[couponApplyNo]" value="">
            <input type="hidden" name="useBundleGoods" value="1">
                <!-- 장바구니 상품리스트 시작 -->
                <div class="cart_cont_list">
                    <div class="order_cart_tit">
                    </div>
                    <!-- //order_cart_tit -->
                    <div class="order_table_type">
                        <table>
                            <colgroup>
                                
                                <col>					<!-- 상품명/옵션 -->
                                <col style="width:5%">  <!-- 수량 -->
                                <col style="width:10%"> <!-- 상품금액 -->
                                <col style="width:13%"> <!-- 할인/적립 -->
                                <col style="width:10%"> <!-- 합계금액 -->
                                <col style="width:10%"> <!-- 배송비 -->
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
                                                <span class="pick_add_img">
                                                    <a href=""><img src="" width="40" alt="${product.proName }" title="[FRAME] At the fair" class="middle"></a>
                                                </span>
                                                <div class="pick_add_info">
                                                    <em><a href="">${product.proName }</a></em>
                                                    <!-- //icon_pick_list -->
                                                    <div class="pick_option_box">
                                                        <span class="text_type_cont">배송선택 : 서울/경기(+40,000원) <strong>(+40,000원)</strong></span>
                                                    </div>
                                                    <div class="pick_option_box">
                                                    </div>
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
                                            <strong class="order_sum_txt price">${product.proPrice }</strong>
                                            <p class="add_currency"></p>
                                        </td>
                                        <td class="td_benefit">
                                                <ul class="benefit_list">
                                                </ul>
                                        </td>
                                        <td>
                                            
                                            <strong class="order_sum_txt">${product.payQuantity * product.proPrice}</strong>
                                            <p class="add_currency"></p>
                                        </td>
                                        <td class="td_delivery" rowspan="1">
                                            기본 - 금액별배송비<br>
                                            0원
        
                                            <br>
                                            (택배)
                                        </td>
                                    </tr>
        							</c:forEach>
                                    </tbody>
        
        
                                </table>
                            </div>
        
                        </div>
                        <!-- //cart_cont_list -->
                        <!-- 장바구니 상품리스트 끝 -->
        
        
                    </form>
                    <hr>
        
        
                    
                    <div class="price_sum">
                        <div class="price_sum_cont">
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <dl>
                                        <dt>총 <strong id="totalGoodsCnt">${fn:length(list)}</strong> 개의 상품금액 </dt>
                                        <dd><strong id="totalGoodsPrice">${totalPrice}</strong>원</dd>
                                    </dl>
                                </div>
                                <span></span>
                                <div class="col-md-4 mb-4">
                                    <dl>
                                        <dt>배송비</dt>
                                        <dd><strong id="totalDeliveryCharge">0</strong>원</dd>
                                    </dl>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <dl class="price_total">
                                        <dt>합계</dt>
                                        <dd><strong id="totalSettlePrice">${totalPrice }</strong>원
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
                                    <th scope="row"><span class="important">주문하시는 분</span></th>
                                    <td><input type="text" name="orderName" id="orderName" value="" data-pattern="gdEngKor" maxlength="20">            
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">주소</span></th>
                                    <td><input type="text" name="orderAddress" id="orderAddress" value="" data-pattern="gdEngKor" maxlength="300">            
                                </td>
                                </tr>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>
                                        <input type="text" id="phoneNum" name="orderPhone" value="" maxlength="20">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="mobileNum" name="orderCellPhone" value="" maxlength="20">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <input type="text" name="orderEmail" value="">
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
                                    <th scope="row"><span class="important">받으실분</span></th>
                                    <td><input type="text" name="receiverName" data-pattern="gdEngKor" maxlength="20"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">받으실 곳</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="receiverZonecode" readonly="readonly">
                                            <input type="hidden" name="receiverZipcode">
                                            <span id="receiverZipcodeText" class="old_post_code"></span>
                                            <button type="button" class="btn_post_search">우편번호검색</button>
                                        </div>
                                        <div class="address_input">
                                            <input type="text" name="receiverAddress" readonly="readonly">
                                            <input type="text" name="receiverAddressSub">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>
                                        <input type="text" id="receiverPhone" name="receiverPhone">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="receiverCellPhone" name="receiverCellPhone">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">남기실 말씀</th>
                                    <td class="td_last_say"><input type="text" name="orderMemo"></td>
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
                                    <th scope="row">상품 합계 금액</th>
                                    <td>
                                        <strong id="totalGoodsPrice" class="order_payment_sum">1,490,000원</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">배송비</th>
                                    <td>
                                        <span id="totalDeliveryCharge">0</span>원
                                        <span class="multi_shipping_text"></span>
                                    </td>
                                </tr>
                                <tr id="rowDeliveryInsuranceFee" class="dn">
                                    <th scope="row">해외배송 보험료</th>
                                    <td>
                                        <span id="deliveryInsuranceFee">0</span>원
                                        <input type="hidden" name="deliveryInsuranceFee" value="0">
                                    </td>
                                </tr>
                                <tr id="rowDeliverAreaCharge" class="dn">
                                    <th scope="row">지역별 배송비</th>
                                    <td>
                                        <span id="deliveryAreaCharge">0</span>원
                                        <input type="hidden" name="totalDeliveryCharge" value="0">
                                        <input type="hidden" name="deliveryAreaCharge" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">할인 및 적립</th>
                                    <td>
                                        <ul class="order_benefit_list">
                                            <li class="order_benefit_sale">
                                                <em id="saleDefault">
                                                    할인 : <strong>(-) <b class="total-member-dc-price">0</b>원</strong>
                                                    <span>(
                                                    상품 0원
                                                    , 회원 <span class="member-dc-price">0원</span>
                                                    , 쿠폰 <span class="goods-coupon-dc-price">0</span>원
                                                    )</span>
                                                </em>
                                                <em id="saleWithoutMember" class="dn">
                                                    할인 : <strong>(-) <b class="total-member-dc-price-without-member">0</b>원</strong>
                                                    <span>(
                                                    상품 0원
                                                    , 회원 0원
                                                    , 쿠폰 <span class="goods-coupon-dc-price-without-member">0</span>원</span>
                                                    )
                                                </em>
                                            </li>
                                            <li class="order_benefit_mileage js_mileage">
                                                <em id="mileageDefault">
                                                    적립 마일리지 : <strong>(+) <b class="total-member-mileage">4,100</b>원</strong>
                                                    <span>
                                                        (
                                                        상품 <span class="goods-mileage">0</span>원,
                                                        회원 <span class="member-mileage">4,100</span>원,
                                                        쿠폰 <span class="goods-coupon-add-mileage">0</span>원
                                                        )
                                                    </span>
                                                </em>
                                                <em id="mileageWithoutMember" class="js_mileage dn">
                                                    적립 마일리지 : <strong>(+) <b class="total-member-mileage-without-member">0</b>원</strong>
                                                    <span>
                                                        (
                                                        상품 0원,
                                                        회원 0원,
                                                        쿠폰 <span class="goods-coupon-add-mileage-without-member">0</span>원
                                                        )
                                                    </span>
                                                </em>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">쿠폰 사용</th>
                                    <td>
                                        <input type="hidden" name="couponApplyOrderNo" value="">
                                        <input type="hidden" name="totalCouponOrderDcPrice" value="">
                                        <input type="hidden" name="totalCouponOrderPrice" value="">
                                        <input type="hidden" name="totalCouponOrderMileage" value="">
                                        <input type="hidden" name="totalCouponDeliveryDcPrice" value="">
                                        <input type="hidden" name="totalCouponDeliveryPrice" value="">
                                        <ul class="order_benefit_list order_coupon_benefits  dn">
                                            <li class="order_benefit_sale">
                                                <em>
                                                    주문할인 : <strong>(-) <b id="useDisplayCouponDcPrice">0</b>원</strong>
                                                </em>
                                            </li>
                                            <li class="order_benefit_sale">
                                                <em>
                                                    배송비할인 : <strong>(-) <b id="useDisplayCouponDelivery">0</b>원</strong>
                                                </em>
                                            </li>
                                            <li class="order_benefit_mileage js_mileage">
                                                <em>
                                                    적립 마일리지 : <strong>(+) <b id="useDisplayCouponMileage">0</b>원</strong>
                                                </em>
                                            </li>
                                        </ul>
                                        <span class="btn_gray_list">
                                            <button type="button" href="#couponOrderApplyLayer" class="btn_gray_mid btn_open_layer"><span>쿠폰 조회 및 적용</span></button>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">마일리지 사용</th>
                                    <td>
                                        <div class="order_money_use">
                                            <b><input type="text" name="useMileage"> 원</b>
                                            <div class="form_element">
                                                <input type="checkbox" id="useMileageAll" onclick="gd_mileage_use_all();">
                                                <label for="useMileageAll" class="check_s">전액 사용하기</label>
                                                <span class="money_use_sum">(보유 마일리지 : 1,000 원)</span>
                                            </div>
                                            <em class="money_use_txt js-mileageInfoArea">※ 1,000원만 사용 가능합니다.</em>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">예치금 사용</th>
                                    <td>
                                        <div class="order_money_use">
                                            <b><input type="text" name="useDeposit" onblur="gd_deposit_use_check();"> 원</b>
                                            <div class="form_element">
                                                <input type="checkbox" id="useDepositAll" onclick="deposit_use_all();">
                                                <label for="useDepositAll" class="check_s">전액 사용하기</label>
                                                <span class="money_use_sum">(보유 예치금 : 0 원)</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">최종 결제 금액</th>
                                    <td>
                                        <input type="hidden" name="settlePrice" value="1,490,000">
                                        <input type="hidden" name="overseasSettlePrice" value="0">
                                        <input type="hidden" name="overseasSettleCurrency" value="KRW">
                                        <strong id="totalSettlePrice" class="order_payment_sum">${totalPrice }</strong>원
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <!-- //payment_info -->

                    <div class="payment_progress">
                        <div class="order_zone_tit">
                            <h4>결제수단 선택 / 결제</h4>
                        </div>

                        <div class="payment_progress_list">
                            <div class="js_pay_content">


                                <!-- N : 일반결제 시작 -->
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
                                                    <li id="settlekindType_pc">
                                                        <input type="radio" id="settleKind_pc" name="settleKind" value="pc">
                                                        <label for="settleKind_pc" class="choice_s">신용카드</label>
                                                    </li>
                                                    <li id="settlekindType_pb">
                                                        <input type="radio" id="settleKind_pb" name="settleKind" value="pb">
                                                        <label for="settleKind_pb" class="choice_s">계좌이체</label>
                                                    </li>
                                                    <li id="settlekindType_pv">
                                                        <input type="radio" id="settleKind_pv" name="settleKind" value="pv">
                                                        <label for="settleKind_pv" class="choice_s">가상계좌</label>
                                                    </li>
                                                    <li id="settlekindType_ph">
                                                        <input type="radio" id="settleKind_ph" name="settleKind" value="ph">
                                                        <label for="settleKind_ph" class="choice_s">휴대폰결제</label>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!-- N : 무통장입금 -->
                                            <div id="settlekind_general_gb" class="pay_bankbook_box" style="display: block;">
                                                <em class="pay_bankbook_txt">( 무통장 입금 의 경우 입금확인 후부터 배송단계가 진행됩니다. )</em>
                                                <ul>
                                                    <li>
                                                        <strong>입금자명</strong>
                                                        <input type="text" name="bankSender">
                                                    </li>
                                                    <li>
                                                        <strong>입금은행 : 카카오뱅크 3333-00-0000000 (주)project muze </strong>

                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- //pay_bankbook_box -->
                                            <!-- 신용카드 컨텐츠 -->
                                            <div class="card" id="settlekind_general_pc" style="display: none;"></div>
                                            <!-- //신용카드 컨텐츠 -->
                                            <!-- 계좌이체 컨텐츠 -->
                                            <div class="account-bank" id="settlekind_general_pb" style="display: none;"></div>
                                            <!-- //계좌이체 컨텐츠 -->
                                            <!-- 가상계좌 컨텐츠 -->
                                            <div class="virtual-bank" id="settlekind_general_pv" style="display: none;"></div>
                                            <!-- //가상계좌 컨텐츠 -->
                                            <!-- 휴대폰 컨텐츠 -->
                                            <div class="cellphone" id="settlekind_general_ph" style="display: none;"></div>
                                            <!-- //휴대폰 컨텐츠 -->
                                        </dd>
                                    </dl>
                                </div>
                                <!-- //general_payment -->
                                <!-- N : 일반결제 끝 -->
                        <!-- //payment_progress_list -->
                        <div class="payment_final">
                            <div class="payment_final_total">
                                <hr>
                                <dl>
                                    <dt>최종 결제 금액</dt>
                                    <dd><span><strong id="totalSettlePriceView">${totalPrice}</strong>원</span></dd>
                                </dl>
                                <hr>
                            </div>
                            <div class="payment_final_check">
                                <div class="form_element">
                                    <input type="checkbox" id="termAgree_orderCheck" class="require">
                                    <label for="termAgree_orderCheck" class="check_s"><em><b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</em></label>
                                </div>
                            </div>
                            <hr>
                            <div class="btn_center_box">
                                <button class="btn_order_buy order-buy"><em>결제하기</em></button>
                            </div>
                        </div>
          <jsp:include page="/views/common/footer.jsp"/>