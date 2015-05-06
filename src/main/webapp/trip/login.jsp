<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<hr>
<section class="container">
<div>
	<form data-ng-submit="login()">
		<div align="center">
		<table>
			<tr>
				<td align="right">&nbsp; &nbsp; &nbsp;아이디 &nbsp; &nbsp;</td>
				<td><input type="text" name="id" id="id"/></td>
			</tr>
			<tr>
				<td align="right">비밀번호 &nbsp;</td>
				<td><input type="password" name="password" id="password"/></td>
			</tr>
			<tr><td colspan="2" align="center" style="color: red"><span id="idcheck"></span></td></tr>
		</table>
		</div>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-default">로그인</button>
		</div>
		<hr>
		<div align="center">
			<button type="button" class="btn btn-default">아이디/비밀번호 찾기</button>
			<a href="#join" class="btn btn-default">회원가입</a>
		</div>
	</form>
</div>
</section>