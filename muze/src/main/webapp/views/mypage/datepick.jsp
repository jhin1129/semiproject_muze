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
     <span id="mySpan01">주문목록 / 배송조회</span> 
   </form>
   <!-- 기간별 검색 -->
   <fieldset class="mySearchDate">
     <form action="${ path }/mypage/search" method="get">
	     <!-- 버튼 -->
	     <div class= "btnsearch" role="group" aria-label="First group">
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn1" >오늘</button>
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn2" >7일</button>
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn3" >15일</button>
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn4" >1개월</button>
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn5" >3개월</button>
	       <button type="button" class="btn btn-outline-secondary" id="srhbtn6" >1년</button>
	
	       <!-- 날짜 -->
	       <input type="text" class="datepicker" name="dateFrom" id="datepicker1" >
	       ~
	       <input type="text" class="datepicker" name="dateTo" id="datepicker2" >
	       
	       <!-- 조회버튼 -->
      	   <button type="submit" class="btn btn-outline-secondary" id="srhbtn7">조회</button>
     	 </div>
     </form>
   </fieldset>
   </div>
 </div>