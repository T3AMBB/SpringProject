<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title><%-- <spring:message code="message.title"/> --%>장바구니 페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
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
						<h4>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" class="individual_cart_checkbox" checked="checked" ></th>
									<th>Product</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>							
								<!-- For each문 시작 지점 -->
								<c:forEach var="c" items="${cart}">								
								<tr>
									<td>
									<input type="checkbox">
									<input type="hidden" id="pid" value="${c.pid}">
								<!-- <input type="hidden" id="${c.pid}" value="${c.price}">  -->								
<!-- 									<input type="hidden" id="cnt" value="${c.cnt}">
 -->									</td>
									<td class="product__cart__item">
										<div class="product__cart__item__pic">
											<img src="${c.pimg}" style="width:120px;"alt="img">
										</div>

										<div class="product__cart__item__text">
											<h6>${c.pname}</h6>
										<div class="price">
									<h6><input type="hidden" class="product_price" value="${c.price}"><fmt:formatNumber value="${c.price}" pattern="#,###,### 원"/></span>
												</h6>
												</div>
										</div>
									</td>
									<td class="quantity__item">
										<div class="quantity">
											<div class="pro-qty-2">
												<p id="${c.pid}">${c.price}</p>										
												<input type="text" id="cnt" value="${c.cnt}">																								
											</div>
												
										</div>
											<input class="individual_total_price" type="text"
										value="${c.price}"
										style="border: none; width: inherit; background: inherit;">
										</td>
									<td>
									</td>
									<td class="cart__close"><a href="delete.do"><i
											class="fa fa-close"></i>
									<!-- <button type="button" class="primary-btn" id="btn-cart" onclick="cartD();" style="size:inherit;">삭제</button> -->
											</a></td>
								</tr>
								</c:forEach>
								<!-- For each문 끝 -->
								
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="product.jsp">더 보러가기</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn update__btn">
								<a href="#"><i class="fa fa-spinner"></i> 장바구니 비우기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__total">
						<h6>상품 금액</h6>
						<hr>
						<div>
							<input class="cart_total_price" type="text"
								value="${c.price*c.cnt}" style="border: none; width: 100%; color:red; font-size:22px; text-align:right; background:inherit;">
						</div>                   
						<a href="payment.jsp" class="primary-btn">주문하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<hearder:footer />

<script type="text/javascript">
function cartD(){
      
        
         var pid = $('#pid').val();
         $.ajax({   
            type : 'POST',
            url : 'cartD.do',
            data :  {
               'pid': pid
            },
            success : function(result) {
               
               if (result == 'success') {
            	   $("#btn-cart").text("삭제");
                  }
               
               } 
            });
         }
</script>

	<!-- Js Plugins -->

	</script>
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
