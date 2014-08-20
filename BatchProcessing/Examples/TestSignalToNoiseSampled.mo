within BatchProcessing.Examples;
model TestSignalToNoiseSampled "Shows the use of the basic PRNG block"
import Noise;
 extends Modelica.Icons.Example;

Noise.PRNG prng(
  redeclare function PSD = Noise.PSD.PSD_IdealLowPass,
  redeclare function PDF = Noise.PDF.PDF_BoxMuller,
    useSampleBasedMethods=true)
  annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
Modelica.Mechanics.Translational.Components.Spring spring(
  s_rel0=0,
  c=2*Modelica.Constants.pi,
    s_rel(fixed=false, start=1))
  annotation (Placement(transformation(extent={{20,-10},{40,10}})));
Modelica.Mechanics.Translational.Components.Mass mass(m=1, s(start=1, fixed=
          true))
  annotation (Placement(transformation(extent={{50,-10},{70,10}})));
Modelica.Mechanics.Translational.Sources.Position position(exact=true)
  annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
Modelica.Blocks.Math.Gain gain(k=1)
  annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
equation

connect(spring.flange_b, mass.flange_a) annotation (Line(
    points={{40,0},{50,0}},
    color={0,127,0},
    smooth=Smooth.None));
connect(position.flange, spring.flange_a) annotation (Line(
    points={{10,0},{20,0}},
    color={0,127,0},
    smooth=Smooth.None));
connect(gain.y, position.s_ref) annotation (Line(
    points={{-19,0},{-12,0}},
    color={0,0,127},
    smooth=Smooth.None));
connect(gain.u, prng.y) annotation (Line(
    points={{-42,0},{-59,0}},
    color={0,0,127},
    smooth=Smooth.None));
annotation (experiment(
    StopTime=100,
    __Dymola_NumberOfIntervals=10,
    Tolerance=1e-008,
    __Dymola_fixedstepsize=0.001,
    __Dymola_Algorithm="Dassl"),
                        __Dymola_experimentSetupOutput,
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
          graphics),
  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",
        info="<html>
<p>This example demonstrates, how the PRNG block can be instantiated. You can use this example to test different settings in the PRNG block.</p>
</html>"));
end TestSignalToNoiseSampled;
