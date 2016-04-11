<?php
class Map {
    // Terrain definitions. We aren't using "basic terrain" right now.
/*    public $basic_terrain = Array("a","b","c","d","e","f","g","h");*/
/*    public $extended_terrain = Array("aa","ab","ac","ad","ae","af","ag","ah",
        "ba","bb","bc","bd","be","bf","bg","bh","bi",
        "ca","cb","cc","cd","ce","cf","cg","ch","ci","cj","ck",
        "da","db",
        "ea","eb","ec","ed","ee","ef",
        "fa","fb","fc","fd","fe","ff","fg",
        "ga","gb","gc","gd","ge","gf","gg","gh","gi","gj","ha","hb","hc","hd","he","hf"); */
    public $basic_terrain = Array();
    public $extended_terrain = Array();
    public $map;
    // open_map should need to just be fed the name of the map. A .sav extension might be appropriate.
    // THIS SHOULD BE STORED IN SQL!!
    public function open($map_id) {
        $myfile = fopen("../save_data/" . $map_id . ".sav","r")
            or die("Unable to open map file!");;
        $map_tmp = fread($myfile,filesize("../save_data/" . $map_id . ".sav"));
        $this->map=unserialize($map_tmp);
        fclose($myfile);
    }

    // Saving the map.
    // CHANGE THIS TO SQL WHEN YOU CAN!!
    public function save($map_id) {
        $serial_map = serialize(self::$map);
        $mapfile = fopen("./save_data/$map_id.sav","w");
        fwrite($mapfile,$serial_map);
        fclose($mapfile);
    }

    // The generation of random terrain, available upon request.
    // OVERWRITES CURRENT MAP
    // Uses terrain array input as $terrain
    public function randomize($width, $height, $terrain) {
        for($x=0; $x<$width; $x++) {
            for ($y=0; $y<$height; $y++) {
                self::$map[$x][$y] = $terrain[array_rand($terrain)];
            }
        }
    }

    public function build_output($x,$y,$explored,$visible,$hex_map) { // input is two two-dimensional arrays
    // x[0] is the first x, x[1] is the last; same for y
    // Build the map array.
        for($cx=$x[0]; $cx<=$x[1]; $cx++) {
            for($cy=$y[0]; $cy<=$y[1]; $cy++) {
                if(in_array([$cx,$cy],$visible)) {
                    $mapTerrain[] = $hex_map[$cx][$cy];
                    $map[$cx][$cy]['terrain'] = $hex_map[$cx][$cy];
                } else {
                    $map[$cx][$cy]['terrain'] = "zz";
                }
                if(in_array([$cx,$cy],$explored)) {
                    $map[$cx][$cy]['explored'] = 1;
                } else {
                    $map[$cx][$cy]['explored'] = 0;
                }
            }
        }
        $mapTerrain = array_unique($mapTerrain);
        return array($x[0], $y[0], $x[1], $y[1], $map, $mapTerrain);
    }
    
}