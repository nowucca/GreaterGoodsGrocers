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

    <link rel="stylesheet" href="<c:url value="/css/normalize-and-reset.css"/>"/>

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" href="<c:url value="/css/main.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/product.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/header.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/footer.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/cart.css"/>"/>

    <!-- Javascript libraries -->
    <script src="<c:out value='js/libs/vue.js'/>"></script>
    <script src="<c:out value='js/libs/fontawesome-kit.js'/>"></script>


</head>

<body>
<main v-cloak>
    <grocery-header :cart="cart"></grocery-header>

    <grocery-navbar :show-selection="false"
                    :categories="categories"
                    :selected-category-name="selectedCategoryName">
    </grocery-navbar>


    <template v-if="cart.getNumberOfItems() > 0">
        Cart total: {{cart.total}}
        Cart subtotal {{cart.getSubtotal()}}

        <table  border="1" cellpadding="3">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <tr v-for="item in cart.getItems()">
                <td>{{item.getProduct().getName()}}</td>
                <td>{{item.getPrice()}}</td>
                <td>{{item.getQuantity()}}</td>
                <td>{{item.getTotal()}}</td>
            </tr>
        </table>
        <p><button @click.stop.prevent="clearCart">Clear Cart</button></p>
    </template>

    <span v-else>Cart is empty</span>



    <grocery-footer></grocery-footer>
</main>
<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/page-cart.js';
    init('main');
</script>
</body>
</html>
