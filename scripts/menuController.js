kingdomApp.controller('menuController', ['$scope', '$kingdom', '$window', /*'$mdDialog',*/ function($scope, $kingdom, $window/*, $mdDialog*/) {



    $scope.phases = {
        "0":{"name":"Upkeep",
             "steps":[
                "Determine Kingdom Stability",
                "Pay Consumption",
                "Fill Vacant Magic Item Slots",
                "Modify Unrest"
             ]
            },
        "1":{"name":"Edict",
            "steps":[
                "Assign Leadership",
                "Claim Hexes",
                "Abandon Hexes",
                "Build Terrain Improvements",
                "Create and Improve Settlements",
                "Create Army Units",
                "Issue Edicts"
             ]
            },
        "2":{"name":"Income",
            "steps":[
                "Make Withdrawals from the Treasury",
                "Make Deposits to the Treasury",
                "Sell Expensive Items for BP",
                "Collect Taxes"
             ]
            },
        "3":{"name":"Event",
            "steps":[
                "Kingdom Events",
                "City Events",
                "Character Events",
                "Special Events"
             ]
            }
    };
    // Test data

$scope.turn = 0;
$scope.phase = 0;
$scope.step = 0;

    $scope.cities = $kingdom.cities;

    $scope.EndStep = function(){
/*        confirmation = 
            $mdDialog.confirm()
                .title('End "' + phases[phase]['steps'][step] + '" step.')
                .textContent("Are you sure you want to end this step?")
                .ok("I'm sure.")
                .cancel("No, wait...");
        $mdDialogue.show(confirmation).then(function(){*/
            $scope.step += 1;
            if($scope.step == $scope.phases[$scope.phase]['steps'].length) {
                $scope.step = 0;
                $scope.phase++;
            }
            if($scope.phase == _.size($scope.phases)) {
                $scope.phase = 0;
                $scope.step = 0;
                $scope.turn++;
            }/*
        }, function() {
            return null;
        })*/;
    };

    
}]);
