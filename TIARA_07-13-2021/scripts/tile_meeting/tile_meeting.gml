/// @function tile_meeting(x,y,tilemap);

function tile_meeting(argument0, argument1, argument2){


var _layer = argument2,
    _tm = layer_tilemap_get_id(_layer);

var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - x), y),
    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - y)),
    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (argument0 - x), y),
    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - y));

for(var _x = _x1; _x <= _x2; _x++){
 for(var _y = _y1; _y <= _y2; _y++){
    if(tile_get_index(tilemap_get(_tm, _x, _y))){
    return true;
    }
 }
}

return false;
}