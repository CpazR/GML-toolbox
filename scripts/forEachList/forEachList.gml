///@function forEachList(_arr, _callback)
///@description iterates over a ds_list and performs the given callback on each iteration
///@param _arr
///@param _callback
function forEachList(_list, _callback) {
	list = _list;
	callback = _callback;
	listLength = ds_list_size(list);
	
	for(i = 0; i < listLength; i++) {
		callback(i);
	}
}

// alternate naming scheme
function for_each_list(_list, _callback) {
	forEachList(_list, _callback);
}