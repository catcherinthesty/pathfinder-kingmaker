kingdomApp.controller('summaryController', ['$scope', '$kingdom', function($scope, $kingdom) {
    $scope.name = $kingdom.name;
}]);