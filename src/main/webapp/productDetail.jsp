<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
		<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	
</head>

<body>
   
    <hearder:header/>
    	<hr>

    <!-- Shop Details Section Begin -->
    <section class="shop-details">
      <div class="product__details__pic" style="padding-bottom: 1px;">
         <div class="container">
            <div class="product__details__breadcrumb">
          	  <div class="col-lg-12" style="padding-bottom: 5%;">
                    <div class="breadcrumb__text">
                        <h4>Home</h4>
                        <div class="breadcrumb__links">
                            <a href="/selectAllP.do">Shop</a>
                            <span>상품상세</span>
                        </div>
                    </div>
              </div>
            </div>
            
            
            <div class="tab-content">
               <div class="tab-pane active" id="tabs-1" role="tabpanel">
               <div class="row">
                  <div class="col-lg-6" >
                  <div class="product__details__pic__item">
                     <img src="${product.pimg}" alt="상품이미지" style="margin-top: 25%; margin-block: auto; border: 1px solid black; padding: 1%">
                  </div>
                  <div>
                  </div>
                  </div>
                  
				<form class="col-lg-6" action="cartP.do" method="post" style="display : inline; margin:0px;">
                  <div class="col-lg-12" style="border:1px solid black; padding:3%;padding-bottom: 1%;padding-top: 4%;">
                     <div class="product__details__text">
                     	<div class="producttext" style="text-align:initial;">
                        <h4>${product.pname}</h4>
                        <br>
                     	</div>
                        <h4 style=" margin-right: 45%;">
                           <input type="text" class="product_price"value="${product.price }" style="border: none;width: 60%; margin-left:20%; -webkit-text-stroke-width: medium;" readonly>원
                        </h4>
                        <br>
                        <br>
                        <div style="margin-left:16%;">
                      					     
                        <table>
                    	    <tbody>
         						<tr>
         							<th scope="row" style="text-align: left; margin-top: 15px; padding-bottom: 15px;">제조사</th>
         							<td style="padding-left: 100px; margin-top: 15px; text-align: left; padding-bottom: 15px;">${product.pcom }</td>
         						</tr>
         						<tr>
         							<th scope="row" style="text-align: left; margin-top: 15px; padding-bottom: 15px;" >원산지</th>
         							<td style="padding-left: 100px; margin-top: 15px; text-align: left; padding-bottom: 15px;">${product.pmade }</td>
         						</tr>
         						<tr>
         							<th scope="row" style="text-align: left; margin-top: 15px; padding-bottom: 15px;"> 재질</th>
         							<td style="padding-left: 100px; margin-top: 15px; text-align: left;padding-bottom: 15px;">${product.pmat }</td>
         						</tr>
         						<tr>
         							<th scope="row" style="text-align: left; padding-bottom: 15px;">치수</th>
         							<td style="padding-left: 100px; margin-top: 15px; text-align: left; padding-bottom: 15px;">${product.psize }cm</td>
         						</tr>
         						
         						
         						<tr>
         							<th scope="row" style="text-align: left; margin-top: 20px;">수량</th>
         							
         								<c:if test="${product.pcnt>0}">
         							<td>
										<div class="product__details__cart__option" >
                      					     <div class="quantity" >
                           					   <div class="pro-qty" scope="row" style="text-align:center; margin-top: 20px; margin-left: 100px;">
                              					   <input type="text" value="1" id="cnt" name="cnt" readonly>
                           					   </div>
                          				 </div>
                     					 </div>
									</td>
                     					 </c:if>
                     					 <c:if test="${product.pcnt<=0}">
                              					<td style="color: #ff6623; font-size: 26px; font-weight: 700; padding-left: 100px; margin-top: 15px; text-align: left; padding-bottom: 15px;">재고가 없습니다.</td>
                     					 </c:if>
         						</tr>
                      		  </tbody>
                        </table>
                        ${product.pid}
                       재고 ${product.pcnt}
                        </div>
						 
                        <hr>
                        <div style="margin-left:16%;">
                        <table>
                        	<tbody>
                        		<tr>
                                 	<th scope="row" style="width: 35%; text-align: left; padding-bottom: 25px;">총 구매금액</th>
         							<td style="padding-left: 0px; margin-top: 20px; text-align: left; padding-bottom: 25px;">
         							<strong><input type="text" class="mbox" value="${product.price}" style="border:none;  width: 55%;color: #ff6623; font-size: 26px; font-weight: 700;">원</strong></td>
                        		</tr>
                        	</tbody>
                        </table>
                        </div>
                        <div>
						<c:choose>
						<c:when test="${product.status==1}">
                        <button type="button" class="primary-btn" id="btn-cart" onclick="cart(${product.pid});"style="border-radius: 30px;border: 2px solid black;background:white;color: #333 !important;" disabled="disabled">장바구니 담기완료</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:when>
                        <c:otherwise>
                        <button type="button" class="primary-btn" id="btn-cart" onclick="cart(${product.pid});"style="border-radius: 30px;border: 2px solid black;background:white;color: #333 !important;">장바구니 담기</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:otherwise>
                        </c:choose>	
                  	<input type="hidden" name="pid" value="${product.pid}">
                  		<!-- 바로 구매하기 비로그인 & 재고부족 -->
                  		<c:choose>
                  		<c:when test="${member==null}">
                        <input type="button" onclick='login_alert();' class="primary-btn" style="cursor:pointer; border-radius: 30px;" value="바로 구매하기">
						</c:when>
						<c:when test="${product.pcnt<=0}">
                        <input type="button" onclick='stock_alert();' class="primary-btn" style="cursor:pointer; border-radius: 30px;" value="바로 구매하기">
						</c:when>
						<c:otherwise>
						<input type="submit" class="primary-btn" style="cursor:pointer; border-radius: 30px;" value="바로 구매하기">
						</c:otherwise>
                        </c:choose>
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="product__details__btns__option">
                         <!-- 로그인 상태 -->
						<c:if test="${user.mid!=null}">
							<c:choose>
								<c:when test="${product.fav==1}"><!-- 좋아요 되어있는 상품인지 확인 -->
			                          <img id="${product.pid}fav_btn" src="img/icon/heartOn.png" alt="좋아요비활성화" onclick="favorite(${product.pid});"> 찜하기
								</c:when>
								<c:otherwise>
			                          <img id="${product.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favorite(${product.pid});"> 찜하기
                		           </c:otherwise>
							</c:choose>
                        </c:if>
						<!-- 비로그인 상태 -->
						<c:if test="${user.mid == null}">
							 <img id="${product.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favoriteN(${product.pid});"> 찜하기
                        </c:if>
                        </div>
                     </div>
                  </div>
				</form>
				
				
               </div>
            </div>
         </div>
      </div>
      </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"role="tab">상품설명</a>
                                </li>
                            </ul>
                            <br>
                            <div class="tab-content">
                            <img src="img/official.jpg" alt="" >
                            <br>
                            <br>
                            <br>
                            <img src="img/productm.png" alt="" style="padding:7%">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <img alt="" src="${product.pdetail }" style="padding: 15%;margin-left: 7%;">
                                    </div>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </section>
    <!-- Shop Details Section End -->
	<br>
	<br>
	<br>
	<hr>
	
    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">다른 상품들</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>상품이름</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <h5>상품금액</h5>
                        </div>
                    </div>
                </div>
                </div>
            </div>
    </section>
    <!-- Related Section End -->
    <hearder:footer/>

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
    <script>
    	function login_alert(){
			alert('로그인 후 이용해주세요.');
    	}
    	function stock_alert(){
			alert('재고가 부족합니다.');
    	}
    </script>
