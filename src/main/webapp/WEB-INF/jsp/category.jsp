<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

    <script src="<c:out value='js/vue.js'/>"></script>
    <script src="<c:out value='js/helper.js'/>"></script>
    <script src="https://kit.fontawesome.com/77e84e46b8.js"></script>

</head>

<body>
<main>
    <jsp:include page="header.jsp"/>

    <section class="products-container">

        <div v-for="product in products" class="product">
            <image class="productImage" src="${initParam.productImages}broccoli.jpg"></image>

            <div class="productDetails">
                <span class="productTitle">{{product.name}}</span>
                <button class="addItem">Add to Cart</button>
            </div>

            <div class="productCost">
                <p class="productPrice">$1.49/lb</p>
                <p class="ggPointsBadge">4</p>
            </div>
        </div>

    </section>
    <jsp:include page="footer.jsp"/>
</main>
<script type="application/javascript"  src="<c:out value='js/category.js'/>"></script>
</body>
</html>
