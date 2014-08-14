within BatchProcessing.Utilities;
function SImulateAndGetCPTTime

  input Integer interpolationModes=5;
  input String resultFileName="Results.txt" "Name of result file";
    input String resultMatName="Results.mat" "Name of result file";
  input Boolean overWriteScripts=true
    "Replaces existing models without propmpting"
    annotation (choices(checkBox=true));
  output Real[1,interpolationModes] CPUTime;
  output Integer[interpolationModes] trajSize;

protected
  Boolean isSimulated;
algorithm
  // OutputCPUtime:=true;

  for i in 1:interpolationModes loop
    (isSimulated,CPUTime[:, i]) := simulateExtendedModel(
      problem="BatchProcessing.Examples.PRNGNoise",
      startTime=0,
      stopTime=1,
      numberOfIntervals=0,
      outputInterval=0,
      method="dassl",
      tolerance=1e-4,
      fixedstepsize=0,
      resultFile="model_"+String(i),
      initialNames={"SincInterpolation_n"},
      initialValues={i},
      finalNames={"CPUtime"},
      autoLoad=false);
  end for;

  // Write results to file
  // check if file already exist. if not, exit
  if overWriteScripts == false then
    assert(not (Modelica.Utilities.Files.exist(resultFileName)), resultFileName + " already exist: exitting");
  else
    Modelica.Utilities.Files.remove(resultFileName);
  end if;

  Streams.print("CPUTime = ",  resultFileName);
  for i in 1:interpolationModes loop
  Streams.print(String(CPUTime[1,i]), resultFileName);

  end for;

  Streams.print("ModelSize = ",  resultFileName);
  for i in 1:interpolationModes loop
    trajSize[i] := readTrajectorySize("model_"+String(i)+".mat");
  Streams.print(String(readTrajectorySize("model_"+String(i)+".mat")), resultFileName);
  end for;

  DataFiles.writeMATmatrix(resultMatName,{"CPUTime"},{CPUTime});
  DataFiles.writeMATmatrix(resultMatName,{"trajSize"},{trajSize},true);
end SImulateAndGetCPTTime;
