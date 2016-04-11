<?php
require 'classes/Hex.php';
$hex = new Hex;
if(PHP_SAPI === "cli") {
    $a = "30,34";
    $b = "38,39";
} else {
    list($a['col'],$a['row']) = explode(",",$_POST['a']);
    list($b['col'],$b['row']) = explode(",",$_POST['b']);
}
$a = $hex->hex_to_cube($a);
$b = $hex->hex_to_cube($b);
$distance = $hex->hex_distance($a,$b);
$json = json_encode(array("a" => $a,
                          "b" => $b,
                          "distance" => $distance));
                          
echo $json;