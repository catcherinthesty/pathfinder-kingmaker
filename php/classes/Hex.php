<?php

class Hex {
/*
    'col' => 0;
    'row' => 0;
    'q'   => 0;
    'r'   => 0;
    's'   => 0;
*/
    /*
     * start_end
     * 
     * Determines the range of hexes, returning the min and max
     * on bot the x and y axis.
     * 
     * @range (array) the range of hexes as an array of arrays;
     * need to cube_to_hex first.
     * @return (array,array) returns x[min],[max] and y[min],[max]
     */
    public function start_end($range) {
        $tmpx = [];
        $tmpy = [];
        foreach($range as $i) {
            $tmpx[] += $i[0];
            $tmpy[] += $i[1];
        }
        $x[0]=min($tmpx);
        $x[1]=max($tmpx);
        $y[0]=min($tmpy);
        $y[1]=max($tmpy);
        return array($x, $y);
    }

    /* Vital functions for hexes and cubes */
    public function hex_to_cube($hex) {
        $x = $hex['col'];
        $z = $hex['row'] - ($hex['col'] - ($hex['col'] % 2)) / 2;
        $y = -$x -$z;
        return ['q' => $x, 'r' => $y, 's' => $z];
    }
    public function cube_to_hex($cube) {
        $col = $cube['q'];
        $row = $cube['s'] + ($cube['q'] - ($cube['q'] % 2)) / 2;
        return ['col' => $col, 'row' => $row];
    }

    /*  addition / subtraction of cube coords */
    public function hex_add($a, $b) {
        return array('q' => ($a['q'] + $b['q']),
                     'r' => ($a['r'] + $b['r']),
                     's' => ($a['s'] + $b['s']));
    }
    public function hex_subtract($cube_a, $cube_b) {
        $final['q'] = ($cube_a['q'] - $cube_b['q']);
        $final['r'] = ($cube_a['r'] - $cube_b['r']);
        $final['s'] = ($cube_a['s'] - $cube_b['s']);
        return $final;
    }

    /* Hexagon neighbors - both linear and diagonal. */
    private $hex_directions = [
        ['q' =>  1, 'r' =>  0, 's' => -1], // ur
        ['q' =>  1, 'r' => -1, 's' => -0], // dr
        ['q' =>  0, 'r' => -1, 's' =>  1], // d
        ['q' => -1, 'r' =>  0, 's' =>  1], // dl
        ['q' => -1, 'r' =>  1, 's' =>  0], // ul
        ['q' =>  0, 'r' =>  1, 's' => -1]  // u
    ];
    private function hex_direction($direction) {
        return $this->hex_directions[$direction];
    }
    public function hex_neighbor($hex, $direction) {
        return $this->hex_add($hex, $this->hex_direction($direction));
    }
    private static $hex_diagonals = [
        ['q' =>  2, 'r' => -1, 's' => -1], // E 
        ['q' =>  1, 'r' => -2, 's' =>  1], // SE
        ['q' => -1, 'r' => -1, 's' =>  2], // SW
        ['q' => -2, 'r' =>  1, 's' =>  1], // W
        ['q' => -1, 'r' =>  2, 's' => -1], // NW
        ['q' =>  1, 'r' =>  1, 's' => -2]  // NE
    ];
    public function hex_diagonal_neighbor($hex, $direction) {
        return $this->hex_add($hex, self::$hex_diagonals[$direction]);
    }

    /* Hex distance functions for determining a line between hexes */
    private function hex_length($hex) {
        return intval((abs($hex['q']) + abs($hex['r']) + abs($hex['s'])) / 2);
    }
    public function hex_distance($cube_a, $cube_b) {
        $dist = $this->hex_subtract($cube_a, $cube_b);
        return $this->hex_length($dist);
    }
    
    /* Where necessary, a fraction hex can be fixed */
    public function hex_round($h) {
        $q = intval(round($h['q']));
        $r = intval(round($h['r']));
        $s = intval(round($h['s']));
        $q_diff = abs($q - $h['q']);
        $r_diff = abs($r - $h['r']);
        $s_diff = abs($s - $h['s']);
        if ($q_diff > $r_diff && $q_diff > $s_diff) {
            $q = -$r - $s;
        } else if ($r_diff > $s_diff) {
            $r = -$q - $s;
        } else {
            $s = -$q - $r;
        }
        return $this->hex_get($q, $r, $s);
    }

