<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="hearder" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
                  <h4>장바구니</h4>
                  <div class="breadcrumb__links">
                     <a href="main.do">Home</a> <a href="/selectAllP.do">Shop</a> <span>장바구니</span>
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
                  <hr>
                  </div>
					
                  <c:forEach var="c" items="${cart}">
                     <div id="${c.pid}" class="box_count" style="width: 100%; height: 130px; margin-bottom: 10px;">
                            <input type="hidden" class="individual_cartPid_input" value="${c.pid}"> 
                            <%--<input type="hidden" class="individual_cartPname_input" value="${c.name}">--%>
                             <input type="hidden" class="individual_cartCnt_input" value="${c.cnt}">                  
                            <%--<input type="hidden" class="individual_cartTotal_input" value="${c.total}">--%>                                           
                        <div class="product_Detail" >
                           <div class="product_Img" style="float:left; width:20%; padding-top:5px;"><a href="boardP.do?pid=${c.pid}"><img src="${c.pimg}" style="width:120px;"alt="img"></a>
                           </div>
                           <div class="product_Name_Price" style="float:left; width:40%; margin-top:10px;"><span>${c.pname}</span> <br><br><span>${c.price}  재고 ${c.pcnt}</span>
                           </div>
                        </div>
                        
                        <div class="product_Cnt" style="float:left; width:12%; margin-top:45px; margin-left:10px;"> 
                           <button class="minus_btn" style="border:none; background-color:inherit;"> <i class="fa fa-angle-left"></i></button>
                           <span class="input_cnt" style="width:30px; ">${c.cnt} </span> 
                           <button class="plus_btn" style="border:none; background-color:inherit;"> <i class="fa fa-angle-right"></i></button>
                           <input type="hidden" class="input_price" value="${c.price}">
                           <input type="hidden" class="input_pid" value="${c.pid}">
                           <input type="hidden" class="input_pcnt" value="${c.pcnt}">
                        </div>
                        <input class="product_Total" style="float:left; border:0px solid black; width:20%;  margin-top:45px;" value="${c.cnt * c.price}" >                     
                        <button style=" margin-top:45px;  margin-left:10px; border:none; background-color:inherit; font-size:22px;" onclick="cartD(${c.pid})"><i class="fa fa-close"></i></button>                     
                     </div>
                     <hr>
               </c:forEach>
               </div>
               <div class="row">
               <div class="col-lg-6 col-md-6 col-sm-6">
                     <div class="continue__btn">
                        <a href="selectAllP.do">더 보러가기</a>
                     </div>
                     </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                     <div class="continue__btn">
                        <a style="float:right; color:#fff;" class="primary-btn" href="cartM.do"><i class="fa fa-spinner"></i> 장바구니 비우기</a>
                     </div>
                     </div>
            </div>
            </div>
            
            <div class="col-lg-4">
               <div class="cart__total">
                  <h6>상품 금액</h6>
                  <hr>
                  <div>
                     <input class="final_total" type="text"
                         style="border: none; width: 100%; color:red; font-size:22px; text-align:right; background:inherit;">
                  </div>
                  <c:choose>
                  	<c:when test="${member!=null }">
	                  <a href="pay.do" class="primary-btn">주문하기</a>
                  	</c:when>
                  	<c:otherwise>
                  	  <a style="color:#fff" class="primary-btn" onclick='login_alert();'>주문하기</a>
                  	</c:otherwise>
                  </c:choose>
               </div>
                  
            </div>
            <!-- col -->
            
            </div> 
            </div> 
            <!-- row -->
            
            

   </section>
   <!-- Shopping Cart Section End -->

   <hearder:footer />

<script type="text/javascript">
		function login_alert(){
			alert('로그인 후 이용해주세요.');
		}
				// 셋 함수
		function reCal(){
			var totalPrice=0;
	  		$(".product_Cnt").each(function(index, element) {
				// 총 가격
				totalPrice += $(element).find(".input_cnt").text()*$(element).find(".input_price").val();
				// 개별 상품 가격
				productPrice = $(element).find(".input_cnt").text()*$(element).find(".input_price").val();
		        $(this).next(".product_Total").val(productPrice);
				$('.final_total').val(totalPrice); 
			});
		}
				// 셋 함수
		function reCalM(){
			var totalPrice=0;
	  		$(".product_Cnt").each(function(index, element) {
				// 총 가격
				totalPrice -= $(element).find(".input_cnt").text()*$(element).find(".input_price").val();
				productPrice = $(element).find(".input_cnt").text()*$(element).find(".input_price").val();
				// 개별 상품 가격
		        $(this).next(".product_Total").val(productPrice);
				$('.final_total').val(-totalPrice); 
			});
		}
		$(function(){
			reCal();
		});
		
		
      /* 수량버튼 */
      $('.plus_btn').on("click", function() {
    	 var product_price = 0;
         let quantity = $(this).parent("div").find("span").html();
         $(this).parent("div").find("span").html(++quantity);
  		$(".product_Cnt").each(function(index, element) {
  		 var pid= $(element).find('.input_pid').val();
  		 var pcnt= $(element).find('.input_pcnt').val();
         var cnt= Number($(element).find('.input_cnt').text());
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
  		});
		 reCal();
      });

      $(".minus_btn").on("click", function() {
         
          let product_price = $(this).parent("div").find("input").val();
          
          let quantity = $(this).parent("div").find("span").html();
          if (quantity > 1) {
             $(this).parent("div").find("span").html(--quantity);
          console.log("수량변경 숫자 : " + quantity);
          //세션 업데이트 부분
  		$(".product_Cnt").each(function(index, element) {

  		 var pid= $(element).find('.input_pid').val();
         var cnt= Number($(element).find('.input_cnt').text());
          
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
         reCalM();
  		});

         };
      });


      //////////////////////삭제버튼/////////////////////////////
		function cartD(pid){
		    
			console.log("pid : ", pid);
			
			console.log("div : ", document.getElementById(pid));
			const div =	document.getElementById(pid);		
			div.remove();
	        var pid = pid;
		       
	        $.ajax({   
	           type : 'POST',
	           url : 'cartD.do',
	           data :  {
	              'pid': pid
	           },
	           success : function(result) {
	             	    console.log(result);
	              if (result === 'success') {
	           	   console.log('장바구니 삭제 성공');
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