///@function move_to_tilemap_nearest(layer_name, dist, angle_interval)
///@description move to 
///@param layer_name
///@param distance
///@param angle_interval

// consider splitting this into two separate functions to get nearest tile x/y

var layer_name = argument0;
var dist = argument1;
var angle_interval= argument2;

var quit=false;
for (var i=0; i<dist; i+=2){ // distance loop (for 62 pixels on 2 pixel intervals)
	for (var j=0; j<(360/angle_interval); j++){ // rotation loop (for 360 degrees on 15 degree intervals)
		var xx = x + lengthdir_x(i, j*15);
		var yy = y + lengthdir_y(i, j*15);
		
		var map_id = layer_tilemap_get_id(layer_get_id(layer_name))
		if tilemap_get_at_pixel(map_id,xx,yy)>0{
			x=xx + lengthdir_x(sprite_width/2+2, j*angle_interval);
			y=yy + lengthdir_y(sprite_height/2+2, j*angle_interval);
			quit=true;
			break;
		}
	}
	if quit
		break;
}