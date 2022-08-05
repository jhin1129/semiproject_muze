<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<style>
	 .comment p {
	     margin: 0px;
	 }
	
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
</style>
    <!-- 내용 전체 컨테이너 -->
    <div class="container mt-5">

        <div>
        	<c:if test="${ type == 'REVIEW'}">
	            <h2 style="text-align: center;"><a style="text-decoration-line: none;" href="${path }/board/list?type=REVIEW">리뷰 게시판</a></h2>
        	</c:if>
        	<c:if test="${ type == 'FREE'}">
	            <h2 style="text-align: center;"><a style="text-decoration-line: none;" href="${path }/board/list?type=FREE">자유 게시판</a></h2>
        	</c:if>
        </div>
        
        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">

            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">제목</th>
                            <td style="width: 50%;">${board.brdTitle }</td>
                            <td style="width: 15%;"></td>
                            <td style="width: 15%;"></td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="table-active">작성자</th>
                            <td>${board.brdWriterId }</td>
                            <th class="table-active">작성일</th>
                            <td>${board.brdDate }</td>
                        </tr>
                       	<c:if test="${ type == 'REVIEW'}">
	                        <tr>
	                            <th class="table-active">리뷰 작품</th>
	                            <td>${product.proName }</td>
	                            <td></td>
	                            <td></td>
	                        </tr>
                        </c:if>
                        <tr>
                            <th class="table-active">첨부파일</th>
                            <td>
								<c:if test="${ empty board.brdOriginalFileName }">
									<span>-</span>
								</c:if>
								<c:if test="${ not empty board.brdOriginalFileName }">
									<img src="${ path }/resources/images/board/file.png" width="20px" height="20px">
									<a href="javascript:" id="fileDown">
										<span>${ board.brdOriginalFileName }</span>
									</a>
									<%-- 
									<br><a href="${ path }/resources/upload/board/${board.renamedFileName}"
										download="${ board.originalFileName }">파일 다운</a>
									--%>
								</c:if>
							</td>
							<td></td>
							<td></td>
                        </tr>
                    </tbody>

                </table>
            </div>

            <!-- 내용 -->
            <div class="my-3 px-3">
            	<div style="min-height: 400px;">
	                <p>
	                    ${ board.brdContent }
	                </p>
            	</div>
                <c:if test="${ loginMember.memberNo == board.brdWriterNo }">
	                <div class="text-right">
	                    <button onclick="location.href='${path}/board/update?no=${ board.brdNo }&type=${ type }&brdWriterNo=${board.brdWriterNo }'" class="btn btn-light py-0">수정</button>
	                    <button id="btnDeleteBoard" class="btn btn-light py-0">삭제</button>
	                </div>
                </c:if>
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
	                            <img src="${path}/resources/upload/product/painting/${product.proImg}" style="background-color: white; width: 254px; height: 254px;" class="rounded-start">
	                        </div>
	                        <!-- 이미지 상세내용 -->
	                        <div class="col-md-8">
	                            <div class="card-body">
	                                <h3 class="card-title">${product.proName }</h3>
	                                <h5 class="card-text"><small class="text-muted">${product.proArtistName}</small></h5>
	                                <div class="text-right" style="margin-top:100px">
	                                	<a href="${path}/product/view?proNo=${ product.proNo }" class="btn btn-light">작품 상세보기</a>
	                    			</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
            </c:if>

            <hr style="border-style: dotted;">
            <!-- 댓글 -->
            <div id="comment-container" class="px-3">
                <h4>댓글</h4>
                <hr>
				<div id="comment-list">
					<c:forEach var="comments" items="${ commentsList }">
	                <div class="comment">
	                	<input id="commentsNo" type="hidden" value="${ comments.commentsNo}">
	                	<input id="commentsWriterNo" type="hidden" value="${comments.commentsWriterNo }" >
	                    <p style="font-weight: bold; margin: 0px;">${comments.commentsWriterId }</p>
	                    <p class="commentsContent">${comments.commentsContent }</p>
	                    <div class="row m-0">
	                        <p class="mt-2 col p-0" style="font-size: 11px;">${comments.commentsDate }</p>
                            <c:if test='${ loginMember.memberNo == comments.commentsWriterNo }'>
	                        <div>
	                            <button onclick="updateComments(event)" class="btn btn-light py-0">수정</button>
	                            <button onclick="deleteComments(event)" class="btn btn-light py-0">삭제</button>
	                        </div>
	                        </c:if>
	                    </div>
	
	                    <hr>
	                </div>
                    <div class="mb-3 comment-editor" style="display:none;">
                    	<div class="form-control" style="height: 85px;">
                        	<p class="commentsWriterId" style="font-weight: bold; margin: 0px;"></p>
                        	<hr style="margin: 0px;">
                        	<textarea id="updateCommentsContent" style="border: none; resize: none; width: 100%;"
                            placeholder="댓글을 작성해주세요"></textarea>
                        </div>
	                    <div class="text-right mt-1">
	                        <button onclick="updateCommentsCancel(event)" class="btn btn-light py-0">취소</button>
	                        <button onclick="updateCommentsCommit(event)" class="btn btn-light py-0">작성</button>
	                    </div>
                    </div>
					</c:forEach>
				</div>

                <div id="comment-editor" class="mb-3">
                    <div class="form-control" style="height: 85px;">
                        <p id="loginId" style="font-weight: bold; margin: 0px;">${loginMember.memberId }</p>
                        <hr style="margin: 0px;">
                        <textarea id="commentsContent" onfocus="loginCheck();" style="border: none; resize: none; width: 100%;"
                            placeholder="댓글을 작성해주세요"></textarea>
                    </div>
                    <div class="text-right mt-1">
                        <button onclick="writeComments();" class="btn btn-light py-0">작성</button>
                    </div>
                </div>
            </div>

        </div>
        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-light text-nowrap" onclick="location.href='${path}/board/list?type=${type}'">목록</button>
        </div>
    </div>
