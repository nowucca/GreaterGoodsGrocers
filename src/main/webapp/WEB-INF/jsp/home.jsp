<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
    <title>Greater Goods Grocers</title>
    <meta charset="utf-8">
    <meta name="description" content="The Homepage for Greater Goods Grocers">

    <!--
        normalize-and-reset.css is a basic CSS reset; useful for starting from ground zero.
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
    <link rel="stylesheet" href="<c:url value="/css/homepage.css"/>"/>


    <!-- Javascript libraries -->
    <script src="<c:out value='js/libs/vue.js'/>"></script>
    <script src="<c:out value='js/libs/fontawesome-kit.js'/>"></script>

</head>

<body>
<main>
    <grocery-header></grocery-header>

    <grocery-navbar :show-selection="false"
                :categories="categories"
                :selected-category-name="selectedCategoryName">
    </grocery-navbar>

    <section id="homeHero">

        <div class="hero-text">
            <h1>Greater Goods Grocers</h1>
            <h3>Find quality fresh groceries and help your community thrive.</h3>
        </div>

        <section id="heroBoxes">

            <div class="heroBox">
                <i class="fas fa-shopping-basket"></i>
                <h3>Shop</h3>
                <span id="shopText">Shop for fresh, quality goods that are simply greater.</span>
            </div>

            <div class="heroBox">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Save</h3>
                <span id="saveText">Save money with low prices and save Greater Goods Points for your chosen community organizations.</span>
            </div>

            <div class="heroBox">
                <i class="fas fa-hands-helping"></i>
                <h3>Support</h3>
                <span id="supportText">Support your chosen Community organizations by donating Greater Goods Points</span>
            </div>

        </section>

    </section>

    <section id="specials">

        <h2>On Sale Specials!</h2>

        <div class="products-container">

            <div class="product" v-for="product in specialProducts">
                <image class="productImage" v-bind:src="productImage(product)"></image>

                <div class="productDetails">
                    <span class="productTitle">{{product.name}}</span>
                    <button class="addItem">Add to Cart</button>
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
    import init from '${pageContext.request.contextPath}/js/page-home.js';
    init('main');
</script></body>
</html>
