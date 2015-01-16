within BatchProcessing.Batches;
function GearPaper

    input String modelName = "Gears.Tests.GearTestrig.TestRigNiemann";

  input Real revolutions = 9.1 "revolutions of test rig";
  input String method = "dassl";
  input String resultMatName="GearBatchResults" "Name of result file";

  input Real Loads[:]=-25:0.2:25;
  input Real Speed = Modelica.SIunits.Conversions.from_rpm(10);

protected
  Boolean isSimulated;
  Real stopTime = abs(revolutions*60/Modelica.SIunits.Conversions.to_rpm(Speed))
    "Simulation stop time";
  Real temp[:];

algorithm
    for i in 1:size(Loads,1) loop
    (isSimulated,temp) := simulateExtendedModel(
      problem=modelName,
      startTime=0,
      stopTime=stopTime,
      numberOfIntervals=integer(stopTime*8000),
      outputInterval=0,
      method=method,
      tolerance=1e-9,
      fixedstepsize=0,
      resultFile=resultMatName + "_" + String(1000+i),
      initialNames={"TorqueLoad","SpeedLoad"},
      initialValues={Loads[i],-Speed},
      finalNames={"TorqueLoad"},
      autoLoad=false);
    end for;

end GearPaper;
