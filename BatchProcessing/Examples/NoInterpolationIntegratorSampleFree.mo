within BatchProcessing.Examples;
model NoInterpolationIntegratorSampleFree
extends Modelica.Icons.Example;
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-32,-6},{-12,14}})));
  Noise.PRNG prng(redeclare replaceable function PDF = Noise.PDF.PDF_Uniform (
          interval={-1,1}*1e-3))
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(integrator.u, prng.y) annotation (Line(
      points={{38,0},{21,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end NoInterpolationIntegratorSampleFree;
