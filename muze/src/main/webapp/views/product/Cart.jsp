<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/views/common/header.jsp"/>

<div class="container">
        <div class="row">
            <div class="col-md-6 mt-3">
                <h2 class="basket">장바구니</h2>
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
                                <col style="width:3%">  <!-- 체크박스 -->
                                <col>					<!-- 상품명/옵션 -->
                                <col style="width:5%">  <!-- 수량 -->
                                <col style="width:10%"> <!-- 상품금액 -->
                                <col style="width:13%"> <!-- 할인/적립 -->
                                <col style="width:10%"> <!-- 합계금액 -->
                                <col style="width:10%"> <!-- 배송비 -->
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>
                                        <div class="form_element">
                                            <input type="checkbox" id="allCheck1" class="gd_select_all_goods" data-target-id="cartSno1_" data-target-form="#frmCart" checked="checked">
                                            <label for="allCheck1" class="check_s on"></label>
                                        </div>
                                    </th>
                                    <th>상품/옵션 정보</th>
                                    <th>수량</th>
                                    <th>상품금액</th>
                                    <th>할인/적립</th>
                                    <th>합계금액</th>
                                    <th>배송비</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- AceCounter eCommerce (Cart_Inout) v8.0 Start -->

                                        <!-- AceCounter eCommerce (Cart_InOut) v8.0 End -->
                                        <td class="td_chk">
                                            <div class="form_element">
                                                <input type="checkbox" id="cartSno1_212360" name="cartSno[]" value="212360" checked="checked" data-price="1490000" data-mileage="0" data-goodsdc="0" data-memberdc="0" data-coupondc="0" data-possible="y" data-goods-key="0" data-goods-no="1163545" data-goods-nm="[FRAME] At the fair" data-option-nm="서울/경기(+40,000원)" data-fixed-sales="option" data-sales-unit="1" data-fixed-order-cnt="option" data-min-order-cnt="1" data-max-order-cnt="0" data-default-goods-cnt="1">
                                                <label for="cartSno1_212360" class="check_s on"></label>
                                            </div>
                                        </td>
                                        <td class="td_left">
                                            
                                            <div class="pick_add_cont">
                                                <span class="pick_add_img">
                                                    <a href=""><img src="" width="40" alt="[FRAME] At the fair" title="[FRAME] At the fair" class="middle"></a>
                                                </span>
                                                <div class="pick_add_info">
                                                    <em><a href="">[FRAME] At the fair</a></em>
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
                                                <strong>1개</strong>
                                            </div>
                                        </td>
                                        <td>
                                            <strong class="order_sum_txt price">1,490,000원</strong>
                                            <p class="add_currency"></p>
                                        </td>
                                        <td class="td_benefit">
                                                <ul class="benefit_list">
                                                </ul>
                                        </td>
                                        <td>
                                            
                                            <strong class="order_sum_txt">1,490,000원</strong>
                                            <p class="add_currency"></p>
                                        </td>
                                        <td class="td_delivery" rowspan="1">
                                            기본 - 금액별배송비<br>
                                            0원
        
                                            <br>
                                            (택배)
                                        </td>
                                    </tr>
        
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
                                        <dt>총 <strong id="totalGoodsCnt">1</strong> 개의 상품금액 </dt>
                                        <dd><strong id="totalGoodsPrice">1,490,000</strong>원</dd>
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
                                        <dd><strong id="totalSettlePrice">1,490,000</strong>원
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
                    <div class="btn_order_box">
                        <div class="row">
                            <div class="col-md-6">
                                <span class="btn_left_box">
                                    <button type="button" class="btn_order_choice_del" onclick="">쇼핑 계속하기</button>
                                    <button type="button" class="btn_order_choice_wish" onclick="">관심상품</button>
                                    <button type="button" class="btn_order_choice_del" onclick="">삭제</button>
                                </span>
                            </div>
                            <div class="col-md-6">
                                <span class="btn_right_box">
                                    <button type="button" class="btn_order_choice_buy" onclick="">선택 상품 주문</button>
                                    <button type="button" class="btn_order_whole_buy" onclick="">전체 상품 주문</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- //btn_order_box -->
        
                    <em class="chk_none">주문서 작성단계에서 할인/마일리지 적용을 하실 수 있습니다.</em>
            </div>
        </div>

  <jsp:include page="/views/common/footer.jsp"/>
</body>
</html>