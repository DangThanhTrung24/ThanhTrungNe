<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Sorting</title>
</head>
<body>
	<h3>SORTING BY ${field}</h3>
	
	<form action="/product/list" >
		<div>Search by Categury Id:</div>
		<input name="id" placeholder="Category Id?"/>	
		<hr>
		<button>Search</button>		
	</form>
	<br>
	<hr>
	<form action="/product/price" >
		<div>Search by Price:</div>
		<input name="min" placeholder="Price min?"/>
		<input name="max" placeholder="Price max?"/>	
		<hr>
		<button>Search</button>		
	</form>
	<br>
	<form action="/product/name" >
		<div>Search by name</div>
		<input name="name" placeholder="Name?"/>	
		<hr>
		<button>Search</button>		
	</form>
	<br>
	<table border="1" style="width:100%">
	<tr>
		<th><a href="/product/sort?field=id">Id</a></th>
		<th><a href="/product/sort?field=name">Name</a></th>
		<th><a href="/product/sort?field=price">Price</a></th>
		<th><a href="/product/sort?field=createDate">Date</a></th>
		<th>Category</th>
	</tr>
	<c:forEach var="item" items="${items}">
		<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td>${item.price}</td>
			<td>${item.createDate}</td>
			<td>${item.category.id}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>