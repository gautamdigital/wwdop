<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
<meta property="og:image" content="img/site-overview.png">
<title></title>
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/bootstrap-datepicker.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.css">
<script src="js/jquery_002.js"></script>
<script src="js/all.js"></script>
<script src="js/jquery.js"></script>
<script src="js/login.js"></script>
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
									Australia all you���������������������������������������������������������������������������������ll need is:</p>
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
					<%-- <jsp:include page="login.jsp" /> --%>
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
						<li>
							<form class="form-inline" method="post" action="cartlist">
								<input type="text" class="hide" name = "user_id" value="${session['userId']}">
								<input type="text"  class="hide" name = "order_id" value="0">
								<button type="submit" name="cart" class="btn btn-default">Shopping Cart</button>
							</form>
						</li>
						<li><a href="/contact">Contacts</a></li>
					</ul>
				</div>
			</div>
			</nav>

			<div class="container" id="home-page">
				<div class="row">
					<div class="col-md-3">
						<div class="filter-sidebar">
							<div class="title">
								<span>Categories</span>
							</div>
							<a href="javascript:void(0)" id="show-xs-nav"
								class="visible-xs visible-sm"> <span class="show-sp">Show
									categories<i class="fa fa-arrow-circle-o-down"
									aria-hidden="true"></i>
							</span> <span class="hidde-sp">Hide categories<i
									class="fa fa-arrow-circle-o-up" aria-hidden="true"></i></span>
							</a>
							<div id="nav-categories">
								<ul class="parent">
									<li><i class="fa fa-chevron-right" aria-hidden="true"></i>
										<a href="javascript:void(0);" data-categorie-id="1"
										class="go-category left-side ">phone</a>
										<ul class="children">
											<li><i class="fa fa-chevron-right" aria-hidden="true"></i>
												<a href="javascript:void(0);" data-categorie-id="2"
												class="go-category left-side ">headphone</a>
												<ul class="children">
													<li><i class="fa fa-circle-o" aria-hidden="true"></i>
														<a href="javascript:void(0);" data-categorie-id="3"
														class="go-category left-side ">sony</a></li>
												</ul></li>
										</ul></li>
								</ul>
							</div>
						</div>
						<div class="filter-sidebar">
							<div class="title">
								<span>Brands</span>
							</div>
						</div>
						<div class="filter-sidebar">
							<div class="title">
								<span>Store</span>
							</div>
							<ul>
								<li><a href="javascript:void(0);" data-in-stock="1"
									class="in-stock ">In Stock (4)</a></li>
								<li><a href="javascript:void(0);" data-in-stock="0"
									class="in-stock ">Out of stock (0)</a></li>
							</ul>
						</div>
						<div class="filter-sidebar">
							<div class="title">
								<span>Oder</span>
							</div>
							<div class="oaerror info">
								<strong>Promo</strong> - For order more than 1$ the shipping is
								free!
							</div>
						</div>
					</div>
					<div class="col-md-9 eqHeight" id="products-side">
						<div class="alone title">
							<span>Products</span>
						</div>
						<div class="product-sort gradient-color">
							<div class="row">
								<div class="ord col-sm-4">
									<div class="form-group">
										<div class="btn-group bootstrap-select order form-control">
											<div class="dropdown-menu open" role="combobox">
												<ul class="dropdown-menu inner" role="listbox"
													aria-expanded="false">
													<li data-original-index="0" class="selected"><a
														tabindex="0" class="" data-tokens="null" role="option"
														aria-disabled="false" aria-selected="true"> <span
															class="text">New </span> <span
															class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
													<li data-original-index="1"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text">Old </span>
															<span class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
												</ul>
											</div>
											<select class="selectpicker order form-control"
												data-order-to="order_new" tabindex="-98">
												<option selected="selected" value="desc">New</option>
												<option value="asc">Old</option>
											</select>
										</div>
									</div>
								</div>
								<div class="ord col-sm-4">
									<div class="form-group">
										<div class="btn-group bootstrap-select order form-control">
											<div class="dropdown-menu open" role="combobox">
												<ul class="dropdown-menu inner" role="listbox"
													aria-expanded="false">
													<li data-original-index="1"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text"></span> <span
															class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
													<li data-original-index="2"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text">Low
																price </span> <span class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
													<li data-original-index="3"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text">High
																price </span> <span class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
												</ul>
											</div>
											<select class="selectpicker order form-control"
												data-order-to="order_price" title="Sort by price.."
												tabindex="-98">
												<option class="bs-title-option" value="" selected="selected">Sort
													by price..</option>
												<option label="Not selected"></option>
												<option value="asc">Low price</option>
												<option value="desc">High price</option>
											</select>
										</div>
									</div>
								</div>
								<div class="ord col-sm-4">
									<div class="form-group">
										<div class="btn-group bootstrap-select order form-control">
											<div class="dropdown-menu open" role="combobox">
												<ul class="dropdown-menu inner" role="listbox"
													aria-expanded="false">
													<li data-original-index="1"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text"></span> <span
															class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
													<li data-original-index="2"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text">Most
																sallers </span> <span class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
													<li data-original-index="3"><a tabindex="0" class=""
														data-tokens="null" role="option" aria-disabled="false"
														aria-selected="false"> <span class="text">Low
																sallers </span> <span class="glyphicon glyphicon-ok check-mark"></span>
													</a></li>
												</ul>
											</div>
											<select class="selectpicker order form-control"
												data-order-to="order_procurement" title="Sort by sallers.."
												tabindex="-98">
												<option class="bs-title-option" value="" selected="selected">Sort
													by sallers..</option>
												<option label="Not selected"></option>
												<option value="desc">Most sallers</option>
												<option value="asc">Low sallers</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<s:iterator value="productList">
							<div class="product-list  col-sm-4 col-md-3">
								<div class="inner">
									<div class="img-container">
										<a href="#"> <img
											src="images/<s:property value="image_name"/>"
											alt="<s:property value="product_name"/>">
										</a>
									</div>
									<h2>
										<a href="#"><s:property value="product_name" /></a>

									</h2>
									<div class="price">
										<span class="underline">Price: <span><s:property
													value="product_price" />$</span></span> <span class="price-down">6%</span>
									</div>
									<div class="price-discount ">
										Before: <span><s:property value="list_price" />$</span>
									</div>
									<div class="quantity">
										In Stock: <span><s:property value="quantity" /></span>
									</div>


									<form
										action="${pageContext.request.contextPath}/product/${product_id}"
										method="POST">
										<!-- <form action="viewproduct" method="POST"> -->
										<s:hidden value="%{product_id}" name="productId"></s:hidden>
										<%-- <s:submit key="Product information" class="info-btn gradient-color" ><span class="text-to-bg"></span></s:submit> --%>
										<button type="submit" class="info-btn gradient-color">
											<span class="text-to-bg">Product information</span>
										</button>
									</form>

									<div class="add-to-cart" style="display:none;">
										<a href="javascript:void(0);" class="add-to-cart btn-add"
											data-id="<s:property value="product_id"/>"> <img
											class="loader" src="images/ajax-loader.gif" alt="Loding">
											<span class="text-to-bg">Add to shopping cart</span>
										</a>
									</div>
									<div class="add-to-cart" style="display:none;">
										<a href="javascript:void(0);"
											class="add-to-cart btn-add more-blue"
											data-id="<s:property value="product_id"/>"> <img
											class="loader" src="images/ajax-loader.gif" alt="Loding">
											<span class="text-to-bg">Buy now</span>
										</a>
									</div>
								</div>
							</div>

						</s:iterator>

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
			<script src="js/bootstrap.js"></script>
			<script src="js/bootstrap-confirmation.js"></script>
			<script src="js/bootstrap-select.js"></script>
			<script src="js/placeholders.js"></script>
			<script src="js/bootstrap-datepicker.js"></script>
			<script src="js/system.js"></script>
			<script src="js/mine.js"></script>
			<link rel="stylesheet" type="text/css" href="css/openpay.css">
			<script type="text/javascript" src="js/openpay.js"></script>
</body>
</html>