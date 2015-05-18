
myApp.controller('eventController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-event';
//	alert("eventController xxx");
	$scope.currentPage = 1;
	$scope.itemsPerPage = 5;
	
	var monthSelect = new Date().getMonth()+1;
	
	if(monthSelect<10){
		monthSelect = "0"+ monthSelect;
	}else {
		monthSelect = monthSelect;
	}
	console.log("monnthSelect="+monthSelect);
	for(var i = 1; i <= 12; i++){
		if(monthSelect == i){
			console.log("monthSelect="+monthSelect +", i="+i);
			$("#month option:eq("+i+")").attr("selected", "selected");
		}
	}
	
	$http.get("/TripWeb/m/event/festival?areaCode=1" + "&month="+ monthSelect + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
		$scope.events = events.response.body;
	});
	
	$http.get("/TripWeb/m/event/city").success(function(citys) {
		$scope.citys = citys.response.body.items.item;
	});
	

	
	$scope.changePage = function() {
		console.log("page = " + $scope.currentPage);
		
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();		
		$http.get("/TripWeb/m/event/festival?areaCode=" + city + "&month=" + month + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
			console.log(events);
			$scope.events = events.response.body;
		}).error(function() {
			alert("festival error...");
		});
	};
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var month = $("#month option:selected").val();		
		$http.get("/TripWeb/m/event/festival?areaCode=" + city + "&month=" + month + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(events) {
			console.log(events);
			$scope.events = events.response.body;
		}).error(function() {
			alert("festival error...");
		});
	};
	
	$scope.detail = function(contentid, title, contenttypeid) {
		alert(contentid + " " +  title);
		$scope.$parent.eventTitle = title;
		$scope.$parent.contentid = contentid;
		$scope.$parent.contenttypeid = contenttypeid;
		console.log("contetnttypeid ## 15 =" + contenttypeid);
		
		location.href="#eventDetail";
	};
});

