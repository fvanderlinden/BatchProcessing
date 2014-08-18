within BatchProcessing.Examples;
model NoInterplolationIntegratorSampleFree
extends Modelica.Icons.Example;
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-32,-6},{-12,14}})));
  Noise.PRNG prng
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(integrator.u, prng.y) annotation (Line(
      points={{38,0},{21,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(
      StopTime=100,
      Tolerance=1e-008,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput(
      states=false,
      derivatives=false,
      inputs=false,
      outputs=false,
      auxiliaries=false,
      events=false));
end NoInterplolationIntegratorSampleFree;
