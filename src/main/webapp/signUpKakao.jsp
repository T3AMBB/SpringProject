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
    <link rel="stylesheet" href="css/signUp.css" type="text/css">
    <!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/9bd2faeab5.js"
	crossorigin="anonymous"></script>
</head>

<body>
    
    <hearder:header/>
	  <div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
 		<form action="signUp.do" method="post">
          <h2 class="sub_tit_txt">회원가입</h2>
          <p class="exTxt">카카오 계정을 사용하기 위한 추가 회원가입을 진행합니다.</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td class="row"><input type="text" placeholder="ID 를 입력하세요." id="mid" name="mid" value="${kakao.mid}" required readonly="readonly"></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td class="row"><input type="text" placeholder="이름을 입력해주세요." id="mname" name="mname"  value="${kakao.mname}" required readonly="readonly"></td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td class="row"><input type="text" placeholder="휴대폰 번호를 입력하세요." id="mphone" name="mphone" required></td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr style="text-align:right">
                  <th></th>
                  <td><button type="button" id="searchAdd" class="btn btn-dark">우편번호 검색</button></td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td class="row"><input  type="text" id="add_zone" placeholder="우편번호" name="zipcode" readonly="readonly"></td>
                </tr>
                <tr>
                  <th></th>
                  <td class="row" colspan="2"><input type="text" id="add_load" placeholder="도로명 주소" name="streetaddress" readonly="readonly"></td>
                </tr>
                <tr>
                <th></th>
                  <td class="row" colspan="2"><input type="text" name="address" placeholder="상세 주소" required></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          </div><!-- join_form E  -->
          <div class="agree_wrap">
            <div class="checkbox_wrap">
              <input type="checkbox" id="news_letter" name="news_letter" class="agree_chk">
              <label for="news_letter">[선택]뉴스레터 수신동의</label>
            </div>
            <div class="checkbox_wrap mar27">
              <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
              <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
              <ul class="explan_txt">
                <li><span class="red_txt">항목 : 휴대폰 번호, 주소</span></li>
                <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
                  대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
                  다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                </li>
              </ul>
            </div>
          </div>
          <div class="btn_wrap2">
          <input type="hidden" name="mpw" value="${kakao.mpw}">
          <input type="hidden" name="mileage" value="0">
            <button type="submit" class="btn btn-dark btn-lg">회원가입</button>
          </div>
          </form>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    <br>
    
    <hearder:footer/>
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
	                   document.getElementById("add_load").value = data.address; // 주소 넣기
	                   document.getElementById('add_zone').value = data.zonecode; // 우편 번호 넣기
	                   document.querySelector("input[name=address]").focus(); //상세입력 포커싱
	               }
	           }).open();
	       });
	   }
	</script>
</body>

</html>