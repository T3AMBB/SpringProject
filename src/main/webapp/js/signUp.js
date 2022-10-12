/**
 *  sign-up java script
 */
 
   
   function joinFormCheck(){
      var id = document.getElementById("mid_form");
      var pw = document.getElementById("mpw_check");
      var pw_re = document.getElementById("mpw_recheck");
      var name = document.getElementById("mname_check");
      var phone = document.getElementById("mphone_check");
      var Streetaddress = document.getElementById("add_load_check");
      var Address = document.getElementById("add_add_check");
      
		
      if(id.value == ""){
         alert("아이디를 입력하세요.");
         id.focus();
         return false;
      }
      if(id.value.indexOf(" ") >= 0){
         alert("아이디에 공백을 사용할 수 없습니다.");
         id.focus();
         return false;
      }
      if(pw.value==""){
         alert("비밀번호를 입력하세요.");
         pw.focus();
         return false;
      }
      if(pw.value.indexOf(" ") >= 0){
         alert("비밀번호에 공백을 사용할 수 없습니다.");
         pw.focus();
         return false;
      }
/* 
      // 비밀번호 영문자+숫자+특수조합(5~25자리 입력) 정규식
      var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,25}$/;
      if(!pwdCheck.test(pw.value)){
         alert("비밀번호는 영문자 + 숫자+ 특수문자 조합으로 5~25자리 사용해야 합니다.");
         pw.focus();
         return false;
      }
*/
      if(pw_re.value.indexOf(" ") >= 0){
         alert("비밀번호 확인에 공백을 사용할 수 없습니다.");
         pw_re.focus();
         return false;
      }
      if(pw_re.value==""){
         alert("비밀번호 확인을 입력하세요.");
         pw_re.focus();
         return false;
      }
/* 
      if(pw.value!=pw_re.value){
         alert("비밀번호가 불일치합니다.");
         pw_re.focus();
         return false;
      }
*/
      if(name.value==""){
         alert("이름을 입력하세요.");
         name.focus();
         return false;
      }
      if(name.value.indexOf(" ") >= 0){
         alert("이름에 공백을 사용할 수 없습니다.");
         name.focus();
         return false;
      }
      if(phone.value==""){
         alert("휴대전화 번호를 입력하세요.");
         phone.focus();
         return false;
      }
       var regPhone = /^01([0|1|6|7|8|9])[0-9]{3,4}[0-9]{4}/;
      if(regPhone.test(phone.value) === false) {
         alert("휴대폰 번호 형식이 올바르지 않습니다.");
         phone.focus();
         return false;
        }
      if(Streetaddress.value == ""){
         alert("주소를 입력하세요.");
         Streetaddress.focus();
         return false;
      }      
      if(Address.value==""){
         alert("상세주소를 입력하세요.");
         Address.focus();
         return false;
      }

      alert("회원가입이 완료되었습니다.");

      document.regForm.submit();
      
   }

// =========================================================================



   function joinFormCheck2(){
      var id2 = document.getElementById("mid_check");
      var pw2 = document.getElementById("mpw");
      var pw_re2 = document.getElementById("mpw_re");
      var name2 = document.getElementById("mname");
      var phone2 = document.getElementById("mphone");
      var Streetaddress2 = document.getElementById("add_load");
      var Address2 = document.getElementById("add_add");
      
		
      if(id2.value == ""){
         alert("아이디를 입력하세요.");
         id2.focus();
         return false;
      }
      if(id2.value.indexOf(" ") >= 0){
         alert("아이디에 공백을 사용할 수 없습니다.");
         id2.focus();
         return false;
      }
      if(pw2.value==""){
         alert("비밀번호를 입력하세요.");
         pw2.focus();
         return false;
      }
      if(pw2.value.indexOf(" ") >= 0){
         alert("비밀번호에 공백을 사용할 수 없습니다.");
         pw2.focus();
         return false;
      }
/* 
      // 비밀번호 영문자+숫자+특수조합(5~25자리 입력) 정규식
      var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,25}$/;
      if(!pwdCheck.test(pw.value)){
         alert("비밀번호는 영문자 + 숫자+ 특수문자 조합으로 5~25자리 사용해야 합니다.");
         pw.focus();
         return false;
      }
*/
      if(pw_re2.value.indexOf(" ") >= 0){
         alert("비밀번호 확인에 공백을 사용할 수 없습니다.");
         pw_re2.focus();
         return false;
      }
      if(pw_re2.value==""){
         alert("비밀번호 확인을 입력하세요.");
         pw_re2.focus();
         return false;
      }
/* 
      if(pw.value!=pw_re.value){
         alert("비밀번호가 불일치합니다.");
         pw_re.focus();
         return false;
      }
*/
      if(name2.value==""){
         alert("이름을 입력하세요.");
         name2.focus();
         return false;
      }
	  if(name2.value.indexOf(" ") >= 0){
         alert("이름에 공백을 사용할 수 없습니다.");
         name2.focus();
         return false;
      }
      if(phone2.value==""){
         alert("휴대전화 번호를 입력하세요.");
         phone2.focus();
         return false;
      }
       var regPhone2 = /^01([0|1|6|7|8|9])[0-9]{3,4}[0-9]{4}/;
      if (regPhone2.test(phone2.value) === false) {
         alert("휴대폰 번호 형식이 올바르지 않습니다.");
         phone2.focus();
         return false;
        }
      if(Streetaddress2.value == ""){
         alert("주소를 입력하세요.");
         Streetaddress2.focus();
         return false;
      }      
      if(Address2.value==""){
         alert("상세주소를 입력하세요.");
         Address2.focus();
         return false;
      }

      alert("회원가입이 완료되었습니다.");

      document.regForm2.submit();
      
   }

