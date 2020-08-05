///@function forEach(_arr, _callback)
///@description iterates over an array and performs the given callback on each iteration
///@param _arr
///@param _callback
function forEach(_arr, _callback) {
	arr = _arr;
	callback = _callback;
	arrLength = array_length(arr);
	
	for(i = 0; i < arrLength; i++) {
		callback(i);
	}
}

// alternate naming scheme
function for_each(_arr, _callback) {
	forEach(_arr, _callback);
}