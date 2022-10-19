<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("_yxif3j955WIoRMM5ZX6",
				"http://pnggbb.duckdns.org/naverLogin.jsp");
		// 접근 토큰 값 출력
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

		function naverSignInCallback() {
			var mid = naver_id_login.getProfileData('email');
			var mname = naver_id_login.getProfileData('name');
			var mphone = naver_id_login.getProfileData('mobile');
			var birthday = naver_id_login.getProfileData('birthday');
			location.href ='naverLogin.do?mid='+ mid+'&mname='+mname+'&birthday='+birthday;
		}
	</script>

</body>
</html>