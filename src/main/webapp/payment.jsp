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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
	
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
						주문상품 <span style="color:red" class="goods_kind_div_count">3</span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="table table-borderless">
						<tbody>
							<tr>
								<th>상품사진</th>
								<th>상품명</th>
								<th>구매수량</th>
								<th>가격</th>
							</tr>
						</tbody>
					</table>
					<table class="table table-borderless">
						<tbody>
								<tr>
									<td>
										<div class="image_wrap" data-bookid="" data-path="" data-uuid="" data-filename="">
											<img>
										</div>
									</td>
									<td class="goods_table_price_td">
										<input type="hidden" class="individual_bookPrice_input" value="${ol.bookPrice}">
										<input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.bookCount}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.bookCount}">
										<input type="hidden" class="individual_point_input" value="${ol.point}">
										<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
										<input type="hidden" class="individual_bookId_input" value="${ol.bookId}">
									</td>
								</tr>							
						</tbody>
					</table>
				</div>		
				<hr>
					<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="btn btn-dark" onclick="showAdress('1')" style="background-color: #343a40;">사용자 정보 주소록</button>
						<button class="btn btn-dark" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div style="height:200px;" class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
						<br>
							<table style="border-collapse: separate; border-spacing: 0 10px;">
								<tr>
									<th style="width:13%">주문자</th>
									<td>주문자</td>
								</tr>
								<tr>
									<th><span>주소</span></th>
									<td><input style="width:70% "type="text" id="" value="주소 넣을 공간"
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
										<td>주문자</td>
									</tr>
									<tr>
										<th><span>주소</span></th>
										<td><input style="width:70% "type="text" id="add_zone"
											placeholder="우편번호" readonly="readonly"><button style="width:30%; height:37px" type="button" id="searchAdd"
												class="btn btn-dark">우편번호 검색</button></td>
									</tr>
									<tr>
										<th></th>
										<td colspan="2"><input type="text"
											id="add_load" placeholder="도로명 주소" readonly="readonly"></td>
									</tr>
									<tr>
										<th></th>
										<td colspan="2"><input type="text"
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
						<input type="radio" class="ds" name="ds" value="쿠폰"><span> 쿠폰 사용하기</span>
						</div>
						<div style="float:left; margin-left:10px; padding:0.75rem;" class="point-wrap">
						<input type="radio" class="ds" name="ds" value="적립금"><span> 적립금 사용하기</span>
						</div>
					</div>
					</div>
					<p>쿠폰과 적립금 중 하나의 할인 방식을 선택해주세요.</p>
				</div>		
				<script>
					$('.ds').on('click', function() {
					    var valueCheck = $('.ds:checked').val(); // 체크된 Radio 버튼의 값을 가져온다.
					    
					    if ( valueCheck == '적립금' ) {
					        $('.order_point_input').attr('disabled', false); 
					        $('.coupon_select').prop("disabled", true);
					        $('.order_point_input').focus(); 
					    } 
					    else {
					        $('.order_point_input').attr('disabled', true); 
					        $('.coupon_select').prop("disabled", false);
					        $('.coupon_select').focus();
					        console.log($('.coupon_select_h').attr('disabled', false));
					    }
					});
				</script>
				<!-- 쿠폰 정보 -->
				<div class="coupon_div" >
					<div class="coupon_div_subject">쿠폰</div>
					<table class="table table-borderless">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody class="tb">
							<tr>
								<th>쿠폰 사용</th>
								<td>
									<select style="width:70%" class="coupon_select" name="select_name">
										<option>쿠폰 목록1</option>
										<option>쿠폰 목록2</option>
										<option>쿠폰 목록3</option>
									</select>
								</td>
							</tr>
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
									${memberInfo.point} <input style="width:70%" class="order_point_input" disabled value="0">원&nbsp;&nbsp;&nbsp;
									<a style="color:#fff" class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
									<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none; color:#fff;">사용취소</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			
				
				</div>
				<div class="col-lg-4">
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
								<span class="usePoint_span">100000</span>원
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
						<a style="color:#fff"class="order_btn" id="check_module">결제하기</a>
					</div>
				</div>		
				<br><br>
				<hr>
				<div class="user_info_div">
					<!-- 가격 종합 정보 -->
					<br><br>
					<div class="user_info_price_div">
						<table>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
							<tr>
								<th>주문자</th>
								<td>허허허</td>
							</tr>
							<tr><td></td></tr><tr><td></td></tr>
							<tr>
								<th>휴대폰번호</th>
								<td>000</td>
							</tr>
						</table>
					</div>
					<!-- 버튼 영역 -->
				</div>				
				</div>
			</div>
				<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="memberId" value="${memberInfo.memberId}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">
				<input name="memberAddr1" type="hidden">
				<input name="memberAddr2" type="hidden">
				<input name="memberAddr3" type="hidden">
				<!-- 사용 포인트 -->
				<input name="usePoint" type="hidden">
				<!-- 상품 정보 -->
			</form>
		</div>
		</div>
	</div>
	<hearder:footer/>

