within BatchProcessing.Utilities;
function readFromString "reads string after specified string"
  input String  inputString="Number of (successful) steps  : 1024"
    "string input";
  input String markerString = "Number of (successful) steps  : "
    "read after String";
output String afterString "part after last dot";
output Boolean stringFound "true if no dot is found";

protected
  Integer markerIndex "index of first dot";
algorithm
  markerIndex := Strings.findLast(inputString, markerString);
  if markerIndex <> 0 then
   afterString := Strings.substring(
         inputString,
         markerIndex+Strings.length(markerString),
         Strings.length(inputString));
    stringFound := true;
  else
    afterString := inputString;
    stringFound  := false;
  end if;

  annotation (Documentation(info="<html>
<p>This fuction reads the string up to the first dot. Helpfull to obtain the package name of a model.</p>
</html>"));
end readFromString;
