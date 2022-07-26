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
  <link rel="stylesheet" href="${path}/resources/css/event/eventpage.css">
  

  
  	<body>
    <!-- 내용 전체 컨테이너  --> 
    <div class="container my-5">
        <div><h2 style="text-align: center;">출석 이벤트</h2></div>
        <div class="container calendar-container">
          
          <script>
            $(document).ready(function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            	 headerToolbar: {          
            		 left: 'title',             
            		 right: 'custom'},
            		 
            		 customButtons: { 
            		        custom: {
            		          text: '출석 체크',
            		          id: 'check',
            		          click: function() {	
            		        	  if (id == '') {
      								alert("로그인 하세요");
      								href="${ pageContext.request.contextPath }/views/footer/footerlink1.jsp"
      								return;
      							},
            		        	  $.ajax({
      								type : "post",
      								url : "attendAdd",
      								async : false,
      								dataType : "json",
      								data : {
      									"id" : id
      								},
      								success : function(data) {

      									if (data.result == 1) {
      										alert("출석체크 완료하였습니다.")

      										$("#calendar").fullCalendar('destroy');
            		          }
            		        }
            		    },
            	
              initialView: 'dayGridMonth',
              
              ,events: [
                {
                  start: '2022-07-19',
                  image_url: "${path}/resources/images/event/resizecalendar.png",
                  
                }
                
              ],
              eventContent: {
            	  html: `<center><div><img src="${path}/resources/images/event/resizecalendar.png" class="event-icon" />\</div><center>`,
              },
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