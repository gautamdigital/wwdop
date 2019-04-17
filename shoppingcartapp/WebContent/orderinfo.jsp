<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:url" content="">
<meta property="og:type" content="website">
<meta property="og:image"
	content="${pageContext.request.contextPath}/img/site-overview.png">
<title>Order Info List</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-select.css">
<link
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/custom.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/theme.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery_002.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cart.js"></script>



<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


</head>
<body>
	<div>
		<div id="notification-bar" class="notification__bar">
			<div class="notification__message">
				<div class="notification__cover opSlides op-animate-top"
					style="background-color: rgb(208, 234, 255); display: none;">
					<div class="notifi__inner">
						<div class="notification__logo">
							<img src="productlist_files/op_logo_normal.png" alt="Openpay">
						</div>
						<p style="color: black">Buy now with Zero interest. More time
							to pay.</p>
						<a href="javascript:void(0);" onclick="myOpen()">Learn more</a>
					</div>
				</div>
				<div class="notification__cover opSlides op-animate-top"
					style="background-color: rgb(255, 232, 226); display: none;">
					<div class="notifi__inner">
						<div class="notification__logo">
							<img src="productlist_files/op_logo_normal_large.png"
								alt="Openpay">
						</div>
						<p style="color: black">Black Friday Sale, 50% off on all
							products storewide</p>
						<a href="javascript:void(0);" onclick="myOpen()">Read more</a>
					</div>
				</div>
				<div class="notification__cover opSlides op-animate-top"
					style="background-color: rgb(255, 247, 245); display: block;">
					<div class="notifi__inner">
						<div class="notification__logo">
							<img src="productlist_files/op_logo_grey.png" alt="Openpay">
						</div>
						<p style="color: black">Huge sale on across Madison island,
							30% off on all footwear</p>
						<a href="javascript:void(0);" onclick="myOpen()">Show Info</a>
					</div>
				</div>
				<a id="close" onclick="closeBanner();" href="javascript:void(0)"
					class="notification__close" style="float: right;">Close</a>
			</div>
			<div class="openpayPopbox" id="openpayPopbox">
				<div class="popboxContent">
					<div class="innerClassPopbox">
						<a href="javascript:void(0);" class="popboxClose"
							onclick="myClose();"></a>
						<div class="popboxDivContent">
							<a href="javascript:void(0)" class="popboLogo"><img
								src="productlist_files/logo-4.png" alt=""></a>
							<p>
								Openpay is a simple and flexible way to buy now <br>and pay
								later - with zero interest. We offer longer, more flexible terms
								all easily <br>managed through the Openpay App.
							</p>
							<div class="popboxMainFeature">
								<h4>Buy with Openpay in 3 easy steps:</h4>
								<ul class="op-step-sec">
									<li>
										<div class="inner">
											<div class="op-step">
												<div class="op-step-inner">
													<span>1</span>
												</div>
											</div>
											<p>
												Shop &amp; <br>checkout
											</p>
										</div>
									</li>
									<li>
										<div class="inner">
											<div class="op-step">
												<div class="op-step-inner">
													<span>2</span>
												</div>
											</div>
											<p>Select Openpay from payment options</p>
										</div>
									</li>
									<li>
										<div class="inner">
											<div class="op-step">
												<div class="op-step-inner">
													<span>3</span>
												</div>
											</div>
											<p>Register &amp; design your plan</p>
										</div>
									</li>
								</ul>

								<p>If you are 18 years or older and a permanent resident of
									Australia all
									you���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ll
									need is:</p>
								<ul class="enquery">
									<li>Photo ID</li>
									<li>Debit or Credit Card</li>
									<li>Email</li>
									<li>The required deposit</li>
									<li>Mobile phone (+ another contact number)</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper">
		<div id="content">
			<div id="top-user-panel">
				<div class="container">
					<a href="#" class="btn btn-default">Register</a>
					<%-- <jsp:include page="login.jsp" />  --%>
					<s:if test="#session['userId'] != null">
						<span> <s:set var="userName" value="#session['userName']" />
							Welcome <s:property value="userName" /></span>
					</s:if>
					<s:elseif test="#session['userId'] == null">
						<jsp:include page="login.jsp" />
					</s:elseif>
				</div>
			</div>
			<div id="languages-bar">
				<div class="container">
					<ul class="pull-left">
						<li class="last-item"><img src="productlist_files/en.jpg"
							alt="Language-en"><a href="#">english</a></li>
					</ul>
					<div class="phone pull-right"></div>
				</div>
			</div>
			<div id="top-part">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-md-3 col-lg-4 left">
							<a href="#"> <img src="images/logo.png" class="site-logo"
								alt="">
							</a>
						</div>
						<div class="col-sm-6 col-md-5 col-lg-5">
							<div class="input-group" id="adv-search">
								<input type="text" id="search_in_title" class="form-control"
									placeholder="Search for word in the title">
								<div class="input-group-btn">
									<div class="btn-group" role="group">
										<div class="dropdown dropdown-lg">
											<button type="button"
												class="button-more dropdown-toggle mine-color"
												data-toggle="dropdown" aria-expanded="false">
												More <span class="caret"></span>
											</button>
											<div class="dropdown-menu dropdown-menu-right" role="menu">
												<form class="form-horizontal" method="GET" action="#"
													id="bigger-search">
													<input type="hidden" name="category" value=""> <input
														type="hidden" name="in_stock" value=""> <input
														type="hidden" name="search_in_title" value=""> <input
														type="hidden" name="order_new" value=""> <input
														type="hidden" name="order_price" value=""> <input
														type="hidden" name="order_procurement" value=""> <input
														type="hidden" name="brand_id" value="">
													<div class="form-group">
														<label for="quantity_more">Quantity more than</label> <input
															type="text" name="quantity_more" id="quantity_more"
															placeholder="Type number" class="form-control">
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label for="added_after">Added after</label>
																<div class="input-group date">
																	<input type="text" name="added_after" id="added_after"
																		class="form-control"><span
																		class="input-group-addon"><i
																		class="glyphicon glyphicon-th"></i></span>
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="added_before">Added before</label>
																<div class="input-group date">
																	<input type="text" name="added_before"
																		id="added_before" class="form-control"><span
																		class="input-group-addon"><i
																		class="glyphicon glyphicon-th"></i></span>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label for="search_in_body">Search for word in the
															description</label> <input class="form-control"
															name="search_in_body" id="search_in_body" type="text">
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label for="price_from">Price from</label> <input
																	type="text" name="price_from" id="price_from"
																	class="form-control" placeholder="Type number">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="price_to">Price to</label> <input
																	type="text" name="price_to" id="price_to"
																	class="form-control" placeholder="Type number">
															</div>
														</div>
													</div>
													<button type="submit" class="btn btn-inner-search">
														<span class="glyphicon glyphicon-search"
															aria-hidden="true"></span>
													</button>
													<a class="btn btn-default" id="clear-form"
														href="javascript:void(0);">Clear fields</a>
												</form>
											</div>
										</div>
										<button type="button" onclick="submitForm()"
											class="btn-go-search mine-color">
											<img src="images/search-ico.png" alt="Search">
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-3">
							<div class="basket-box">
								<table>
									<tbody>
										<tr>
											<td><img src="images/green-basket.png"
												class="green-basket" alt=""></td>
											<td>
												<div class="center">
													<h4>Your Basket</h4>
													<a href="#">Checkout</a> | <a href="#">Shopping Cart</a>
												</div>
											</td>
											<td>
												<ul class="shop-dropdown">
													<li class="dropdown text-center mini-cart-for-all"><a
														href="#" class="dropdown-toggle" data-toggle="dropdown"
														role="button" aria-expanded="false">
															<div>
																<span class="sumOfItems">0</span> Products
															</div> <img src="images/shopping-cart-icon-515.png" alt="">
															<span class="caret"></span>
													</a>
														<ul
															class="dropdown-menu dropdown-menu-right dropdown-cart"
															role="menu">
															<li class="text-center">No products</li>
														</ul></li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="navbar gradient-color">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav" style="margin-left: -15px;">
						<li><a href="#">Home</a></li>
						<li><a href="#">Blog</a></li>
						<li class="active"><a href="/productlist">Productlist</a></li>
						<li><a href="/order">Orders</a></li>
						<li><a href="/checkout">Checkout</a></li>
						<li><a href="/cart">Shopping Cart</a></li>
						<li><a href="/contact">Contacts</a></li>
					</ul>
				</div>
			</div>
			</nav>

			<div class="container" id="blog">

				<div class="row eqHeight">
					<div class="col-sm-12 col-md-12">
						<div class="alone title">
							<span>View Order Info List</span>
						</div>
						<div class="row">

							<table id="example" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>SL. No.</th>
										<th>PlanId</th>
										<th>Order Id</th>
										<th>Refund Amount</th>
										<th>Dispatch Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator var="itr" value="orderinfoList" status="incr">
										<tr>
											<td> <s:property value="%{#incr.index}"/></td>
											<td><s:property value="jam_plan_id" /></td>
											<td><s:property value="id" /></td>
											<td>$<s:if test="%{reduction_amount==null}">
									   0
									</s:if> <s:else>
									  <s:property value="reduction_amount" />
									</s:else></td>

											<td><s:if test="%{order_dispatch_status==null}">
									 Not Yet Dispatch
									</s:if> <s:else>
									  Dispatched Successful
									</s:else></td>

											<td><a href="javascript:void()" data-id="<s:property value="id" />"
												data-planid="<s:property value="jam_plan_id" />" class="order_status" data-toggle="modal">Order status</a>
												 ||<a href="javascript:void()" data-planid="<s:property value="jam_plan_id" />" class="order_refund" data-toggle="modal">Refund</a>
												 ||<a href="javascript:void()" data-planid="<s:property value="jam_plan_id" />" class="order_dispatch" data-toggle="modal">Dispatch</a>
												 ||<a href="javascript:void()" data-planid="<s:property value="jam_plan_id" />" class="order_fraud"
												  data-toggle="modal">OrderFraudAlert</a></td>
										</tr>
									</s:iterator>

								</tbody>

							</table>
						</div>

					</div>

				</div>


			</div>
			
			
			<div id="orderrefundModal" class="modal fade in" role="dialog" padding-right: 17px;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">Refund</h4>
      </div>
      <div class="modal-body">
      <div class="message_section"></div>
        <div id="refundsuccess" class="row">
        
          <div class="col-md-10">
            <input type="hidden" name="refundorderplanidid" id="refundorderplanidid" value="">
            <input type="text" name="refundvalue" id="refundvalue" class="form-control" placeholder="Enter the amount you want to refund">
          </div>
          <div class="col-md-2">  
          <s:submit type="button" class="btn btn-primary go-refund" value="Submit" />
          </div>
         
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default close_footer" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="OrderFraudAlertModal" class="modal fade in" role="dialog" padding-right: 17px;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">Order Fraud Alert</h4>
      </div>
      <div class="modal-body">
      <p class="message_section"></p>
        
          <input type="hidden" name="forderplanid" id="forderplanid" value="">
          <textarea name="fdetails" id="fdetails" placeholder="Enter the Details you want"></textarea>
          <s:submit type="button" class="btn btn-primary go-orderfraudalert" value="Submit" />
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default close_footer" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
			<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<h5>Product Category</h5>
						<ul>
							<li><a href="#">Hand picked collection</a></li>
							<li><a href="#">Featured posts</a></li>
							<li><a href="#">Men Collection</a></li>
							<li><a href="#">Women Collection</a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h5>Quick Links</h5>
						<ul>
							<li><a href="#">Openpay</a></li>
						</ul>
					</div>

					<div class="col-md-3">
						<h5>Pages</h5>
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Orders</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Cart</a></li>
							<li><a href="#">Shop</a></li>
						</ul>
					</div>

					<div class="col-md-3">
						<h5>Payments</h5>
						<ul class="store-logo">
							<li><img src="imgaes/paypal.png"></li>
							<li><img src="images/visa.png"></li>
							<li><img src="images/mastercard.png"></li>
							<li><img src="images/american_express.png"></li>
							<li><img src="images/openpay1.png"></li>
						</ul>
					</div>
				</div>
			</div>
			</footer>
			<div id="notificator" class="alert"></div>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/bootstrap-confirmation.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/placeholders.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
			<%-- <script type="text/javascript"
				src="${pageContext.request.contextPath}/js/system.js"></script> --%>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/mine.js"></script>
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/css/openpay.css">

			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/openpay.js"></script>
			<script src="${pageContext.request.contextPath}/js/login.js"></script>

			<link rel="stylesheet" type="text/css"
				href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
			<script type="text/javascript">
				jQuery(document).ready(function($) {
					$('#example').DataTable({
						"pagingType" : "full_numbers"
					});
					
					$("#orderrefundModal").hide();
					$("#OrderFraudAlertModal").hide();
				});
				
				$('.order_status').on('click', function () {					
					var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";				
			    	var planid =  $(this).data("planid");			    
			   		var id= $(this).data("id");		   		
			   		
			   		var data = {
			   				'planid':planid,
			   				'id':id
			   				
			   			}
			   		
			   		$.ajax({
			   			url : _BASE_URL + 'cart/checkorderstatus.action',
			   			type : 'POST',
			   			data : data,
			   			dataType : 'json',
			   			success : function(data) {
			   				console.log(data);	   				
			   				
			   			},
			   			error: function (jqXHR, textStatus, errorThrown) {			   	            
			   			}
			   		});

			        
			    });
				
				
				
				
				$('.order_refund').on('click', function () {					
					//var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";				
			    	var planid =  $(this).data("planid");			    	
			    	$('#orderrefundModal').modal('show');			    	
			    	$("#refundorderplanidid").val(planid);
			        
			    });
				
				$('.go-refund').on('click', function () {
					
					var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";	
					var planid = $("#refundorderplanidid").val();
					var reductionPrice = $("#refundvalue").val();
					
					if (reductionPrice != '') {
						reductionPrice = reductionPrice;
					} else {
						reductionPrice = "0.00";
					}
					
					var data = {
			   				'planid':planid,
			   				'reductionPrice':reductionPrice
			   				
			   			}
					$.ajax({
			   			url : _BASE_URL + 'cart/orderrefund.action',
			   			type : 'POST',
			   			data : data,
			   			dataType : 'json',
			   			success : function(data) {
			   				console.log(data);	
			   				alert('tttt');
			   				
			   			},
			   			error: function (jqXHR, textStatus, errorThrown) {			   	            
			   			}
			   		});
					
				 });
				
				
				
				$('.order_dispatch').on('click', function () {
					
					var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";	
					var planid = $("#refundorderplanidid").val();
					
					var data = {
			   				'planid':planid   				
			   				
			   			}				
					
					$.ajax({
			   			url : _BASE_URL + 'cart/orderdispatch.action',
			   			type : 'POST',
			   			data : data,
			   			dataType : 'json',
			   			success : function(data) {
			   				console.log(data);	
			   				alert('tttt');
			   				
			   			},
			   			error: function (jqXHR, textStatus, errorThrown) {			   	            
			   			}
			   		});
					
				 });
				
				
				$('.order_fraud').on('click', function () {					
					//var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";				
			    	var planid =  $(this).data("planid");			    	
			    	$('#OrderFraudAlertModal').modal('show');			    	
			    	$("#forderplanid").val(planid);
			        
			    });
				
				
			$('.go-orderfraudalert').on('click', function () {
					
					var _BASE_URL = "http://localhost:8087/ShoppingCartApp/";	
					var planid = $("#forderplanid").val();
					var fdetails = $("#fdetails").val();
					
					
					var data = {
			   				'planid':planid,
			   				'details':fdetails
			   				
			   			}
					
					
					$.ajax({
			   			url : _BASE_URL + 'cart/fraudalert.action',
			   			type : 'POST',
			   			data : data,
			   			dataType : 'json',
			   			success : function(data) {
			   				console.log(data);	
			   				alert('tttt');
			   				
			   			},
			   			error: function (jqXHR, textStatus, errorThrown) {			   	            
			   			}
			   		});
					
				 });
			</script>
</body>
</html>