<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PinaGunGong -cart
</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<!-- Css Styles -->
    <link rel="shorycut icon" href="img/pavi.png" type="image/png">
	<link rel="apple-touch-icon" href="img/pavi.png">
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
						<div class="table_head">
							<span>Product</span> <span>Quantity</span> <span>Total</span> <span>비우기</span>
							<hr>
						</div>
						<c:forEach var="c" items="${cart}">
							<div id="${c.pid}" class="box_count"
								style="width: 100%; height: 130px; margin-bottom: 10px;">
								<input type="hidden" class="individual_cartPid_input"
									value="${c.pid}">
								<%--<input type="hidden" class="individual_cartPname_input" value="${c.name}">--%>
								<input type="hidden" class="individual_cartCnt_input"
									value="${c.cnt}">
								<%--<input type="hidden" class="individual_cartTotal_input" value="${c.total}">--%>
								<div class="product_Detail">
									<div class="product_Img"
										style="float: left; width: 20%; padding-top: 5px;">
										<img src="${c.pimg}" style="width: 120px;" alt="img">
									</div>
									<div class="product_Name_Price"
										style="float: left; width: 40%; margin-top: 10px;">
										<span>${c.pname}</span> <br> <br> <span>${c.price}</span>
									</div>
								</div>

								<div class="product_Cnt"
									style="float: left; width: 12%; margin-top: 45px; margin-left: 10px;">
									<button class="minus_btn"
										style="border: none; background-color: inherit;">
										<i class="fa fa-angle-left"></i>
									</button>
									<span style="width: 30px;">${c.cnt} </span>
									<button class="plus_btn"
										style="border: none; background-color: inherit;">
										<i class="fa fa-angle-right"></i>
									</button>
									<input type="hidden" class="individual_cartPrice_input"
										value="${c.price}">

								</div>

								<input class="product_Total"
									style="float: left; border: 0px solid black; width: 20%; margin-top: 45px;"
									value="${c.cnt * c.price}">
								<button
									style="margin-top: 45px; margin-left: 10px; border: none; background-color: inherit; font-size: 22px;"
									onclick="cartD(${c.pid})">
									<i class="fa fa-close"></i>
								</button>
							</div>
							<hr>
						</c:forEach>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="continue__btn">
							<a href="product.jsp">더 보러가기</a>
						</div>
					</div>
					<!-- 쇼핑카트 테이블 -->
				</div>

				<div class="col-lg-4">
					<div class="cart__total">
						<h6>상품 금액</h6>
						<hr>
						<div>
							<input class="final_total" type="text" value="20000"
								style="border: none; width: 100%; color: red; font-size: 22px; text-align: right; background: inherit;">
						</div>
						<a href="payment.jsp" class="primary-btn">주문하기</a>
					</div>
				</div>

			</div>
			<!-- col -->

		</div>
		<!-- row -->

		</div>
		<!-- 컨테이너 -->


	</section>
	<!-- Shopping Cart Section End -->

	<hearder:footer />

	<script type="text/javascript">	

				
		var final_total = 0;

		//product_Total Class가 있는 Array 가져와서 value => for문돌려서 총합을 
		$(".product_Total").each(function (idx, element){			
			
			var factor = parseFloat($(element).val());
			
			console.log("처음 총합 출력 데이터타입 : " +typeof factor);
			
			final_total +=  factor; //반복 핵심 sum += sum	
						
		});
				
		$('.final_total').val(final_total);
		

		/* 수량버튼 */
		$('.plus_btn').on("click", function() {
			let quantity = $(this).parent("div").find("span").html();
			$(this).parent("div").find("span").html(++quantity);
			console.log("수량변경 숫자 : " + quantity);
			//가격 변수 설정
			let product_price = parseFloat($(this).parent("div").find("input").val());
			console.log("개별 상품가격 : " + product_price);
			console.log("개별 상품가격 데이터 타입 : " + typeof product_price);
			
			var pid= $('.individual_cartPid_input').val();
			var cnt=quantity; 
			//세션 업데이트 부분
			$.ajax({   
		            type : 'POST',
		            url : 'cartU.do',
		            data :  {
		               'cnt': cnt,
		               'pid': pid
		            },
		            success : function(result) {
		               	    console.log(result);

		               if (result == 'success') {
		                  }
		               } 
		            });
			//ajax종료
			
			//총합 출력 로직
			
			product_Total = cnt * product_price;
			
			$(this).parent("div").next("input").val(product_Total);
			console.log("개별 상품 총합 가격 : " + product_Total);

			
			final_total += product_price;
			
			console.log("최종상품가격 데이터 타입 : "+ typeof final_total);
			console.log("최종상품가격 : " + final_total);

			$('.final_total').val(final_total);						

		
		});

		$(".minus_btn").on("click", function() {
			
			let product_price = $(this).parent("div").find("input").val();
			console.log("개별 상품가격 : " + product_price);
			console.log("개별 상품가격 데이터 타입 : " + typeof product_price);
			
			let quantity = $(this).parent("div").find("span").html();
			if (quantity > 1) {
				$(this).parent("div").find("span").html(--quantity);
			console.log("수량변경 숫자 : " + quantity);
			//세션 업데이트 부분
			var pid= $('.individual_cartPid_input').val();
			var cnt=quantity; 
			
			$.ajax({   
		            type : 'POST',
		            url : 'cartU.do',
		            data :  {
		               'cnt': cnt,
		               'pid': pid
		            },
		            success : function(result) {
		               	    console.log(result);

		               if (result == 'success') {
		            	   
		            	   console.log('눌렸음');
		               }
		            } 
		    });
			
			product_Total = cnt * product_price;
			console.log("개별 상품 총합 가격 : " + product_Total);
			$(this).parent("div").next("input").val(product_Total);
			final_total -= product_price;
			$('.final_total').val(final_total);

			
			}
		});
		
		//////////////////////삭제버튼/////////////////////////////
		function cartD(pid){
		    
			console.log("pid : ", pid);
			
			//console.log($('#pid').val());
			console.log("div : ", document.getElementById(pid));
			const div =	document.getElementById(pid);		
			div.remove();/////
	        
	         var pid = $('#pid').val();
	         $.ajax({   
	            type : 'POST',
	            url : 'cartD.do',
	            data :  {
	               'pid': pid
	            },
	            success : function(result) {
               	    console.log(result);

	               if (result === 'success') {
	            	   //$("#btn-cart").text("삭제");
	            	   console.log('here');
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
