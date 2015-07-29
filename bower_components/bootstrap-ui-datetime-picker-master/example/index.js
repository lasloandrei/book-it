var app = angular.module('app', ['ui.bootstrap', 'ui.bootstrap.datetimepicker']);

app.controller('MyController', ['$scope', function($scope) {

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
}]);