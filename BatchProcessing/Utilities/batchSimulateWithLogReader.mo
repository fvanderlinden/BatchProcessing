within BatchProcessing.Utilities;
function batchSimulateWithLogReader

  input String modelName = "BatchProcessing.Examples.NoInterplolationIntegratorSampleFree";
  input Real stopTime = 100 "Simulation stop time";
  input String method = "dassl";
  input String resultMatName="Results.mat" "Name of result file";
  input String[:] getSimulationProperties={"Number of (successful) steps","time for integration",
      "Number of F-evaluations       : "};
  input Real Tolerances[:]={1e-1,1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8};
  input Real ReferenceTolerance=1e-9
    "Tolerance to be used for reference solution";
  input String ReferenceState="integrator.y" "The state to be compared";
  input Integer ReferenceSamples=1000
    "Number of reference samples to compare simulations";

  output Real[size(Tolerances,1)] CPUTime;
  output Real[size(Tolerances,1)] numberOfSteps;
  output Real[size(Tolerances,1)] numberOfF_Evals;
  output Real[size(Tolerances,1)] absoluteMeanError;

protected
  Boolean isSimulated;
  Real[size(getSimulationProperties,1),size(Tolerances,1)] logValues;
  Real temp[:];
  Real ReferenceTrajectory[1,ReferenceSamples+2];
  Real ComparisonTrajectory[1,ReferenceSamples+2];

algorithm
    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=ReferenceSamples,
      outputInterval=0,
      method=method,
      tolerance=ReferenceTolerance,
      fixedstepsize=0,
      resultFile="model_ref",
      initialNames=fill("",0),
      initialValues=fill(0.0,0),
      finalNames={"prng.y"},
      autoLoad=false);
    ReferenceTrajectory :=readTrajectory(
    "model_ref.mat",
    {ReferenceState},
    ReferenceSamples + 2);

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
      initialNames=fill("",0),
      initialValues=fill(0.0,0),
      finalNames={"prng.y"},
      autoLoad=false);

    logValues[:, i] := BatchProcessing.Utilities.readLogFile("dslog.txt",
      getSimulationProperties);
    numberOfSteps[i] := logValues[1, i];
    CPUTime[i] := logValues[2, i];
    numberOfF_Evals[i] := logValues[3, i];

    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=ReferenceSamples,
      outputInterval=0,
      method=method,
      tolerance=Tolerances[i],
      fixedstepsize=0,
      resultFile="model_" + String(i),
      initialNames=fill("",0),
      initialValues=fill(0.0,0),
      finalNames={"prng.y"},
      autoLoad=false);

    ComparisonTrajectory :=readTrajectory(
    "model_" + String(i) + ".mat",
    {ReferenceState},
    ReferenceSamples + 2);

    //absoluteMeanError[i] := sqrt(sum((ComparisonTrajectory - ReferenceTrajectory))^2/(ReferenceSamples + 2)); RMS
    absoluteMeanError[i] := (sum(abs(ComparisonTrajectory - ReferenceTrajectory))/(ReferenceSamples + 2)); //H1 Norm

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
  DataFiles.writeMATmatrix(
    resultMatName,
    {"absoluteMeanError"},
    {absoluteMeanError},
    true);
end batchSimulateWithLogReader;
