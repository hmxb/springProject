<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
.center{
	margin: auto;
	width: 50%;
	border: 2px solid RGB(50, 55, 67);
	padding: 10px;
	text-align: left;
	background-color: RGB(248, 248, 248);
}
.regi{
	width: 100%;
	background-color:#505567;
	color:white;
}
.text{
	padding: 5px;
	border: 2px solid RGB(204, 204, 204);
	border-radius:3px;
		
}
</style>
</head>
<body>
<h2>회원가입</h2>
<p>환영합니다</p>
<div class="center">
<form action="regiAf.do" method="post">
<table>
<tr>
	<th>아이디</th>
	<td>
		<input type="text" size="20" id="id" name="id" class="text"><br>
		<p id="idcheck" style="font-size: 8px"></p>
	</td>
	<td>
		<input type="button" id="id_chk_btn" value="ID확인">
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>
		<input type="password" size="20" id="pwd" name="pwd" class="text">
	</td>
</tr>
<tr>
	<th>비밀번호 확인</th>
	<td>
		<input type="password" size="20" id="chk_pwd" name="chk_pwd" class="text"><br>
		<p id="pwdcheck" style="font-size: 8px"></p>
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" size="20" id="name" name="name" class="text">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" size="20" id="email" name="email" class="text">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="회원가입" class="regi">
	</td>
</tr>
</table>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#id_chk_btn").click(function(){
		// id의 규칙 : 대소문자 + 특수문자
		// id 글자수
		// id가 사용할 수 있는지 없는지
		// ajax (비동기 통신)
		$.ajax({
			url:"idcheck.do",
			type:"post",
			data:{"id":$("#id").val()},
			success:function(answer){
				// alert("success");
				// alert(JSON.stringify(answer));
				if(answer == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다.");
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용할 수 없는 아이디입니다.");
					$("#id").val("");
				}
			},
			error:function(){
				alert("error");
			}
		});
	});
	// 비밀번호 확인
    /* $("#chk_pwd").on("keyup", function(){
      var pwd = $("#pwd").val().trim();
      var chkPwd = $(this).val().trim();

      if (pwd ==="" || chkPwd === "") {
    	    $("#pwdcheck").text(""); // 비밀번호 확인 입력란이 비어 있을 때 메시지를 지웁니다.
    	  } else if (pwd !== chkPwd) {
    	    $("#pwdcheck").css("color", "#ff0000");
    	    $("#pwdcheck").text("비밀번호가 일치하지 않습니다.");
    	  } else {
    	    $("#pwdcheck").css("color", "#0000ff");
    	    $("#pwdcheck").text("비밀번호가 일치합니다.");
    	  }
    }); */
	$("form").submit(function(event) {
		var pwd = $("#pwd").val().trim();
		var chkPwd = $("#chk_pwd").val().trim();

		if (pwd !== chkPwd) {
			event.preventDefault(); // 폼 제출을 막습니다.
			$("#pwdcheck").css("color", "#ff0000");
			$("#pwdcheck").text("비밀번호가 일치하지 않습니다.");
		}
	});
});
</script>
</body>
</html>