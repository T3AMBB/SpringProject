<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/b7488a2ad9.js" crossorigin="anonymous"></script>

 <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
              <c:choose>
              	<c:when test="${member!=null }">                  
              	  <a href="favorite.jsp"><i class="fa fa-heart" style="color:black;">찜목록</i></a>
                  <a href="cart.jsp"><i class="fa fa-shopping-cart" style="color:black;">장바구니</i></a>
                  <a href="mypage.do">마이페이지</a>
                  <a href="logout.do">로그아웃</a>
                  </c:when>
                  <c:otherwise>
                  <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                  <a href="signUp.jsp">회원가입</a>
                  <a href="cart.jsp"><i class="fa fa-shopping-cart" style="color:black;">장바구니</i></a>
                  </c:otherwise>
              </c:choose>
            </div>
           
        </div>
      
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>피규어나라🤖 건담공주👑</p>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>피규어나라🤖 건담공주👑</p>
                        </div>
                         <div class="header__top__left">
                         <a href="https://github.com/T3AMBB/SpringProject" >
                         <img src="./img/icon/gitlogo.png"/>
                         </a>
                         </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                            <c:choose>
                            	<c:when test="${member!=null }">
                			    <a href="cart.jsp"><i class="fa fa-shopping-cart" style="color:white;">장바구니</i></a>
                                <a href="favAll.do"><i class="fa fa-heart" style="color:white;">찜목록</i></a>
                                <a href="mypage.do">마이페이지</a>
                                <a href="logout.do">로그아웃</a>
                                </c:when>
                                <c:otherwise>
                                <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                                <a href="signUp.jsp">회원가입</a>
                                <a href="cart.jsp"><i class="fa fa-shopping-cart" style="color:white;">장바구니</i></a>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </div>           
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-4">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="./main.do">Home</a></li>
                            <li><a href="./selectAllP.do">Shop</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-5">
                    <div class="header__logo">
                        <a href="./main.do"><img src="img/banner.png" alt="배너이미지"></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-3">
                    <div class="shop__sidebar__search" style="margin-top:8%;">
                            <form action="searchName.do">
                                <input type="text" name="pname" placeholder="피규어 검색">
                                <button type="submit"><span class="icon_search" style="margin-top:4%;"></span></button>
                            </form>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
    
    <div class="row">
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header border-bottom-0">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="form-title text-center">
	          <h4>로그인</h4>
	        </div>
	        <div class="d-flex flex-column text-center">
	          <form action="login.do" name="login" method="post">
	            <div class="form-group">
	              <input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력해주세요.">
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control" id="mpw" name="mpw" placeholder="비밀번호를 입력해주세요.">
	            </div>
	            <button type="submit" class="btn btn-dark btn-block btn-round">로그인</button>
	          </form>
	          <div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
	          <div class="d-flex justify-content-center social-buttons">
	            <a href="javascript:kakaoLogin();"><button type="button" style="margin-right:2%;"class="btn btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
	              <img style="width:30px; height:30px;" src="img/kakao.png" alt="kakao">
	            </button></a>
	            <a href="javascript:void(0);" id="naverIdLogin_loginButton"><button type="button" style="margin-right:2%;"class="btn btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
	              <img style="width:30px; height:30px;" src="img/naver.png" alt="naver">
	            </button></a>

	          </div>
	        </div>
	        <br>
	       	<div class="modal-footer d-flex justify-content-center">
	        <div class="signup-section"> <a href="signUp.jsp" class="text-info"> 회원가입</a></div>
	        <div class="signup-section"> <a href="#" class="text-info"> 아이디 찾기</a></div>
	        <div class="signup-section"> <a href="#" class="text-info"> 비밀번호 찾기</a></div>
	      </div>
	      </div>
	    </div>

	  </div>
	</div>
	</div>
	
<!-- 네이버 스크립트 -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "_yxif3j955WIoRMM5ZX6", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl : "http://pnggbb.duckdns.org/naverLogin.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup : false,
		callbackHandle : true
	});
	naverLogin.init();

	var testPopUp;
	function openPopUp() { // 팝업이 나옴
		testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
				"_blank",
				"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp() { // 그 후 팝업 종료
		testPopUp.close();
	}

	function naverLogout() { // 로그아웃시 팝업 등장했다 사라짐
		openPopUp();
		setTimeout(function() {
			closePopUp();
		}, 1000);
	}
</script>
<!-- 네이버 스크립트 종료-->
<!-- 카카오 스크립트 시작 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        window.Kakao.init('7c680401a97de1baad85ebc5da673f27');

        function kakaoLogin() {
            window.Kakao.Auth.login({
//                 scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                      Kakao.API.request({
                           url : '/v2/user/me',
                           success : function(response) {
                        	   
                               var email=response.kakao_account.email;
                               var name=response.kakao_account.profile.nickname;
                               var mpw=response.id;
                               console.log(response)
                               console.log('이메일:'+response.kakao_account.email);
                               console.log('닉네임:'+response.kakao_account.profile.nickname);
//                                location.href="login.do?amid="+email;
							   location.href ='kakaoLogin.do?mid='+ email+'&mname='+name+'&mpw='+mpw;
                           },
                           fail : function(error) {
                               console.log(error)
                           },
                       })
                   },

                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
       function kakaoLogout() {
           if (!Kakao.Auth.getAccessToken()) {
              console.log('Not logged in.');
              return;
           }
           Kakao.Auth.logout(function(response) {
              alert(response +' logout');
              window.location.href='main.do'
           });
    };
    
    function secession() {
       Kakao.API.request({
           url: '/v1/user/unlink',
           success: function(response) {
              console.log(response);
              //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
              window.location.href='main.jsp'
           },
           fail: function(error) {
              console.log('탈퇴 미완료')
              console.log(error);
           },
       });
    };
    </script>
<!-- 카카오 스크립트 종료 -->
