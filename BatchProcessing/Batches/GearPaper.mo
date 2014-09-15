within BatchProcessing.Batches;
function GearPaper

    input String modelName = "Gears.Tests.GearTestrig.TestRig";
  input Real stopTime = 60 "Simulation stop time";
  input String method = "dassl";
  input String resultMatName="GearBatchResults" "Name of result file";

  input Real Loads[:]=-10:10;
  input Real Speed = 3;

protected
    Boolean isSimulated;
    Integer test = 60;
  Real temp[:];

algorithm
    for i in 1:size(Loads,1) loop
    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=test*6000,
      outputInterval=0,
      method=method,
      tolerance=1e-4,
      fixedstepsize=0,
      resultFile=resultMatName + "_" + String(i),
      initialNames={"TorqueLoad","SpeedLoad"},
      initialValues={Loads[i],Speed},
      finalNames={"TorqueLoad"},
      autoLoad=false);
    end for;

end GearPaper;
