<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="<c:out value='js/libs/vue.js'/>"></script>

</head>
<body>
<div id="app" v-cloak>
<h1>{{message}}</h1>


<ul>
  <li v-for="category in categories">
      <a href="#" @click.stop.prevent="selectCategory(category.name)">{{category.name}}</a>
  </li>
</ul>

<p>Selected category:
    <span style="text-transform: capitalize">{{selectedCategoryName}}</span>
</p>

<table border="1" cellpadding="3">
    <tr>
        <th>product_id</th>
        <th>name</th>
        <th>description</th>
        <th>price</th>
        <th>category_id</th>
        <th>Add Button</th>
    </tr>
    <tr v-for="product in products">
        <td>{{product.productId}}</td>
        <td>{{product.name}}</td>
        <td>{{product.description}}</td>
        <td>{{product.price}}</td>
        <td>{{product.categoryId}}</td>
        <td><button @click.stop.prevent="addToCart(product)">Add to Cart</button></td>
    </tr>

</table>

    Cart total: {{cart.total}}
    Cart subtotal {{cart.getSubtotal()}}

<table border="1" cellpadding="3">
    <tr v-for="item in cart.getItems()">
        <td>{{item.getProduct().getName()}}</td>
        <td>{{item.getPrice()}}</td>
        <td>{{item.getQuantity()}}</td>
        <td>{{item.getTotal()}}</td>
    </tr>
</table>

<p><button @click.stop.prevent="clearCart">Clear Cart</button></p>

</div>

<!-- Vue app for page -->
<script type="module">
    import init from '${pageContext.request.contextPath}/js/pages/TestPage.js';
    init('#app');
</script>
</body>
</html>
