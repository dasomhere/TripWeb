
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
		console.log(citys);
		$scope.citys = citys.response.body.items.item;
	}).error(function() {
		alert("local.city error...");
	});;
	
	$http.get("/TripWeb/m/local/gus?areaCode=1").success(function(gus) {
		$scope.gus = gus.response.body.items.item;
	}).error(function() {
		alert("server error...");
	});
	
	$scope.cityChange = function() {
		var city = $("#city option:selected").val();
		$http.get("/TripWeb/m/local/gus?areaCode=" + city).success(function(gus) {
			$scope.gus = gus.response.body.items.item;
		}).error(function() {
			alert("server error...");
		});
	};
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#contentTypeId option:selected").val();
		console.log(city + ", "+ sigunguCode +", "+ contentTypeId);
		
		$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId).success(function(localResult) {
			$scope.localResult = localResult.response.body.items.item;
		}).error(function() {
			alert("search error...");
		});
	};
	
	$scope.contentid = function(contentid,contenttypeid) {
			$http.get("/TripWeb/m/local/detailcommon?contentId="+contentid +"&contentTypeId="+contenttypeid).success(function(localCommonDetail){
				$scope.$parent.localCommonDetail = localCommonDetail.response.body.items.item;
				location.href="#localDetail";
			});
			$http.get("/TripWeb/m/local/imageIintro?contentId="+contentid +"&contentTypeId="+contenttypeid).success(function(imageInfoDetail){
				$scope.$parent.imageInfoDetail = imageInfoDetail.response.body.items.item;
				location.href="#localDetail";
			});
			$http.get("/TripWeb/m/local/detailintro?contentId="+contentid+"&contentTypeId="+contenttypeid).success(function(localIntroDetail){
				$scope.$parent.localIntroDetail = localIntroDetail.response.body.items.item;
				location.href="#localDetail";
			}).error(function() {
				alert("detailIntro  error...");
			});
			
	};
});

	