    /* Pathfinding */
    





    /* lerp interpolates as a helper function for drawing a line 
    public function hex_lerp($a, $b, $t) {
        return array($a['q'] + ($b['q'] - $a['q']) * $t, $a['r'] + ($b['r'] - $a['r']) * $t, $a['s'] + ($b['s'] - $a['s']) * $t);
    }
    public function hex_linedraw($a, $b) {
        $N = $this->hex_distance($a, $b);
        $results = [];
        $step = 1.0 / max($N, 1);
        for ($i = 0; $i <= $N; $i++)
            {
                array_push($results,($this->hex_round(
                    $this->hex_lerp($a, $b, $step * $i))));
            }
        return $results;
    }
*/
    /* I'm not going to be using offset coordinates 
    public function OffsetCoord($col, $row) {
        return ['col' => $col,
                'row' => $row];
    }
    public function qoffset_from_cube($offset, $h) {
        $col = $h['q'];
        $row = $h['r'] + intval(($h['q'] + $offset * ($h['q'] & 1)) / 2);
        return $this->OffsetCoord($col, $row);
    }
    public function qoffset_to_cube($offset, $h) {
        $q = $h['col'];
        $r = $h['row'] - intval(($h['col'] + $offset * ($h['col'] & 1)) / 2);
        $s = -$q - $r;
        return $this->hex_get($q, $r, $s);
    }
    public function roffset_from_cube($offset, $h) {
        $col = $h['q'] + intval(($h['r'] + $offset * ($h['r'] & 1)) / 2);
        $row = $h['r'];
        return $this->OffsetCoord($col, $row);
    }
    public function roffset_to_cube($offset, $h) {
        $q = $h['col'] - intval(($h['row'] + $offset * ($h['row'] & 1)) / 2);
        $r = $h['row'];
        $s = -$q - $r;
        return $this->hex_get($q, $r, $s);
    }
*/
    /* Nor do I need orientations in the php files, as they do not draw
    public function Orientation($f0, $f1, $f2, $f3, $b0, $b1, $b2, $b3, $start_angle) {
        return ['f0' => f0,
                'f1' => f1,
                'f2' => f2,
                'f3' => f3,
                'b0' => b0,
                'b1' => b1,
                'b2' => b2,
                'b3' => b3,
                'start_angle' => start_angle];
    }
    public function layout_get($orientation, $size, $origin) {
        return ['orientation' => $orientation,
                'size' => $size,
                'origin' => $origin];
    }
    public $layout_pointy = [
        'f0' => M_SQRT3,
        'f1' => M_SQRT3 / 2.0,
        'f2' => 0.0,
        'f3' => 3.0 / 2.0,
        'b0' => M_SQRT3 / 3.0,
        'b1' => -1.0 / 3.0,
        'b2' => 0.0,
        'b3' => 2.0 / 3.0,
        'start_angle' => 0.5
    ];
    public $layout_flat = [
        'f0' => 3.0 / 2.0,
        'f1' => 0.0,
        'f2' => M_SQRT3 / 2.0,
        'f3' => M_SQRT3,
        'b0' => 2.0 / 3.0,
        'b1' => 0.0,
        'b2' => -1.0 / 3.0,
        'b3' => M_SQRT3 / 3.0,
        'start_angle' => 0.0
    ];
*/

