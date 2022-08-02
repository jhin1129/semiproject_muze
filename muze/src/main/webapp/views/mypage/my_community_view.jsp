<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- header -->
<jsp:include page="/views/common/header.jsp"/>

    <!-- my CSS -->
	<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 
	<style>
		
		 textarea:focus {
		     outline: none;
		 }
		
		 table th,
		 table td {
		     white-space: nowrap;
		 }
		
		 #th,
		 #td {
		     padding-top: 10px;
		     padding-bottom: 10px;
		 }
		 
		 .table-active{
		 	background-color : white;
		 	font-weight : 600;
		 	text-align : center;
		 }
		 
		 #srhbtn8{
		    border: 1px solid lightgray;
		    margin-bottom: 3px;
		    padding-bottom: 5px;
		    border-radius: 3%;
		    height: 34px;
		    font-size: 0.8em;
		}
		 
	</style>

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
      <div class="row">

        <!-- 왼쪽 그리드 -->
        <div class="col-sm-2" >
        	<!--사이드 메뉴 -->
        	<jsp:include page="/views/mypage/welcome_side.jsp" flush="false"/>
        </div>

        <!-- 오른쪽 그리드 -->
        <div class="col-sm-10">
          <!-- 컨테이너 -->
          <div class="container">
            <!-- 첫번째 행 -->
            <div class="row">
              <div class="col-sm-12" style="margin-top: 40px;">
                  <span id="mySpan01">나의 게시글</span> 
                  <hr style="margin-bottom: 0;">
              </div>
            </div>
            
            <!-- 두번째 행 -->
        <div class="mt-5">
                  <div>
        	<c:if test="${ type == 'REVIEW'}">
	            <h2 style="text-align: center;"><a href="${path }/board/list?type=REVIEW">리뷰 게시판</a></h2>
        	</c:if>
        	<c:if test="${ type == 'FREE'}">
	            <h2 style="text-align: center;"><a href="${path }/board/list?type=FREE">자유 게시판</a></h2>
        	</c:if>
        </div>
        <!-- 후기글 전체 -->
        <div class="mt-5">

            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <td style="width: 100%; font-size : 1.3em; font-weight : 500; " colspan="5" ><center>${board.brdTitle}안녕하세요</center></td>
                        </tr>
                    </thead>

                    <tbody>
                         <tr>
                            <td style="width: 80%;" ></td>
                            <th class="table-active" style="width: 5%;">작성자</th>
                            <td>${board.brdWriterId } 내 이름 </td>
                            <th class="table-active" style="width: 5%;" >작성일</th>
                            <td>${board.brdDate } 22 / 07 / 30 </td>
                        </tr>
                       	<c:if test="${ type == 'REVIEW'}">
	                        <tr>
	                            <th class="table-active" style="width: 10%;">리뷰 작품</th>
	                            <td>${product.proName } 작품 이름</td>
	                        </tr>
                        </c:if> 
                    </tbody>

                </table>
            </div>

            <!-- 내용 -->
            <div class="my-3 px-3">
                <p style="font-weight : 300;">
                    ${ board.brdContent }
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                    내용 내용 <br>
                </p>
                <div class="text-right">
                	 <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/board/update?no=${ board.brdNo }&type=${ type }'" id="srhbtn8">수정</button>
                	 <button type="button" id="btnDelete" class="btn btn-outline-secondary" style="font-size: 0.8em;" >삭제</button>
                </div>
            </div>

            
            <c:if test="${ type == 'REVIEW'}">
            
	            <hr style="border-style: dotted;">
	            <!-- 리뷰 속 작품 -->
	            <div class="px-3 pb-3">
	                <h4>리뷰 속 작품</h4>
	
	                <div class="card">
	                    <div class="row g-0">
	                        <!-- 이미지 -->
	                        <div class="col-md-4" style="min-width: 254px;">
	                            <img style="background-color: black; width: 254px; height: 254px;" class="rounded-start">
	                        </div>
	                        <!-- 이미지 상세내용 -->
	                        <div class="col-md-8">
	                            <div class="card-body">
	                                <h5 class="card-title">${product.proName }</h5>
	                                <p class="card-text">${product.proDescription }</p>
	                                <p class="card-text"><small class="text-muted">${product.proArtistName}</small></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
            </c:if>

            <hr>
            <!-- 댓글 -->

	        </div>
	        <!-- 목록버튼 -->
	        <div class="text-center mt-3 mb-5">
	            <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/board/list?type=${type}'" id="srhbtn8">목록</button>
	        </div>
      	  </div>	
        </div>
      </div>
      <!-- 오른쪽 그리드 끝 -->
    </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    <script>
	$(document).ready(() => {
		$("#btnDelete").on("click", ()=> {
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.replace("${path}/board/delete?no=${board.brdNo}&type=${board.brdType}");
			}
		});
		
		$("#fileDown").on("click", ()=> {
			location.assign("${path}/board/fileDown?oname=${board.brdOriginalFileName}&rname=${board.brdRenamedFileName}");
		});
	});
	</script>
    
	<!-- footer -->
	<jsp:include page="/views/mypage/welcome_footer.jsp"/>