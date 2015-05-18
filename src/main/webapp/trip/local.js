
myApp.controller('localController', function($scope, $http) {

	$scope.$parent.pageClass = 'page-local';
	$scope.currentPage = 1;
	$scope.itemsPerPage = 10;
	
	$http.get("/TripWeb/m/load/search?areaCode=1" + "&sigunguCode=1" + "&contentTypeId=12" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(localResult) {
		$scope.$parent.localResult = localResult.response.body;
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
	$scope.stays = function(data) {
		$scope.flags = [{flag : false}];
		if(data=="32"){
			$scope.flags=[{flag:true}];
			
//			$('#select').html("<option value='hanOk' class=form-control>한옥</option>");
//			$('#select').append("<option value='benikia'class=form-control>베니키아</option>");
//			$('#select').append("<option value='goodStay' class=form-control>굿스테이</option>");
		}
	};
//	$scope.stay = function() {
//		alert("ggg");
//		var output= " ";
//		
//		output += "<select>";
//		
//		output += "</select>";
//			$('#select').html("<option value='hanOk' class=form-control>한옥</option>");
//			$('#select').append("<option value='benikia'class=form-control>베니키아</option>");
//			$('#select').append("<option value='goodStay' class=form-control>굿스테이</option>");
//		}else{
//			$('#select').html("<option value='#' class=form-control>선택사항 없음</option>");
//		}
//	};
	
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
		if(contentTypeId=='32') {
			if(stay=="hanOk"){
				$http.get("/TripWeb/m/local/searchhanok?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(hanokResult) {
					$scope.localResult = hanokResult.response.body;
				}).error(function() {
					alert('hanOk error');
				});
			}else if(stay=="goodStay"){
				$http.get("/TripWeb/m/local/searchgoodstay?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(hanokResult) {
					$scope.localResult = hanokResult.response.body;
				}).error(function() {
					alert('hanOk error');
				});
			}else{
				$http.get("/TripWeb/m/local/searchbenikia?areaCode=" + city + "&sigungucode=" + sigunguCode + "&contentTypeId="+contentTypeId+"&"+stay+"=1" + "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(hanokResult) {
					$scope.localResult = hanokResult.response.body;
				}).error(function() {
					alert('hanOk error');
				});
			}
		
		}else{
			$http.get("/TripWeb/m/load/search?areaCode=" + city + "&sigunguCode=" + sigunguCode + "&contentTypeId="+contentTypeId+ "&numOfRows=" +$scope.itemsPerPage + "&pageNo=" + $scope.currentPage).success(function(localResult) {
				$scope.localResult = localResult.response.body;
			}).error(function() {
				alert('city error');
			});	
		}
	};
	
	$scope.contents = [
	                   {code: '12', name: '관광지'},
	                   {code: '14', name: '문화시설'},
	                   {code: '15', name: '축제공연행사'},
	                   {code: '25', name: '여행코스'},
	                   {code: '28', name: '레포츠'},
	                   {code: '32', name: '숙박'},
	                   {code: '38', name: '쇼핑'},
	                   {code: '39', name: '음식점'}
	];
	
	$scope.stayss =[
	               {value : 'hanOk', name :'한옥'},
	               {value : 'benikia', name :'베니키아'},
	               {value : 'goodStay', name :'굿스테이'}
	             ];
	
});