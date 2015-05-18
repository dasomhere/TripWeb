
myApp.controller('localController', function($scope, $http) {
	$scope.$parent.pageClass = 'page-local';
	
	var city = $("#city option:selected").val();
	var sigunguCode = $("#sigunguCode option:selected").val();
	var contentTypeId = $("#contentTypeId option:selected").val();
	
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

	$scope.stay = function() {
		var stay = $("#contentTypeId option:selected").val();
		if(stay==32)
			$('#select').html("<option value='1'>한옥</option>");
		else
			$('#select').html("<option value='#'>선택할수 없습니다.</option>");
	};
	
	$scope.search = function() {
		var city = $("#city option:selected").val();
		var sigunguCode = $("#sigunguCode option:selected").val();
		var contentTypeId = $("#contentTypeId option:selected").val();
		var stay = $("#select option:selected").val();
		console.log(city + ", "+ sigunguCode +", "+ contentTypeId + ", "+stay);
		$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&hanOk="+stay).success(function(localResult) {
			$scope.localResult = localResult.response.body.items.item;
		}).error(function() {
			alert("search error...");
		});
	};
	
	$scope.contentid = function(contentid,contenttypeid) {
		$scope.$parent.contentid = contentid;
		$scope.$parent.contenttypeid = contenttypeid;
		console.log("contetnttypeid ## 12 =" + contenttypeid);
		
		location.href="#localDetail";
		var stay = $("#select option:selected").val();
		if(stay == 1){
				var city = $("#city option:selected").val();
				var sigunguCode = $("#sigunguCode option:selected").val();
				var contentTypeId = $("#contentTypeId option:selected").val();
				
				$scope.$parent.city = city;
				$scope.$parent.sigunguCode = sigunguCode;
				$scope.$parent.contentTypeId = contentTypeId;
				$scope.$parent.stay = stay;
//				console.log("city = "+city +", sigunguCode" +sigunguCode +", contentTypeId= " +contentTypeId);
				location.href="#stayDetail";
			}
		};
	});
	


				
//				if(stay == 1){
//					$http.get("/TripWeb/m/local/hanokinfo?contentId="+contentid +"&contentTypeId="+contenttypeid+"&areaCode="+city +"&sigunguCode="+sigunguCode+"&hanOk="+stay).success(function(hanOkInfo){
//						$scope.$parent.hanOkInfo = hanOkInfo.response.body.items.item;
//						location.href="#stayDetail";
//					
//				});
//			}
//		};
