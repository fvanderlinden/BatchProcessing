within BatchProcessing.Examples;
model NoInterpolationCriticalDamping50SampleFree
extends Modelica.Icons.Example;
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-32,-6},{-12,14}})));
  Noise.PRNG prng
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10,
    n=50,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(criticalDamping.u, prng.y) annotation (Line(
      points={{38,0},{21,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end NoInterpolationCriticalDamping50SampleFree;
