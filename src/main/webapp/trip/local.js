
myApp.controller('localController', function($scope, $http) {

	$scope.$parent.pageClass = 'page-local';
	$scope.currentPage = 1;
	$scope.itemsPerPage = 10;
	
	$http.get("/TripWeb/m/load/search?areaCode=1" + "&sigunguCode=1" + "&contentTypeId=12" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(localResult) {
		$scope.$parent.localResult = localResult.response.body;
		console.log(JSON.stringify(localResult.response.body.items.item.contentid));
		
//		console.log(JSON.stringify($scope.$parent.localResult.contentid));
		
		alert(JSON.stringify(localResult.response.body.items.item.contentid));
	});
	
	$http.get("/TripWeb/m/local/city").success(function(citys) {
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
		$http.get("/TripWeb/m/local/gus?areaCode="+city).success(function(gus) {
			$scope.gus = gus.response.body.items.item;
		}).error(function() {
			alert("server error...");
		});
	};

	$scope.stay = function() {
		var stay = $("#contentTypeId option:selected").val();
		if(stay==32){
			$('#select').html("<option value='hanOk' class=form-control>한옥</option>");
			$('#select').append("<option value='benikia'class=form-control>베니키아</option>");
			$('#select').append("<option value='goodStay' class=form-control>굿스테이</option>");
		}else{
			$('#select').html("<option value='#' class=form-control>선택사항 없음</option>");
		}
	};
	
	$scope.changePage = function() {
		console.log("page = " + $scope.currentPage);
		
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#contentTypeId option:selected").val();
		var stay = $("#select option:selected").val();
		
		if(stay=='#'){
			$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(localResult) {
			console.log("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage);
				
				$scope.localResult = localResult.response.body;
			}).error(function() {
				alert('city error');
			});	
		} else{
			$http.get("/TripWeb/m/local/searchhanok?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1"+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(hanokResult) {
				$scope.localResult = hanokResult.response.body;
			}).error(function() {
				alert('hanOk error');
			});
		}

	};
	
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#contentTypeId option:selected").val();
		var stay = $("#select option:selected").val();

		if(stay=='#'){
			$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(localResult) {
					$scope.localResult = localResult.response.body;
			}).error(function() {
				alert('city error');
			});	
		} else {
			$http.get("/TripWeb/m/local/searchhanok?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(hanokResult) {
				$scope.localResult = hanokResult.response.body;
			}).error(function() {
				alert('hanOk error');
			});
		}
	};
});