<script>

	var default_price=$('.product_price').val();
	var proQty = $('.pro-qty');
	proQty.prepend('<span class="fa fa-angle-down inc qtybtn"></span>');
	proQty.append('<span class="fa fa-angle-up dec qtybtn"></span>');
	proQty.on('click', '.qtybtn', function() {
		var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		if ($button.hasClass('dec')) {
			if( oldValue >= ${product.pcnt}){
				alert("재고가 부족합니다.");
				var newVal = oldValue;
			}
			else if(oldValue < 10){
				newVal = parseFloat(oldValue)+1;
			}else {
				alert("한번에 최대 10개 까지 주문 가능합니다")
				newVal = 10;
			}
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 1) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				alert("1개 이상 부터 주문 가능합니다");
				newVal = 1;
			}
		}
		$button.parent().find('input').val(newVal);
		
		var show_total_amount = default_price * newVal;
		$(".mbox").val(show_total_amount)
		console.log(show_total_amount);
		console.log(default_price);
	
	});
</script>
<script type="text/javascript">
function cart(pid){
      
         var cnt = $('#cnt').val();
         
         console.log(pid);
         $.ajax({   
            type : 'POST',
            url : 'cart.do',
            data :  {
               'cnt': cnt,
               'pid': pid
            },
            success : function(result) {
               
               if (result == 'success') {
                  $("#btn-cart").text("장바구니 담기완료!");
                  $("#btn-cart").attr('disabled','disabled');
                  }
               
               } 
            });
         }
</script>

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