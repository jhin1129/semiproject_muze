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
            		right: 'addEventButton'
            	},

            	customButtons: {
            	    addEventButton: {
            	        text: '출석 체크',
            	        click: function () {
            	            if(${ empty loginMember }) {
            	          		alert("로그인 후 이용해주세요");
            	          		location.href = '${ path }/member/login';
        						return;
            	          	}
	            	    	insertEvent();
            	        },
            	    },
            	},
            	
              	eventContent: {
            	  	html: `<center><div><img src="${path}/resources/images/event/check.png" class="event-icon" />\</div><center>`,
              	}
            });

            calendar.render();
            
	            var date = new Array();
				<c:forEach var="event" items="${list}" varStatus="status">
					date.push("${event.evAttendDate}");
				</c:forEach>
				
				for(var i = 0; i < date.length; i++){
					calendar.addEvent({
		            	title: "출석 정보",
		            	start: date[i],
		            	allDay: true
		            });
				}
			});
         
		
		function insertEvent(){
			$.ajax({
				type: "POST",
				url: "${path}/event",
				success: function(isAlreadyEvent){
					if(isAlreadyEvent == true){
						alert("이미 출석하셨습니다.");
					} else {
						calendar.addEvent({
			            	title: "출석 정보",
			            	start: new Date(),
			            	allDay: true
			            });
						alert("출석 완료되었습니다.");
					}
				},
				error: function(){
					alert("출석에 실패하였습니다");
				}
			})
		}
                	
         
        //출석체크 날짜를 controller로 보내줌
       	function check(currentDate) {
       		$.ajax({
       			type: "POST",
       			url: "${ path }/event",
       			data:{
       				checkDate: currentDate
       			},
       			success: function(data){
				
       			},
        		// AJAX 통신 성공 여부와 상관없이 실행될 콜백 함수
        		complete: function() {
					console.log("complete");						
				}
       		});
       	};
       	
        </script>
        
        <div class="mt-3"><h6 style="text-align: center;">매일 출석 하고 100 마일리지 가져가세요!</h6></div>
        <div class="mt-4" id='calendar'></div>
      </div>
    </div>
    <!-- //본문 끝 contents -->
	</body>
	
<jsp:include page="/views/common/footer.jsp"/>