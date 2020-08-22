///@function customTimer(callback)
///@description Assign a callback, run the advance function each step, and have a named alarm
///@param ds_list1
///@param ds_list2
function customTimer(_callback) constructor {
	// PRIVATE: a function to run when timer is activated
	callback = _callback;
	
	// PRIVATE: main counter for time
	counter = 0;
	
	// PRIVATE: goal for counter
	toCount = -1;
	
	// PRIVATE: a quick way to check if timer is active
	active = false;
	
	// return if timer is active or not
	function isActive() {
		return active;
	}
	
	// set timer and make active
	function setTimer(_goalCount) {
		toCount = _goalCount;
		active = true;
	}
	
	// advance timer and run callback once time is up
	function advance() {
		if !(toCount == -1) {
			// timer is assinged, advance timer
			if (counter < toCount) {
				counter++;
			} else {
				// reset counters and run callback
				counter = 0;
				toCount = -1;
				active = false;
				callback();
			}
		}
	}
}

/* **EXAMPLES**

// Define in create event:
myTimer = new customTimer(function() {
	doThing();
});

// Set timer in step event and advance:
if (conditionIsMet) {
	myTimer.setTimer(10);
}
...

myTimer.advance();

// You can also check if a timer is currently active before you use it:
if (!myTimer.isActive()) {
	myTimer.setTimer(10);
}

*/