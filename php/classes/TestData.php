<?php
class TestData {
    // We need to initiate this information so we can pull it from the database.
    static $game_map = "map";
    static $visible = "visible";
    static $explored = "explored";


    // Eventually, these simulated areas will be replaced with real data pulled from the database.
    static $game1_ryecatcher15_visible =  array(
        [33,31],[33,32],[33,33],[33,36],[33,37],[33,38],[33,39],[33,40],
        [35,30],[35,34],[35,35],[35,38],[35,39],[35,40],[35,41],[35,42],[35,43],[35,44],
        [32,33],[32,34],[32,35],[32,37],[32,38],[32,40],
        [36,30],[36,31],[36,35],[36,36],[36,38],[36,39],[36,40],[37,38],[37,39],
        [37,30],[37,31],[37,32],[38,37],[38,38],[39,36],[39,37],[37,34],[38,34],[38,35],
        [34,30],[34,31],[34,34],[34,35],[34,36],[34,37],[34,40],[39,34],[39,35],[35,33],
        [38,30],[38,39],[38,40],[39,30],[36,33],[35,31],[35,32],[36,32],
        [31,31],[31,32],[31,33],[31,34],[31,35],[31,36],[31,37],[31,38],[31,39],[31,40],
        [40,30],[40,31],[40,32],[40,33],[40,34],[40,35],[40,36],[40,37],[40,38],[40,39],[40,40]);
    static $game1_ryecatcher15_explored = array(
        [33,31],[33,32],[33,33],[33,36],[33,37],[33,38],[33,39],[33,40],
        [35,30],[35,34],[35,35],[35,38],[35,39],[35,40],[35,41],[35,42],[35,43],[35,44],
        [32,33],[32,34],[32,35],[32,37],[32,38],[32,40],
        [36,30],[36,31],[36,35],[36,36],[36,38],[36,39],[36,40],[37,38],[37,39],
        [37,30],[37,31],[37,32],
        [34,30],[34,31],[34,34],[34,35],[34,36],[34,37],[34,40],
        [38,30],[38,39],[38,40],[39,30],
        [31,31],[31,32],[31,33],[31,34],[31,35],[31,36],[31,37],[31,38],[31,39],[31,40],
        [40,30],[40,31],[40,32],[40,33],[40,34],[40,35],[40,36],[40,37],[40,38],[40,39],[40,40]);
    static $game1_ryecatcher15_controller = array(
    );

    static $game1_lordnitemar_visible =  array(
        [70,7],[70,8],[70,9],[70,10],[70,13],[70,14],[70,15],
        [71,5],[71,6],[71,7],[71,8],[71,9],[71,10],[71,11],[71,12],[71,13],[71,14],[71,15],[71,16],
        [72,8],[72,9],[72,10],[72,11],[72,12],[72,13],[72,14],[72,15],[72,16],
        [73,6],[73,7],[73,8],[73,9],[73,11],[73,12],[73,13]
    );        
    static $game1_lordnitemar_explored = array(
        [70,10],[70,13],[70,14],[70,15],
        [71,9],[71,10],[71,11],[71,12],[71,13],[71,14],
        [72,8],[72,9],[72,10],[72,14],[72,15],[72,16],
        [73,6],[73,7],[73,8],[73,12],[73,13]
    );
    // We need the map functions script.
}