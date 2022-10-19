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
	<title>PinaGunGong</title>

   <link rel="shorycut icon" href="img/pavi.png" type="image/png">
   <link rel="apple-touch-icon" href="img/pavi.png">

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
                     step: 1,
                     values: [ 0, 100 ],
                     slide: function( event, ui ) {
                       $( "#amount" ).val(   ui.values[ 0 ] + "만원 - " + ui.values[ 1 ]+"만원" );
                       $("#price").val(ui.values[ 0 ]*10000);
                       $("#price2").val(ui.values[ 1 ]*10000);
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
                     step: 1,
                     values: [ 0, 50 ],
                     slide: function( event, ui ) {
                       $( "#amount1" ).val(   ui.values[ 0 ] + "cm - " + ui.values[ 1 ]+"cm" );
                       $("#psize").val(ui.values[ 0 ]);
                       $("#psize2").val(ui.values[ 1 ]);
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

  <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <form action="filter.do" method="post" name="filterForm">
                        <div class="shop__sidebar__search">
                                <input type="text" name="pname" placeholder="이름 검색">
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">원산지</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                   <li><input type="checkbox" name="pmade1" value="일본" class="pixel-radio"><label>일본</label> </li>
                                                   <li><input type="checkbox" name="pmade1" value="중국" class="pixel-radio"><label>중국</label> </li>
                                                   <li><input type="checkbox" name="pmade1" value="미국" class="pixel-radio"><label>미국</label> </li>
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
                                                   <li><input type="checkbox" name="pmat1" value="ABS" class="pixel-radio"><label>ABS</label> </li>
                                                   <li><input type="checkbox" name="pmat1" value="PVC" class="pixel-radio"><label>PVC</label> </li>
                                                   <li><input type="checkbox" name="pmat1" value="플라스틱" class="pixel-radio"><label>플라스틱</label> </li>
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
                                                   <li><input type="checkbox" name="pcom1" value="메가하우스" class="pixel-radio"><label>메가하우스</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="굿스마일컴퍼니" class="pixel-radio"><label>굿스마일컴퍼니</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="반프레스토" class="pixel-radio"><label>반프레스토</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="에이펙스" class="pixel-radio"><label>에이펙스</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="파이넥스" class="pixel-radio"><label>파이넥스</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="후류" class="pixel-radio"><label>후류</label> </li>
                                                   <li><input type="checkbox" name="pcom1" value="타이토" class="pixel-radio"><label>타이토</label> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">가격</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                            <p>
											  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
											</p>
											<div id="slider-range"></div>
                                             <input type="hidden" name="price" id="price" value="0">
                                             <input type="hidden" name="price2" id="price2" value="1000000">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">사이즈</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                            <p>
											  <input type="text" id="amount1" readonly style="border:0; color:#f6931f; font-weight:bold;">
											</p>
											<div id="slider-range1"></div>
                                              <input type="hidden" id="psize" name="psize" value="0">
 												<input type="hidden" id="psize2" name="psize2" value="50">
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
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>가격순으로 보기 : </p>
                                    <select name="pdetail" onchange="sortPrice()" id="sortPrice">
	                                   <option>----</option>
	                                   <option value="low" >낮은가격순</option>
	                                   <option value="high" >높은가격순</option>
	                         </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="figures">
                    	<!-- 상품 뽑아낼 반복문 위치 -->
                    	
                    <c:if test="${products.size()!=0}">	
                     <c:forEach var="n" items="${products}" begin="0" end="23">
                        <div class="col-lg-4 col-md-6 col-sm-6 figure">
                            <div class="product__item">
                                <div class="product__item__pic set-bg">
                                  <div class="img" style="overflow:hidden;">
                                  <a href="boardP.do?pid=${n.pid}">
                                  <img src="${n.pimg}"alt="" width="280" height="280">
                                  </a></div>
                                    <ul class="product__hover">
                        <!-- 로그인 상태 -->
						<c:if test="${member!=null}">
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
						<c:if test="${member == null}">
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
                        
                        
                    </c:if>
                    </div>
                    <c:if test="${products.size() < 1}">
                    	<img alt="검색제품없음" src="img/empty.png">
                        <h2>검색하신 조건의 상품이 존재하지 않습니다.....</h2>
                        </c:if>
					<div>
					<hr>
                    <!-- 더보기 버튼 자리 -->
					<c:if test="${products.size() > 24}">
					<a id="moreProduct" href="javascript:more();" style="background-color: white;color: black;margin-left: 48%;border: 1px solid black;border-radius: 30px;padding: 1%;">
					더보기</a>
					</c:if>
					<input type="hidden" id="cnt" value="24"> <!-- cnt 기본값 24로 세팅 -->
					</div>                    
                </div>
            </div>
        </div>
    </section>
 	${pcom}
    ${pmade}
    ${pmat} 
<!-- Shop Section End -->

<!-- hidden으로 세팅 -->
<input type="hidden" name="price" id="price3" value="${price}">
<input type="hidden" name="price2" id="price4" value="${price2}">
<input type="hidden" name="psize" id="psize3" value="${psize}">
<input type="hidden" name="psize2" id="psize4" value="${psize2}">
<input type="hidden" name="pdetail" id="pdetail1" value="${pdetail}">
<input type="hidden" name="pname" id="pname" value="${pname}">
	
<%-- <c:forEach var="m" items="${pmat}"  step="1"> --%>
<input type="hidden" name="pmat" id="pmat" value="${pmat}">
<%-- </c:forEach> --%>

<%-- <c:forEach var="d" items="${pmade}"  step="1"> --%>
<input type="hidden" name="pmade" id="pmade" value="${pmade}">
<%-- </c:forEach> --%>

 <%-- <c:forEach var="c" items="${pcom}"  step="1">  --%>
<input type="hidden" name="pcom" id="pcom" value="${pcom}">
 <%-- </c:forEach>  --%>
<input type="hidden" id="user" value="${member}" >



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
                    /*  var pcom= $("#pcom").val();
			            var pmade= $("#pmade").val();
			            var	pmat= $("#pmat").val(); */
			            var pname =  $("#pname").val(); 
			            var	price= $("#price3").val();
			            var price2 = $("#price4").val();
			            var psize = $("#psize3").val();
			            var psize2 = $("#psize4").val();     
			            var pdetail = $("#pdetail1").val();
			            
			            var user = $("#user").val();
			            console.log('/'+user+'/');
			            
			            let pmat = $("#pmat").val();
			            let pmat1 = pmat.replace('[',''); // 배열을 가져올때 '['가 포함되므로 replace를 통해 '['를 공백으로 변경 
			            let pmat2 = pmat1.replace(']','');

			            let pcom = $("#pcom").val();
			            let pcom1 = pcom.replace('[','');
			            let pcom2 = pcom1.replace(']','');
			            
			            let pmade = $("#pmade").val();
			            let pmade1 = pmade.replace('[','');
			            let pmade2 = pmade1.replace(']','');
			            
			            console.log('/'+price+'/');
			            console.log('/'+price2+'/');
			            console.log('/'+psize+'/');
			            console.log('/'+psize2+'/');
			       		console.log('/'+pname+'/');
			            console.log(pcom2);
			            console.log(pmade);
			            console.log(pmat);
			            console.log('/'+pdetail+'/');
			            console.log('/'+cnt+'/');
                    	console.log("more()함수에 진입");
                    	
                    	$.ajax({
                    		url : "selectAllPajax.do",
                    		type : "POST",
                    		data : { 
                    			"pdetail":pdetail, // 가격정렬을 유지하기 위해 같이 보냄, pdetail은 low 또는 high를 가지고 있음
                    			"cnt" :cnt, // 위 벨류에서 가져온 cnt를 controller 로 보냈다.
                    			"pcom1":pcom2,
				            	"pmade1":pmade2,
				            	"pmat1":pmat2, 
				            	"pname":pname,   
				            	"price":price,
				            	"price2":price2,
				            	"psize":psize,
				            	"psize2":psize2
                    		},
                    		success : function(result){  // controller 에서 받은 hm(map)이 result로 들어가고 pro/more 사용 가능
                    			console.log("more함수 실행 중");
                    			console.log(result);
                    			console.log(cnt);
                    			if(result.more==1){ // hm의 more이 1이라면
                    			for(var n of result.pro){ // forEach문 : hm의 pro(List)를 n이라는 변수로 반복
                    				var product = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>"; // product : 추가할 태그를 담을 변수
                    				
                    				product += "<div class='product__item'>";
                    				product += "<div class='product__item__pic set-bg'>";
                    				product += "<div class='img' style='overflow:hidden;'>";
                    				product += " <a href='boardP.do?pid="+n.pid+"'>";
                    				product += "<img alt='이미지' src='"+n.pimg+"'width='280' height='280'></a></div>";
                    				product += "<ul class='product__hover'>";
                    				
                    				if (user!=""){
                    					if(n.fav==1){
                    						product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heartOn.png' alt='좋아요활성화' onclick='favorite("+n.pid+");'></li>";
                    					}
                    					else{
                    						product += " <li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favorite("+n.pid+");'></li>";
                    					}
                    				}
                    				if(user==""){
                    					product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favoriteN("+n.pid+");'></li>";
                    				}
                    				product += "<ul>";
                    				product += "</div>";
                    				product += "<div class='product__item__text'>";
                    				product += "<h6>"+n.pname+"</h6>";
                    				product += "<h5>"+n.price+"원</h5>";
                    				product += "</div>";
                    				product += "</div>";
                    				product += "</div>";
                    				
                    				$('#figures').append(product); // id가 figures인 태그에 product를 추가
                    				
                    			}	
                    				cnt = Number(cnt); // cnt를 숫자로 타입변환
                    				var cnt2 = 24;
                    				console.log(cnt+cnt2); 
                    				$('#cnt').val(cnt+cnt2); // 기존 cnt에서 +24된 값을 id가 cnt인 value로 설정
                    			}
                    			else { // hm의 more이 1이 아니라면
                    				for(var n of result.pro){
                        				var product = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>";
                        				
                        				product += "<div class='product__item'>";
                        				product += "<div class='product__item__pic set-bg'>";
                        				product += "<div class='img' style='overflow:hidden;'>";
                        				product += " <a href='boardP.do?pid="+n.pid+"'>";
                        				product += "<img alt='이미지' src='"+n.pimg+"'width='280' height='280'></a></div>";
                        				product += "<ul class='product__hover'>";
                        				
                        				if (user!=""){
                        					if(n.fav==1){
                        						product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heartOn.png' alt='좋아요활성화' onclick='favorite("+n.pid+");'></li>";
                        					}
                        					else{
                        						product += " <li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favorite("+n.pid+");'></li>";
                        					}
                        				}
                        				if(user==""){
                        					product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favoriteN("+n.pid+");'></li>";
                        				}
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
                    				
                    				$("#moreProduct").remove(); // 더 보여줄 데이터가 없으므로, id가 moreProduct인 더보기 버튼 삭제
                    				cnt = Number(cnt); 
                    				var cnt2 = 24;
                    				console.log(cnt+cnt2);
                    				$('#cnt').val(cnt+cnt2);
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
						function sortPrice(){ // 가격정렬 
							var cnt = $('#cnt').val();
						        var sortPrice = $("#sortPrice").val();
 						       /*   var pcom= $("#pcom").val(); 
					             var pmade= $("#pmade").val();
					            var	pmat= $("#pmat").val();*/
					            var pname =  $("#pname").val();
					            var	price= $("#price3").val();
					            var price2 = $("#price4").val();
					            var psize = $("#psize3").val();
					            var psize2 = $("#psize4").val();   
					            var user = $("#user").val();
					            console.log('/'+user+'/');
					            
					            let pmat = $("#pmat").val();
					            let pmat1 = pmat.replace('[','');
					            let pmat2 = pmat1.replace(']','');

					            let pcom = $("#pcom").val();
					            let pcom1 = pcom.replace('[','');
					            let pcom2 = pcom1.replace(']','');
					            
					            let pmade = $("#pmade").val();
					            let pmade1 = pmade.replace('[','');
					            let pmade2 = pmade1.replace(']','');
						         console.log("정렬 [" + sortPrice + "]");
						         
						         
						         $.ajax({   
						            type : "post",
						            url : "sortPrice.do",
						            data :  {
						            	"cnt":cnt,
						            	"pdetail": sortPrice,
 						            	  "pcom1": pcom2,
						            	"pmade1": pmade2,
						            	"pmat1": pmat2, 
						            	 "pname": pname,   
						            	"price": price,
						            	"price2": price2,
						            	"psize": psize,
						            	"psize2": psize2        
						            	
						            	
						            },
						            success : function(result) {
						                console.log(result);
										$('.figure').remove();
										  var sortPrice1 = $("#sortPrice").val(); 
										for(var n of result){
											
											var product = "<div class='col-lg-4 col-md-6 col-sm-6 figure'>";

											product += "<div class='product__item'>";
		                    				product += "<div class='product__item__pic set-bg'>";
		                    				product += "<div class='img' style='overflow:hidden;'>";
		                    				product += " <a href='boardP.do?pid="+n.pid+"'>";
		                    				product += "<img alt='이미지' src='"+n.pimg+"'width='280' height='280'></a></div>";
		                    				product += "<ul class='product__hover'>";
		                    				
		                    				if (user!=""){
		                    					if(n.fav==1){
		                    						product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heartOn.png' alt='좋아요활성화' onclick='favorite("+n.pid+");'></li>";
		                    					}
		                    					else{
		                    						product += " <li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favorite("+n.pid+");'></li>";
		                    					}
		                    				}
		                    				if(user==""){
		                    					product += "<li><img id='"+n.pid+"fav_btn' src='img/icon/heart.png' alt='좋아요비활성화' onclick='favoriteN("+n.pid+");'></li>";
		                    				}
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
											$('#pdetail1').val(sortPrice1);
											console.log(sortPrice1);
										
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