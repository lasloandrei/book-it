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

bookIt.controller('DatepickerDemoCtrl', function ($scope) {
 
  

  // // Disable weekend selection
  // $scope.disabled = function(date, mode) {
  //   return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
  // };



  // $scope.dateOptions = {
  //   formatYear: 'yy',
  //   startingDay: 1
  // };

  // $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  // $scope.format = $scope.formats[0];

  // var tomorrow = new Date();
  // tomorrow.setDate(tomorrow.getDate() + 1);
  // var afterTomorrow = new Date();
  // afterTomorrow.setDate(tomorrow.getDate() + 2);
  // $scope.events =
  //   [
  //     {
  //       date: tomorrow,
  //       status: 'full'
  //     },
  //     {
  //       date: afterTomorrow,
  //       status: 'partially'
  //     }
  //   ];


});

bookIt.controller('FormController', ['$scope', '$http', function($scope, $http) {
      $scope.master = {};
      $scope.first_name = 'test'
      $scope.contact = {
        first_name: 'asd'
      };
      $scope.dining_tables = [];

      $http.get('/zones').
        success(function(data) { 
        $scope.zones = data;
      })

      $http.get('/dining_tables').
        success(function(data) {
        $scope.dining_tables = data;
      })

      $scope.today = function() {
        $scope.dt = new Date();
      };
        $scope.today();

      $scope.clear = function () {
        $scope.dt = null;
      };

      $scope.toggleMin = function() {
        $scope.minDate = $scope.minDate ? null : new Date();
      };
      $scope.toggleMin();

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

      $scope.reset = function() {
        $scope.contact = angular.copy($scope.master);
      };

      $scope.reset();


}]);
