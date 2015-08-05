//= require moment
//= require bootstrap-datetimepicker
var bookIt = angular.module('bookIt', ['ngRoute', 'ui.bootstrap', 'ui.bootstrap.datetimepicker']);

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

$scope.dates = {
        date1: new Date('01 Mar 2015 00:00:00.000'),
        date2: new Date(),
        date3: new Date(),
        date4: new Date('01 Mar 2015'),
        date5: new Date('10 Mar 2015'),
        date6: new Date(),
        date7: new Date(),
        date8: new Date()
    };

    $scope.open = {
        date1: false,
        date2: false,
        date3: false,
        date4: false,
        date5: false,
        date6: false,
        date7: false,
        date8: false
    };

    // Disable weekend selection
    $scope.disabled = function(date, mode) {
        return (mode === 'day' && (new Date().toDateString() == date.toDateString()));
    };

    $scope.dateOptions = {
        showWeeks: false,
        startingDay: 1
    };

    $scope.timeOptions = {
        readonlyInput: false,
        showMeridian: false
    };

    $scope.openCalendar = function(e, date) {
        e.preventDefault();
        e.stopPropagation();

        $scope.open[date] = true;
    };

    // watch date4 and date5 to calculate difference
    $scope.$watch(function() {
        return $scope.dates;
    }, function() {
        if ($scope.dates.date4 && $scope.dates.date5) {
            var diff = $scope.dates.date4.getTime() - $scope.dates.date5.getTime();
            $scope.dayRange = Math.round(Math.abs(diff/(1000*60*60*24)))
        } else {
            $scope.dayRange = 'n/a';
        }
    }, true);




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
