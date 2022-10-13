<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <link rel="stylesheet" href="css/order.css" type="text/css">
    <link rel="stylesheet" href="css/signUp.css" type="text/css">
    
    <!-- 데이트 피커 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/datepicker.css">

    <!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/9bd2faeab5.js"
	crossorigin="anonymous"></script>
	<!-- 우편번호 찾기 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<style>
    .total_info_div {
        position: sticky;
        top: 400px;
    }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>

<body>

    <hearder:header/>
    			<!-- Breadcrumb Section Begin -->
			   <section class="breadcrumb-option">
			      <div class="container">
			         <div class="row">
			            <div class="col-lg-12">
			               <div class="breadcrumb__text">
			                  <h4>주문</h4>
			                  <div class="breadcrumb__links">
			                     <a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>주문 / 결제
			                        </span>
			                  </div>
			               </div>
			            </div>
			         </div>
			      </div>
			   </section>
			   <!-- Breadcrumb Section End -->		
	<br><br>
<div class="section">
<div class="container">
			<div class="content_main">
			<div class="row">
			<div class="col-lg-8">
				<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span style="color:red" class="goods_kind_div_count">${cart.size()}</span>개
					</div>
					<c:if test="${pay!=null}">
					<!-- 상품 테이블 -->
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th>상품사진</th>
								<th>상품명</th>
								<th>구매수량</th>
								<th>가격</th>
							</tr>
							<tr>
								<td><img src="${pay.pimg}"
								alt="상품 사진" width="100" height="100"></td>
								<td>${pay.pname}</td>
								<td>${pay.cnt}</td>
								<td>${pay.price}</td>
							</tr>
						</tbody>
					</table>
					</c:if>
					<c:if test="${pay==null }">
					<!-- 상품 테이블 -->
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th>상품사진</th>
								<th>상품명</th>
								<th>가격</th>
								<th>구매수량</th>
								<th>합계</th>
							</tr>
							<c:forEach var="cart" items="${cart}">
								<tr class="cart_price">
								<td><a href="boardP.do?pid=${cart.pid}"><img src="${cart.pimg }" 
								alt="상품 사진" width="100" height="100"></a></td>
								<td><a href="boardP.do?pid=${cart.pid}">${cart.pname}</a></td>
								<td>${cart.price}</td>
								<td>${cart.cnt}</td>
								<td>${cart.price*cart.cnt}</td>
								</tr>
								<tr>
								<td class="goods_table_price_td">
									<input type="hidden" class="cart_price" value="${cart.price}">
									<input type="hidden" class="cart_cnt" value="${cart.cnt}">
								</td></tr>
								</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>		
				<hr>
					<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="btn btn-dark" onclick="showAdress('1'); show1();" style="background-color: #343a40;">사용자 정보 주소록</button>
						<button class="btn btn-dark" onclick="showAdress('2'); show2();">직접 입력</button>
						<span>※ 상품 배송지를 선택해주세요.</span>
					</div>
					<input type="hidden" id="add_value">
					<div class="addressInfo_input_div_wrap">
						<div style="height:200px;" class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
						<br>
							<table style="border-collapse: separate; border-spacing: 0 10px;">
								<tr>
									<th style="width:13%">주문자</th>
									<td>${user.mname}</td>
								</tr>
								<tr>
									<th><span>주소</span></th>
									<td><input style="width:70% "type="text" id="add" value="${user.streetaddress} ${user.address}"
											readonly="readonly"></td>
								</tr>
								</tbody>
							</table>

						</div>
						<div style="height:200px;" class="addressInfo_input_div addressInfo_input_div_2">
						<br>
							<table style="border-collapse: separate; border-spacing: 0 10px;">
								<tbody>
									<tr>
										<th>주문자</th>
										<td>${user.mname}</td>
									</tr>
									<tr>
										<th><span>주소</span></th>
										<td><input style="width:70% "type="text" value="${user.zipcode}" id="add_zone"
											placeholder="우편번호" readonly="readonly"><button style="width:30%; height:37px" type="button" id="searchAdd"
												class="btn btn-dark" onclick='execution_daum_address();'>우편번호 검색</button></td>
									</tr>
									<tr>
										<th></th>
										<td colspan="2"><input type="text"
											id="add_load" value="${user.streetaddress}" class="address1_input" placeholder="도로명 주소" readonly="readonly"></td>
									</tr>
									<tr>
										<th></th>
										<td colspan="2"><input type="text" class="address2_input" value="${user.address}"
											name="address" placeholder="상세 주소"></td>
									</tr>
									</tbody>
								</table>
							</div>				

					</div>
				</div>
				<hr>
				<!-- 배송지 정보 -->
				<div class="goods_kind_div">					
					<table>
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody class="tb">
						<tr>
							<th>배송일</th>
							<td><input type="text" id="from" name="sDate"></td>
						</tr>	
						</tbody>
					</table>
				</div>
				<hr>
				<!-- 쿠폰&적립금 선택 -->
				<div class="point_div">
					<div class="point_div_subject">쿠폰 & 적립금</div>
					<div class="row">
					<div class="radio-wrap">
						<div style="float:left; margin-left:10px; padding:0.75rem;" class="coupon-wrap">
						<input type="radio" class="ds" id="ds" name="ds" value="쿠폰"><span> 쿠폰 사용하기</span>
						</div>
						<div style="float:left; margin-left:10px; padding:0.75rem;" class="point-wrap">
						<input type="radio" class="ds" name="ds" value="적립금"><span> 적립금 사용하기</span>
						</div>
					</div>
					</div>
					<p>※ 쿠폰과 적립금 중 하나의 할인 방식을 선택해주세요.</p>
				</div>		
				<hr>

				<!-- 쿠폰 정보 -->
				<div class="coupon_div" >
					<div class="coupon_div_subject">쿠폰</div>
					<table class="table table-borderless">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody class="tb">
							<c:if test="${fn:length(coupon)>0}">
							<tr>
								<th>쿠폰 사용</th>
								<td>
									<select style="width:70%" class="coupon_select" id="select_coupon" onchange=' check();' name="select_name">
										<option selected value="0">쿠폰 선택</option>
										<c:forEach var="c" items="${coupon}">
										<option value='${c.cid}'>${c.code}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							</c:if>
							<c:if test="${fn:length(coupon)==0}">
							<tr>
								<th>쿠폰 사용</th>
								<td>
									<select style="width:70%" class="coupon_select" id="select_coupon" onchange=' check_blank();' name="select_name">
										<option selected value="0">쿠폰이 존재하지 않습니다.</option>
									</select>
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<hr>
				<!-- 포인트 정보 -->
				<div class="point_div">
					<div class="point_div_subject">적립금</div>
					<table class="table table-borderless">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody class="tb">
							<tr>
								<th>포인트 사용</th>
								<td>
									<input style="width:70%" class="order_point_input" onkeyup='point()' disabled value="0">&nbsp;&nbsp;&nbsp;
									<a style=" display: none; color:#fff" class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
									<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none; color:#fff;">사용취소</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				<div  style="height:800px" class="col-lg-4">
				<div class="user_info_div">
					<!-- 가격 종합 정보 -->
					<br><br><br><br>
					<div class="user_info_price_div">
						<table>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
							<tr>
								<th>주문자</th>
								<td>${user.mname}</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>${user.mphone}</td>
							</tr>
						</table>
					</div>
					<hr>
					<!-- 버튼 영역 -->
				</div>	
				
				<!-- 주문 종합 정보 -->
				&nbsp;&nbsp;&nbsp;
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">할인금액</span>
								<span class="usePoint_span"></span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										1500000
									</span>원
								</strong>
							</li>
							<li class="point_li">
								<span class="price_span_label">적립예정 포인트</span>
								<span class="totalPoint_span">7960원</span>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a style="color:#fff" class="order_btn" id="check_module">결제하기</a>
					</div>
				</div>
				
				</div>
				<br><br><br><br><br><br><br><br>
			</div>

		</div>
		</div>
	</div>
	<hearder:footer/>
	<script>
	function check_blank(){
		alert('쿠폰이 존재하지 않습니다.');
	}
	function check(){
		if($('.ds').is(":checked") == false){
		    alert('쿠폰과 적립금 중 할인 유형을 선택해주세요.')
		   $("#ds").focus();	
		    return;
		}
		else{
			coupon();
		}
	}
	</script>
	<script type="text/javascript">
		var finalTotalPrice=0;
	function setInfo(){
		var totalPrice=0;
		var totalCount=0;
		var delivery_price=0;
		var totalPoint=0;
		$(".goods_table_price_td").each(function(index, element){
			// 총 가격
			totalPrice += $(element).find(".cart_price").val()*$(element).find(".cart_cnt").val();
			// 총 갯수
			console.log(totalPrice);
		});	
			/* 배송비 결정 */
			if(totalPrice >= 30000){
				delivery_price = 0;
			} else if(totalPrice == 0){
				delivery_price = 0;
			} else {
				delivery_price = 3000;	
			}
			// 배송비
			$(".delivery_price_span").text(delivery_price.toLocaleString());	
			
			usePoint = $(".order_point_input").val();
			$(".usePoint_span").text(usePoint.toLocaleString());
			console.log(usePoint.toLocaleString());
			// 물건 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			finalTotalPrice = totalPrice + delivery_price - usePoint;
			console.log(finalTotalPrice);
			totalPoint = totalPrice*0.01;
			
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
			// 총 마일리지
			$(".totalPoint_span").text(totalPoint.toLocaleString());
	}
