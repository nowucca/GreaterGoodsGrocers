<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>Confirmation Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The confirmation page for a e-commerce website">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->

    <link rel="stylesheet" href="css/normalize-and-reset.css"/>

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/product.css"/>
    <link rel="stylesheet" href="css/header.css"/>
    <link rel="stylesheet" href="css/footer.css"/>
    <link rel="stylesheet" href="css/confirmation.css"/>

    <!-- Javascript libraries -->
    <script src="js/libs/vue.js"></script>
    <script src="js/libs/fontawesome-kit.js"></script>


</head>

<body>
<main>
	<grocery-header :cart="cart"></grocery-header>

	<section v-if="!orderDetails" id="confirmationInvalid">
		<a :href="link('category')">
			<button class="normal2xButton">Continue Shopping</button>
		</a>
	</section>
	<template v-else>
		<section id="confirmationSummary">
			<h1>Confirmation</h1>
			<p>Your confirmation number is {{orderDetails.order.confirmationNumber}}</p>
			<p>{{new Date(orderDetails.order.dateCreated)}}</p>
		</section>
		<section id="confirmationOrderDetails">
			<table id="orderDetailsTable">
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>
				<tr v-for="(item,index) in orderDetails.lineItems">
					<td>{{orderDetails.products[index].name}}</td>
					<td>{{item.quantity}}</td>
					<td>{{formatPrice(orderDetails.products[index].price * item.quantity/100)}}</td>
				</tr>
				<tr>
					<td colspan="2">-- Delivery Surcharge --</td>
					<td>{{formatPrice(cart.surcharge/100)}}</td>
				</tr>
				<tr>
					<td colspan="2"><strong>Total</strong></td>
					<td><strong>{{formatPrice(orderDetails.order.amount/100)}}</strong></td>
				</tr>
			</table>
		</section>
		<section id="customerDetails">
			<h1>Customer Information</h1>
			<p>{{orderDetails.customer.customerName}} ({{orderDetails.customer.email}})</p>
			<p>{{orderDetails.customer.address}}</p>
		</section>
		<section id="confirmationContinue">
			<a :href="link('category')">
				<button class="emphasized2xButton">Continue Shopping</button>
			</a>
		</section>
	</template>

	<grocery-footer></grocery-footer>
</main>
</body>
<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/pages/ConfirmationPage.js';
    init('main');
</script>
</body>
</html>
