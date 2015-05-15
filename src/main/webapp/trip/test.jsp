<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>lightSlider Demo</title>
    <meta charset="utf-8">
    <meta name="description" content="">
    <link rel="stylesheet"  href="/TripWeb/lightslider/css/lightslider.css"/>
    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 800px;
		}
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/TripWeb/lightslider/js/lightslider.js"></script> 
    <script>
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
		});
    </script>
</head>
<body>
	<div class="demo">
        <div class="item">            
            <div class="clearfix" style="max-width:474px;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                    <li data-thumb="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg"> 
                        <img src="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg" />
                         </li>
                    <li data-thumb="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg"> 
                        <img src="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg" />
                         </li>
                    <li data-thumb="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg"> 
                        <img src="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg" />
                         </li>
                    <li data-thumb="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg"> 
                        <img src="http://tong.visitkorea.or.kr/cms/resource/16/1956116_image2_1.jpg" />
                         </li>
                </ul>
            </div>
        </div>
        <div class="item">
            <ul id="content-slider" class="content-slider">
                <li>
                    <h3>1</h3>
                </li>
                <li>
                    <h3>2</h3>
                </li>
                <li>
                    <h3>3</h3>
                </li>
                <li>
                    <h3>4</h3>
                </li>
                <li>
                    <h3>5</h3>
                </li>
                <li>
                    <h3>6</h3>
                </li>
            </ul>
        </div>

    </div>	
</body>
</html>