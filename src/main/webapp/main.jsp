<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/modal.css" type="text/css">
    <!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/9bd2faeab5.js"
	crossorigin="anonymous"></script>
</head>

<body>
   
    <hearder:header/>
    <hr>

	
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/hero/onepice-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text" style="font-color:white">
                                <h6>피규어 역사상 최고의 Collection</h6>
                                <h2>최고의 걸작!</h2>
                                <p> 살아 숨쉬는듯한 생동감 넘치는 피규어!</p>
                                <a href="#" class="primary-btn">구매하러 가기 <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="https://www.facebook.com/figurefarm.net/"target=”_blank”><i class="fa fa-facebook"></i></a>
                                    <a href="https://twitter.com/figurefam_net"target=”_blank”><i class="fa fa-twitter"></i></a>
                                    <a href="https://www.instagram.com/figurefarm/"target=”_blank”><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="img/hero/onepice-2.jpg">
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

	<hr>
	<br>
	<br>

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
            <!-- 상품 뽑아낼 반복문 위치 -->
            <c:forEach var="n" items="${products}" begin="1" end="20">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                    <div class="product__item__pic set-bg" >
                        <a href="boardP.do?pid=${n.pid}">
                        <img src="${n.pimg}" alt="" width="280" height="280"></a>
		                   <ul class="product__hover">
		                 <!-- 로그인 상태 -->
						<c:if test="${user.mid!=null}">
							<c:choose>
								<c:when test="${n.fav==1}"><!-- 좋아요 되어있는 상품인지 확인 -->
        		                        <li><img id="${n.pid}fav_btn" src="img/icon/heartOn.png" alt="좋아요활성화" onclick="favorite(${n.pid});"></li>
								</c:when>
								<c:otherwise>
        		                        <li><img id="${n.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favorite(${n.pid});"></li>
                		           </c:otherwise>
							</c:choose>
                        </c:if>
                        
                        <!-- 비로그인 상태 -->
						<c:if test="${user.mid == null}">
                                <li><img id="${n.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favoriteN(${n.pid});"></li>
                        </c:if>
                        
                		           </ul>
                        </div>
                        <br>
                        <div class="productitem_">
                            <h6 style="font-weight: 600;">${n.pname}</h6>
                            <h5 style="font-weight: 800;">
                            <fmt:formatNumber pattern="###,###,###" value="${n.price}"/>원</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- 상품 뽑아낼 반복문 끝나는 위치 -->
            </div>
        </div>
    </section>
    <!-- Product Section End -->



	<hearder:footer/>


    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
      function favorite(pid) {
         var mid = '${user.mid}';
         console.log('로그: Favorite');
         $.ajax({
            type : 'POST',
            url : 'favorite.do',
            data : {
               mid : mid,
               pid : pid
            },
            success : function(result) {
               console.log("로그1 [" + result + "]");
               if (result == 1) {
                  console.log("로그2 [좋아요+1]");
                  $('#'+pid+'fav_btn').prop("src", "./img/icon/heartOn.png");
               } else if(result == 0){
                  console.log("로그3 [좋아요-1]");
                  $('#'+pid+'fav_btn').prop("src", "./img/icon/heart.png");
               }
            },
            error : function(request, status, error) { 
               console.log("상태코드: " + request.status);
               console.log("메세지: " + request.responseText);
               console.log("에러설명: " + error);
            }
         });
      }
      
      function favoriteN(pid) {
    	  alert('로그인 후 이용해주세요.')
      }
   </script>
<<<<<<< HEAD
    
    
     <script type="text/javascript">
	$(document).ready(function(){
		// 퀵메뉴 위치 제어
		var quickMenu = $('#quick_menu');
		var headerArea = $('#header');
		var paddingArea = 194;
		quickMenu.css({'top' : headerArea + paddingArea});
		
	});
	// 비주얼슬라이드
	$('#main .visual_main').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		arrows: true,
		dots: true,
	});

	// 대한민국대표피규어쇼핑몰 배너슬라이드
	$('#main .store_slide .slide').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		arrows: true,
		dots: false,
	});

	// BEST PRODUCT
	var _tab_chk = new Array();
	slideTab = function(no) {
		var tabs = $('#main .best .tab_bestprd').find('a');
		tabs.each(function(idx) {
			var detail = $('.tabcnt_bestprd'+idx);
			if(no == idx) {
				tabs.eq(idx).addClass('active');
				detail.show();
				// 상품슬라이드
				if(_tab_chk[idx] != true) {
					detail.find('.prd_basic.bestproduct').slick({
						slidesToShow: 5,
						slidesToScroll: 1,
						variableWidth: true,
						centerMode: true,
						centerPadding: '0',
						arrows: true,
						dots: true,
						infinite: true,
					});
					_tab_chk[idx] = true;
				}
			} else {
				tabs.eq(idx).removeClass('active');
				detail.hide();
			}
		});
	}
	slideTab(0); //초기 탭첫번째만 실행
</script>
<script type="text/javascript">
	(function(m,b,r,i,s){m.mbris=m.mbris||function(){(m.mbris.q=m.mbris.q||[]).push(arguments)};i=b.createElement(r);i.async=!0;i.defer=!0;i.src="https://cdn.megadata.co.kr/dist/prod/enp_mbris.min.js";0<b.querySelectorAll("script[src*=enp_mbris]").length&&m.ENP_MBRIS_INVOKE?m.ENP_MBRIS_INVOKE():(s=b.getElementsByTagName(r)[0],s.parentNode.insertBefore(i,s))})(window,document,"script");
  mbris("202209248155134303_toyntech_1_01,202209248155134304_toyntech_1_02");
</script>
<!-- Enliple Insite Main end --><!-- mkt script '모비온 스크립트' scr_bottom start-->
<!-- Enliple Insite breakAway Popup start -->
<script type="text/javascript">
	(function(m,b,r,i,s){m.mbris=m.mbris||function(){(m.mbris.q=m.mbris.q||[]).push(arguments)};i=b.createElement(r);i.async=!0;i.defer=!0;i.src="https://cdn.megadata.co.kr/dist/prod/enp_mbris.min.js";0<b.querySelectorAll("script[src*=enp_mbris]").length&&m.ENP_MBRIS_INVOKE?m.ENP_MBRIS_INVOKE():(s=b.getElementsByTagName(r)[0],s.parentNode.insertBefore(i,s))})(window,document,"script");
  mbris("202209248155134306_toyntech_3_01,202209248155134306_toyntech_3_02");
</script>
<!-- Enliple Insite breakAway Popup end --><!-- Enliple Tracker Start -->
<script type="text/javascript">
    (function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
    enp('create', 'common', 'toyntech', { device: 'W' });    
    enp('send', 'common', 'toyntech');
</script>
    
=======
>>>>>>> dd32d5ef57ea3e3c68326baeeb93d5087baf60f3
</body>

</html>