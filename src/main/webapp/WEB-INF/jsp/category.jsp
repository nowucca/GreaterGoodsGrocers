<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
<head>
    <title>Bookstore Category Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for a ecommerce website">

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
    <link rel="stylesheet" href="<c:url value="/css/category.css"/>"/>

    <!-- Javascript libraries -->
    <script src="<c:out value='js/libs/vue.js'/>"></script>
    <script src="<c:out value='js/libs/fontawesome-kit.js'/>"></script>


</head>

<body>
<main v-cloak>
    <grocery-header></grocery-header>

    <grocery-navbar :show-selection="showSelection"
                :categories="categories"
                :selected-category-name="selectedCategoryName">
    </grocery-navbar>

    <section class="products-container">

        <div v-for="product in products" class="product">
            <image class="productImage" v-bind:src="productImage(product)"></image>

            <div class="productDetails">
                <span class="productTitle">{{product.name}}</span>
                <button class="addItem"
                @click.stop="addToCart(product)">Add to Cart</button>
            </div>

            <div class="productCost">
                <p class="productPrice">{{formatPrice(product.price/100)}}</p>
                <p class="ggPointsBadge">{{product.points}}</p>
            </div>
        </div>

    </section>

    <grocery-footer></grocery-footer>
</main>
<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/page-category.js';
    init('main');
</script>
</body>
</html>
