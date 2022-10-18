<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%  // 현재 페이지가 정상적으로 응답되는 페이지임을 지정
    // 코드 생략 시 웹 브라우저가 자체적으로 제공하는 에러 페이지 출력
    response.setStatus(HttpServletResponse.SC_OK);
%>
    <h1>404 에러 발생!!</h1>
    <h2>요청하신 문서를 찾지 못했습니다.</h2>
    <h3>문서의 경로를 다시 한 번 확인해주세요!</h3>