</script>
<script>
$(function(){
	setInfo();
	});
</script>
<script>
var usePoint=0;
var finalTotalPrice=0;
	function coupon() {
		var totalPrice = 0;
		var totalCount = 0;
		var delivery_price = 0;
		var totalPoint = 0;

		$(".goods_table_price_td").each(
				function(index, element) {
					// 총 가격
					totalPrice += $(element).find(".cart_price").val()
							* $(element).find(".cart_cnt").val();
					// 총 갯수
					console.log(totalPrice);
				});
		/* 배송비 결정 */
		if (totalPrice >= 30000) {
			delivery_price = 0;
		} else if (totalPrice == 0) {
			delivery_price = 0;
		} else {
			delivery_price = 3000;
		}
		// 배송비
		$(".delivery_price_span").text(delivery_price.toLocaleString());

		var coupon = $("#select_coupon option:selected").text();
		alert(coupon);
		finalTotalPrice = totalPrice + delivery_price;
		if(coupon == "0"){
			return;
		}
		if (coupon == '고객감사쿠폰20%') {
			usePoint = finalTotalPrice * 0.2;
		} else {
			usePoint = finalTotalPrice * 0.1;
		}
		alert(usePoint);
		$(".usePoint_span").text(usePoint.toLocaleString());
		console.log(usePoint.toLocaleString());
		// 물건 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		finalTotalPrice -= usePoint;
		console.log(finalTotalPrice);
		totalPoint = 0;

		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		// 총 마일리지
		$(".totalPoint_span").text(totalPoint.toLocaleString());
	}
