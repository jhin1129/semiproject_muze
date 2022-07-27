<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	     <!-- 버튼 -->
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
	       