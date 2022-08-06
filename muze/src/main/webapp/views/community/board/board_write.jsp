<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>

<script src="${ path }/resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<link rel="stylesheet" href="${ path }/resources/summernote-0.8.18-dist/summernote-lite.css">
    
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
        <!-- 후기글 전체 -->
        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">
		
			<form action="${ path }/board/write?type=${type}" onsubmit="return submitCheck()" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="writerNo" value=${ loginMember.memberNo }>
	            <div>
	                <table class="table m-0">
	                    <thead>
	                        <tr>
	                            <th class="table-active" style="width: 20%;">제목</th>
	                            <td style="width: 80%;">
	                            	<input type="text" id="title" name="title" placeholder="제목을 입력해주세요." style="width: 80%;">
	                            </td>
	                        </tr>
	                    </thead>
	
	                    <tbody>
	                        <tr>
	                            <th class="table-active">작성자</th>
	                            <td>
	                            	<input type="text" name="writer" value=${loginMember.memberId } readonly style="border: 0px;">
	                            </td>
	                        </tr>
	                       	<c:if test="${ type == 'REVIEW'}">
	                        <tr>
	                            <th class="table-active">리뷰 작품</th>
	                            <td>
	                            	<button type="button" id="btnFindProduct" class="btn btn-light py-0">찾아보기</button>
	                            	<input type="text" id="product" name="product" readonly style="border: 0px;">
	                            	<input type="hidden" id="proNo" name="proNo">
	                            </td>
	                        </tr>
							</c:if>
	                        <tr>
	                            <th class="table-active">첨부 파일</th>
	                            <td>
	                                <input type="file" name="upfile" class="py-0"></input>
	                            </td>
	                        </tr>
	                    </tbody>
	
	                </table>
	            </div>
	
	
	            <!-- 내용 -->
	            <div class="my-3 px-3">
	
					<textarea id="summernote" name="content"></textarea>
	                <script>
	                    $('#summernote').summernote({
	                        placeholder: '내용을 입력해주세요',
	                        focus: true,
	                        height: 400,
	                        toolbar: [
	                            // [groupName, [list of button]]
	                            ['fontname', ['fontname']],
	                            ['fontsize', ['fontsize']],
	                            ['color', ['color']],
	                            ['style', ['bold', 'italic', 'underline', 'clear']],
	                            ['para', ['ul', 'ol', 'paragraph']],
	                            ['insert', ['picture']],
	                            ['height', ['height']]
	                        ],
	                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
	                        // 추가한 폰트사이즈
	                        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
	                        // 줄간격
	                        lineHeights: ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0'],
							
	                    	callbacks: {
	                    		onImageUpload : function(files, editor, welEditable){
	                    			for(var i = files.length -1; i>=0; i--){
	                    				uploadSummerNoteImageFile(files[i], this);
	                    			}
	                    		}
	                    	}
	                    });
	                    
	                    function uploadSummerNoteImageFile(file, editor) {
	                    	var data = new FormData();
	                    	data.append("file", file);
	                    	$.ajax({
	                    		url: "${path}/board/imageupload",
	                    		type: "POST",
	                            enctype: 'multipart/form-data',
	                            data: data,
	                            dataType: "json",
	                            cache: false,
	                            contentType : false,
	                            processData : false,
	                            success : function(data){
	                            	$(editor).summernote('editor.insertImage', data.url);
	                            },
	                            error : function(e){
	                            	console.log(e);
	                            }
	                    	});
	                    }
	                    
	                </script>
	
	
	
	                <div class="text-right mt-1">
	                    <button type="button" onclick="location.href='${path}/board/list?type=${type}'" class="btn btn-light py-0">취소</button>
	                    <button class="btn btn-light py-0">작성</button>
	                </div>
	            </div>
			</form>

			<c:if test="${ type == 'REVIEW' }">
	            <hr style="border-style: dotted;">
	            <!-- 리뷰 속 작품 -->
	            <div class="px-3 pb-3">
	                <h4>리뷰 속 작품</h4>
	
	                <div class="card">
	                    <div class="row g-0">
	                        <!-- 이미지 -->
	                        <div class="col-md-4" style="min-width: 254px;">
	                            <img id="proImg" style="background-color: white; width: 254px; height: 254px;" class="rounded-start">
	                        </div>
	                        <!-- 이미지 상세내용 -->
	                        <div class="col-md-8">
	                            <div class="card-body">
	                                <h3 id="proName" class="card-title"></h3>
	                                <h5 id="proArtistName" class="card-text"><small class="text-muted"></small></h5>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
			
			</c:if>

        </div>
        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-light text-nowrap" onclick="location.href='${path}/board/list?type=${ type }'">목록</button>
        </div>
    </div>
    
<script>
	function submitCheck() {
		if($("#title").val().trim()==""){
			alert("제목을 입력해주세요");
			return false;
		}
		if($("#proNo").val()==""){
			alert("리뷰작품을 선택해주세요");
			return false;
		}
	};
	$(document).ready(() => {
		$("#btnFindProduct").on("click", () => {
			let url ="${path}/board/findProduct?memberNo=${loginMember.memberNo}";
			let status = "left=500px,top=200px,width=600px,height=600px";
			
			open(url,"",status);
		});
	});
	
</script>
<jsp:include page="/views/common/footer.jsp"/>
