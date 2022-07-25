<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/views/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

  <!-- mainstyle CSS -->
  <link rel="stylesheet" type="text/css" href="../../CSS/Common/mainstyle.css">

  <!-- eventpage CSS -->
  <link rel="stylesheet" type="text/css" href="../../CSS/Event/eventpage.css">

  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>

  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js'></script>

  <title>eventpage</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <!-- 내용 전체 컨테이너  --> 
    <div class="container my-5">
        <div><h2 style="text-align: center;">출석 이벤트</h2></div>
        <div class="container calendar-container">
          
          <script>
            document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
              initialView: 'dayGridMonth',
              events: [
                {
                  start: '2022-07-19',
                  image_url: "${path}/resources/images/event/resizecalendar.png",
                }
              ],
              eventContent: function(arg) {
                let arrayOfDomNodes = []
                // title event
                let titleEvent = document.createElement('div')
                if(arg.event._def.title) {
                  titleEvent.innerHTML = arg.event._def.title
                  titleEvent.classList = "fc-event-title fc-sticky"
                }
    
                // image event
                let imgEventWrap = document.createElement('div')
                if(arg.event.extendedProps.image_url) {
                  let imgEvent = '<img src="'+arg.event.extendedProps.image_url+'" >'
                  imgEventWrap.classList = "fc-event-img"
                  imgEventWrap.innerHTML = imgEvent;
                }
    
                arrayOfDomNodes = [ titleEvent,imgEventWrap ]
    
                return { domNodes: arrayOfDomNodes }
              }     	  
            });
            calendar.render();
 
         });
        </script>
        <div class="mt-3"><h6 style="text-align: center;">매일 출석 하고 100 마일리지 가져가세요!</h5></div>
        <div class="mt-4" id='calendar'></div>
      </div>
    </div>
        
<!-- Bootstrap JS -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
  crossorigin="anonymous"></script>
</body>
</html>

<jsp:include page="/views/common/footer.jsp"/>