<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<hr>
<h1>{{localDetail[0].title}} </h1>
	<ul class="list-group">
	 	<li class="list-group-item" data-ng-repeat="local in localDetail">
	 			<table>
	 			  <tr><td><img alt="" src="{{local.firstimage2}}" style="width: 200px; height: 150px; border: 1px solid black; ">
	 			  		  		  		  
	 			  </tr>
	 			  <tr><td>
	 			  		주      소 : {{local.addr1}}
	 			  		  		{{local.addr2}}
	 			  </td></tr>
	 			   <tr><td> 우편주소 : {{local.zipcode}}</td></tr>
	 			   <tr>
	 			  	<td><h3>개요</h3>
	 			  		{{local.overview}}
	 			  	</td>
	 			  </tr>
	 			</table>
	 			
	 	</li>
	</ul>	
</div>
