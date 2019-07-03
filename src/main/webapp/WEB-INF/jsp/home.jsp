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
    <script src="https://kit.fontawesome.com/77e84e46b8.js"></script>

    <!-- Vue library and helper library -->
    <script src="<c:out value='js/helper.js'/>"></script>
    <script src="<c:out value='js/vue.js'/>"></script>

    <!-- Vue components -->
    <script src="<c:out value='js/components/header.js'/>"></script>
    <script src="<c:out value='js/components/navbar.js'/>"></script>
    <script src="<c:out value='js/components/footer.js'/>"></script>

</head>

<body>
<main>
    <ggg-header></ggg-header>

    <ggg-navbar :categories="categories" :selectedcategoryname="selectedCategoryName"></ggg-navbar>

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

            <div class="product">
                <image class="productImage" src="${initParam.productImages}broccoli.jpg"></image>

                <div class="productDetails">
                    <span class="productTitle">Broccoli</span>
                    <button class="addItem">Add to Cart</button>
                </div>

                <div class="productCost">
                    <p class="productPrice">$1.49/lb</p>
                    <p class="ggPointsBadge">4            </p>
                </div>
            </div>
            <div class="product">
                <image class="productImage" src="${initParam.productImages}cauliflower.jpg"></image>

                <div class="productDetails">
                    <span class="productTitle">Caulifower</span>
                    <button class="addItem">Add to Cart</button>
                </div>

                <div class="productCost">
                    <p class="productPrice">$1.49/lb</p>
                    <p class="ggPointsBadge">5</p>
                </div>
            </div>
            <div class="product">
                <image class="productImage" src="${initParam.productImages}bell-pepper.jpg"></image>

                <div class="productDetails">
                    <span class="productTitle">Bell Pepper (Red)</span>
                    <button class="addItem">Add to Cart</button>
                </div>

                <div class="productCost">
                    <p class="productPrice">$1.49/lb</p>
                    <p class="ggPointsBadge">5</p>
                </div>
            </div>
        </div>
    </section>
    <ggg-footer></ggg-footer>
</main>
<!-- Vue app for page -->
<script type="application/javascript"  src="<c:out value='js/home.js'/>"></script>
</body>
</html>
