///@function round_nearest_multiple(number, multiple)
///@description Rounds given number to nearest given multiple.
///@param number_round
///@param multiple_round
function round_multiple(_number_round, _multiple_round) {

	number = round(_number_round);
	multipleOf = _multiple_round;
	i=1;
	retNumber = number;

	// iterates until npi or nmi are 0, or i is greater/equal to multipleOf
	while (i < multipleOf) {
		var npi = (number+i) mod multipleOf;
		var nmi = (number-i) mod multipleOf;
	
		if npi == 0 {
			 retNumber = number + i;
			 break;
		}
		if nmi ==  0{
			retNumber = number - i;
			break;
		}
		i++;
	}

	return retNumber;



}
