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
         	//\\\var all_events = null;
            //all_events = loadingEvents();
         	
            $(document).ready(function() {
            var calendarEl = document.getElementById('calendar');
            	 
            calendar = new FullCalendar.Calendar(calendarEl, {
            	initialView: 'dayGridMonth',
            	headerToolbar: {   
            		left: 'title',             
            		right: 'addEventButton'},
            		//events: "${ path }/event",
            		events: {
                   			//type: "POST",
                   			url: '${ path }/event',
            			  },
            		/*
            					events: function(info, successCallback, failureCallback) {
            						$.ajax({
            							url: '${ path }/event',
            							type: 'POST',
            							dataType: 'json',
            							data: {
            							},
            							success: function(data) {
            								successCallback(data);
            							}
            						});
            					},*/
            				
            		  customButtons: {
            	            addEventButton: {
            	              text: '출석 체크',
            	              click: function () {
            	            	  if(${ empty loginMember }) {
            	          			alert("로그인 후 이용해주세요");
            	          			location.href = '${ path }/member/login'
        							return;
            	          		}
            	              	var date = new Date(); 
						       	var currentDate = date.getFullYear() + "-" + ( date.getMonth() + 1 ) + "-" + date.getDate(); 
	            	                if (true) {
	            	                  calendar.addEvent({
	            	                    title: "출석 정보",
	            	                    start: date,
	            	                    allDay: true,
	            	                  });
	            	                  alert("출석 체크 완료");
	            	                  check(currentDate); 
	            	                } else {
	            	                  alert("출석 체크 실패");
	            	                }
            	             	 },
            	              },
            	          },
              eventContent: {
            	  html: `<center><div><img src="${path}/resources/images/event/check.png" class="event-icon" />\</div><center>`,
              }
            });
            calendar.render();
         });
         
        
                	
         
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
       	
       	<%--function loadingEvents()
       	{	
   			var return_value = null;
       		$.ajax({
       			type: "POST",
       			url: "${ path }/event",
       			data:{},
       			dataType: 'json',
       			async: false
       		})
       			.done(function(result){
       				return_value = result;
       			})
        		.fail(function(request,status,error){
        			alert("에러 발생 :" + error);
       		})
       		return return_value;
       	} -->
       	
     	<%-- function view() {
	       	$.ajax({
					type: "POST",
					url: "${ path }/event",
					dataType: "json",
					data: {
						list
					},
					success: (list) => {
						console.log(list);
						
						let result = "";
						
						$.each(list, (i) => {
							result += 
								" title : " + "출석 정보" + 
								", start : " + list[i].evAttendDate + 
							    ", allday : " + "true" + 
						});
						console.log(list);
					},
					error: (error) => {
						console.log(list);
					}
				});
			});
       	}--%>
       	
     	<%--function getAttendData() {
       		var items = [];
       		$.ajax({

       			type : "post",
       			url : "${ path }/event",
       			async : false,
       			dataType : "json",
       			data : {
       			},
       			success : function(list) {
       			

       					$.each(list, function(list) {
       						items.push({
       							start : event.attenddate,
       							end : event.attenddate, // 20
       						});
       					})
       			
       				console.log("list=" + items);

       			}

       		});

       		return items;
       	} --%>
       	
  
       	
       	
        </script>
        
        
        <div class="mt-3"><h6 style="text-align: center;">매일 출석 하고 100 마일리지 가져가세요!</h6></div>
        <div class="mt-4" id='calendar'></div>
      </div>
    </div>
    <!-- //본문 끝 contents -->
	</body>
	
<jsp:include page="/views/common/footer.jsp"/>