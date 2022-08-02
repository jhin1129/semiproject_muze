<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
           
	<!-- 두번째 행 -->
	<div class="row">
	  <div class="col-sm-12" style="margin-top: 30px;">
	    <form id="myForm01">
	      <span id="mySpan01">진행 중인 주문</span> 
	      <span id="mySpan02">최근 30일 내 진행중인 주문정보입니다.</span>
	    </form>
	    <!-- 주문상태 -->
	    <fieldset class="mySearchDate2">
	      <div class="container">
	        <div class="row row-cols-6">
	          <div class="col" id="mying1">입금대기</div>
	          <div class="col" id="mying1">결제완료</div>
	          <div class="col" id="mying1">상품준비중</div>
	          <div class="col" id="mying1">배송중</div>
	          <div class="col" id="mying1">배송완료</div>
	          <div class="col" id="mying1">구매확정</div>
	        </div>
	      </div>
	     <c:if test="${ not empty status }">
	      <div class="container">
	        <div class="row row-cols-12">
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro1() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro2() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro3() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro4() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro5() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">${ status.get(status.size() - 1).getPro6() }</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3" hidden>${ status.get(status.size() - 1).getPro7() }</div>
	          <div class="col" id="mying3" hidden>${ status.get(status.size() - 1).getPro8() }</div>
	        </div>
	      </div>
	    </c:if>
		<c:if test="${ empty status }">
	      <div class="container">
	        <div class="row row-cols-12">
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying3"></div>
	          <div class="col" id="mying2">0</div>
	          <div class="col" id="mying3"></div>
	        </div>
	      </div>
	     </c:if>
	    </fieldset>
	  </div>
	</div>
