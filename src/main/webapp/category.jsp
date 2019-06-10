<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Bookstore Category Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for a bookstore">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->

    <link rel="stylesheet" href="css/normalize-and-reset.css">

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/category.css">
    <script src="https://kit.fontawesome.com/77e84e46b8.js"></script>

</head>

<body>
<main>
    <jsp:include page="WEB-INF/jsp/header.jsp"/>

    <section class="products-container">

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
    </section>
    <jsp:include page="WEB-INF/jsp/footer.jsp"/>
</main>
</body>
</html>
