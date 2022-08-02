<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>
<jsp:include page="/views/adminpage/sidebar.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">
<link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

      <!-- 오른쪽 그리드 -->
      <div class="col-sm-10" style="border: 1px solid lightgray;">
        <!-- 컨테이너 -->
        <div class="container-chart">
          <h5>방문자 현황</h5>
          <div>
            <canvas id="myChart"></canvas>
          </div>
        </div>
        <div class="container-chart">
          <h5>페이지 뷰</h5>
          <div>
            <canvas id="myChart2"></canvas>
          </div>
        </div>
        <div class="daily-summary">
          <h5>일자별 요약</h5>
          <div class="mt-3">
            <table class="table table-sm">
                <thead>
                    <tr style="height: 10px; color:gray">
                        <th style="width: 20%;">일자</th>
                        <th style="width: 12%;">주문수</th>
                        <th style="width: 20%;">매출액</th>
                        <th style="width: 12%;">방문자</th>
                        <th style="width: 12%;">가입</th>
                        <th style="width: 12%;">문의</th>
                        <th style="width: 12%;">후기</th>
                    </tr>
                </thead>

                <tbody>
                  <!-- (tr>(td{2022-07-$$}+td{0건}+td{0원}+td*4{0}))*9 -->
                  <tr>
                    <td>2022-07-01</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-02</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-03</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-04</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-05</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-06</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>2022-07-07</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>최근 7일 합계</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr>
                    <td>이번 달 합계</td>
                    <td>0건</td>
                    <td>0원</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>

                </tbody>

            </table>
        </div>
        </div>
      </div>
      <!-- 컨테이너 끝 -->
    </div>

  </div>
  <!-- 내용 전체 컨테이너 끝 -->
  
<!-- chart js -->
<script src="${path}/resources/js/Adminpage/status_visitors.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<jsp:include page="/views/common/footer.jsp"/>