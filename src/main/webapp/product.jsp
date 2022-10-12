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
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript">
               $( function() {
                  
                   $( "#slider-range" ).slider({
                     range: true,
                     min: 0,
                     max: 100,
                     step: 10,
                     values: [ 30, 50 ],
                     slide: function( event, ui ) {
                       $( "#amount" ).val(   ui.values[ 0 ] + "만원 - " + ui.values[ 1 ]+"만원" );
                       $("#price").val(ui.values[ 0 ]);
                       $("#price2").val(ui.values[ 1 ]);
                     }
                   });
                   
                   $( "#amount" ).val(  $( "#slider-range" ).slider( "values", 0 ) +
                     "만원 - " + $( "#slider-range" ).slider( "values", 1 )+"만원" );
                 } );
               
               </script>
<script type="text/javascript">
               $( function() {
                   $( "#slider-range1" ).slider({
                     range: true,
                     min: 0,
                     max: 50,
                     step: 5,
                     values: [ 15, 30 ],
                     slide: function( event, ui ) {
                       $( "#amount1" ).val(   ui.values[ 0 ] + "cm - " + ui.values[ 1 ]+"cm" );
                       $("#size").val(ui.values[ 0 ]);
                       $("#size2").val(ui.values[ 1 ]);
                     }
                   });
                   $( "#amount1" ).val(  $( "#slider-range1" ).slider( "values", 0 ) +
                     "cm - " + $( "#slider-range1" ).slider( "values", 1 )+"cm" );
                 } );
               
               </script>

    <!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/9bd2faeab5.js"
	crossorigin="anonymous"></script>
</head>

<body>
   
    <hearder:header/>
	<hr>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="/main.do">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

  <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="searchName.do">
                                <input type="text" name="pname" placeholder="이름 검색">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <form action="filter.do" method="post" name="filterForm">
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">주제</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show">
                                        <div class="card-body">
                                        	<div class="shop__sidebar__brand">
                                                <ul>
                                                    <li><input type="checkbox" name="pname" value="원피스""><label>원피스</label> </li>
                                                    <li><input type="checkbox" name="pname" value="나루토" ><label>나루토</label> </li>
                                                    <li><input type="checkbox" name="pname" value="하이큐" ><label>하이큐</label> </li>
                                                    <li><input type="checkbox" name="pname" value="이누야샤" ><label>이누야사</label> </li>
                                                    <li><input type="checkbox" name="pname" value="귀멸의 칼날" ><label>귀멸의 칼날</label> </li>
                                                    <li><input type="checkbox" name="pname" value="보컬로이드" ><label>보컬로이드</label> </li>
                                                    <li><input type="checkbox" name="pname" value="방탄소년단" ><label>방탄소년단</label> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">원산지</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                   <li><input type="checkbox" name="pmade" value="일본" class="pixel-radio"><label>일본</label> </li>
                                                   <li><input type="checkbox" name="pmade" value="중국" class="pixel-radio"><label>중국</label> </li>
                                                   <li><input type="checkbox" name="pmade" value="미국" class="pixel-radio"><label>미국</label> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">재질</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                   <li><input type="checkbox" name="pmat" value="ABS" class="pixel-radio"><label>ABS</label> </li>
                                                   <li><input type="checkbox" name="pmat" value="PVC" class="pixel-radio"><label>PVC</label> </li>
                                                   <li><input type="checkbox" name="pmat" value="플라스틱" class="pixel-radio"><label>플라스틱</label> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">제조사</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                   <li><input type="checkbox" name="pcom" value="메가하우스" class="pixel-radio"><label>메가하우스</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="굿스마일컴퍼니" class="pixel-radio"><label>굿스마일컴퍼니</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="반프레스토" class="pixel-radio"><label>반프레스토</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="에이펙스" class="pixel-radio"><label>에이펙스</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="파이넥스" class="pixel-radio"><label>파이넥스</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="후류" class="pixel-radio"><label>후류</label> </li>
                                                   <li><input type="checkbox" name="pcom" value="타이토" class="pixel-radio"><label>타이토</label> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">가격(원)</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                            <p>
											  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
											</p>
											<div id="slider-range"></div>
                                                   <input type="hidden" name="price" id="price">
                                             <input type="hidden" name="price2" id="price2">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">치수</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                            <p>
											  <input type="text" id="amount1" readonly style="border:0; color:#f6931f; font-weight:bold;">
											</p>
											<div id="slider-range1"></div>
                                               <input type="hidden" id="size" name="size">
                                       <input type="hidden" id="size2" name="size2">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" value="검색" class="primary-btn">
                         </form>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>전체상품 : </p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>가격순으로 보기:</p>
                                    <select name="pdetail" onchange="sortPrice()" id="sortPrice">
	                                   <option>----</option>
	                                   <option value="low" >낮은 금액부터</option>
	                                   <option value="high" >높은 금액부터</option>
	                         </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="figures">
                    	<!-- 상품 뽑아낼 반복문 위치 -->
                     <c:forEach var="n" items="${products}" begin="1" end="24">
                        <div class="col-lg-4 col-md-6 col-sm-6 figure">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                  <a href="boardP.do?pid=${n.pid}">
                                  <img src="${n.pimg}"alt="" width="280" height="280"></a>
                                    <ul class="product__hover">
                        <!-- 로그인 상태 -->
						<c:if test="${user.mid!=null}">
							<c:choose>
								<c:when test="${n.fav==1}"><!-- 좋아요 되어있는 상품인지 확인 -->
        		                        <li><img id="${n.pid}fav_btn" src="img/icon/heartOn.png" alt="좋아요활성화" onclick="favorite(${n.pid});"></li>
								</c:when>
								<c:otherwise>
        		                        <li><img id="${n.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favorite(${n.pid});"></li>
                		           </c:otherwise>
							</c:choose>
                        </c:if>
                        
                        <!-- 비로그인 상태 -->
						<c:if test="${user.mid == null}">
                                <li><img id="${n.pid}fav_btn" src="img/icon/heart.png" alt="좋아요비활성화" onclick="favoriteN(${n.pid});"></li>
                        </c:if>
                        
                		           </ul>
                                </div>
                                 <div class="product__item__text">
                                    <h6>${n.pname }</h6>
                                    <h5>${n.price}원</h5>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- 상품 뽑아낼 반복문 끝 위치 -->
                    </div>
                    <!-- 더보기 버튼 자리 -->
					<div>
					<hr>
					<a id="moreProduct" href="javascript:more();" style="background-color: white;color: black;margin-left: 48%;border: 1px solid black;border-radius: 30px;padding: 1%;">
					더보기</a>
					<input type="hidden" id="cnt" value="24">
					</div>                    
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->


