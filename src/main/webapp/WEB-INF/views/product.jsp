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
    <h1>All Products</h1>
    <table border="1" style="text-align: center">
        <tr>
            <th>ID</th>
            <th>Category ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${products}" var="p">
            <tr>
                <td>${p.getProductID()}</td>
                <td>${p.getCategoryID()}</td>
                <td>${p.getProductName()}</td>
                <td>${p.getFormattedPrice()}</td>
                <td>${p.getDescription()}</td>
                <td><a href="products/updateProduct/${p.getProductID()}">Update</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="categories">Go back</a>
</body>
</html>