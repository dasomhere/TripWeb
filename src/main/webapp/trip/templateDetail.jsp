<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>

<section class="container">

<h3>{{searchDetailCommon[0].title}}</h3>
<hr>
  <div align="center">
    <carousel>
      <slide>
        <img ng-src="{{searchDetailCommon[0].firstimage}}" style="margin:auto; width: auto; min-height: 200px; max-height: 400px;">
      </slide>
      <slide data-ng-repeat="s in searchDetailImage">
        <img ng-src="{{s.originimgurl}}" style="margin:auto; width: auto; min-height: 200px; max-height: 400px;">
      </slide>
    </carousel>
  </div>
<hr>
<tabset justified="true">
    <tab heading="개요"><span data-ng-bind-html="searchDetailCommon[0].overview"></span></tab>
    <tab heading="기본정보">
    	<ul>
    		<li>우편번호 : {{searchDetailCommon[0].zipcode}}</li>
    		<li>전화명 : {{searchDetailCommon[0].telname}}</li>
    		<li>전화번호 : {{searchDetailCommon[0].tel}}</li>
    		<li>홈페이지 : <span data-ng-bind-html="searchDetailCommon[0].homepage"></span></li>
    		<li>주소 : {{searchDetailCommon[0].addr1}}</li>
    	</ul>
    </tab>
    <tab heading="이용안내">Long Labeled Justified content</tab>
    <tab heading="상세정보">ㅇㅇ</tab>
</tabset>



</section>