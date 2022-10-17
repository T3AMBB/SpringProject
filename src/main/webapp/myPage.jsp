<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PinaGunGong</title>
<link rel="shorycut icon" href="img/pavi.png" type="image/png">
<link rel="apple-touch-icon" href="img/pavi.png">
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
<link rel="stylesheet" href="css/myPage.css" type="text/css">
<link rel="stylesheet" href="css/modal.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/9bd2faeab5.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>

<body>
	<header:header />


	<div class="section">
		<div class="container">
			<br>
			<br>
			<!-- 마이페이지 헤더 -->
			<table class="table table-bordered" id="mypageHeader">
				<tr>
					<td class="text-center align-middle"
						style="width: 20%; background-color: #212529; color: #ffffff; font-size: 1.4em; font-weight: 600;">${user.mname}님 안녕하세요!</td>
					<td class="align-middle" style="width: 20%">
						<div class="row" onclick="pointEffect()" id="point">
							<div class="col-md-8 col-lg-3">
								<i class="fab fa-product-hunt"></i><br />
							</div>
							<div class="col-md-4 col-lg-9">
								<span>적립금</span><br> <span class="emphasis">${mileageU}</span>
								<div class="square square-1"></div>
								<div class="square square-2"></div>
								<div class="circle circle-1"></div>
								<div class="triangle triangle-1"></div>
								<div class="close close-1"></div>
								<div class="star star-1"></div>
								<div class="message message-1"></div>
							</div>
						</div>
					</td>
					<td class="align-middle" style="width: 20%">
						<div class="row">
							<div class="col-md-8 col-lg-3">
								<i class="fas fa-shopping-basket"></i><br />
							</div>
							<div class="col-md-4 col-lg-9">
								<a href="selectAllB.do"> <span>구매내역 확인</span>
								</a>
							</div>
						</div>
					</td>
					<td class="align-middle" style="width: 20%">
						<div class="row">
							<div class="col-md-8 col-lg-3">
								<i class="far fa-edit"></i><br />
							</div>
							<div class="col-md-4 col-lg-9">
								<a href="selectAllC.do"><span>내 쿠폰함</span><br> <span
									class="emphasis">확인</span></a>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- 마이페이지 헤더 끝 -->
			<div class="section">
				<div class="row">
					<div class="col-md-8 col-lg-3">
						<div class="navbar bg-white" id="sidebar">
							<ul class="navbar-nav" style="border-left: 4px solid #ccc;">
								<li class="nav-item"><a class="nav-link" href="myPage.jsp"><span>내
											정보 수정</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="selectAllB.do"><span>내 구매 내역</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="selectAllC.do"><span>내 쿠폰함</span></a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#delete" href="#"><span>회원
											탈퇴</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 col-lg-9">
							<br><br>
						<form action="updateM.do" method="post" name='addressForm'>
						<div class="text-left">
						<h5>내 정보 수정 </h5>
						<br>
						<table class="table table-borderless">
							<tr>
								<td>아이디</td>
								<td><input type="text" class="form-control" value='${user.mid }' name="mid" readonly="readonly"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" class="form-control" value='${user.mname }' name="mname" readonly="readonly"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" class="form-control" value='${user.mpw }' name="mpw"></td>
							</tr>
							<tr>
								<td>휴대폰 번호</td>
								<td><input type="text" class="form-control" value='${user.mphone }' name="mphone" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="2">
										<div class="form-group">
											<div class="input-group mb-1">
												<div class="input-group-prepend">
													<span style="background:#fff;" class="input-group-text">주소</span>
												</div>
												<input  style="background:#fff;" type="text" name="zipcode" id="zipcode"
													placeholder="${user.zipcode}" class="form-control" readonly="readonly" required>
												<input style="height:37px; line-height:6px;" id="searchAdd" type="button" value="우편번호찾기"
													class="primary-btn"><br>
											</div>
											<div class="input-group">
												<input style="background:#fff;" type="text" name="streetaddress" id="streetaddress" readonly="readonly"
													class="form-control" placeholder="${user.streetaddress}" required>
												<span id="guide" style="color: #999; display: none"></span>
												<input type="text" name="address" value="${user.address }"
													class="form-control" placeholder="상세주소" required>
											</div>
										</div>
								</td>
							</tr>
						</table>

					</div>
					<div class="text-center">
					<input type="hidden" name="mileage" value="${user.mileage}">
					<button type="submit" class="primary-btn">정보 수정</button>
					</div>
					</form>
					<br><br>
				</div>
				</div>
			</div>
		</div>
		</div>
		<div class="row">
	<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header border-bottom-0">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="text-center"><h5>회원탈퇴</h5>
	      </div>
	      <hr>
	      <div class="modal-body">
	        <div class="d-flex flex-column text-center">
	          <form action="deleteM.do">
	            <div class="form-group">
	              <input type="text" class="form-control" id="mid" placeholder="아이디를 입력해주세요.">
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control" id="mpw" placeholder="비밀번호를 입력해주세요.">
	            </div>
	            <button type="submit" class="btn btn-dark btn-block btn-round">회원탈퇴</button>
	          </form>
	        </div>
	        <br>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
		<script>
			function pointEffect() {
				$(".square, .circle, .triangle, .close, .star, .message").css(
						"display", "block");
				setTimeout(function() {
					$(".square, .circle, .triangle, .close, .star, .message")
							.css("display", "none");
				}, 3000);
			}
		</script>

		<header:footer />
		<!-- Footer Section End -->

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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
		
		<script>
		   window.onload = function(){
		       document.getElementById("searchAdd").addEventListener("click", function(){ //주소입력칸을 클릭하면
		           //카카오 지도 발생
		           new daum.Postcode({
		               oncomplete: function(data) { //선택시 입력값 세팅
		                   document.getElementById("streetaddress").value = data.address; // 주소 넣기
		                   document.getElementById('zipcode').value = data.zonecode; // 우편 번호 넣기
		                   document.querySelector("input[name=address]").focus(); //상세입력 포커싱
		               }
		           }).open();
		       });
		   }
		</script>
</body>
</html>