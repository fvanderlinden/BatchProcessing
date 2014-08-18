within BatchProcessing.Utilities;
function batchSimulateWithLogReader

  input String modelName = "BatchProcessing.Examples.NoInterplolationIntegrator";
  input Real stopTime = 100 "Simulation stop time";
  input String method = "dassl";
  input String resultMatName="Results.mat" "Name of result file";
  input String[:] getSimulationProperties={"Number of (successful) steps","time for integration",
      "Number of F-evaluations       : "};
  input Real Tolerances[:]={1e-1,1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8};

  output Real[size(Tolerances,1)] CPUTime;
  output Real[size(Tolerances,1)] numberOfSteps;
  output Real[size(Tolerances,1)] numberOfF_Evals;

protected
  Boolean isSimulated;
  Real[size(getSimulationProperties,1),size(Tolerances,1)] logValues;
  Real temp[:];
algorithm

  for i in 1:size(Tolerances,1) loop
    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=3,
      outputInterval=0,
      method=method,
      tolerance=Tolerances[i],
      fixedstepsize=0,
      resultFile="model_" + String(i),
      initialNames={""},
      initialValues={5},
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
    {"Tolerances"},
    {Tolerances},
    true);
end batchSimulateWithLogReader;
