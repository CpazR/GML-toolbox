///@function instance_count_radius(object, x ,y, radius)
///@description Counts number of objects in radius at a given point.
///@param object_id
///@param x
///@param y
///@param radius
function instance_count_radius(_x, _y, _obj, _rad) {
	xx = _x;
	yy = _y;
	obj = _obj;
	rad = _rad;

	obj_count = instance_number(obj);

	count = 0;

	for(var i=0; i < obj_count; i++) {
		obj_list[i] = instance_find(obj, i);
	
		if instance_exists(obj_list[i]) && (point_distance(xx,yy, obj_list[i].x, obj_list[i].y) <= rad) {
	 		count++
		}
	}

	return count;


}