<script>

	$(document).ready(() => {
		$("#btnDeleteBoard").on("click", ()=> {
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.replace("${path}/board/delete?no=${board.brdNo}&type=${board.brdType}&brdWriterNo=${board.brdWriterNo }");
			}
		});
		
		$("#fileDown").on("click", ()=> {
			location.assign("${path}/board/filedown?oname=${board.brdOriginalFileName}&rname=${board.brdRenamedFileName}");
		});
		
	});
	function loginCheck(){
		if(${ empty loginMember }) {
			alert("로그인 후 이용해주세요");
			
			$("#commentsContent").blur();
		}
	}	
	
	function writeComments() {
		
		if($("#commentsContent").val().trim()==""){
			alert("내용을 입력해주세요");
		} else{
			$.ajax({
				url: "${path}/board/commentswrite",
				type: "POST",
				dataType: "json",
				data: {
					"brdNo" : ${board.brdNo},
					"commentsContent" : $("#commentsContent").val()
				},
				success: function(data) {
					let html = "<div class='comment'>";
					html += "<input id='commentsNo' type='hidden' value="+ data.commentsNo + ">";
					html += "<input id='commentsWriterNo' type='hidden' value=" + data.commentsWriterNo +">";
					html += "<p style='font-weight: bold; margin: 0px;'>"+data.commentsWriterId+"</p>";
					html += "<p class='commentsContent'>"+data.commentsContent+"</p>";
					html += "<div class='row m-0'>";
					html += "<p class='mt-2 col p-0' style='font-size: 11px;'>"+ data.commentsDate + "</p>";
					html += "<div><button onclick='updateComments(event)' class='btn btn-light py-0'>수정</button>";
					html += "<button onclick='deleteComments(event)' class='btn btn-light py-0'>삭제</button></div></div><hr></div>";
					html += "<div class='mb-3 comment-editor' style='display:none;'>";
					html += "<div class='form-control' style='height: 85px;'>";
					html += "<p class='commentsWriterId' style='font-weight: bold; margin: 0px;'></p>";
					html += "<hr style='margin: 0px;'>";
					html += "<textarea id='updateCommentsContent' style='border: none; resize: none; width: 100%;' placeholder='댓글을 작성해주세요'></textarea>";
					html += "</div>";
					html += "<div class='text-right mt-1'>";
					html += "<button onclick='updateCommentsCancel(event)' class='btn btn-light py-0'>취소</button>";
					html += "<button onclick='updateCommentsCommit(event)' class='btn btn-light py-0'>작성</button>";
					html += "</div></div>";
					
					$("#comment-list").append(html);

					$("#commentsContent").val('');
				},
				error: (error) => {
					alert("댓글 작성 실패");
				}
			});
		}
		
	}
	
	function deleteComments(event) {
		$.ajax({
			url: "${path}/board/commentsdelete",
			type: "POST",
			dataType: "json",
			data: {
				"commentsNo" : $(event.target).parent().parent().siblings("#commentsNo").val(),
				"commentsWriterNo" : $(event.target).parent().parent().siblings("#commentsWriterNo").val()
			},
			success: function() {
				$(event.target).parents(".comment").remove();
			},
			error: (error) => {
				alert("댓글 삭제 실패");
			}
		});
	}
	
	function updateComments(event) {
		$(event.target).parents(".comment").hide();
		$(event.target).parents(".comment").next().show();
		$(event.target).parents(".comment").next().find("#updateCommentsContent").val($(event.target).parent().parent().prev().text());
		$(event.target).parents(".comment").next().find(".commentsWriterId").text($(event.target).parent().parent().prev().prev().text());
	}
	
	function updateCommentsCancel(event) {
		$(event.target).parent().parent().hide();
		$(event.target).parent().parent().prev().show();
	}
	
	function updateCommentsCommit(event){
		$.ajax({
			url: "${path}/board/commentsupdate",
			type: "POST",
			dataType: "json",
			data: {
				"commentsNo" : $(event.target).parent().parent().prev().find("#commentsNo").val(),
				"commentsContent" : $(event.target).parent().prev().find("#updateCommentsContent").val(),
				"commentsWriterNo" : $(event.target).parent().parent().prev().find("#commentsWriterNo").val()
			},
			success: function() {
				$(event.target).parent().parent().hide();
				$(event.target).parent().parent().prev().show();
				$(event.target).parent().parent().prev().find(".commentsContent").text($(event.target).parent().prev().find("#updateCommentsContent").val());
			},
			error: (error) => {
				alert("댓글 수정 실패");
			}
			
		});
	}
</script>    
    
<jsp:include page="/views/common/footer.jsp"/>
