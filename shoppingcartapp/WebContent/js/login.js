var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";
function authenticate() {
	console.log("inside login");
	var user_name = $("#user_name").val();
	var user_pwd = $("#user_pwd").val();

	var data = {
		'user_name' : user_name,
		'password' : user_pwd
	}

	console.log(data);

	$.ajax({
		url : _BASE_URL + 'user/login.action',
		type : 'POST',
		data : data,
		dataType : 'json',
		success : function(data) {
			console.log(data);

			if (data.code == 1) {
				$("#login_error_message").html(data.msg).show();
			} else {
				location.reload();
				$("#login_error_message").hide();
			}
		}
	});
}