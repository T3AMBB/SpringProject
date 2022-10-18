<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
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
<title>PinaGunGong -receipt</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="shorycut icon" href="img/pavi.png" type="image/png">
<link rel="apple-touch-icon" href="img/pavi.png">
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

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
	<div style="margin-left: 300px;margin-right: 18%;padding: 1%;">
	<hr>
	<h3 class="order__title">${user.mname}님, 상품을 구매해주셔서 감사합니다</h3>
	<br>
	<h4>주문하신 상품</h4>
	<br>
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
			 <td><img src="${c.pimg}"alt="상품 사진" width="100" height="100"></td>
				<td><br>${c.pname}</td>
				<td>${c.cnt}</td>
				<td>${c.price*c.cnt}</td>
			</tr>
			<br>
		</c:forEach>
		</tbody>
	</table>
	</div>
		<div class="container">
			<div class="checkout__form">
				<form action="#">
					<div class="row" style="margin-left: 10%;margin-right: -8%;">
						<div class="col-lg-7">
							<div class="checkout__order">
								<c:forEach var="d" items='${buyProduct}' begin='0' end='0'>
								<h4>주문자 정보</h4>
								<br>
								<p>주문자 성함 : ${user.mname}</p>
								<p></p>
								<p>전화번호 : ${user.mphone}</p>
								<p>휴대전화번호 : ${user.mphone}</p>
								<p>주문일자 : ${d.buydate}</p>
								<hr>
								<h4>배송지 정보</h4>
								<br>
								<p>받으시는 분 : ${user.mname}</p>
								<p>전화번호 : ${user.mphone}</p>
								<p>휴대전화번호 : ${user.mphone}</p>
								<a>배송 예정일 : ${d.shipping}</a>
								<p></p>
								<p>배송지 주소 : ${d.prcadr}</p>
								
								</c:forEach>
								
								<hr>
							</div>
						</div>
						<div class="col-lg-3">
								<ul class="checkout__total__all" style="font-size: 26px; font-weight: 400;">
									<c:if test="${total<30000}">
										<li>합계 <span><fmt:formatNumber pattern="###,###,###" value="${total-3000}"/>원</span></li>
										<li>배송비 <span><fmt:formatNumber pattern="###,###,###" value="3000"/>원</span></li>
									</c:if>
									<c:if test="${total>30000}">
										<li>합계 <span><fmt:formatNumber pattern="###,###,###" value="${total}"/>원</span></li>
									</c:if>
									<c:if test="${coupon.code != null}">
									<li>할인된 금액<span><fmt:formatNumber pattern="###,###,###" value="${coupontotal}"/>원</span></li>
									<li>사용한 쿠폰<span>${coupon.code}</span></li>
									<li>최종가격 <span><fmt:formatNumber pattern="###,###,###" value="${total-coupontotal}"/>원</span></li>
									</c:if>
									<c:if test="${mileage > 0}">
									<li>적립금<span><fmt:formatNumber pattern="###,###,###" value="${mileage}"/>원</span></li>
									<li>최종가격 <span><fmt:formatNumber pattern="###,###,###" value="${total}"/>원</span></li>
									</c:if>
									<c:if test="${mileage < 0}">
									<li>사용한 적립금<span><fmt:formatNumber pattern="###,###,###" value="${mileage*-1}"/>원</span></li>
									<li>최종가격 <span><fmt:formatNumber pattern="###,###,###" value="${total-(mileage*-1)}"/>원</span></li>
									</c:if>
								</ul>
						</div>
					</div>
					<br>
					<br>
					<a href="main.do" class="primary-btn" style="cursor:pointer; border-radius: 30px; margin-left:43%;">메인으로 가기</a>
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