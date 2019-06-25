<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="selectedCategoryName" type="java.lang.String" scope="request"/>
<jsp:useBean id="bookList" type="java.util.List" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>Hello World!</h1>

Selected category: ${fn:toUpperCase(fn:substring(selectedCategoryName, 0, 1))}${fn:toLowerCase(fn:substring(selectedCategoryName, 1,fn:length(selectedCategoryName)))}

<table border="1">
    <tr>
        <th>book_id</th>
        <th>title</th>
        <th>author</th>
        <th>price</th>
        <th>is_public</th>
        <th>category_id</th>
    </tr>
    <c:forEach var="book" items="${bookList}">
        <jsp:useBean id="book" type="business.book.Book" scope="page"/>
        <tr>
            <td><c:out value="${book.bookId}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.price}"/></td>
            <td><c:out value="${book.isPublic}"/></td>
            <td><c:out value="${book.categoryId}"/></td>
        </tr>

    </c:forEach>

</table>
</body>
</html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="../../js/vue.js"></script>
</head>
<body>

    <%--
      Render the table data using the data in the Vue object below.
    --%>
    <div id="app">
        <h1>{{message}}</h1>

        <table border="1">
            <!-- column headers -->
            <tr>
                <th v-for="columnName in columnNames">{{columnName}}</th>
            </tr>

            <!-- column data -->
            <tr v-for="row in rows">
                <td v-for="value in row">{{value}}</td>
            </tr>
        </table>
    </div>

</body>

<%--
  Database query direct, not a good pattern.
  This is so we can get data onto the page for Vue to render.
--%>
<sql:query var="result" dataSource="jdbc/GreaterGoodsGrocers">
    SELECT * FROM category, product
    WHERE category.category_id = product.category_id
</sql:query>

<%--
  Use the data in the Vue object to capture the database data
  for rendering above in the html.
--%>
<script type="application/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hello from Vue!',
            columnNames: [
            <c:forEach var="columnName" items="${result.columnNames}">
                "<c:out value="${columnName}"/>",</c:forEach>
            ],
            rows: [
                <c:forEach var="row" items="${result.rowsByIndex}">
                [
                    <c:forEach var="value" items="${row}">
                    "<c:out value="${value}"/>",
                    </c:forEach>
                ],
                </c:forEach>
            ]
        }
    })
</script>
</html>