</script>
	<script>
	var usePoint =0;
	function point(){
		if (window.event.keyCode == 13) {
			usePoint = $(".order_point_input").val();
			console.log(usePoint);
	    	// 할인 금액
	    	$(".usePoint_span").text(usePoint.toLocaleString());
	    	console.log(typeof(usePoint));
		}
	}
	</script>
	<script>
	$('.ds').on('click', function() {

	    var valueCheck = $('.ds:checked').val(); // 체크된 Radio 버튼의 값을 가져온다.
	    if ( valueCheck == '적립금' ) {
	        $('.order_point_input').attr('disabled', false); 
	        $('.coupon_select').prop("disabled", true);
	        $('.order_point_input_btn_N').css('display', 'inline-block');
	        $('.order_point_input_btn_Y').css('display', 'none');
	        $('.coupon_select option:eq(0)').prop('selected', true); //첫번째 option 선택
	        $('.order_point_input').focus();
	    }
	    else {
	        $('.order_point_input').attr('disabled', true); 
	        $('.coupon_select').prop("disabled", false);
	        $('.order_point_input').val(0);
	        $('.order_point_input_btn_N').css('display', 'none');
	        $('.order_point_input_btn_Y').css('display', 'none');
	        $('.coupon_select').focus();
	    }
		setInfo();
	});
	</script>
<script>

