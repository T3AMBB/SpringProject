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
                     <img src="img/figure/${product.pid }.png" alt="" style="margin-top: 25%; margin-block: auto; border: 1px solid black; padding: 1%">
                  </div>
                  <div>
                  </div>
                  </div>
                  
				<form class="col-lg-6" action="pay.do?pid=${product.pid}&pcnt=${product.pcnt}" method="post" style="display : inline; margin:0px;">
                  <div class="col-lg-12" style="border:1px solid black; padding:3%;padding-bottom: 1%;padding-top: 4%;">
                     <div class="product__details__text">
                     	<div class="producttext" style="text-align:initial;">
                        <h4>${product.pname }</h4>
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
         							<td>
										<div class="product__details__cart__option" >
                      					     <div class="quantity" >
                           					   <div class="pro-qty" scope="row"style="text-align: center; margin-top: 20px; margin-left: 100px;">
                              					   <input type="text" value="1" readonly>
                           					   </div>
                          				 </div>
                     					 </div>
									</td>
         						</tr>
                      		  </tbody>
                        </table>
                        </div>
						 
                        <hr>
                        <div style="margin-left:16%;">
                        <table>
                        	<tbody>
                        		<tr>
                                 	<th scope="row" style="width: 35%; text-align: left; padding-bottom: 25px;">총 구매금액</th>
         							<td style="padding-left: 0px; margin-top: 20px; text-align: left; padding-bottom: 25px;">
         							<strong><input type="text" class="mbox" value="${product.price }" style="border:none;  width: 55%;color: #ff6623; font-size: 26px; font-weight: 700;">원</strong></td>
                        		</tr>
                        	</tbody>
                        </table>
                        </div>
                        <div>
							
                        <a href="/cart.do" class="primary-btn" style="border-radius: 30px;border: 1px solid black;background:white;color: #333 !important;">장바구니 담기</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" value="${product.pid }${product.pcnt}">
                        <input type="submit" class="primary-btn" style="border-radius: 30px;" value="바로 구매하기">
							
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="product__details__btns__option">
                          <img id="fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favorite(${product.pid});"> 찜하기
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
                                        <img alt="" src="${product.pdetail }" style="padding:11%">
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
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
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
<script type="text/javascript">
function cart(){
      
         var cnt = $('#cnt').val();
         var pid = $('#pid').val();
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
         var mid = '${data.mid}';
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
                  $("#fav_btn").prop("src", "./img/icon/heartOn.png");
               } else if(result == 0){
                  console.log("로그3 [좋아요-1]");
                  $("#fav_btn").prop("src", "./img/icon/heart.png");
               }
            },
            error : function(request, status, error) { 
               console.log("상태코드: " + request.status);
               console.log("메세지: " + request.responseText);
               console.log("에러설명: " + error);
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