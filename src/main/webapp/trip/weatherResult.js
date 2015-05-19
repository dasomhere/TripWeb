
myApp.controller('weatherResultController', function($scope, $http, $routeParams) {
	$scope.$parent.pageClass = 'page-event';
	
	$scope.city = $routeParams.city;
	
	$http.get("/TripWeb/m/weather/weather?woeid=" + $routeParams.woeid).success(function(weather) {
			$scope.weather = weather.query.results.channel;
		}).error(function() {
			alert("weather error...");
		});
	
	$http.get("weatherLanguageChange.json").success(function(response) {
		$scope.convertConditionCode = function(code) {
			return response.conditions[code].text;
		}
		
		$scope.convertDay = function(day) {
			for(var i=0; i<response.days.length; i++) {
				if(day == response.days[i].day)
					return response.days[i].dayKR;
			}
		}

	});
	
	$scope.weatherImageChange = function() {
		var weatherCode = $scope.weather.item.condition.code;
		console.log(weatherCode);
		if(weatherCode < 3) {
			return "weatherImages/맑음.jpg";
		} else if ((weatherCode > 2 && weatherCode < 13 )||(weatherCode > 36 && weatherCode < 41)){
			return "weatherImages/비.jpg";
		} else if ((weatherCode > 12 && weatherCode < 19 )||(weatherCode > 40 && weatherCode < 44)|| weatherCode == 46) {
			return "weatherImages/눈.jpg";
		} else if (weatherCode == 19) {
			return "weatherImages/황사.jpg";
		} else if (weatherCode > 19 && weatherCode < 23) {
			return "weatherImages/안개.jpg";
		} else if (weatherCode > 22 && weatherCode < 26) {
			return "weatherImages/바람.jpg";
		} else if ((weatherCode > 25 && weatherCode < 32) || weatherCode == 44){
			return "weatherImages/흐림.jpg";
		} else if ((weatherCode > 31 && weatherCode < 35) || weatherCode == 36) {
			return  "weatherImages/맑음.jpg";
		} else {
			return "weatherImages/맑음.jpg";
		}
	}
	
	$scope.weatherIcon = function(code) {
		var weatherCode = code;
		console.log(weatherCode);
		if(weatherCode < 3) {
			return "weatherIcons/1.png";
		} else if((weatherCode > 2 && weatherCode < 5)||(weatherCode > 36 && weatherCode < 40)|| weatherCode == 45 || weatherCode == 47) {
			return "weatherIcons/2.png";
		} else if(weatherCode > 4 && weatherCode < 8) {
			return "weatherIcons/3.png";
		} else if((weatherCode > 8 && weatherCode < 13)|| weatherCode == 40) {
			return "weatherIcons/4.png";
		} else if(weatherCode == 8 ||(weatherCode > 12 && weatherCode < 17)||weatherCode == 18||(weatherCode > 40 && weatherCode < 44)||weatherCode == 46) {
			return "weatherIcons/5.png";
		} else if(weatherCode == 17 || weatherCode == 35) {
			return "weatherIcons/6.png";
		} else if(weatherCode == 19) {
			return "weatherIcons/7.png";
		} else if(weatherCode > 19 && weatherCode < 23) {
			return "weatherIcons/8.png";
		} else if(weatherCode > 22 && weatherCode < 25) {
			return "weatherIcons/9.png";
		} else if((weatherCode > 25 && weatherCode < 32)||weatherCode == 44) {
			return "weatherIcons/10.png";
		} else if(weatherCode > 31 && weatherCode < 35) {
			return "weatherIcons/11.png";
		} else if(weatherCode == 25) {
			return "weatherIcons/12.png";
		} else if(weatherCode == 36) {
			return "weatherIcons/13.png";
		} else {
			return "weatherIcons/1.png";
		} 
			
		
	}
		
});

