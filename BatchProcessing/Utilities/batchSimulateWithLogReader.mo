within BatchProcessing.Utilities;
function batchSimulateWithLogReader

  input Integer interpolationModes=5;
  input String resultMatName="Results.mat" "Name of result file";
  input String[:] getSimulationProperties = {"Number of (successful) steps  : ",
      "CPU-time for integration      : "};

  output Real[interpolationModes] CPUTime;
  output Real[interpolationModes] numberOfSteps;

protected
  Boolean isSimulated;
  Real[2,interpolationModes] logValues;
algorithm

  for i in 1:interpolationModes loop
    (isSimulated) := simulateExtendedModel(
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
      finalNames={""},
      autoLoad=false);

      logValues[:,i] :=BatchProcessing.Utilities.readLogFile("dslog.txt", getSimulationProperties);
      numberOfSteps[i] :=logValues[1, i];
      CPUTime[i] :=logValues[2, i];
  end for;

  DataFiles.writeMATmatrix(resultMatName,{"CPUTime"},{CPUTime});
  DataFiles.writeMATmatrix(resultMatName,{"numberOfSteps"},{numberOfSteps},true);
  DataFiles.writeMATmatrix(resultMatName,{"logValues"},{logValues},true);
end batchSimulateWithLogReader;
