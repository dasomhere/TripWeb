<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/taglib.jspf" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style type="text/css">


<!-- Include Bootstrap-select CSS, JS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/js/bootstrap-select.min.js"></script>

<style type="text/css">
#bootstrapSelectForm .selectContainer .form-control-feedback {
    /* Adjust feedback icon position */
    right: -15px;
}
</style>

<form id="bootstrapSelectForm" method="post" class="form-horizontal">
    <div class="form-group">
        <label class="col-xs-3 control-label">Favorite color</label>
        <div class="col-xs-5 selectContainer">
            <select name="colors" class="form-control" multiple title="Choose 2-4 colors">
                <option value="black">Black</option>
                <option value="blue">Blue</option>
                <option value="green">Green</option>
                <option value="orange">Orange</option>
                <option value="red">Red</option>
                <option value="yellow">Yellow</option>
                <option value="white">White</option>
            </select>
        </div>
    </div>
   <div class="row">
    <div class="form-group">
        <label class="col-xs-3 control-label">Language</label>
        <div class="col-xs-3 selectContainer">
            <select name="language" class="form-control">
                <option value=""></option>
                <option value="arabic">Arabic</option>
                <option value="english">English</option>
                <option value="french">French</option>
                <option value="german">German</option>
                <option value="other">Other</option>
            </select>
        </div>
    </div>
     <div class="form-group">
        <label class="col-xs-3 control-label">Language</label>
        <div class="col-xs-3 selectContainer">
            <select name="language" class="form-control">
                <option value=""></option>
                <option value="arabic">Arabic</option>
                <option value="english">English</option>
                <option value="french">French</option>
                <option value="german">German</option>
                <option value="other">Other</option>
            </select>
        </div>
    </div>
</div>
    <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3">
            <button type="submit" class="btn btn-default">Validate</button>
        </div>
    </div>
</form>


