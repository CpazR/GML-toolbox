///@function instance_count_rect(x ,y, object, width, height)
///@description Counts number of objects in a rectangle at a given point.
///@param object_id
///@param x
///@param y
///@param width
///@param height

var xx, yy, obj, xx2, yy2, count, obj_list, obj_count;

obj = argument0;
xx = argument1;
yy = argument2;
xx2 = argument3;
yy2 = argument4;

obj_count = instance_number(obj);

count = 0;

// NOTE: not percise for bounding box, but effective enough for my use cases
for(var i=0; i < obj_count; i++) {
	obj_list[i] = instance_find(obj, i);
	
	if instance_exists(obj_list[i]) && (point_in_rectangle(obj_list[i].x, obj_list[i].y, xx,yy, xx2, yy2) ) {
 		count++
	}
}

return count;