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
        	<h2 style="text-align: center;">작품 등록</h2>
        </div>
        <!-- 후기글 전체 -->
        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">
		
			<form action="${ path }/product/write?type=${ type }" onsubmit="return submitCheck()" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="partistno" value=${ loginMember.memberNo }>
	            <div>
	                <table class="table m-0">
	                    <thead>
	                    <tr>
							<th class="table-active">작품 구분</th>
							<td style="width: 85%;"><select name="type" id="type" style="width: 150px; color: gray;" required>
									<option>작품 주제 선택</option>
									<option value="PORTRAIT">인물</option>
									<option value="LANDSCAPE">풍경</option>
									<option value="STILL-LIFE">정물</option>
									<option value="ABSTRACT">추상</option>
							</select></td>
						</tr>
	                    </thead>
	                    <tbody>
	                    <tr>
	                    	<th class="table-active">작품명</th>
	                    	<td><input type="text" name="pname" id="pname" style="width: 400px; padding-left: 0.5em;" required></td>
	                    </tr>
	                    <tr>
	                    	<th class="table-active">작품 수량(개)</th>
	                    	<td><input type="number" name="pcount" id="pcount" value="0" min="0" max="999" step="1" style="width: 80px; padding-left: 0.5em;" required></td>
	                    </tr>
	                    <tr>
	                    	<th class="table-active">작품 사이즈</th>
	                    	<td><input type="text" name="psize" style="width: 150px; padding-left: 0.5em;" required> &nbsp &nbsp 예시) '80 x 120cm'와 같이 작성</td>
<!-- 	                    	<td><label for="width">가로(cm) : &nbsp</label><input type="text" name="psize" id="width" style="width: 80px; padding-left: 0.5em;" required> &nbsp &nbsp
	                    		<label for="height">세로(cm) : &nbsp</label><input type="text" name="psize" id="height" style="width: 80px; padding-left: 0.5em;" required>
	                    	</td>  -->
	                    </tr>
                        <tr>
                            <th class="table-active">작품 이미지</th>
                            <td><input type="file" name="pimg" id="pimg" class="py-0" required></input></td>
                        </tr>
                        <tr>
                            <th class="table-active">판매 가격(원)</th>
<!--                        <td><input type="text" name="pprice" id="pprice" onkeyup="inputNumberFormat(this)" style="width: 160px; padding-left: 0.5em;" required></td> -->
                            <td><input type="text" name="pprice" id="pprice" style="width: 160px; padding-left: 0.5em;" required></td>
                        </tr>
	                    </tbody>

	                </table>
	            </div>
	
	
	            <!-- 내용 -->
	            <div class="my-3 px-3">
	
					<textarea id="summernote" name="description"></textarea>
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
	                    
	                    $("#content").html(data.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g,'"').replace(/&#40;/g,'(').replace(/&#41;/g,')').replace(/&#35;/g,'#'));

					 </script>
	                
	                <div class="text-right mt-1">
	                    <button type="reset" class="btn btn-light py-0">취소</button>
	                    <button class="btn btn-light py-0">작성</button>
	                </div>
	            </div>
			</form>
        </div>
        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-light text-nowrap" onclick="location.href='${path}/board/list?type=${ type }'">목록</button>
        </div>
    </div>
    
<script>
	function submitCheck() {
		if($("#type").val().trim()==""){
			alert("작품 주제를 선택해 주세요");
			return false;
		}
		if($("#pname").val()==""){
			alert("작품명을 입력해 주세요");
			return false;
		}
		if($("#pcount").val()==""){
			alert("작품 수량을 입력해 주세요");
			return false;
		}
		if($("#pimg").val()==""){
			alert("작품 이미지를 등록해 주세요");
			return false;
		}
		if($("#pimg").val()==""){
			alert("작품 이미지를 등록해 주세요");
			return false;
		}
		if($("#proPrice").val()==""){
			alert("작품 가격을 입력해 주세요");
			return false;
		}
	};
	
	 function inputNumberFormat(obj) {
	     obj.value = comma(uncomma(obj.value));
	 }

	 function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

	 function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }
	 
</script>
<jsp:include page="/views/common/footer.jsp"/>