<hearder:footer/>


    <!-- Js Plugins -->
    <!-- <script src="js/jquery-3.3.1.min.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    
          <script type="text/javascript"> // 더보기 스크립트
                    function more(){
                     var cnt = $('#cnt').val();
                    	console.log("more()함수에 진입");
                    	$.ajax({
                    		url : "selectAllPajax.do",
                    		type : "POST",
                    		data : { "cnt" : cnt // 위 벨류에서 가져온 cnt를 controller 로 보냈다.
                    			
                    		},
                    		success : function(result){  // controller 에서 받은 hm 이 result 로 들어가고 pro/more 사용 가능
                    			console.log("b함수 실행 중");
                    			console.log(result);
                    			console.log(cnt);
                    			if(result.more==1){
                    			for(var n of result.pro){
                    				var product = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>";
                    				
                    				product += "<div class='product__item'>";
                    				product += "<div class='product__item__pic set-bg'>";
                    				product += "<img alt='이미지' src='"+n.pimg+"'>";
                    				product += "<ul class='product__hover'>";
                    				product += "<li><a href='favorite.jsp'><img src='img/icon/heart.png' alt=''></a></li>";
                    				product += "<li><a href='boardP.do?pid="+n.pid+"'><img src='img/icon/search.png' alt=''></a></li>";
                    				product += "<ul>";
                    				product += "</div>";
                    				product += "<div class='product__item__text'>";
                    				product += "<h6>"+n.pname+"</h6>";
                    				product += "<h5>"+n.price+"원</h5>";
                    				product += "</div>";
                    				product += "</div>";
                    				product += "</div>";
                    				
                    				$('#figures').append(product);
                    				
                    			}	
                    				cnt = Number(cnt);
                    				var cnt2 = 24;
                    				console.log(cnt+cnt2);
                    				$('#cnt').val(cnt+cnt2);
                    			}
                    			else {
                    				for(var n of result.pro){
                        				var product = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>";
                        				
                        				product += "<div class='product__item'>";
                        				product += "<div class='product__item__pic set-bg'>";
                        				product += "<img alt='이미지' src='"+n.pimg+"'>";
                        				product += "<ul class='product__hover'>";
                        				product += "<li><a href='favorite.jsp'><img src='img/icon/heart.png' alt=''></a></li>";
                        				product += "<li><a href='boardP.do?pid="+n.pid+"'><img src='img/icon/search.png' alt=''></a></li>";
                        				product += "<ul>";
                        				product += "</div>";
                        				product += "<div class='product__item__text'>";
                        				product += "<h6>"+n.pname+"</h6>";
                        				product += "<h5>"+n.price+"원</h5>";
                        				product += "</div>";
                        				product += "</div>";
                        				product += "</div>";
                        				
                        				$('#figures').append(product);
                        				
                        			}
                    				
                    				$("#moreProduct").remove();
                    			}
                    			
                    		}, error : function(request, status, error){
                    			console.log("상태코드 :" + request.status);
                    			console.log("메세지 :" + request.responseText);
                    			console.log("에러설명 :" + error);
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

                    <script type="text/javascript">
						function sortPrice(){
						      
						         var sortPrice = $("#sortPrice").val();
						         console.log("정렬 [" + sortPrice + "]");
						         $.ajax({   
						            type : "post",
						            url : "sortPrice.do",
						            data :  {
						            	"pdetail": sortPrice
						            },
						            success : function(result) {
						                console.log(result);
										$('.figure').remove();
										
										for(var n of result){
											
											var item = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>";

											item += "<div class='product__item'>";
											item += "<div class='product__item__pic set-bg'>";
											item += "<img alt='이미지' src='"+n.pimg+"'>";
											item += "<ul class='product__hover'>";
											item +=	"<li><a href='favorite.jsp'><img src='img/icon/heart.png' alt=''></a></li>";
											item += "<li><a href='boardP.do?pid="+n.pid+"'><img src='img/icon/search.png' alt=''></a></li>";
											item += "</ul>";
											item += "</div>";
											item += "<div class='product__item__text'>";
											item += "<h6>"+n.pname+"</h6>";
											item += "<h5>"+n.price+"원</h5>";
											item += "</div>";
											item += "</div>";
											item += "</div>";
											
											$('#figures').append(item);
										}
										
						             },
						             error : function(request, status, error) { // 순서 체크해보기!
						                console.log("상태코드: " + request.status);
						                console.log("메세지: " + request.responseText);
						                console.log("에러설명: " + error);
						             }
						          });
						         }
					</script>
    
</body>

</html>