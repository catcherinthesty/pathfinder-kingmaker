<?php
spl_autoload_register(function($class_name){
    require_once "classes/" . $class_name . ".php";
}); // Database, Hex, Map, TestData
$database = new Database;
$hex = new Hex;
$map = new Map;
$DEV = null;

// This infomration will eventually be pulled from a _POST request or cookie
// Verification through a login will be necessary, so the values will likely be secret.
if(PHP_SAPI === "cli") {
    $game = "game1";
    $player = "_lordnitemar";
} else {
    $game = $_POST['game'];
    $player = "_" . $_POST['player'];
}

// We need to initiate this information so we can pull it from the database.
$visible = $game . $player .  "_visible";
$explored = $game . $player . "_explored";
$game_map = $game . "_map";

// Eventually, these simulated areas will be replaced with real data pulled from the database.
${$visible} =  TestData::${$visible};
// ${$visible} = GetData::${$visible};
${$explored} = TestData::${$explored};
//${$explored} = GetData::${$explored};

// ### RETRIEVE OUR MAP ###
// This is a quick and dirty map.
$game_map = TestData::$game_map;
// We need the map functions script.

// We'll borrow the open_map function from map_functions.php
$map->open($game_map);

list($x,$y) = $hex->start_end(${$visible});
list($x[0],$y[0],$x[1],$y[1],$output,$mapTerrain) = $map->build_output($x,$y,${$explored},${$visible},$map->map);

// Build our query for terrain
$query = "SELECT * FROM TERRAIN WHERE id IN ('" . implode("','", $mapTerrain) . "');";
$result = $database->query($query);
// Parse the results into terrain blocks
foreach($result as $item) {
    $terr["$item[id]"] = [
        "description"   => $item["description"],
        "img"           => $item["img"],
        "name"          => $item["name"],
        "tags"          => $item["tags"]
    ];
}

// Let's get the terrain as well. We'll need this in the future, I suppose.
/* $query = "SELECT id FROM TERRAIN;";
$result = $database->query($query);
foreach($result as $item) {
    if(strlen($item['id']) == 1) {
        array_push($map->basic_terrain,$item['id']);
    } else if(strlen($item['id']) == 2) {
        array_push($map->extended_terrain,$item['id']);
    }
} */

$json = json_encode(array("x"           => $x,
                          "y"           => $y,
                          "map"         => $output,
                          "terrain"     => $terr,
                          "map_width"   => count($map->map),
                          "map_height"  => count($map->map[0])
                         )
                   );
echo($json);
?>
