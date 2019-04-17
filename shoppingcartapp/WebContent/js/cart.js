var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";
function addToCart() {
	console.log("inside cart");
	var product_name = $("#product_name").text();
	var product_id = $("#product_id").text();
	var product_price = $("#product_price").text();
	var product_quantity = 1;
	var status = 'CRT';
	var user_id = 1;

	var data = {
		'product_id':product_id,
		'product_name':product_name,
		'price':product_price,
		'quantity':product_quantity,
		'status':status,
		'user_id':user_id
	}

	console.log(data);

	$.ajax({
		url : _BASE_URL + 'cart/addToCart.action',
		type : 'POST',
		data : data,
		dataType : 'json',
		success : function(data) {
			console.log(data);
			console.log("Product added successfully");
			
		},
		error: function (jqXHR, textStatus, errorThrown) {

            console.log('jqXHR:');
            console.log(jqXHR);
            console.log('textStatus:');
            console.log(textStatus);
            console.log('errorThrown:');
            console.log(errorThrown);
		}
	});
}