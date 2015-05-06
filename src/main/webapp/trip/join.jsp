<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<section class="container">
	<hr>
	<h3>회원가입</h3>
	기본정보를 모두 입력해 주세요.
	<hr>
	<div align="center">
		<form action="join" method="post" onsubmit='return checkForm()' name="loginForm">
			<table>
				<tr>
					<td align="right" style="width: 70px;">이름 :&nbsp;</td>
					<td><input type="text" name="name" id="name" maxlength="10"/></td>
				</tr>
				<tr>
					<td align="right">아이디 :&nbsp;</td>
					<td><input type="text" name="id" id="id" maxlength="12"/></td>
					<td style="padding-left: 10px">
						<input type="button" value="중복확인" data-ng-click="idCheck()" style="width: 70px; height: 30px; font-size: 13px;"/>
					</td>
				</tr>
				<tr><td></td><td colspan="2"><span id="idcheck" class="idchecklabel"></span></td></tr>
				<tr>
					<td align="right">비밀번호 :&nbsp;</td>
					<td><input type="password" name="password" id="password" data-ng-model="password" data-ng-required="true" 
									data-ng-pattern="/^.{4,12}$/"/></td>
					<td style="padding-left: 10px">
						<span style="color: red" data-ng-if="loginForm.password.$error.required">
						4자이상, 12자이하
						</span>
						<span style="color: red" data-ng-if="loginForm.password.$error.pattern">
						4자이상, 12자이하
						</span>
					</td>
				</tr>
				<tr>
					<td align="right">이메일 :&nbsp;</td>
					<td><input type="email" name="email" id="email" maxlength="30"/></td>
				</tr>
	
			</table>
			<hr>
			<div align="center">
				<input class="btn btn-info btn-lg" type="submit" value="회원가입"/>
			</div>
		</form>
	</div>
</section>