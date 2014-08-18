within BatchProcessing.Utilities;
function batchSimulateWithLogReaderNoiseAmplitudeChange

  input String modelName = "BatchProcessing.Examples.TestSignalToNoise";
  input Real stopTime = 100 "Simulation stop time";
  input String method = "dassl";
  input String resultMatName="Results.mat" "Name of result file";
  input String[:] getSimulationProperties={"Number of (successful) steps","time for integration",
      "Number of F-evaluations       : "};
  input Real Amplitudes[:]={1e-4,1e-3,1e-2,1e-1,1e-0};

  output Real[size(Amplitudes,1)] CPUTime;
  output Real[size(Amplitudes,1)] numberOfSteps;
  output Real[size(Amplitudes,1)] numberOfF_Evals;

protected
  Boolean isSimulated;
  Real[size(getSimulationProperties,1),size(Amplitudes,1)] logValues;
  Real temp[:];
algorithm

  for i in 1:size(Amplitudes,1) loop
    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=3,
      outputInterval=0,
      method=method,
      tolerance=1e-4,
      fixedstepsize=0,
      resultFile="model_" + String(i),
      initialNames={"gain.k"},
      initialValues={Amplitudes[i]},
      finalNames={"prng.y"},
      autoLoad=false);

    logValues[:, i] := BatchProcessing.Utilities.readLogFile("dslog.txt",
      getSimulationProperties);
    numberOfSteps[i] := logValues[1, i];
    CPUTime[i] := logValues[2, i];
    numberOfF_Evals[i] := logValues[3, i];
  end for;

  DataFiles.writeMATmatrix(
    resultMatName,
    {"CPUTime"},
    {CPUTime});
  DataFiles.writeMATmatrix(
    resultMatName,
    {"numberOfSteps"},
    {numberOfSteps},
    true);
  DataFiles.writeMATmatrix(
    resultMatName,
    {"logValues"},
    {logValues},
    true);
  DataFiles.writeMATmatrix(
    resultMatName,
    {"numberOfF_Evals"},
    {numberOfF_Evals},
    true);
  DataFiles.writeMATmatrix(
    resultMatName,
    {"Amplitudes"},
    {Amplitudes},
    true);
end batchSimulateWithLogReaderNoiseAmplitudeChange;
