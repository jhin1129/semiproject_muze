<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/views/common/header.jsp"/>

 <script>
    //상품을 추가하기위한 정보를 담아 insert.do로 보내는 자바스크립트 함수
    function product_write() {
 
        var product_name = document.form1.product_name.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품이름을 반환해서 name에 저장함
        var price = document.form1.price.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 값을 반환해서 price에 저장함
        var description = document.form1.description.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 정보를 반환해서 description에 저장함
        
        //document.form.은 폼페이지에 있는 값을 반환한다는 뜻.
 
        if (product_name == "") { //상품 이름이 입력되어 있지 않으면
            alert("상품명을 입력하세요");
            document.form1.product_name.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        if (price == "") { //상품가격이 입력되어 있지 않으면
            alert("가격을 입력하세요");
            document.form1.price.focus(); //form1페이지에 있는 "가격을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        if (description == "") { //상품설명이 입력되어 있지 않으면
            alert("상품설명을 입력하세요");
            document.form1.description.focus(); //form1페이지에 있는 "상품설명을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        // input 태그를 마우스로 클릭하여 입력상태로 만든것을 포커스를 얻었다고 한다.
       // 그리고 입력상태를 떠난 것을 포커스가 벗어났다고 한다.
        

        document.form1.action = "${path}/product/painting/writer"; //페이지로 form1에 저장된 자료를 전송함
        document.form1.submit();
    }
 </script>


    <div class="container">
        <div class="row">
            <div class="col">
                <div>
        	<c:if test="${ type == 'Pwriter'}">
            	<h2 style="text-align: center;"><a href="${path }/product/writer?type=Pwriter">회화 작품등록</a></h2>
           	</c:if>
        	<c:if test="${ type == 'Owriter'}">
            	<h2 style="text-align: center;"><a href="${path }/product/writer?type=Owriter">유화 작품등록</a></h2>
           	</c:if>
           	<c:if test="${ type == 'Cwriter'}">
            	<h2 style="text-align: center;"><a href="${path }/product/writer?type=Cwriter">조소 작품등록</a></h2>
           	</c:if>
        </div>
            </div>
        </div>
        <hr class="mt-4">

        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">

            <div>
            	<form name="form1" action="${ path }/product/writer?type=${type}" method="POST" enctype="multipart/form-data">
                <table class="table m-0">
                    <thead>
                    	<input type="hidden" name="flag" value="i">
                    	<tr>
                            <th class="table-active" style="width: 20%;">작품타입</th>
                            <td style="width: 80%;"><input type="text" name="ptype" placeholder="회화, 조소, 유화" style="width: 80%;">
                            </td>

                        </tr>
                        <tr>
                            <th class="table-active" style="width: 20%;">상품명</th>
                            <td style="width: 80%;"><input type="text" name="pname" placeholder="제목을 입력해주세요." style="width: 80%;">
                            </td>

                        </tr>
                        <tr>
                            <th class="table-active" style="width: 20%;">상품 사이즈</th>
                            <td style="width: 80%;"><input type="text" name="psize" placeholder="Cm사이즈 입니다. 예) 세로 x 가로." style="width: 80%;">
                            </td>

                        </tr>
                                                <tr>
                            <th class="table-active" style="width: 20%;">상품 수량</th>
                            <td style="width: 80%;"><input type="text" name="pcount" placeholder="수량을 입력해주세요." style="width: 80%;">
                            </td>

                        </tr>
                    </thead>

                    <tbody>


                        <tr>
                            <th class="table-active">작품 이미지</th>
                            <td>
                                <input type="file" name="pimg"></input>
                                
                            </td>
                        </tr>

                        <tr>
                            <th class="table-active">가격</th>
                            <td style="width: 80%;"><input type="text" name="pprice" placeholder="가격을 입력해주세요." style="width: 80%;">
                            </td>
                        </tr>
                        <tr>
                			<td>상품설명</td>
               				<td><textarea rows="5" cols="60" name="description"
                        	id="description" placeholder="작품 설명을 입력해주세요."></textarea></td>
           			    </tr>
           			    <tr>
           			    	<th>
           			    		<input class="btn btn-light py-0" type="submit" value="등록">
           			    	</th>
           			    </tr>
                    </tbody>

                </table>
            	</form>
            </div>



            </div>


            <hr style="border-style: dotted;">


        </div>
    </div>



<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>