<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jQuery js -->
    <script src="${ path }/resources/js/common/jquery-3.6.0.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!-- Mainstyle CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/common/mainstyle.css?after">

    <title>Document</title>
</head>

<body onresize="parent.resizeTo(600,600)" onload="parent.resizeTo(600,600)">
	<div style="overflow-y: scroll; height: 480px;">
	
		<c:forEach var="product" items="${ list }" varStatus="status">
			<c:if test="${status.count % 2 == 1}">
				<div class="row my-5 mx-0" style="width: 100%;">
					<div class="col-1"></div>
			</c:if>
	    	<div class="col-5 px-4" onclick="selectProduct(${product.proNo}, '${product.proName }', '${product.proImg }','${product.proArtistName }');">
	            <div class="card " style="width: 100%;">
	                <img src='${path}/resources/upload/product/painting/${fn:replace(product.proImg,"\\","/")}' width="100%" height="188px">
	                <div class="card-body p-1">
	                    <h5 class="card-title m-0">${ product.proName }</h5>
	                </div>
	            </div>
	        </div>
       		<c:if test="${status.count %2 == 0 && !status.last}">
		    	</div>
			</c:if>
			<c:if test="${status.last}">
		  		</div>
			</c:if>
		        
				
		</c:forEach>
	</div>
	<div class="text-center mt-1">
	    <button class="btn btn-light text-nowrap" onclick="self.close();">닫기</button>
	</div>
	
	<script>
			function selectProduct(proNo, proName, proImg, proArtistName) {
				opener.document.getElementById("proNo").value = proNo;
				opener.document.getElementById("product").value = proName;
				opener.document.getElementById("proName").innerText = proName;
				opener.document.getElementById("proImg").src = '${path}/resources/upload/product/painting/' + proImg;
				opener.document.getElementById("proArtistName").innerText = proArtistName;
				window.close();
			}
	</script>
    <!-- Bootstrap JS -->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>

</html>