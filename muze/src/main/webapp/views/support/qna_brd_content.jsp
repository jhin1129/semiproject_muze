<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/support/support.css">
<link rel="stylesheet" href="${path}/resources/css/adminpage/admin.css">

    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

        <div>
    	        <h3 style="text-align: left; margin-left: 60px; margin-bottom: 20px;">1 : 1 문의</h3>
        </div>

        <div class="notice-content" style="height: 100%;">
			<input type="hidden" name="brdNo" value=${ board.brdNo }>
            <table class="table" style="border: 1px; width: 1000px; height: 100%; margin: auto; font-size: 1em;">
            
                <tr>
                    <td style="width: 15%; height: 8%;"><b>제목</b></td>
                    <td colspan="3">${ board.brdTitle }</td>
                </tr>
                <tr>
                    <td style="height: 8%;"><b>작성자</b></td>
                    <td colspan="3">${ board.brdWriterId }</td>
                </tr>                
                <tr>
                    <td style="height: 8%;"><b>작성일</b></td>
                    <td style="width: 30%;">${ board.brdDate }</td>
                    <td style="width: 10%;"><b>조회수</b></td>
                    <td style="width: 40%;">${ board.brdReadCount }</td>
                </tr>
                <tr>                
                    <td style="width: 10%;"><b>첨부파일</b></td>
                    <td colspan="3" style="width: 35%;">${ board.brdRenamedFileName }</td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 38%;">
                       <p style="padding-top: 30px;">
                            ${ board.brdContent }
                        </p>
                    </td>
                </tr>
                <c:if test="${ not empty board.brdRepContent }">
                <tr>
                    <td colspan="4" style="height: 38%;">
                       <p style="padding-top: 30px;">
                            &lt;&nbsp; 답변드립니다 &nbsp;&gt;
                        </p><br>
                	   <p>
                            ${ board.brdRepContent }
                        </p>
                    </td>
                </tr>
                </c:if>                
            </table>
            <%--게시글 작성자만 수정 및 삭제, 관리자는 답글 작성 가능 --%>
            <p style="text-align: center; margin-top: 10px;">
        	<c:if test="${ not empty loginMember && loginMember.memberId == board.brdWriterId }">
                <button type="button" class="button-white" style="margin: 0;"
                onclick="location.href='${ path }/support/update?brdNo=${ board.brdNo }&type=QNA'"><b>수정</b></button>
                <button type="button" class="button-white" id="btnDelete" style="margin: 0;"><b>삭제</b></button>
            </c:if>
         	<c:if test="${ not empty loginMember && loginMember.memberRole == 'MEMBER_ROLE_ADMIN'}">
                <button type="button" class="button-white" style="margin: 0;"
                onclick="location.href='${ path }/support/reply?brdNo=${ board.brdNo }&type=QNA'"><b>답글</b></button>
       		</c:if>
                <button type="button" class="button-white" style="margin: 0;"
                onclick="location.href='${ path }/support/list?type=QNA'"><b>목록</b></button>
            </p>
        </div>
    </div>

<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제하시겠습니까?")) {
				location.replace("${ path }/support/delete?brdNo=${ board.brdNo }&type=QNA");
			}
		});
	})
</script>

<jsp:include page="/views/common/footer.jsp"/>