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
                <h2 class="basket">주문완료</h2>
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
        <form id="frmCart" name="frmCart" method="POST" target="ifrmProcess">
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
                    <div class="row">
                        <div class="col-sm">
                            <div class="product_list">
                                <div class="product_no_data" style="line-height:250px;text-align:center !important;">
                                    <strong style="line-height: 300px;">구매가 완료 되었습니다.</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    
<jsp:include page="/views/common/footer.jsp"/>