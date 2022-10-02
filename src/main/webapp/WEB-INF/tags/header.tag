<%@ tag language="java" pageEncoding="UTF-8"%>
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
                <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                <a href="signUp.jsp">회원가입</a>
                <a href="myPage.jsp">마이페이지</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>세상 모든 피규어를 만나보세요!</p>
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
                            <p>세상 모든 피규어를 만나보세요!</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                                <a href="signUp.jsp">회원가입</a>
                                <a href="mypage.do">마이페이지</a>
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
                            <li class="active"><a href="./main.jsp">Home</a></li>
                            <li><a href="./product.jsp">Shop</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-5">
                    <div class="header__logo">
                        <a href="./main.jsp"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-3">
                    <div class="shop__sidebar__search" style="margin-top:8%;">
                            <form action="#">
                                <input type="text" placeholder="Search...">
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
	          <form action="login.do" method="post">
	            <div class="form-group">
	              <input type="text" class="form-control" id="id" name="mid" placeholder="아이디를 입력해주세요.">
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control" id="password" name="mpw" placeholder="비밀번호를 입력해주세요.">
	            </div>
	            <button type="submit" class="btn btn-dark btn-block btn-round">로그인</button>
	          </form>
	          <div class="text-center text-muted delimiter">다른 계정으로 로그인</div>
	          <div class="d-flex justify-content-center social-buttons">
	            <button type="button" style="margin-right:2%;"class="btn btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
	              <img style="width:30px; height:30px;" src="img/kakao.png" alt="kakao">
	            </button>
	            <button type="button" style="margin-right:2%;"class="btn btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
	              <img style="width:30px; height:30px;" src="img/naver.png" alt="naver">
	            </button>

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