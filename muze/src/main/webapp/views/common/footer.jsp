<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<footer class="bg-light text-center text-lg-start">
	<div style="background-color: #F7F7F7;">
		<!-- Grid container -->
		<div class="container p-4" style="background-color: #F7F7F7;">
			<!--Grid row-->
			<div class="row">
				<!--Left Grid column-->
				<div class="col-lg-6 col-md-12 mb-4 mb-md-0" style="text-align:center; background-color: #F7F7F7;">
					<h5 class="text-uppercase">Project</h5>
				<div style="text-align:center;"><img src="${path}/resources/images/common/logo.png" class="w-25 cul my-3"> <br><br>
					<a class="text-dark" href="https://muze.com/">© 2022 Copyright: muze.com</a></div>               
				</div>
				<!--Left Grid column-->

				<!--Right Grid column-->
				<div class="col-lg-6 col-md-12 mb-4 mb-md-0" style="text-align:center; background-color: #F7F7F7;">
				<h5 class="text-uppercase">contact us</h5>
					<div class="cul my-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
						</svg> &nbsp; 02-123-4567 &nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
							<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
						</svg> &nbsp; muzeofficial@gmail.com <br><br>
						<p>
						<a href="${ pageContext.request.contextPath }/views/footer/footerlink1.jsp">이용안내</a> &nbsp;
						<a href="${ pageContext.request.contextPath }/views/footer/footerlink2.jsp">이용약관</a> &nbsp;
						<a href="${ pageContext.request.contextPath }/views/footer/footerlink3.jsp">개인정보처리방침</a>
						</p>
						<div>Business license : 706-20-01181 <br> Mall-order license : 2022-서울시-0334</div>
					</div>
				</div>
				<!--Right Grid column-->
			</div>
			<!--Grid row-->
		</div>
		<!-- Grid container -->
	</footer>

	<!-- Bootstrap JS -->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>