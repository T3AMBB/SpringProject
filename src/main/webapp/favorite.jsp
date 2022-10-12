<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
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
<title>찜목록</title>

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
						<h4>찜목록</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>찜목록</span>
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
				<div class="col-lg-12">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th style="width: 60%;">Product</th>
									<th style="width: 20%;">Quantity</th>
									<th style="width: 10%;">Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<!-- For each문 시작 지점 -->
						    <c:choose>
								<c:when test="${favorite==null}">
									<tr>
									<td>
									<h3>찜목록이 비어있습니다</h3>
									</td>
									</tr>
								    </c:when>
								    <c:otherwise>					
							<c:forEach var="f" items="${favorite}">								
								<tr id="${f.pid}">
									<td>
									<input type="checkbox">
									
									</td>
									<!-- 크롤링한 이미지 삽입 -->
									<td class="product__cart__item">
										<div class="product__cart__item__pic">
											 <a href="boardP.do?pid=${f.pid}">
											<img src="${f.pimg}" style="width:90px;"alt="img"></a>
										</div>

										<div class="product__cart__item__text">
											<h6>${f.pname}</h6>
									<h6><span class="product_price"><fmt:formatNumber value="${f.price}" pattern="#,###,### 원"/></span>
												</h6>
										</div>
									</td>
									<td class="quantity__item">
										<div class="quantity">
											<div class="pro-qty-2">
											</div>
												<button type="button" class="primary-btn" id="btn-cart" onclick="cartU();" style="size:inherit;">변경</button>
										</div>
									</td>									
									<td class="cart__close"><button onclick="favD(${f.pid})"><i
											class="fa fa-close"></i></button>></td>
								</tr>
								</c:forEach>
								<!-- For each문 끝 -->
								</c:otherwise>
								</c:choose>
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
								<a href="#"><i class="fa fa-cart-shopping"
									style="color: white; display: inline-block;"></i>장바구니에 담기</a>
							</div>							
						</div>
					</div>

				</div>
			</div>
	</section>
	<!-- Shopping Cart Section End -->

	<hearder:footer />
<script type="text/javascript">
function favD(pid){
    	
	var mid = '${user.mid}';
         $.ajax({   
            type : 'POST',
            url : 'favD.do',
            data :  {
               'pid': pid,
               'mid': mid
            },
            success : function(result) {               
               if (result == 'success') {
            	   $("#"+pid+"").remove();
                  }           
               } 
            });
         }
</script>

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