/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
}
function show1(){
	$('#add_value').val('a');
	console.log($('#add_value').val());
}
function show2(){
	$('#add_value').val('b');
	console.log($('#add_value').val());
}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#add_zone").val(data.zonecode);
                $(".address1_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address2_input").attr("readonly", false);
                $(".address2_input").focus();	 
	        }
	    }).open();  	
}
/* 포인트 입력 */
//0 이상 & 최대 포인트 수 이하
$(".order_point_input").on("propertychange change keyup paste input", function(){

	const maxPoint = parseInt('${user.mileage}');	
	
	let inputValue = parseInt($(this).val());	
	
	if(inputValue < 0){
		$(this).val(0);
	} else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}	
	
	/* 주문 조합정보란 최신화 */
	setInfo();	
	
});
/* 포인트 모두사용 취소 버튼 
 * Y: 모두사용 상태 / N : 모두 취소 상태
 */
$(".order_point_input_btn").on("click", function(){

	const maxPoint = parseInt('${user.mileage}');	
	
	let state = $(this).data("state");	
	
	if(state == 'N'){
		console.log("n동작");
		/* 모두사용 */
		//값 변경
		$(".order_point_input").val(maxPoint);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "inline-block");
		$(".order_point_input_btn_N").css("display", "none");
	} else if(state == 'Y'){
		console.log("y동작");
		/* 취소 */
		//값 변경
		$(".order_point_input").val(0);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "none");
		$(".order_point_input_btn_N").css("display", "inline-block");		
	}	
	
	/* 주문 조합정보란 최신화 */
	setInfo();	
});

/* 주문 요청 */
$(".order_btn").on("click", function(){
	
	/* 데이트피커 값 넣기 */
	$("input[name='shipping']").val($("#from").val());	
	
	/* 전송 */
	$(".order_form").submit();	
	
});	


$(document).ready(function () {
    var tmp = parseInt($(".total_info_div").css('top'));

    $(window).scroll(function () {
        var scrollTop = $(window).scrollTop();
        var obj_position = scrollTop + tmp + "px";
		
        $(".total_info_div").stop().animate({
            "top": obj_position
        }, 800);

    }).scroll();
});
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
	<!-- 결제 -->
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		
	<script>
	

   $("#check_module").click(function () {
	   var prcadr="";
		if($('#add_value').val()=='b'){
			prcadr = $('#add_zone').val()+" "+$('.address1_input').val()+$('.address2_input').val();
			console.log("직접 " + prcadr);
		}
		else{
			prcadr = $('#add').val();
			console.log(prcadr);
		}
		
		if($('#from').val()==""){
			alert('배송일을 입력해주세요.');
            $("#from").focus();	
			return;
		}
	      var IMP = window.IMP; // 생략가능
	      IMP.init('imp17445447'); 
	      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	      // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	      IMP.request_pay({
	         pg: 'html5_inicis',
	         pay_method: 'card',
	         merchant_uid: 'merchant_' + new Date().getTime(),
	         /* `
	          *  merchant_uid에 경우 
	          *  https://docs.iamport.kr/implementation/payment
	          *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	          */
	         name: '${cart[0].pname}',
	         // 결제창에서 보여질 이름
	         // name: '주문명 : ${auction.a_title}',
	         // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
	         amount: 100,
	         // amount: ${bid.b_bid},
	         // 가격 
	         buyer_name: '${user.mname}',
	         // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
	         // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
	         buyer_postcode: '123-456',
	         
	         }, function (rsp) {
	            console.log(rsp);
	         if (rsp.success) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            // success.submit();
	            // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
	            // 자세한 설명은 구글링으로 보시는게 좋습니다.
	            alert(msg);
		         location.href='insertB.do?mid='+${user.mid}+'&pid='+${cart[0].pid}+'&buycnt='+${cart[0].cnt}
		         +'&shipping='+$("#from").val()+'&prcadr='+prcadr+'&cid='+$("select[name='select_name']").val()+'&mileage='+$('.order_point_input').val();	         } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	         }
	         alert(msg);
	         location.href='insertB.do?mid='+${user.mid}+'&pid='+${cart[0].pid}+'&buycnt='+${cart[0].cnt}
	         +'&shipping='+$("#from").val()+'&prcadr='+prcadr+'&cid='+$("select[name='select_name']").val()+'&mileage='+$('.order_point_input').val();
	        
	      });
	   }); 
	</script>
	<!-- 데이트피커 -->
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
		integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
    // 데이트피커 한글화
	$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년',
		});
    
    // 데이트피커 실행
    $("#from").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0
    });
	</script>
</body>

</html>