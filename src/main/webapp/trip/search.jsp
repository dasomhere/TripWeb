<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<section class="container">

<h3>키워드 검색</h3>

<div>
	<form data-ng-submit="search()">
		<div align="center">
		<table>
			<tr>
				<td><input type="text" name="keyword" id="keyword"/></td><td style="padding-left: 10px;"><button type="submit" class="btn btn-default">검색</button></td>
			</tr>
		</table>
		</div>
	</form>
</div>

</section>