var kingdomApp = angular.module('kingdomApp', ['ngRoute']);

kingdomApp.config(function ($locationProvider, $routeProvider){
    $locationProvider.html5Mode(true);
    $routeProvider
/*    .when('/', {
        templateUrl: '/static/html/main.html',
        controller: 'mainController'
    })*/
    .when('/kingdom', {
        templateUrl: '/static/html/kingdomSummary.html',
        controller: 'summaryController'
    })
    .when('/hex', {
        templateUrl: '/static/html/worldMap.html',
        controller: 'worldMapController'
    })
//    .when('', {});
});

kingdomApp.service('$kingdom', function(){
    var self = this;
    this.name = "Kingdom";
    this.cities = ["Olegston","Aurum Heights","Fort Tuskwater","The Murque Tribe"];
});