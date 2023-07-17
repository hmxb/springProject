<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 쿠키 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<style type="text/css">
.center{
	margin: auto;
	width: 400px;
	border: 2px solid RGB(50, 55, 67);
	padding: 10px;
	background-color: RGB(248, 248, 248);
}
.idpw{
	padding: 10px;
	width: 100%;
	border: 2px solid RGB(204, 204, 204);
	border-radius:3px;
	background-color:RGB(232, 240, 254);
}
.regi{
float: right;
font-size : 8px;

}
#chk_save_id{
float: left;
font-size : 8px;
}
.login{
padding: 10px;
width: 100%;
border-radius:3px;
background-color:#505567;
color:white;
}
</style>
</head>
<body>
<h2>login</h2>

<div class="center">
<form action="loginAf.do" method="post">
<table class="table">
<tr>
	<td>
		<input type="text" id="id" name="id" placeholder="ID를 입력하세요." class="idpw">
	</td>
</tr>
<tr>
	<td>
		<input type="password" name="pwd" value="" placeholder="PW를 입력하세요." class="idpw">
	</td>
</tr>
<tr>
	<td>
		<input type="checkbox" id="chk_save_id">ID기억
		<a href="regi.do" class="regi">회원가입</a>
	</td>
</tr>
<tr>
	<td>
		<input type="submit" value="로그인" class="login">
	</td>
</tr>
</table>
</form>

</div>
<script type="text/javascript">
/*
	session : server에 저장. login 정보. 	Object
	cookie	: client에 저장. id,pwd를 저장 	String
*/
let user_id = $.cookie("user_id");
// 저장한 id가 있을 시
if(user_id != null){
	$("#id").val(user_id);
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function(){
	// alert("click");
	// alert( $("#chk_save_id").is(":checked") );
	if($("#chk_save_id").is(":checked") == true){	// id를 cookie에 저장 
		if( $("#id").val().trim() == "" ){		// 빈문자열이였을 경우 
			alert("id를 입력하세요.");
			$("#chk_save_id").prop("checked",false);
		}else{
			// cookie에 저장
			$.cookie("user_id", $("#id").val().trim(), {expires:7, path:"./"});
		}
	}else{	// cookie에 저장하지 않음(삭제)
		$.removeCookie("user_id", { path:'./' });
	}
});
</script>




</body>
</html>