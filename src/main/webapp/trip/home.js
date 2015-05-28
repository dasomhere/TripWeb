/*
 * angular Application Module
 */
//var myApp = angular.module('tourApp', ["ngSanitize", "ngAnimate", "ngRoute", "ngMap", "ui.bootstrap"]);
var myApp = angular.module('homeApp', ["ngSanitize", "ngAnimate", "ngRoute", "ngMap"]);

myApp.config(function($routeProvider) {

	var event = {
			templateUrl : "event.jsp",
			controller : "eventController"
	};
	var local = {
			templateUrl : "local.jsp",
			controller : "localController"
	};
	var map = {
			templateUrl : "map.jsp",
			controller : "mapController"
	};
	var maplocation = {
			templateUrl : "maplocation.jsp",
			controller : "maplocationController"
	};
	var searchDetail = {
			templateUrl : "searchDetail.jsp",
			controller : "searchDetailController"
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
	
	var template = {
			templateUrl : "template.jsp",
			controller : "templateController"
	};
	
	var home = {
			templateUrl : "home.jsp"
	};
	
	
	$routeProvider.when('/event', event);
	$routeProvider.when('/local', local);
	$routeProvider.when('/map', map);
	$routeProvider.when('/maplocation', maplocation);
	$routeProvider.when('/search', search);
	$routeProvider.when('/searchDetail/:contentid/:contenttypeid', searchDetail);
	$routeProvider.when('/weather', weather);
	$routeProvider.when('/weatherResult/:woeid/:city', weatherResult);
	$routeProvider.when('/load', load);
	$routeProvider.when('/login', login);
	$routeProvider.when('/join', join);
	$routeProvider.when('/template', template);
	$routeProvider.when('/home', home);
	$routeProvider.otherwise({redirectTo:'/'});
	
});

