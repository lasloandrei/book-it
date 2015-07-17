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

bookIt.controller('DTablePickerController', function ($scope, $http) {
  $http.get('/dining_tables').
    success(function(data) {
      $scope.dining_tables = data;
    })
  
});

bookIt.controller('DatepickerDemoCtrl', function ($scope) {
 
  $scope.today = function() {
    $scope.dt = new Date();
  };
  $scope.today();

  $scope.clear = function () {
    $scope.dt = null;
  };

  // // Disable weekend selection
  // $scope.disabled = function(date, mode) {
  //   return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
  // };

  $scope.toggleMin = function() {
    $scope.minDate = $scope.minDate ? null : new Date();
  };
  $scope.toggleMin();

  $scope.open = function($event) {
    $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;
  };

  $scope.dateOptions = {
    formatYear: 'yy',
    startingDay: 1
  };

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
});

bookIt.controller('FormController', ['$scope', '$http', function($scope, $http) {
      $scope.master = {};

      $scope.update = function(contact) {
        $scope.master = angular.copy(contact);
      };

      $scope.foo = function(){
        
        alert('foo');
        
        $http({
            method: 'POST',
            url: '/api/contacts',
            data: JSON.stringify($scope.contact),
            }).
        success(function (data) {
            //Showing Success message
            $scope.status = "The Person Saved Successfully!!!";
            //Loading people to the $scope
            GetContacts();
        })
        .error(function (error) {
            //Showing error message
            $scope.status = 'Unable to create a person: ' + error.message;
        }); 
      }
      
      function GetContacts() {
        //Defining the $http service for getting the people
        $http.get('/contacts')
        success(function (data) {
            if (data != null || data != 'undefined') {
               //Assigning people data to the $scope variable
                $scope.contacts = data;
                //Clearing the Person object in create context and Showing default Gender(Male) Checked
                $scope.contact = {
                   id: '',
                   first_name: '',
                   last_name: '',
                   phone_number:'',
                   email:'',
               };
           }
        })
        .error(function (error) {
            //Showing error message
            $scope.status = 'Unable to retrieve contacts' + error.message;
        });
      }

      $scope.createContact = function () {

        $http({
            method: 'POST',
            url: '/contacts',
            data: JSON.stringify($scope.contact),
            }).
        success(function (data) {
            //Showing Success message
            $scope.status = "The Contact Saved Successfully!!!";
            //Loading people to the $scope
            GetContacts();
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
