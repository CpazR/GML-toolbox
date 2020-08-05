function logger(_logFileName, _fileIsUnique) constructor {
	
	// assign a filename and create file
	fileName = (_fileIsUnique ? _logFileName + "_" + string_replace(string(date_current_datetime()) + "_", ".", "_") + string(current_second) : _logFileName) + ".txt";
	logFile = file_text_open_append(fileName);
	
	// sends texts to log file and prints to console if needed
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
		text = "INFO: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "error" level
	function error(_textToLog, _logToConsole) {
		text = "ERROR: \t" + string(_textToLog);
		log(text, _logToConsole);
	}
	
	// logs to "fatal" level
	function fatal(_textToLog, _logToConsole) {
		text = "INFO: \t" + string(_textToLog);
		log(text, _logToConsole);
	}

	// closes file, saving it to drive at given location
	function closeAndPublish() {
		file_text_close(logFile);
	}
	
	// close and reopen log file
	function publish() {
		file_text_close(logFile);
		logFile = logFile = file_text_open_append(fileName);
	}
}