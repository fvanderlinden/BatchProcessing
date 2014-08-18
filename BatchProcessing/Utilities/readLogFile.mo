within BatchProcessing.Utilities;
function readLogFile "Reads properties from the log file"

  input String logName="dslog.txt" "name of log file";
  input String markerString[:]={"Number of (successful) steps","time for integration"}
    "logfile property vector";

  output Real markerValue[size(markerString,1)] "Value of the marker";

protected
  String[:] logFile "contents of logfile";
  String afterString "part after last dot";
  Boolean stringFound "true if no dot is found";

algorithm
  // Read Logfile
  logFile := Streams.readFile(logName);

  // loop over the strings of the logfile
  for i in 1:size(logFile, 1) loop
    // loop over the different marker strings
    for j in 1:size(markerString, 1) loop
      // compare marker with string from logfile
      if Strings.find(logFile[i], markerString[j]) > 0 then
        (afterString,stringFound) := BatchProcessing.Utilities.readFromString(
          logFile[i], markerString[j]);
        if stringFound then // if markerstring is found, write results to matrix.
          (afterString,stringFound):= BatchProcessing.Utilities.readAfterColon(afterString);
          markerValue[j] := Modelica.Utilities.Strings.scanReal(afterString);
        end if;
      end if;
    end for;
  end for;
end readLogFile;
