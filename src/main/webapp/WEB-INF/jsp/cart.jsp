<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <script src="js/libs/fontawesome-kit.js"></script>


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
                <template v-if="cart.getNumberOfItems() > 1">
                    Your shopping cart contains {{cart.getNumberOfItems()}} items.
                </template>
                <template v-else-if="cart.getNumberOfItems() == 1">
                    Your shopping cart contains {{cart.getNumberOfItems()}} item.
                </template>
                <template v-else>
                    Your shopping cart is empty.
                </template>
            </li>

        </ul>
    </div>

    <section id="cartContents" v-if="cart.getNumberOfItems() > 0">

        <table  border="1" cellpadding="3">
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Points</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <tr v-for="item in cart.getItems()">
                <td>{{item.getProduct().getName()}}</td>
                <td>{{item.getProduct().getDescription()}}</td>
                <td><p class="productPoints">{{item.getProduct().getPoints()}}</p>
                </td>
                <td>{{formatPrice(item.getPrice()/100)}}</td>
                <td><input type="number"
                           min="1"
                           max="9"
                           step="1"
                           placeholder="placeholder text"
                           v-model.trim.number="item.quantity"
                           @change="updateCart(item.getProduct(), item.quantity)"/>
                </td>
                <td>{{formatPrice(item.getTotal()/100)}}</td>
            </tr>
        </table>

        <ul id="cartTotals" v-if="cart.getNumberOfItems() > 0">
            <li>Cart subtotal: {{formatPrice(this.getCartSubtotal()/100)}}</li>
            <li>Cart total: <b>{{formatPrice(this.getCartTotal()/100)}}</b></li>
        </ul>

    </section>


    <section id="cartActions">
      <button class="normal2xButton" v-if="cart.getNumberOfItems() > 0" @click.stop.prevent="clearCart">Clear Cart</button>
      <a :href="link('category')">
          <button class="normal2xButton">Continue Shopping</button>
      </a>
      <a :href="link('checkout')" v-if="cart.getNumberOfItems() > 0">
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
