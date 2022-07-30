<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

  <jsp:include page="/views/common/header.jsp"/>

  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>

  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script>
	
  <!-- Eventpage CSS -->
  <link rel="stylesheet" href="${path}/resources/css/event/eventpage.css?after">
  

  
  	<body>
    <!-- 내용 전체 컨테이너  --> 
    <div class="container my-5">
        <div><h2 style="text-align: center;">출석 이벤트</h2></div>
        <div class="container calendar-container">
          
          <script>
         	var calendar = null;
         	$(document).ready(function() {
            var calendarEl = document.getElementById('calendar');
            
            calendar = new FullCalendar.Calendar(calendarEl, {
            	initialView: 'dayGridMonth',
            	headerToolbar: {   
            		left: 'title',             
            		right: 'addEventButton'},
            		  customButtons: {
            	            addEventButton: {
            	              text: '출석 체크',
            	              click: function () {
            	                var date = new Date(); 
            	                var currentDate = date.getFullYear() + "-" + ( date.getMonth() + 1 ) + "-" + date.getDate(); 
            	                calendar.addEvent({
            	                    title: "출석 정보",
            	                    start: date,
            	                    allDay: true, 
            	                $.ajax({
            	           			url: "/event",
            	           			type: "POST",
            	           			data:{
            	           				currentDate
            	           			},
            	           			success: function(data){
            	           				alert(data);
            	           				location.reload();	
            	           			}
            	           		});
            	                });
            	              },
            	            },
            	          },
              eventContent: {
            	  html: `<center><div><img src="${path}/resources/images/event/check.png" class="event-icon" />\</div><center>`,
              }
            });
            calendar.render();
         });
         
        </script>
        <div class="mt-3"><h6 style="text-align: center;">매일 출석 하고 100 마일리지 가져가세요!</h6></div>
        <div class="mt-4" id='calendar'></div>
      </div>
    </div>
    <!-- //본문 끝 contents -->
	</body>
	
<jsp:include page="/views/common/footer.jsp"/>