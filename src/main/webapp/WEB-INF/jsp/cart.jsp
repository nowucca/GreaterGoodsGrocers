<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>Cart Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The cart page for a ecommerce website">

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
    <link rel="stylesheet" href="css/cart.css"/>

    <!-- Javascript libraries -->
    <script src="js/libs/vue.js"></script>
<%--    <script src="js/libs/fontawesome-kit.js"></script>--%>


</head>

<body>
<main v-cloak>
    <grocery-header :cart="cart"></grocery-header>

    <grocery-navbar :show-selection="false"
                    :categories="categories"
                    :selected-category-name="selectedCategoryName">
    </grocery-navbar>

    <div id="cartDescription">
        <ul>
            <li>
                <template v-if="cart.numberOfItems > 1">
                    Your shopping cart contains {{cart.numberOfItems}} items.
                </template>
                <template v-else-if="cart.numberOfItems == 1">
                    Your shopping cart contains {{cart.numberOfItems}} item.
                </template>
                <template v-else>
                    Your shopping cart is empty.
                </template>
            </li>

        </ul>
    </div>

    <section id="cartContents" v-if="!cart.empty">

        <table  border="1" cellpadding="3">
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Points</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <tr v-for="item in cart.items">
                <td>{{item.product.name}}</td>
                <td>{{item.product.description}}</td>
                <td><p class="productPoints">{{item.product.points}}</p>
                </td>
                <td>{{formatPrice(item.price/100)}}</td>
                <td><input type="number"
                           min="1"
                           max="9"
                           step="1"
                           placeholder="Quantity desired"
                           v-model.trim.number="item.quantity"
                           @change="updateCart(item.product, item.quantity)"/>
                </td>
                <td>{{formatPrice(item.total/100)}}</td>
            </tr>
        </table>

        <ul id="cartTotals" v-if="!cart.empty">
            <li>Cart subtotal: {{formatPrice(this.cart.subtotal/100)}}</li>
            <li>Cart total: <b>{{formatPrice(this.cart.total/100)}}</b></li>
        </ul>

    </section>


    <section id="cartActions">
      <button class="normal2xButton" v-if="!cart.empty" @click.stop.prevent="clearCart">Clear Cart</button>
      <a :href="link('category')">
          <button class="normal2xButton">Continue Shopping</button>
      </a>
      <a :href="link('checkout')" v-if="!cart.empty">
          <button class="emphasized2xButton">Proceed to Checkout</button>
      </a>
    </section>

    <grocery-footer></grocery-footer>
</main>
<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/pages/CartPage.js';
    init('main');
</script>
</body>
</html>
