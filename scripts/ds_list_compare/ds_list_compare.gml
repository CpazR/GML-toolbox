///@function ds_list_compare(ds_list1, ds_list2)
///@description Compares two ds lists to see if they are identical
///@param ds_list1
///@param ds_list2
function ds_list_compare(_ds_list1, _ds_list2) {

	ds_list1 = _ds_list1;
	ds_list2 = _ds_list2;
	list1_size = ds_list_size(ds_list1);
	list2_size = ds_list_size(ds_list2);

	returnValue= true;

	if list1_size == list2_size { // checks if lists are equal in size
		for(var i = 0; i < list1_size; i++) {
			// checks if there is a single mismatch in list contents, if so set return value to false and break from loop
			if ds_list1[|i] != ds_list2[|i] {
				returnValue = false;
				break;
			}
		}
	} else { // if lists are different sizes, they cannot be identical
		returnValue = false;	
	}

	return returnValue;


}
