<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>

    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

        <div>
            <h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;">공지사항</h3>
        </div>

        <div class="notice-content" style="height: 100%;">

            <table class="table" style="border: 1px; width: 1000px; height: 100%; margin: auto; font-size: 1em;">
            
                <tr>
                    <td style="width: 15%; height: 8%;"><b>제목</b></td>
                    <td colspan="3">2022년 놓치면 안되는 아트페어 TOP 4</td>
                </tr>
                <tr>
                    <td style="height: 8%;"><b>작성자</b></td>
                    <td colspan="3">관리자</td>
                </tr>                
                <tr>
                    <td style="height: 8%;"><b>작성일</b></td>
                    <td style="width: 35%;">2022-07-23</td>
                    <td style="width: 15%;"><b>조회수</b></td>
                    <td>99</td>
                </tr>                
                <tr>
                    <td colspan="4" style="height: 76%;">
                        <p style="padding-top: 30px;">
                            2020년 초반에 시작된 코로나 19는 우리의 많은 것들을 변하게 만들었는데요. <br> 특히 화랑과 갤러리를 비롯하여 미술 시장은 크게 직격타를 맞으며 각종 아트페어와 행사들이 취소되는 등의 어려움을 겪었습니다. <br> 이러한 상황이 계속 지속되면서 우울감과 무기력증에 시달리는 코로나 블루를 호소하는 사람들이 많아졌고 많은 콜렉터와 갤러리, 그리고 일반인까지 국내에서 열리는 아트페어에 집중을 하게 되었는데요. <br> 이러한 상황은, 2021년 대한민국 미술시장을 역대급 호황으로 만들어주었습니다. <br> 개최되기만 하면 역대급 관람객 수, 역대급 판매고를 찍으며 대박을 친 2021 아트페어! 그렇다면 2022년 반드시 가야 하는 아트페어에는 어떤 것이 있을까요? <br> 2022년 놓치면 안 되는 아트페어 TOP4를 소개해 드리겠습니다.
                        </p>
                    </td>
                </tr>
            </table>
            <p style="text-align: center; margin-top: 10px;">
                <button type="button" class="button-white" style="margin: 0;"><b>목록</b></button>
            </p>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp"/>