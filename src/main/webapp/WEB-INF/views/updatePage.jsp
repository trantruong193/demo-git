<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
    <h3>Change Product ${product.getProductName()}</h3>
    <form:form method="POST"
               action="/products/resultUpdateProduct/${product.getProductID()}"
               modelAttribute="product">
        <form:input type="text"
                    value="${product.getProductName()}"
                    placeholder="Enter product's name"
                    path="productName"
        /><br>
        <form:errors path="productName" cssClass="error"></form:errors><br>
        <form:input path="price"
                    type="number"
                    value="${product.getPrice()}"
        /><br>
        <form:errors path="price" cssClass="error"></form:errors><br>
        <form:input path="description"
                    value="${product.getDescription()}"
        /><br>
        <form:errors path="description" cssClass="error"></form:errors><br>
        <form:select path="categoryID">
            <c:forEach var="category" items="${categories}">
                <form:option value="${category.getCategoryID()}">
                    ${category.getCategoryName()}
                </form:option>
            </c:forEach>
        </form:select>
        <input type="submit" value="Update" />
    </form:form>
    <a href="../../categories">Go back</a>
</body>
</html>