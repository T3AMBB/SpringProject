<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

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
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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

	<hearder:header />


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Check Out</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>결제완료</span>
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
								<h4 class="order__title">${user.mname}님, 상품을 구매해주셔서 감사합니다</h4>
								<c:forEach var="d" items='${buyProduct}' begin='0' end='0'>
								<a>주문하신 상품은 ${d.shipping}에 배송 될 예정입니다.</a>
								<p></p>
								<p>연락처 : ${user.mphone}</p>
								<p>배송 예정지 : ${d.prcadr}</p>
								
								</c:forEach>
								
								<hr>
								<table class="table table-borderless">
						<tbody>
							<tr>
								<th>상품사진</th>
								<th>상품명</th>
								<th>구매수량</th>
								<th>가격</th>
							</tr>
							<c:forEach var="c" items="${buy}">
							<tr>
								<td><a href="boardP.do?pid=${cart.pid}"><img src="${c.pimg}"
								alt="상품 사진" width="100" height="100"></a></td>
								<td><a href="boardP.do?pid=${cart.pid}">${c.pname}</a></td>
								<td>${c.cnt}</td>
								<td>${c.price*c.cnt}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
								<ul class="checkout__total__all">
									<li>합계 <span>${total}</span></li>
									<c:if test="${coupon.code != null}">
									<li>할인된 금액<span>${coupontotal}</span></li>
									<li>사용한 쿠폰<span>${coupon.code}</span></li>
									<li>최종가격 <span>${total-coupontotal}</span></li>
									</c:if>
									<c:if test="${mileage > 0}">
									<li>적립금<span>${mileage}</span></li>
									<li>최종가격 <span>${total}</span></li>
									</c:if>
									<c:if test="${mileage < 0}">
									<li>사용한 적립금<span>${mileage*-1}</span></li>
									<li>최종가격 <span>${total-(mileage*-1)}</span></li>
									</c:if>
									
								</ul>
								<div class="checkout__input__checkbox">
									<label for="acc-or"> 예비용 체크박스1 <input type="checkbox"
										id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<p>예비용 문구 추가 예시입니다</p>
								<div class="checkout__input__checkbox">
									<label for="payment"> 예비용 체크박스2 <input type="checkbox"
										id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> 예비용 체크박스3 <input type="checkbox"
										id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="site-btn" style="text-align:center; color:white; font-size:inherit;">
									<a href="selectAllP.do" style="color:#f3f2ee;">상품 더 보러가기</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<hearder:footer />
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