<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>Checkout Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The checkout page for a ecommerce website">

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
    <link rel="stylesheet" href="css/checkout.css"/>

    <!-- Javascript libraries -->
    <script src="js/libs/vue.js"></script>
    <script src="js/libs/fontawesome-kit.js"></script>


</head>

<body>
<main v-cloak>
    <grocery-header :cart="cart"></grocery-header>

    <section id="checkoutMain">

        <p style="font-weight:bold">Checkout</p>

        <div id="checkoutFormErrors">

        </div>
        <div id="checkoutFormAndInfo">
            <div id="checkoutFormBox">
                <form id="checkoutForm" v-on:submit.prevent="submitOrder" method="post">
                    <div class="form-element">
                        <label for="name">Name</label>
                        <input class="textField" type="text"
                               size="20" maxlength="45"
                               id="name" name="name" v-model="customerForm.name">
                    </div>

                    <button id="checkoutButton" class="emphasized2xButton" type="submit">Complete Purchase</button>
                </form>
            </div>
            <div id="checkoutInfo">
        <span id="checkoutInfoText">
            Your credit card will be charged <strong>{{formatPrice(cart.getTotal()/100)}}</strong><br>
            (<strong>{{formatPrice(cart.getSubtotal()/100)}}</strong> + <strong>{{formatPrice(cart.getSurcharge()/100)}}</strong> shipping)
        </span>
            </div>
        </div>
    </section>


    <grocery-footer></grocery-footer>
</main>
<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/pages/CheckoutPage.js';
    init('main');
</script>
</body>
</html>