    /* Again, these are really for the JS side of things
    public function hex_to_pixel($layout, $h) {
        $M = $layout['orientation'];
        $size = $layout['size'];
        $origin = $layout['origin'];
        $x = ($M['f0'] * $h['q'] + $M['f1'] * $h['r']) * $size['x'];
        $y = ($M['f2'] * $h['q'] + $M['f3'] * $h['r']) * $size['y'];
        return $this->point_get($x + $origin['x'], $y + $origin['y']);
    }
    public function pixel_to_hex($layout, $p) {
        $M = $layout['orientation'];
        $size = $layout['size'];
        $origin = $layout['origin'];
        $pt = $this->point_get(($p['x'] - $origin['x']) / $size['x'], ($p['y'] - $origin['y']) / $size['y']);
        $q = $M['b0'] * $pt['x'] + $M['b1'] * $pt['y'];
        $r = $M['b2'] * $pt['x'] + $M['b3'] * $pt['y'];
        return $this->hex_get($q, $r, -$q - $r);
    }
    public function hex_corner_offset($layout, $corner) {
        $M = $layout['orientation'];
        $size = $layout['size'];
        $angle = 2.0 * M_PI * ($corner + $M['start_angle']) / 6;
        return $this->point_get($size['x'] * cos($angle), $size['y'] * sin($angle));
    }
    public function polygon_corners($layout, $h) {
        $corners = [];
        $center = hex_to_pixel($layout, $h);
        for ($i = 0; $i < 6; $i++)
        {
            $offset = hex_corner_offset($layout, $i);
            array_push($corners,($this->point_get($center['x'] + $offset['x'], $center['y'] + $offset['y'])));
        }
        return $corners;
    }
*/

/* Tests

    public function complain($name) {
        echo("FAIL: " . $name . "\n");
    }

    public function equal_hex($name, $a, $b) {
        if (!($a['q'] == $b['q'] &&
              $a['s'] == $b['s'] &&
              $a['r'] == $b['r'])) {
            $this->complain($name);
        }
    }

    public function equal_offsetcoord($name, $a, $b) {
    if (!($a['col'] == $b['col'] && $a['row'] == $b['row'])) {
            $this->complain($name);
        }
    }

    public function equal_int($name, $a, $b) {
        if (!($a == $b)) {
            $this->complain($name);
        }
    }

    public function equal_hex_array($name, $a, $b) {
        $this->equal_int($name, sizeof($a), sizeof($b));
        for ($i = 0; $i < sizeof($a); $i++) {
            $this->equal_hex($name, $a[$i], $b[$i]);
        }
    }

    public function test_hex_arithmetic() {
    $this->equal_hex("hex_add", $this->hex_get(4, -10, 6),
                     $this->hex_add($this->hex_get(1, -3, 2),
                                    $this->hex_get(3, -7, 4)));
    $this->equal_hex("hex_subtract", $this->hex_get(-2, 4, -2),
                     $this->hex_subtract($this->hex_get(1, -3, 2),
                                         $this->hex_get(3, -7, 4)));
    }

    public function test_hex_direction() {
        $this->equal_hex("hex_direction", $this->hex_get(0, -1, 1), $this->hex_direction(2));
    }

    public function test_hex_neighbor() {
        $this->equal_hex("hex_neighbor", $this->hex_get(1, -3, 2), $this->hex_neighbor($this->hex_get(1, -2, 1), 2));
    }

    public function test_hex_diagonal() {
        $this->equal_hex("hex_diagonal",
                         $this->hex_get(-1, -1, 2),
                         $this->hex_diagonal_neighbor($this->hex_get(1, -2, 1), 4));
    }

    public function test_hex_distance() {
        $this->equal_int("hex_distance", 7, $this->hex_distance($this->hex_get(3, -7, 4), $this->hex_get(0, 0, 0)));
    }

    public function test_hex_round() {
        $a = $this->hex_get(0, 0, 0);
        $b = $this->hex_get(1, -1, 0);
        $c = $this->hex_get(0, -1, 1);
        $this->equal_hex("hex_round 1",
                         $this->hex_get(5, -10, 5),
                         $this->hex_round($this->hex_lerp($this->hex_get(0, 0, 0),
                                                          $this->hex_get(10, -20, 10),
                                                 0.5)
                                         )
                        );
        $this->equal_hex("hex_round 2",
                         $a,
                         $this->hex_round($this->hex_lerp($a,
                                                          $b,
                                                          0.499)
                                         )
                        );
        $this->equal_hex("hex_round 3",
                         $b,
                         $this->hex_round($this->hex_lerp($a,
                                                          $b,
                                                          0.501)
                                         )
                        );
        $this->equal_hex("hex_round 4",
                         $a,
                         $this->hex_round($this->hex_get($a['q'] * 0.4 + $b['q'] * 0.3 + $c['q'] * 0.3,
                                                         $a['r'] * 0.4 + $b['r'] * 0.3 + $c['r'] * 0.3,
                                                         $a['s'] * 0.4 + $b['s'] * 0.3 + $c['s'] * 0.3)
                                         )
                        );
        $this->equal_hex("hex_round 5",
                         $c,
                         $this->hex_round($this->hex_get($a['q'] * 0.3 + $b['q'] * 0.3 + $c['q'] * 0.4,
                                                         $a['r'] * 0.3 + $b['r'] * 0.3 + $c['r'] * 0.4,
                                                         $a['s'] * 0.3 + $b['s'] * 0.3 + $c['s'] * 0.4)
                                         )
                        );
    }

    public function test_hex_linedraw() {
        $this->equal_hex_array("hex_linedraw",[ 
            $this->hex_get(0, 0, 0),
            $this->hex_get(0, -1, 1),
            $this->hex_get(0, -2, 2),
            $this->hex_get(1, -3, 2),
            $this->hex_get(1, -4, 3),
            $this->hex_get(1, -5, 4)],
            $this->hex_linedraw($this->hex_get(0, 0, 0),
                                $this->hex_get(1, -5, 4)));
    }

    public function test_layout() {
        $h = $this->hex_get(3, 4, -7);
        $flat = $this->layout_get($this->layout_flat, $this->point_get(10, 15), $this->point_get(35, 71));
        $this->equal_hex("layout", $h, $this->hex_round($this->pixel_to_hex($flat, $this->hex_to_pixel($flat, $h))));
        $pointy = $this->layout_get($this->layout_pointy, $this->point_get(10, 15), $this->point_get(35, 71));
        $this->equal_hex("layout", $h, $this->hex_round($this->pixel_to_hex($pointy, $this->hex_to_pixel($pointy, $h))));
    }

    public function test_conversion_roundtrip() {
        $a = $this->hex_get(3, 4, -7);
        $b = $this->OffsetCoord(1, -3);
        $this->equal_hex("conversion_roundtrip even-q", $a, $this->qoffset_to_cube(1, $this->qoffset_from_cube(1, $a)));
        $this->equal_offsetcoord("conversion_roundtrip even-q", $b, $this->qoffset_from_cube(1, $this->qoffset_to_cube(1, $b)));
        $this->equal_hex("conversion_roundtrip odd-q", $a, $this->qoffset_to_cube(-1, $this->qoffset_from_cube(-1, $a)));
        $this->equal_offsetcoord("conversion_roundtrip odd-q", $b, $this->qoffset_from_cube(-1, $this->qoffset_to_cube(-1, $b)));
        $this->equal_hex("conversion_roundtrip even-r", $a, $this->roffset_to_cube(1, $this->roffset_from_cube(1, $a)));
        $this->equal_offsetcoord("conversion_roundtrip even-r", $b, $this->roffset_from_cube(1, $this->roffset_to_cube(1, $b)));
        $this->equal_hex("conversion_roundtrip odd-r", $a, $this->roffset_to_cube(-1, $this->roffset_from_cube(-1, $a)));
        $this->equal_offsetcoord("conversion_roundtrip odd-r", $b, $this->roffset_from_cube(-1, $this->roffset_to_cube(-1, $b)));
    }

    public function test_offset_from_cube() {
        $this->equal_offsetcoord("offset_from_cube even-q",
                                 $this->OffsetCoord(1, 3),
                                 $this->qoffset_from_cube(1, $this->hex_get(1, 2, -3)));
        $this->equal_offsetcoord("offset_from_cube odd-q",
                                 $this->OffsetCoord(1, 2),
                                 $this->qoffset_from_cube(-1, $this->hex_get(1, 2, -3)));
    }

    public function test_offset_to_cube() {
        $this->equal_hex("offset_to_cube even-", $this->hex_get(1, 2, -3), $this->qoffset_to_cube(1, $this->OffsetCoord(1, 3)));
        $this->equal_hex("offset_to_cube odd-q", $this->hex_get(1, 2, -3), $this->qoffset_to_cube(-1, $this->OffsetCoord(1, 2)));
    }

    public function test_all() {
        $this->test_hex_arithmetic();
        $this->test_hex_direction();
        $this->test_hex_neighbor();
        $this->test_hex_diagonal();
        $this->test_hex_distance();
        $this->test_hex_round();
        $this->test_hex_linedraw();
        $this->test_layout();
        $this->test_conversion_roundtrip();
        $this->test_offset_from_cube();
        $this->test_offset_to_cube();
    }
*/
}