function customTimer(_callback) constructor {
	// a function to run when timer is activated
	callback = _callback;
	
	// main counter for time
	counter = 0;
	
	// goal for counter
	toCount = -1;
	
	// a quick way to check if timer is active
	isActive = false;
	
	function setTimer(_goalCount) {
		toCount = _goalCount;
		isActive = true;
	}
	
	// assign and or advance timer
	function advance() {
		if !(toCount == -1) {
			// timer is assinged, advance timer
			if (counter < toCount) {
				counter++;
			} else {
				// reset counters and run callback
				counter = 0;
				toCount = -1;
				isActive = false;
				callback();
			}
		}
	}
}

/* **EXAMPLE**

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

*/