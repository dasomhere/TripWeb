var myApp = angular.module('myApp', ["ngSanitize", "ngAnimate", "ngRoute"]);

myApp.config(function($routeProvider) {

	var event = {
			templateUrl : "event.jsp",
			controller : "eventController"
	};
	var local = {
			templateUrl : "local.jsp",
			controller : "localController"
	};
	var weather = {
			templateUrl : "weather.jsp",
			controller : "weatherController"
	};
	var weatherResult = {
			templateUrl : "weatherResult.jsp",
			controller : "weatherResultController"
	};
	var load = {
			templateUrl : "load.jsp",
			controller : "loadController"
	};
	var login = {
			templateUrl : "login.jsp",
			controller : "loginController"
	};
	var join = {
			templateUrl : "join.jsp",
			controller : "joinController"
	};
	
	$routeProvider.when('/', event);
	$routeProvider.when('/local', local);
	$routeProvider.when('/weather', weather);
	$routeProvider.when('/weatherResult', weatherResult);
	$routeProvider.when('/load', load);
	$routeProvider.when('/login', login);
	$routeProvider.when('/join', join);
	$routeProvider.otherwise({redirectTo:'/'});
	
	});
myApp.controller('mainController', function($scope, $http) {

	$scope.logout = function() {
		$http.get("/TripWeb/m/login/logout").success(function(loginResult) {
			alert("loginResult = " + JSON.stringify(loginResult));
			$scope.loginResult = loginResult;
		}).error(function() {
			alert("loginout error...");
		});
	};
	
//	alert("mainController");
});




