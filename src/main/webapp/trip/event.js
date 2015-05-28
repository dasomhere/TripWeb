
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event'; $scope.$parent.nowPage = '행사';
//	alert("eventController xxx");
	$scope.currentPage = 1;
	$scope.itemsPerPage = 12;
	
	var monthSelect = new Date().getMonth()+1;
	
	if(monthSelect<10){
		monthSelect = "0"+ monthSelect;
	}else {
		monthSelect = monthSelect;
	}
	console.log("monnthSelect="+monthSelect);
	for(var i = 1; i <= 12; i++){
		if(monthSelect == i){
			var j = i-1;
			$("#month option:eq("+j+")").attr("selected", "selected");
		}
	}
	
	$http.get("/TripWeb/m/event/festival?areaCode=1" + "&month="+ monthSelect + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
		$scope.events = events.response.body;
	});
	
	$http.get("/TripWeb/m/event/city").success(function(citys) {
		$scope.citys = citys.response.body.items.item;
	});
	

	
	$scope.changePage = function() {
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();
		if(month < 10)
			month = "0" + month;
		$http.get("/TripWeb/m/event/festival?areaCode=" + city + "&month=" + month + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
			console.log(events);
			$scope.events = events.response.body;
		}).error(function() {
			alert("festival error...");
		});
	};
	
	$scope.search = function() {
		$scope.currentPage = 1;
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();
		if(month < 10)
			month = "0" + month;
		$http.get("/TripWeb/m/event/festival?areaCode=" + city + "&month=" + month + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
			console.log(events);
			$scope.events = events.response.body;
		}).error(function() {
			alert("festival error...");
		});
	};
	
});

