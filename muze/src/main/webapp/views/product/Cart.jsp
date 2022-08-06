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

                <!-- 장바구니 상품리스트 시작 -->
                <div class="cart_cont_list">
                    <div class="order_cart_tit">
                    </div>

                    <div class="order_table_type">
                        <table>

                            <thead>
                                <tr>
                                    <th>
                                        <div class="form_element">
                                            <input type="checkbox" id="allCheck1" class="gd_select_all_goods" data-target-id="cartSno1_" data-target-form="#frmCart">
                                            <label for="allCheck1" class="check_s on"></label>
                                        </div>
                                    </th>
                                    <th style="width:60%">상품/옵션 정보</th>
                                    <th style="width:10%">남은수량</th>
                                    <th style="width:10%">구매수량</th>
                                    <th style="width:10%">상품금액</th>
                                    <th style="width:10%">합계금액</th>
                                </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="product" items="${ list }">
                                    <tr>
                                        <td>
                                            <div class="form_element">
                                                <input type="checkbox" value="${product.proNo }" class="checkProduct" id="cartSno1_212360" name="cartSno[]" data-possible="y" data-goods-key="0" data-goods-no="1163545" data-goods-nm="[FRAME] At the fair" data-option-nm="서울/경기(+40,000원)" data-fixed-sales="option" data-sales-unit="1" data-fixed-order-cnt="option" data-min-order-cnt="1" data-max-order-cnt="0" data-default-goods-cnt="1">
                                                <label for="cartSno1_212360" class="check_s on"></label>
                                            </div>
                                        </td>
                                        <td>
                                            
                                            <div class="pick_add_cont">
                                                <span class="pick_add_img">
                                                    <a href=""><img src='${path}/resources/upload/product/painting/${fn:replace(product.proImg,"\\","/")}' width="40" alt="${product.proName }" title="${product.proName }" class="middle"></a>
                                                </span>
                                                <div class="pick_add_info">
                                                    <em><a href="">${product.proName }</a></em>

                                                    <div class="pick_option_box">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- //pick_add_cont -->
                                            <!-- //pick_add_list -->
                                        </td>
                                        <td>
                                        	<strong class="proQuantity">${product.proQuantity}</strong>
                                        </td>
                                        <td class="td_order_amount">
                                            <div class="order_goods_num">
                                                <input style="width:60px;" class="quantitySelect" type="number" min="1" max="${product.proQuantity}" value="1">
                                            </div>
                                        </td>
                                        <td>
                                            <strong class="proPrice">${product.proPrice }</strong>P
                                            <p class="add_currency"></p>
                                        </td>
                                        <td>
                                            <strong class="sumPrice">${product.proPrice }</strong>P
                                            <p class="add_currency"></p>
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
                                        <dd><strong id="totalGoodsPrice" class="totalPrice">0</strong>P</dd>
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
                                        <dd><strong id="totalSettlePrice" class="totalPrice">0</strong>P
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
                                    <button type="button" id="deleteCart" class="btn_order_choice_del">삭제</button>
                                </span>
                            </div>
                            <div class="col-md-6">
                                <span class="btn_right_box">
                                    <button type="button" id="selectedProductPayment">선택 상품 주문</button>
                                    <button type="button" id="allProductPayment">전체 상품 주문</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- //btn_order_box -->
        
                    <em class="chk_none">주문서 작성단계에서 할인/마일리지 적용을 하실 수 있습니다.</em>
            </div>
        </div>
<script>
	$(document).ready(() => {
		$(".quantitySelect").on("change", (event) => {
			var quantity = $(event.target).val();
			var proPrice = $(event.target).parent().parent().next().find(".proPrice").text();
			$(event.target).parent().parent().next().next().find(".sumPrice").text(quantity * proPrice);
			getTotalPrice();
		});
		
		$("#deleteCart").on("click", ()=> {
			var arr = [];
			$("input:checkbox[name='cartSno[]']:checked").each(function(){
				var proNo = $(this).val();
				arr.push(proNo);
			});
			if(arr.length !=0){
				location.href="${path}/cart/delete?list="+arr;
			}else{
				alert("작품을 선택해주세요");
			}
		});
		
		$("#selectedProductPayment").on("click", () => {
			var result = 1;
			$("input:checkbox[name='cartSno[]']:checked").each(function(){
				var value = Number($(this).parent().parent().next().next().next().find(".quantitySelect").val());
				var min = Number($(this).parent().parent().next().next().next().find(".quantitySelect").attr("min"));
				var max = Number($(this).parent().parent().next().next().next().find(".quantitySelect").attr("max"));
				
				if(value < min || value > max){
					result = 0;
				}
			});
			if(result==0){
				alert("구매수량을 적절하게 입력해주세요");
			} else{
				var arr = [];
				var quanarr = [];
				$("input:checkbox[name='cartSno[]']:checked").each(function(){
					var proNo = $(this).val();
					var quantity = $(this).parent().parent().next().next().next().find(".quantitySelect").val();
					arr.push(proNo);
					quanarr.push(quantity);
				});
				if(arr.length !=0){
					location.href="${path}/product/payment?list="+arr+"&quantity="+quanarr;
				}else{
					alert("작품을 선택해주세요");
				}
			}		
		});
		
		$("#allProductPayment").on("click", ()=> {
			var result = 1;
			$("input:checkbox[name='cartSno[]']").each(function(){
				var value = Number($(this).parent().parent().next().next().next().find(".quantitySelect").val());
				var min = Number($(this).parent().parent().next().next().next().find(".quantitySelect").attr("min"));
				var max = Number($(this).parent().parent().next().next().next().find(".quantitySelect").attr("max"));
				
				if(value < min || value > max){
					result = 0;
				}
			});
			if(result==0){
				alert("수량을 다시 입력해주세요.");
			}else{
				var arr = [];
				var quanarr = [];
				$("input:checkbox[name='cartSno[]']").each(function(){
					var proNo = $(this).val();
					var quantity = $(this).parent().parent().next().next().next().find(".quantitySelect").val();
					arr.push(proNo);
					quanarr.push(quantity);
	
				});
				if(arr.length !=0){
					location.href="${path}/product/payment?list="+arr+"&quantity="+quanarr;
				}else{
					alert("장바구니에 작품이 없습니다.");
				}
			}
			
		});
		
		$(".checkProduct").change(function(){
			getTotalPrice();
	    });
		
		$("#allCheck1").change(function() {
			if($("#allCheck1").is(":checked")){
				$('.checkProduct').prop('checked',true);
				getTotalPrice();
	        }else{
	        	$('.checkProduct').prop('checked',false);
				getTotalPrice();
	        }
		});
	});
	
	function getTotalPrice(){
		var arr = [];
		var totalPrice = 0;
		$("input:checkbox[name='cartSno[]']:checked").each(function(){
			totalPrice += Number($(this).parent().parent().next().next().next().next().next().find(".sumPrice").text());
		});

		$(".totalPrice").text(totalPrice);
	}
</script>

  <jsp:include page="/views/common/footer.jsp"/>
