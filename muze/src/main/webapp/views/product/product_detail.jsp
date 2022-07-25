<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
    <div class="container my-5">
        <div>
            <div class="card" style="border: none;">
                <div class="row g-0 p-5">
                    <!-- 이미지 -->
                    <div class="col-6" style="min-width: 254px; width: 100%;">
                        <img style="background-color: black; width: 445px; height: 445px;" class="rounded-start">
                    </div>
                    <div class="col-1"></div>
                    <!-- 이미지 상세내용 -->
                    <div id="div1" class="col-5">
                        <div class="card-body py-0">
                            <h4 class="card-title">작품 제목</h4>
                            <p class="my-0">작가</p>
                            <hr class="my-2">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 30%;">자체상품코드</td>
                                    <td>2-P-CB7788</td>
                                </tr>
                                <tr>
                                    <td>사이즈</td>
                                    <td>90.0X90.0</td>
                                </tr>
                                <tr>
                                    <td>제작방식</td>
                                    <td>ArtPrint</td>
                                </tr>
                                <tr>
                                    <td>소재</td>
                                    <td>Art Paper</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mb-2">수량</div>
                                    </td>
                                    <td>
                                        <div class="mb-2">3</div>
                                    </td>
                                </tr>
                                <tr
                                    style="border-top: 1px solid rgba(0,0,0,.1); border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="my-2">판매가</div>
                                    </td>
                                    <td>999999</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mt-2">수량선택</div>
                                    </td>
                                    <td>
                                        <input class="mt-2" type="number" min="1" max="3" value="1">
                                    </td>
                                </tr>
                                <tr style="border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="mb-2">총 합계금액</div>
                                    </td>
                                    <td>
                                        <div class="mb-2">999999</div>
                                    </td>
                                </tr>
                            </table>

                            <table class="my-2" style="width: 100%;">
                                <tr>
                                    <td style="width: 50%;">
                                        <div class="py-2 text-center"
                                            style="border: 1px solid; width: 100%; height: 100%;">리뷰 확인</div>
                                    </td>
                                    <td style="width: 50%;">
                                        <div class="py-2 text-center"
                                            style="border: 1px solid; width: 100%; height: 100%;">장바구니</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <div class="col-12 my-2 py-2 text-center" style="border: 1px solid;">구매하기</div>
                                    </td>
                                </tr>
                            </table>


                        </div>
                    </div>
                </div>
            </div>

            <h3>추천 상품 보기</h3>

            <div class="row my-5">


                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
                <div class="col-lg-3 col-md-6">
                    <div class="card" style="width: 16rem;">
                        <img style="background-color: black;" width="100%" height="254px">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's
                                content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
    
            </div>

            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" style="height: 55px; line-height: 40px;">작가 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="height: 55px; line-height: 40px;">작품 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="height: 55px; line-height: 40px;">배송 및 교환 안내</a>
                </li>
            </ul>

            <div>
                <div class="card" style="border: none;">
                    <div class="row g-0 p-5">
                        <!-- 이미지 -->
                        <div class="col-6" style="min-width: 254px; width: 100%;">
                            <img style="background-color: black; width: 445px; height: 445px;" class="rounded-start">
                        </div>
                        <div class="col-1"></div>
                        <!-- 이미지 상세내용 -->
                        <div class="col-5">
                            <div class="card-body py-0">
                                <h2>작가 이름</h2>
                                <p>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                    작가 소개~~~~~~~~~~<br>
                                </p>
    
                            </div>
                        </div>
                    </div>
                </div>

                <div class="p-5">
                    <img style="background-color: black; width: 100%; height: 700px;">
                    <p>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                        작품소개~~~~~~~~~~~~~~~~<br>
                    </p>
                </div>

                <div class="p-5">
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                    배송안내~~~~~~~<br>
                </div>
            </div>
        </div>

    </div>

    <footer class="bg-light text-center text-lg-start">
        <div style="background-color: rgb(238, 233, 233);">
            <!-- Grid container -->
            <div class="container p-4" style="background-color: rgb(238, 233, 233);">
                <!--Grid row-->
                <div class="row">
                    <!--Left Grid column-->
                    <div class="col-lg-6 col-md-12 mb-4 mb-md-0"
                        style="text-align:center; background-color: rgb(238, 233, 233);">
                        <h5 class="text-uppercase">Project</h5>
                        <div style="text-align:center;"><img src="../../IMG/Common/logo.png" class="w-25 cul my-3">
                            <br><br>
                            <a class="text-dark" href="https://muze.com/">© 2022 Copyright: muze.com</a>
                        </div>
                    </div>
                    <!--Left Grid column-->

                    <!--Right Grid column-->
                    <div class="col-lg-6 col-md-12 mb-4 mb-md-0"
                        style="text-align:center; background-color: rgb(238, 233, 233);">
                        <h5 class="text-uppercase">contact us</h5>
                        <div class="cul my-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-telephone-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
                            </svg> &nbsp; 02-123-4567 &nbsp;
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                <path
                                    d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
                            </svg> &nbsp; muzeofficial@gmail.com <br><br>
                            <p>
                                <a href="#!">이용안내</a> &nbsp;
                                <a href="#!">이용약관</a> &nbsp;
                                <a href="#!">개인정보처리방침</a>
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

<jsp:include page="/views/common/footer.jsp"/>