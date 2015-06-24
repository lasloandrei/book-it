var bookIt = angular.module('bookIt', ['ngRoute']);

bookIt.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/zones', {
        templateUrl: 'partials/zone-list.html',
        controller: 'ZoneListController'
      }).
      when('/', {
        templateUrl: 'partials/main.html'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);

bookIt.controller('ZoneListController', function ($scope, $http) {
	$http.get('/zones').
	  success(function(data) {
	    $scope.zones = data;
	  })
});