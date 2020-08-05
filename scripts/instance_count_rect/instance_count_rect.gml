///@function instance_count_rect(x ,y, object, width, height)
///@description Counts number of objects in a rectangle at a given point.
///@param object_id
///@param x
///@param y
///@param width
///@param height
function instance_count_rect(_obj, _x1, _y1, _x2, _y2) {
	obj = _obj;
	xx1 = _x1;
	yy1 = _y1;
	xx2 = _x2;
	yy2 = _y2;

	obj_count = instance_number(obj);

	count = 0;

	// NOTE: not percise for bounding box, but effective enough for my use cases
	for(var i=0; i < obj_count; i++) {
		obj_list[i] = instance_find(obj, i);
	
		if instance_exists(obj_list[i]) && (point_in_rectangle(obj_list[i].x, obj_list[i].y, xx1, yy1, xx2, yy2) ) {
	 		count++
		}
	}

	return count;


}
