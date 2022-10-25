<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category list</title>
</head>
<body>
    <h1>Category List</h1>
<%--    <h3>Xin chao ${name} Age ${age}</h3>--%>
    <table border="1" style="text-align: center">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${categories}" var="c">
            <tr>
                <td>${c.getCategoryID()}</td>
                <td>${c.getCategoryName()}</td>
                <td>${c.getDescription()}</td>
                <td><a href="products/getProductByCategoryId/${c.getCategoryID()}">Detail</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="products">Show All Products</a>
</body>
</html>