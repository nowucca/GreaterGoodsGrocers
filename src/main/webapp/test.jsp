<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="js/vue.js"></script>
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