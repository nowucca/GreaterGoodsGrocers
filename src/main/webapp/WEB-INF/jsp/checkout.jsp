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
    <script type="text/javascript" src="js/libs/validator.js"></script>
    <script src="js/libs/vue.js"></script>
    <script src="js/libs/fontawesome-kit.js"></script>


</head>

<body>
<main v-cloak>
    <grocery-header :cart="cart"></grocery-header>

    <section id="checkoutMain">

        <p style="font-weight:bold">Checkout</p>

        <p style="color: red" v-if="temporaryMessage.length>0">{{temporaryMessage}}</p>

        <div id="checkoutFormAndInfo">
            <div id="checkoutFormBox">
                <form id="checkoutForm"
                      v-on:submit.prevent="submitOrder"
                      v-on:reset="resetOrder" method="post">

                    <div class="form-element">
                        <label for="name">Name</label>
                        <input class="textField" type="text"
                               size="20" maxlength="45"
                               id="name" name="name"
                               v-on:blur="blurred"
                               v-model="customerForm.name">
                    </div>
                    <div v-if="hasFieldError('name')" class="fieldErrorsBox">
                        <ul v-for="msg in getFieldErrorMessages('name')">
                            <li>{{msg}}</li>
                        </ul>
                    </div>

                    <div class="form-element">
                        <label for="address">Address</label>
                        <input class="textField" type="text" size="20" maxlength="45" id="address" name="address"
                               v-on:blur="blurred"
                               v-model="customerForm.address">
                    </div>
                    <div v-if="hasFieldError('address')" class="fieldErrorsBox">
                        <ul v-for="msg in getFieldErrorMessages('address')">
                            <li>{{msg}}</li>
                        </ul>
                    </div>

                    <div class="form-element">
                        <label for="phone">Phone</label>
                        <input class="textField" type="tel" size="20" maxlength="45" id="phone" name="phone"
                               v-on:blur="blurred"
                               v-model="customerForm.phone">
                    </div>
                    <div v-if="hasFieldError('phone')" class="fieldErrorsBox">
                        <ul v-for="msg in getFieldErrorMessages('phone')">
                            <li>{{msg}}</li>
                        </ul>
                    </div>

                    <div class="form-element">
                        <label for="email">Email</label>
                        <input class="textField" type="email" size="20" maxlength="45" id="email" name="email"
                               v-on:blur="blurred"
                               v-model="customerForm.email">
                    </div>
                    <div v-if="hasFieldError('email')" class="fieldErrorsBox">
                        <ul v-for="msg in getFieldErrorMessages('email')">
                            <li>{{msg}}</li>
                        </ul>
                    </div>

                    <div class="form-element">
                        <label for="ccNumber">Credit card</label>
                        <input class="textField" type="text" size="20" maxlength="45" id="ccNumber" name="ccNumber"
                               v-on:blur="blurred"
                               v-model="customerForm.ccNumber">
                    </div>
                    <div v-if="hasFieldError('ccNumber')" class="fieldErrorsBox">
                        <ul v-for="msg in getFieldErrorMessages('ccNumber')">
                            <li>{{msg}}</li>
                        </ul>
                    </div>

                    <div id="checkoutButtonArea">
                        <button id="checkoutButton" class="emphasized2xButton" type="submit">Complete Purchase</button>
                        <button id="resetButton" class="normal2xButton" type="reset">Reset Form</button>
                    </div>
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
