<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" href="css/category.css"/>

    <!-- Javascript libraries -->
    <script src="js/libs/vue.js"></script>
    <script src="js/libs/fontawesome-kit.js"></script>


</head>

<body>
<main v-cloak>
    <grocery-header :cart="cart"></grocery-header>

    <grocery-navbar :show-selection="showSelection"
                :categories="categories"
                :selected-category-name="selectedCategoryName">
    </grocery-navbar>

    <section class="products-container">

        <div v-for="product in products" class="product">
            <image class="productImage" v-bind:src="productImage(product)"></image>

            <div class="productDetails">
                <span class="productTitle">{{product.name}}</span>
                <button class="normalButton"
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
    import init from '${pageContext.request.contextPath}/js/pages/CategoryPage.js';
    init('main');
</script>
</body>
</html>
