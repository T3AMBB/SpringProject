<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%  // 현재 페이지가 정상적으로 응답되는 페이지임을 지정
    // 코드 생략 시 웹 브라우저가 자체적으로 제공하는 에러 페이지 출력
    response.setStatus(HttpServletResponse.SC_OK);
%>
<article class="post-grid">



</article>
<style>

body {
    
    background-size: cover;
    height: 100vh;
    width: 100vw;
    margin : 5%;
}
.img-error{
display: flex;
justify-content: center;
width:600px;
height:500px;
margin: auto;
display: block;
}

.glyphicon glyphicon-arrow-left{
 display: flex;
 justify-content: center;
}
</style>
    <div class="col-md-10 col-md-offset-1 pull-right">
    <h1>404 Not Found</h1>
    <h2>죄송합니다, 오류가 발생하여 요청하신 페이지를 찾을 수 없습니다!</h2>
	</div>
    <img class="img-error" src="https://bunny.jjalbot.com/2021/12/OtrsI46TN/OtrsI46TN.gif">
    <div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right" style="margin-top:10px;">
                    <div class="error-actions">
                        <a href="./index.jsp" class="btn btn-primary btn-lg">
                            <span class="glyphicon glyphicon-arrow-left"></span>
                            메인메뉴로 돌아가기 
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
