function logger(_logFileName, _fileIsUnique) constructor {
	
	// @private; assign a filename and create file
	fileName = (_fileIsUnique ? _logFileName + "_" + string_replace(string(date_current_datetime()) + "_", ".", "_") + string(current_second) : _logFileName) + ".txt";
	
	// @private; log file index
	logFile = file_text_open_append(fileName);

	
	// @private; sends texts to log file and prints to console if needed
	function log(_textToLog, _logToConsole) {
		file_text_write_string(logFile, _textToLog + "\n");
		if _logToConsole {
			show_debug_message(_textToLog);
		}
	}
	
	// logs to "debug" level
	function debug(_textToLog, _logToConsole) {
		text = "DEBUG: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "info" level
	function info(_textToLog, _logToConsole) {
		text = "INFO: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "warn" level
	function warn(_textToLog, _logToConsole) {
		text = "WARN: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "error" level
	function error(_textToLog, _logToConsole) {
		text = "ERROR: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "fatal" level
	function fatal(_textToLog, _logToConsole) {
		text = "FATAL: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	
	// return name of log file
	function getFileName() {
		return fileName;
	}

	// closes file, saving it to drive at given location
	function closeAndPublish() {
		file_text_close(logFile);
	}
	
	// close and reopen log file
	function publish() {
		closeAndPublish();
		logFile = logFile = file_text_open_append(fileName);
	}
}

/* **EXAMPLE**

// Define logger in either object create event or struct constructor:
myLogger = new logger("mylog", false); // will save as "mylog.txt"
myLogger = new logger("mylog", true); // will save as "mylog_[TIMEDATE]_[INGAMEMILLISECOND].txt"

// Call logger whenever needed to append information to file and/or log to the console
if (conditionIsMet) {
	myLogger.info("Important information!");
	// will log "INFO:    Important information!"
}

...

try {
	// risky thing...
} catch(ex) {
	myLogger.fatal( string(ex) );
	// will log "FATAL:    [Runtime exception struct]"
	myLogger.closeAndPublish(); // <-- will get to this in a sec
}

// Whenever you want to be sure the log file is saved, publish to the file:
... other logging funny business
myLogger.publish();

// Whenever you're finished logging, you'll want to be sure all logging info is saved. So close and publish:
...
myLogger.closeAndPublish(); // will to file and close

*/