<script>
	$('.ds').on('click', function() {
	    var valueCheck = $('.ds:checked').val(); // 체크된 Radio 버튼의 값을 가져온다.
	    
	    if ( valueCheck == '적립금' ) {

	        $('.order_point_input').attr('disabled', false); 
	        $('.order_point_input').focus(); 
	    } 
	    else {
	        $('.order_point_input').attr('disabled', true); 
	        $('.coupon_select').attr('disabled', false);
	        $('.coupon_select').focus();
	        console.log($('.coupon_select').attr('disabled', false));
	    }
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
	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
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
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}


/* 포인트 입력 */
//0 이상 & 최대 포인트 수 이하
$(".order_point_input").on("propertychange change keyup paste input", function(){

	const maxPoint = parseInt('${memberInfo.point}');	
	
	let inputValue = parseInt($(this).val());	
	
	if(inputValue < 0){
		$(this).val(0);
	} else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}	
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();	
	
});


/* 포인트 모두사용 취소 버튼 
 * Y: 모두사용 상태 / N : 모두 취소 상태
 */
$(".order_point_input_btn").on("click", function(){

	const maxPoint = parseInt('${memberInfo.point}');	
	
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
	setTotalInfo();	
	
});


/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){

	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
	});	

	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
	finalTotalPrice = totalPrice + deliveryPrice;	
	
	/* 사용 포인트 */
	usePoint = $(".order_point_input").val();
	
	finalTotalPrice = totalPrice - usePoint;	
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	// 할인가(사용 포인트)
	$(".usePoint_span").text(usePoint.toLocaleString());	
	
}

/* 주문 요청 */
$(".order_btn").on("click", function(){

	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='addressee']").val($(obj).find(".addressee_input").val());
			$("input[name='memberAddr1']").val($(obj).find(".address1_input").val());
			$("input[name='memberAddr2']").val($(obj).find(".address2_input").val());
			$("input[name='memberAddr3']").val($(obj).find(".address3_input").val());
		}
	});	
	
	/* 사용 포인트 */
	$("input[name='usePoint']").val($(".order_point_input").val());	
	
	/* 상품정보 */
	let form_contents = ''; 
	$(".goods_table_price_td").each(function(index, element){
		let bookId = $(element).find(".individual_bookId_input").val();
		let bookCount = $(element).find(".individual_bookCount_input").val();
		let bookId_input = "<input name='orders[" + index + "].bookId' type='hidden' value='" + bookId + "'>";
		form_contents += bookId_input;
		let bookCount_input = "<input name='orders[" + index + "].bookCount' type='hidden' value='" + bookCount + "'>";
		form_contents += bookCount_input;
	});	
	$(".order_form").append(form_contents);	
	
	/* 서버 전송 */
	$(".order_form").submit();	
	
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
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
   $("#check_module").click(function () {
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
         name: '주문명 : 아메리카노',
         // 결제창에서 보여질 이름
         // name: '주문명 : ${auction.a_title}',
         // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
         amount: 100,
         // amount: ${bid.b_bid},
         // 가격 
         buyer_name: '이름',
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
         } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
         }
         alert(msg);
         location.href='payment.jsp';
      });
   });
	</script>
    <!-- 데이트피커 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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