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
<title><%-- <spring:message code="message.title"/> --%>장바구니 페이지
</title>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
   rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
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
                  <div class="table_head">
                     <span>Product</span> <span>Quantity</span> <span>Total</span> <span>비우기</span>
                     <hr>
                  </div>
                  <c:forEach var="c" items="${cart}">
                     <div id="${c.pid}" class="box_count" style="width: 100%; height: 130px; border: 2px solid red;">
                            <input type="hidden" class="individual_cartPid_input" value="${c.pid}"> 
                            <%--<input type="hidden" class="individual_cartPname_input" value="${c.name}">--%>
                             <input type="hidden" class="individual_cartCnt_input" value="${c.cnt}">                  
                            <%--<input type="hidden" class="individual_cartTotal_input" value="${c.total}">--%>                                           
                        <div class="product_Detail" >
                           <div class="product_Img" style="float:left; border:1px solid orange; width:20%;"> <img src="${c.pimg}" style="width:120px;"alt="img">
                           </div>
                           <div class="product_Name_Price" style="float:left; border:1px solid yellow; width:40%;"><span>${c.pname}</span> <br><br><span>${c.price}</span>
                           </div>
                        </div>
                        
                        <div class="product_Cnt" style="float:left; border:1px solid blue; width:15%;"> 
                           <button class="minus_btn"> <i class="fa fa-angle-left"></i></button>
                           <span style="width:30px; ">${c.cnt} </span> 
                           <button class="plus_btn"> <i class="fa fa-angle-right"></i></button>
                           <input type="hidden" class="individual_cartPrice_input" value="${c.price}">
                           
                        </div>
                        
                        <input class="product_Total" style="float:left; border:1px solid black; width:20%;" value="${c.cnt * c.price}">                     
                        <button onclick="cartD(${c.pid})"><i class="fa fa-close"></i></button>                     
                     </div>
               </c:forEach>
               </div> 
               <!-- 쇼핑카트 테이블 -->
               <h2>최종금액</h2>      
               <input type="text" class="final_total" value="00000">
               <button type="button" class="totalFn" onclick="totalFn();">시험운전</button>
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
      var final_total=0;
      
      function totalFn(){
          var $final_total = $(".box_count .product_Total")       
          var final_total = 0;        
         $final_total.find(".product_Total").each(function(){
            final_total += Number($(this).val());        
            });
      };
      

      /* 수량버튼 */
      $('.plus_btn').on("click", function() {
         let quantity = $(this).parent("div").find("span").html();
         $(this).parent("div").find("span").html(++quantity);
         console.log(quantity);
         //가격 변수 설정
         let product_price = $(this).parent("div").find("input").val();
         console.log(product_price);
         
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
                        
                        console.log('눌렸음');
                        }
                     } 
                  });
         //ajax종료
         
         //총합 출력 로직         
         product_Total = cnt * product_price;
         console.log(product_Total);
         $(this).parent("div").next("input").val(product_Total);
         final_total = final_total + product_Total
         
         $('.final_total').val(final_total);
      });

      $(".minus_btn").on("click", function() {
         
         let product_price = $(this).parent("div").find("input").val();
         console.log(product_price);
         
         let quantity = $(this).parent("div").find("span").html();
         if (quantity > 1) {
            $(this).parent("div").find("span").html(--quantity);
         console.log(quantity);
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
         console.log(product_Total);
         $(this).parent("div").next("input").val(product_Total);
         final_total = final_total - product_Total
         $('.final_total').val(final_total);
         }
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
</body>

</html>