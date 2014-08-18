within BatchProcessing.Utilities;
function readLogFile "Reads properties from the log file"

  input String logName="dslog.txt" "name of log file";
  input String markerString[:]={"Number of (successful) steps  : ","CPU-time for integration      : "}
    "logfile property vector";

  output Real markerValue[size(markerString,1)] "Value of the marker";

protected
  String[:] logFile "contents of logfile";
  String afterString "part after last dot";
  Boolean stringFound "true if no dot is found";

algorithm
  logFile := Streams.readFile(logName);

  for i in 1:size(logFile, 1) loop
    for j in 1:size(markerString, 1) loop
      if Strings.find(logFile[i], markerString[j]) > 0 then
        (afterString,stringFound) := BatchProcessing.Utilities.readFromString(
          logFile[i], markerString[j]);
        if stringFound then
          markerValue[j] := Modelica.Utilities.Strings.scanReal(afterString);
        end if;
      end if;
    end for;
  end for;
end readLogFile;
