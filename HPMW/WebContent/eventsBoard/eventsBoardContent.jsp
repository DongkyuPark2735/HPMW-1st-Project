<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			var parttimer = "<c:out value='${parttimer}'/>";
			if(parttimer!=""){
				console.log(parttimer);
				$(".listbtn").attr("value", '메인으로');
				$(".listbtn").attr("onclick", 'location.href="${conPath}/main.do"');
			}
		});
	</script>
</head>
<body>
		<!-- 해더 -->
	<jsp:include page="../main/header.jsp" />
		<c:if test="${not empty EventsDetail }">
			<table>
				<caption>${EventsDetail.evno }번 행사 상세정보 </caption>
				<tr>
					<td>행사번호</td>
					<td>${EventsDetail.evno }</td>
				</tr>
				<tr>
					<td>행사명</td>
					<td>${EventsDetail.evtitle }</td>
				</tr>
				<tr>
					<td>행사 상세정보</td>
					<td>${EventsDetail.evdetail }</td>
				</tr>
				<tr>
					<td>행사일시</td>
					<td><fmt:formatDate value="${EventsDetail.evstartdate}" pattern="yy-MM-dd(E)"/></td>
				</tr>
				<tr>
					<td>행사 유형</td>
					<td>${EventsDetail.etno}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${EventsDetail.mno }</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${manager.mno eq EventsDetail.mno }">
							<input type="button" value="행사 수정" class="btn"
										 onclick="location.href='${conPath}/eventsBoardModifyView.do?evno=${EventsDetail.evno }&pageNum=${pageNum }&mno=${manager.mno }'" >
							<input type="button" value="행사 삭제" 
										 onclick="location.href='${conPath}/eventsBoardDelete.do?evno=${EventsDetail.evno }&pageNum=${pageNum }&mno=${manager.mno }'">
						</c:if>
							<input type="button" value="목록" class="listbtn"	 onclick="location.href='${conPath}/eventsBoardList.do?pageNum=${pageNum}'">
					</td>
				</tr>	
			</table>
		</c:if>
		<c:if test="${empty EventsDetail }">
				<h3>나에게 등록된 행사가 없습니다.</h3>
				<input type="button" value="메인페이지로" class="btn"	 onclick="location.href='${conPath}/main.do'">
		</c:if>
</body>
</html>