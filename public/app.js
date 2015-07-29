//= require moment
//= require bootstrap-datetimepicker
var bookIt = angular.module('bookIt', ['ngRoute', 'ui.bootstrap']);

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



bookIt.controller('FormController', ['$scope', '$http', function($scope, $http) {
  $scope.master = {};
  $scope.dining_tables = [];


  $http.get('/zones').
    success(function(data) { 
    $scope.zones = data;
  })

  // $http.get('/dining_tables').
  //   success(function(data) {
  //   $scope.dining_tables = data;
  // })

  $scope.dt = new Date();



  $scope.filterOutDiningTables = function () {
    $http.get('/zones/' + $scope.dining_table.zone_id + '/dining_tables').
      success(function(data) {
        if (data.length == 0) {
          $scope.error = 'no data'
        }
        $scope.dining_tables = data;
      })
  }

  $scope.mytime = new Date();

  $scope.hstep = 1;
  $scope.mstep = 1;

  $scope.options = {
    hstep: [1, 2, 3],
    mstep: [1, 5, 10, 15]
  };

  $scope.ismeridian = true;
  $scope.toggleMode = function() {
    $scope.ismeridian = ! $scope.ismeridian;
  };
      
 $scope.dateTimeNow = function() {
    $scope.date = new Date();
  };
  $scope.dateTimeNow();

  $scope.dateOptions = {
    startingDay: 1,
    showWeeks: false
  };
  
  $scope.$watch("date", function(value) {
    console.log('New date value:' + value);
  }, true);
  
  $scope.resetHours = function() {
    $scope.date.setHours(1);}

  $scope.open = function($event) {
    $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;
  };

  $scope.getDayClass = function(date, mode) {
    if (mode === 'day') {
      var dayToCheck = new Date(date).setHours(0,0,0,0);

      for (var i=0;i<$scope.events.length;i++){
        var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

        if (dayToCheck === currentDay) {
          return $scope.events[i].status;
        }
      }
    }

    return '';
  };

  $scope.update = function(contact) {
    $scope.master = angular.copy(contact);
  };

  $scope.createContact = function () {
    params = {
      first_name: $scope.contact.first_name,
      last_name: $scope.contact.last_name,
      phone_number: $scope.contact.phone_number,
      email: $scope.contact.email,
      reservations_attributes: [{
        dining_table_id: $scope.dining_table_id ,
        date: $scope.reservation_date,
        observation: $scope.reservation_observation
      }]
    }
  $http({
      method: 'POST',
      url: '/contacts',
      data: { contact: params }

      }).
  success(function (data) {
      //Showing Success message
      $scope.status = "The Contact Saved Successfully!!!";
          
  })
  .error(function (error) {
      //Showing error message
      $scope.status = 'Unable to create a contact: ' + error.message;
    });

  } 
}]);
