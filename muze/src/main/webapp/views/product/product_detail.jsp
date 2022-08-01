<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

    <div class="container my-5">
        <div>
            <div class="card" style="border: none;">
                <div class="row g-0 p-5">
                    <!-- 이미지 -->
                    <div class="col-6" style="min-width: 254px; width: 100%;">
                        <img style="background-color: black; width: 445px; height: 445px;" class="rounded-start">
                    </div>
                    <div class="col-1"></div>
                    <!-- 이미지 상세내용 -->
                    <div id="div1" class="col-5">
                        <div class="card-body py-0">
                            <h4 class="card-title">${product.proName }</h4>
                            <p class="my-0">${product.proArtistName }</p>
                            <hr class="my-2">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 30%;">자체상품코드</td>
                                    <td>${product.proNo }</td>
                                </tr>
                                <tr>
                                    <td>사이즈</td>
                                    <td>${product.proSize }</td>
                                </tr>
                                <tr>
                                    <td>제작방식</td>
                                    <td>${product.proType }</td>
                                </tr>
                                <tr>
                                    <td>소재</td>
                                    <td>소재 컬럼은 안만들었었군</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mb-2">수량</div>
                                    </td>
                                    <td>
                                        <div class="mb-2">${product.proQuantity }</div>
                                    </td>
                                </tr>
                                <tr
                                    style="border-top: 1px solid rgba(0,0,0,.1); border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="my-2">판매가</div>
                                    </td>
                                    <td>${product.proPrice }</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mt-2">수량선택</div>
                                    </td>
                                    <td>
                                        <input id="quantitySelect" class="mt-2" type="number" min="1" max="${product.proQuantity }" value="1">
                                    </td>
                                </tr>
                                <tr style="border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="mb-2">총 합계금액</div>
                                    </td>
                                    <td>
                                        <div id="totalPrice" class="mb-2">${product.proPrice }</div>
                                    </td>
                                </tr>
                            </table>

                            <table class="my-2" style="width: 100%;">
                                <tr>
                                    <td style="width: 50%;">
                                        <div onclick="location.href='${path}/board/list?type=REVIEW&searchType=proNo&searchVal=${product.proNo }&isSearch=true'" class="py-2 text-center"
                                            style="border: 1px solid; width: 100%; height: 100%;">리뷰 확인</div>
                                    </td>
                                    <td style="width: 50%;">
                                        <div class="py-2 text-center"
                                            style="border: 1px solid; width: 100%; height: 100%;">장바구니</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <div class="col-12 my-2 py-2 text-center" style="border: 1px solid;">구매하기</div>
                                    </td>
                                </tr>
                            </table>


                        </div>
                    </div>
                </div>
            </div>

            <h3>추천 상품 보기</h3>

            <div class="row my-5">


                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
            </div>

            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#artistIntroduce" style="height: 55px; line-height: 40px;">작가 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#productIntroduce" style="height: 55px; line-height: 40px;">작품 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#orderIntroduce" style="height: 55px; line-height: 40px;">배송 및 교환 안내</a>
                </li>
            </ul>

            <div>
            	<div id="artistIntroduce">
            		<h1 class="mt-5" style="text-align:center;">ABOUT ARTIST</h1>
	                <div class="card" style="border: none;">
	                    <div class="row g-0 p-5">
	                        <!-- 이미지 -->
	                        <div class="col-6" style="min-width: 254px; width: 100%;">
	                            <img style="background-color: black; width: 445px; height: 445px;" class="rounded-start">
	                        </div>
	                        <div class="col-1"></div>
	                        <!-- 이미지 상세내용 -->
	                        <div class="col-5">
	                            <div class="card-body py-0">
	                                <h2>작가 이름</h2>
	                                <p>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                    작가 소개~~~~~~~~~~<br>
	                                </p>
	    
	                            </div>
	                        </div>
	                    </div>
	                </div>
            	</div>

                <div id="productIntroduce" class="p-5">
       	            <h1 class="mt-5" style="text-align:center;">ABOUT PRODUCT</h1>
                	
                    <img class="mt-5" style="background-color: black; width: 100%; height: 700px;">
                    <p>
                        ${product.proDescription }
                    </p>
                </div>

                <div id="orderIntroduce" class="p-5">
       	            <h1 class="mt-5" style="text-align:center;">ABOUT DELIVERY & SERVICE</h1>
                	
                	<div class="mt-5">
	                    <h3>배송 안내</h3>
	                    <p>- 배송비는 별도로 추가되지 않습니다.</h5>
	                    
	                    <h3>배송 기간</h3>
	                    <p>
		                    - MUZE의 제품은 결제 후 아티스트가 배송을 승인하는 대로 배송이 시작됩니다.<br>
		                    - 아티스트가 배송을 승인한 후 평균 5~7일 소요됩니다.<br>
		                    - 해외 보유 재고를 수입하여 제작되거나 대량 주문일 경우, 그 외 아티스트 사정에 따라<br>
	                   	    &nbsp;&nbsp;&nbsp;7일~2주 정도 추가될 수 있으며, 별도 안내를 드립니다.
	                    </p>
	                    
	                    <h3>취소 및 환불 안내</h3>
	                    <p>
	                    	- 작품의 주문 취소는 아티스트가 배송을 승인하기 전까지 가능합니다.<br>
	                    	&nbsp;&nbsp;&nbsp;그 이후에는 환불 처리가 이루어집니다.<br>
	                    	- 작품에 하자가 있을 시 상품 수령일로부터 7일 이내에 연락을 주셔야 환불 처리가 가능합니다.<br>
	                    </p>
	                    
	                    <h3>교환 및 환불이 불가능한 경우</h3>
	                    <p>
	                    	- 구매자의 사용 또는 일부 소비에 의해 상품가치가 현저히 감소한 경우<br>
	                    	- 밀봉 포장을 개봉했거나, 내부 포장재를 분실한 경우 또는 전면 보호 필름을 제거한 경우<br>
	                    	 &nbsp;&nbsp;&nbsp;(상품 내용 확인을 위해 포장 박스를 개봉한 경우는 제외)<br>
	                    	- 오랜 시간이 경과되어 재 판매가 어려울 정도로 상품 가치가 상실된 경우<br>
	                    	- 기타 전자 상거래 등에서의 소비자 보호법에 관한 법률이 정하는 청약 철회 제한 사유에 해당하는 경우
	                    </p>
                	</div>
                </div>
            </div>
        </div>

    </div>
	
	<script>
		$("#quantitySelect").on("change", () => {
			$("#totalPrice").text(${product.proPrice} * $("#quantitySelect").val());
		});
	</script>

<jsp:include page="/views/common/footer.jsp"/>