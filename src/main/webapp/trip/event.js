
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
//	alert("eventController xxx");
	
	$http.get("/TripWeb/m/event/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys.response.body.items.item;
	});
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();		
		$http.get("/TripWeb/m/event/festival?areaCode=" + city + "&month=" + month).success(function(events) {
			console.log(events);
			$scope.events = events.response.body.items.item;
		}).error(function() {
			alert("festival error...");
		});
	};
	
	$scope.detail = function(contentid) {
		$http.get("/TripWeb/m/event/detail?contentId=" + contentid + "&contentTypeId=15").success(function(eventDetail){
			alert(eventDetail);
			$scope.$parent.eventDetail = eventDetail.response.body.items.item;
			alert(contentid);
			location.href="#eventDetail";
		}).error(function(url) {
			alert("post error..."+ this.url);
		});
	};
	
	
	
});

