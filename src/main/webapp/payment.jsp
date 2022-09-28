<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="hearder" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>결제완료 페이지</title>

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
</head>

<body>
    
    <hearder:header/>


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Payment</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="#">
                    <div class="row">                       
                        <div class="col-lg-12">
                            <div class="checkout__order">
                                <h4 class="order__title">상품 결제</h4>
                                <div class="checkout__order__products">상품 1개 외 N개<span>Total Price</span></div>
                                <hr>
                                <h3>배송지 정보</h3>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        기본 배송지
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                  <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        신규 배송지
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <input id="address" placeholder="주소입력">
                                <input id="phone" placeholder="전화번호 입력">
                                <a href="#"> 배송지 목록</a>
                                <hr>
                                <a>UserName</a> <br>
                                <a>UserPhone</a> <br>
                                <a>UserAddress</a> <br>
                                <a>요청사항 입력</a>
                                <hr>
                                <h3>할인 및 포인트</h3> <br>
                                <h4>쿠폰 할인</h4>
                                <ul class="checkout__total__all">
                                <li>상품/주문 쿠폰</li>
                                <li>배송비 쿠폰</li>                              
                                </ul>
                                <h4>포인트</h4>
                                <ul class="checkout__total__all">
                                <li>보유</li>
                                <li>사용</li>                              
                                </ul>
                                <br>
                                <ul class="checkout__total__all">
                                    <li>합계 <span>$750.99</span></li>
                                    <li>쿠폰적용 후 가격<span>가격</span></li>
                                    <li>최종가격 <span>$750.99</span></li>
                                </ul>
                                
                                <button type="submit" class="site-btn">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

   <hearder:footer/>
    <!-- Search End -->

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
</body>

</html>