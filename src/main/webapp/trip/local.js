
myApp.controller('localController', function($scope) {
	alert("localController");
	
	$scope.click = function() {
		alert("asdfdf");
	
			$.ajax({
				type : "GET",
				url  : "/TourWeb/m/local/local?_" + new Date().getTime(),
				dataType : "json",
				success : function(local) {
//					alert(this.url +" : "+ JSON.stringify(local));
					$scope.locals = local;
//					$scope.$apply();
					var msg = local;
					
//					$('#output').html(msg);
					$scope.locals = local;
					alert($scope.locals);
				},	
				error : function(xhr, status, error) {
						alert(status + " : "+ this.url);
				}
			});
			
	};
});

