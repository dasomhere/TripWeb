<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- login.jsp -->
<h1>로그인</h1>

<form novalidate="novalidate" data-ng-submit="submit()">
<input type="text" name="id" data-ng-model="id"/>
<input type="password" name="password" data-ng-model="password"/><br>
<input type="submit" value="로그인" class="btn"/>
<input type="reset" value="cancel" class="btn"/>

</form>

