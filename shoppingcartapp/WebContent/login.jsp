<form class="form-inline">
	<div class="form-group">
		<input type="text" name="user_name" id="user_name"
			class="form-control" placeholder="username">
	</div>
	<div class="form-group">
		<input type="password" name="password" id="user_pwd"
			class="form-control" placeholder="Password">
	</div>
	<button type="button" name="login" class="btn btn-default"
		onclick="authenticate()">Login</button>
	<p id="login_error_message" style="display: none; color: red"></p>
</form>