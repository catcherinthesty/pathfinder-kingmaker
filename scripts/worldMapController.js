DEV = true;
kingdomApp.controller('worldMapController', ['$scope', '$log', '$kingdom', function($scope, $log, $kingdom) {
// We really don't need to do _anything_ until this WHOLE document is loaded.
$(document).ready(function() {

// Define the constants
const HEX_HEIGHT = 68, // Height of each hex in pixels
      HEX_SIDE = HEX_HEIGHT / 2, // Half the height
      HEX_QUARTER = HEX_SIDE / 2; // Quarter the height, half the size

// Get the size of the div that contains the hexmap
var div_size = function() { // We need to know how big #hexmap is
    var div = [];
// Check how many FULL rows / columns of hexes we can fit
    // Don't know why 1.5 is correct,  but it works
    div[0] = Math.floor(($('#hexmap').width()/(HEX_SIDE*(1.5))))-1.5;
    // And .5 works here
    div[1] = Math.floor(($('#hexmap').height()/(HEX_HEIGHT))-0.5);
    div[2] = Math.floor(($('#hexmap').width() - div[0]*HEX_SIDE*1.5)/4);
    div[3] = Math.floor(($('#hexmap').height() - div[1]*HEX_HEIGHT)/4);
    return div;
}
// declare the div variable for use in code
var div = div_size(); // Set the div size as an array of X / Y / margin X / margin Y
// Draw one hex
var hex_draw = function(x,y,ter,mapCoordX,mapCoordY) {
    $('#hexmap').append(`<img class="hex" src="${terrain[ter].img}" style="left:${x}; top:${y}; z-index:0;" />`);
    // Each hex is drawn as an html element using the five parameters given
    $('#hexmap').append(`<span class="over-text" style="left:${x+Math.floor(HEX_QUARTER/2)}; top:${y+Math.floor(HEX_QUARTER+(HEX_QUARTER/2))}; z-index:1;">${mapCoordX},${mapCoordY}</span>`);
    if(!map[mapCoordX][mapCoordY]['explored']) {
        $('#hexmap').append(`<img class="hex gray" src="/static/images/terrain/gray.png" style="left:${x}; top:${y}; z-index:3;" />`);
    // if the hex is selected or targeted, draw that as well.
    // RESOURCES
    // IMPROVEMENTS
    // ARMIES
    }
}


// Render the map into html; this also offsets the map as requested.
var render_map_to_html = function(map) {
    // We need to make sure that the offset is ready to be considerd
    if($scope.off_x === NaN||$scope.off_x === null) { $scope.off_x = 0; }
    if($scope.off_y === NaN||$scope.off_y === null) { $scope.off_y = 0; }
    if($scope.off_x > $scope.MAP_WIDTH-div[0]) // too big? Reduce
        { $scope.off_x = Math.round($scope.MAP_WIDTH-div[0]+1); }
    if($scope.off_y > $scope.MAP_WIDTH-div[1]) // too big? Reduce
        { $scope.off_y = Math.round($scope.MAP_WIDTH-div[1]+1); }
    if($scope.off_x%2==1) {$scope.off_x--;} // We want EVEN values
    if($scope.off_y%2==1) {$scope.off_y--;} // We want fucking EVEN values
    var even = Boolean($scope.off_x %2 == 1); // I could just set this true


    for( x = $scope.off_x; x < ( div[0] + $scope.off_x ); x++) {
        for( y = $scope.off_y; y < ( div[1] + $scope.off_y ); y++) {
            // --- Terrain type in this hex
            if(!map[x]) { // Does this column exist?
                map[x] = Object(); // Add it if it does not
            }
            if(!map[x][y]) { // Does this row exist?
                map[x][y] = Object(); // If not, this is "zz"
            }
            if(!map[x][y]['terrain']) {
                ter = map[x][y]['terrain'] = "zz";
                map[x][y]['explored'] = 0;
            } else {
            ter = map[x][y]['terrain'];
            }
            
            // --- Coordinates to begin hex polygon on the screen
            var t = hex_coord(x,y);
            hex_draw(t[0],t[1],ter,x,y);
            $('#X_AXIS').val($scope.off_x);
            $('#Y_AXIS').val($scope.off_y);
            
            // -- If this is the selection or the target, retain that.
            if($scope.selected == (x + "," + y)) {
                $scope.selected=null; $scope.select(x,y);
            }
            // Keep the target if possible.
            if($scope.target == (x + "," + y)) {
                $scope.target=null; $scope.distance(x,y);
            }
        }
    }
    // Finally, hide the hex numbers if the box isn't checked.
    if($('#coord-check').hasClass('btn-danger') == true) { $('.over-text').hide(); }
}
// Redraw the map using the current settings.
var redraw = function() {
    $('#hexmap').children('img').remove();
    $('#hexmap').children('span.over-text').remove();
    render_map_to_html(map, $scope.off_x, $scope.off_y); // This should be replaced with a redraw function
    $('#X_AXIS').val($scope.off_x);
    $('#Y_AXIS').val($scope.off_y);
}
// Very simple terrain image one-liner



// Create the map and terrain objects to be populated later.
var map = Object(),
    terrain = Object();    
// For testing, we shall simulate specific coorrdinate sets.
// This function doesn't care what's happening in the backend, as long as it
// # gets json data as the response containing:
// # * map, * map_width * map_height * x[0,1] * y[0,1] * terrain
$.ajax({
    type: "POST",
    url: '/php/return_map.php',
    data: {'player':'ryecatcher15','game':'game1'},
    dataType: "json",
    success: function(data) {
        map =               data.map; if(DEV) {console.log(map);}
        $scope.off_x =      data.x[0]; 
        $scope.off_y =      data.y[0];
        end_x =             data.x[1]; // Currently unused - last visible x
        end_y =             data.y[1]; // Currently unused - last visible y
        $scope.MAP_WIDTH =  data.map_width;
        $scope.MAP_HEIGHT = data.map_height;
        terrain =           data.terrain;
        terrain['zz'] = {
            "description": "",
            "img": "./static/images/terrain/black.png",
            "name": "Unexplored",
            "tags": ""
        };
        render_map_to_html(map, $scope.off_x, $scope.off_y);

        $( window ).resize(function() {
            div = div_size();
            redraw()
        }); // Resize function
    }
});
$scope.goButton         = function() {
    redraw();
}
$scope.arrow            = function(direction) {
    switch(direction) {
        case 'left':
            if( $scope.off_x > 0 ) { Math.floor($scope.off_x -= 2)};
            redraw()
            break;
        case 'right':
            if( $scope.off_x < $scope.MAP_WIDTH - div[0] ) { Math.floor($scope.off_x += 2) };
            redraw();
            break;
        case 'up':
            if( $scope.off_y > 0 ) { Math.floor($scope.off_y -= 1); }
            redraw();
            break;
        case 'down':
            if( ($scope.off_y) < ($scope.MAP_HEIGHT - div[1]) ) { Math.ceil($scope.off_y += 2) };
            redraw();
            break;
        default:
            break;
    }
}
$scope.coordToggle      = function() {
    $('#coord-check').toggleClass('btn-danger');
    $('.over-text').toggle();
}
$scope.mode             = function(newMode) {
    unselect();
    untarget();
    $scope.curMode = newMode;
    if(DEV) {console.log("Current Mode:" + $scope.curMode);}
    $('.chess').removeClass("btn-primary");
    $('#btn-' + $scope.curMode).addClass('btn-primary');
    reveal(newMode);
}
$('#hexmap').click(       function(e) {
    hex_map = $('#hexmap')[0]; // map = #hexmmap w/jQuery
    
    // Where is the mouse in the #hexmap?
    var posx = e.pageX + $(this).scrollLeft() - div[2] -
            $(this).offset().left,
        posy = e.pageY + $(this).scrollTop() - div[3] -
            $(this).offset().top;
    // The math here will determine which hex was clicked.
    var x = (posx - (HEX_HEIGHT/2)) / (HEX_HEIGHT * 0.75);
    var y = (posy - (HEX_HEIGHT/2)) / HEX_HEIGHT;
    var z = -0.5 * x - y;
    
    y = -0.5 * x + y;
    
    var ix = Math.floor(x+0.5);
    var iy = Math.floor(y+0.5);
    var iz = Math.floor(z+0.5);
    
    var s = ix + iy + iz;
    
    if (s) {
        abs_dx = Math.abs(ix-x);
        abs_dy = Math.abs(iy-y);
        abs_dz = Math.abs(iz-z);
        if (abs_dx >= abs_dy && abs_dx >= abs_dz) {
            ix -= s;
        } else if (abs_dy >= abs_dx && abs_dy >= abs_dz) {
            iy -= s;
        } else {
            iz -= s;
        }
    }
    
    // map_x and map_y are the map coordinates of the click
    map_x = ix + $scope.off_x;
    map_y = ((iy - iz + (1 - ix %2 ) ) / 2 - 0.5) + $scope.off_y;
    
    // Test to make sure the click was on a valid hex
    if(map_x > $scope.MAP_WIDTH || map_y > $scope.MAP_HEIGHT || map_x < $scope.off_x || map_y < $scope.off_y ||
       map_x >= $scope.off_x+div[0] || map_y >= $scope.off_y+div[1] ) { return null };
    
    // This is the point of all of this.
    //change_selection(map_x,map_y);
    $scope[$scope.curMode](map_x,map_y);
});
    var hex_coord       = function(x,y) {
        var t = [];
        t[0] = (x-$scope.off_x) * HEX_SIDE * 3/2 + div[2];
        t[1] = (y-$scope.off_y) * HEX_HEIGHT + div[3];
        if(x%2 == 1) { t[1] += HEX_SIDE; }
        return t;
    }
    var terrain_image   = function(terrain) {
        return terrain.img;
    };
    var reveal          = function(mode) {
        $('.infobox').hide();
        $(`.${mode}`).show();
    }
$scope.select           = function(x,y) {
    if($scope.selected == x + "," + y) {
        unselect();
    } else {
        $scope.selected = x + "," + y;
        change_selection(x,y);
    }
}
    var untarget        = function() {
        $scope.target = null;
        $('#target').remove();
        $('.distance>span').slice(1).html(""); // slice skips the "selection" field
    }
    var change_target   = function(x,y) {
        $('#target-hex').html($scope.target);
        var t = hex_coord(x,y);
        target_place(t[0],t[1],x,y);
    }
    var target_place    = function(tx,ty,x,y) {
        $('#target').remove();
        $("#hexmap").append('<img id="target" class="hex" src="/static/images/terrain/selection.png" />');
        $('#target').css({"left": tx,"top": ty,"z-index": "3"});
        // Figure out the distance
    }
$scope.distance         = function(x,y) {
    if($scope.selected == x + "," + y) {
        unselect();
    } else if($scope.target == x + "," + y) {
        untarget();
    } else if(!$scope.selected) {
        $scope.selected = x + "," + y;
        change_selection(x,y);
    } else {
        $scope.target = x + "," + y;
        change_target(x,y);
    }
    // DETERMINE DISTANCCE FOR VISION AND MOVEMENT
    if($scope.selected && $scope.target) {
        $.ajax({
            type: "POST",
            url: '/php/return_distance.php',
            data: {
                a: $scope.selected,
                b: $scope.target
            },
            dataType: "json",
            success: function(data) {
                $('#distance-hex').html(data.distance);
            }
        });

    }
}
    var unselect        = function() {
        $scope.selected = null;
        $('#selected').remove();
        $('.select>span').html("");
    }
    var change_selection= function(x,y) {
        $('#selection-hex').html($scope.selected);
        $('#selection-type').html(terrain[map[x][y]['terrain']].name);
        $('#selection-desc').html(terrain[map[x][y]['terrain']].description);
        // --- Where do we put the selection marker?$scope.targeted
        // --- Coordinates to begin hex polygon on the screen
        var t = hex_coord(x,y);
        selection_place(t[0],t[1],x,y);

    }
    var selection_place = function(tx,ty,x,y) {
        $('#selected').remove();
        $("#hexmap").append('<img id="selected" class="hex" src="/static/images/terrain/selection.png" />');
        $('#selected').css({"left": tx,"top": ty,"z-index": "3"});
        if(!map[x][y]['explored']) {
            $('#selection-desc').append("<b> This hex has not yet been explored.</b>");
        }
    }

$scope.army = function(x,y) {
    return null;
}

$scope.culture = function(x,y) {
    return null;
}

$scope.improvements = function(x,y) {
    return null;
}

$scope.kingdom = function(x,y) {
    return null;
}

$scope.curMode = "select";
reveal("select");

});
}]);
