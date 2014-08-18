%% Load logfile data
NoInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_NoInterplolationIntegratorSampleFree.mat');
SincInterpolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_SincInterpolationIntegratorSampleFree.mat');
NoInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_NoInterplolationIntegratorSampled.mat');
SincInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_SincInterplolationIntegratorSampled.mat');


NoInterplolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_NoInterplolationCriticalDamping50SampleFree.mat');
SincInterpolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_SincInterpolationCriticalDamping50SampleFree.mat');
NoInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_NoInterplolationCriticalDamping50Sampled.mat');
SincInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_SincInterplolationCriticalDamping50Sampled.mat');


RadauNoInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationIntegratorSampleFree.mat');
RadauSincInterpolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_RadauSincInterpolationIntegratorSampleFree.mat');
RadauNoInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationIntegratorSampled.mat');
RadauSincInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_RadauSincInterplolationIntegratorSampled.mat');


Res_TestSignalToNoise=load('D:\Modelica\DymolaWork\Res_TestSignalToNoise.mat');

%% plot results
figure(1)
loglog(-NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    -SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    -NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.numberOfF_Evals,...
    -SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.numberOfF_Evals)

allon
title "Dassl"
legend('NoInterplolationIntegratorSampleFree','SincInterpolationIntegratorSampleFree','NoInterplolationIntegratorSampled','SincInterplolationIntegratorSampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Function evaluations'
%
figure(2)
loglog(-NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.CPUTime,...
    -SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.CPUTime,...
    -NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.CPUTime,...
    -SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.CPUTime)

allon
title "Dassl"
legend('NoInterplolationIntegratorSampleFree','SincInterpolationIntegratorSampleFree','NoInterplolationIntegratorSampled','SincInterplolationIntegratorSampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Simulation time / s'

%% plot results CriticalDamping50
figure(11)
loglog(-NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    -SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    -NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    -SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.numberOfF_Evals)

allon
title 'Dassl CriticalDamping 50'
legend('NoInterplolationCriticalDamping50SampleFree','SincInterpolationCriticalDamping50SampleFree','NoInterplolationCriticalDamping50Sampled','SincInterplolationCriticalDamping50Sampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Function evaluations'
%
figure(12)
loglog(-NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.CPUTime,...
    -SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.CPUTime,...
    -NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.CPUTime,...
    -SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.CPUTime)

allon
title 'Dassl  CriticalDamping 50'
legend('NoInterplolationCriticalDamping50SampleFree','SincInterpolationCriticalDamping50SampleFree','NoInterplolationCriticalDamping50Sampled','SincInterplolationCriticalDamping50Sampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Simulation time / s'

%% plot results Radau
figure(3)
loglog(-RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    -RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    -RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.numberOfF_Evals,...
    -RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.numberOfF_Evals)

allon
title "Radau"
legend('NoInterplolationIntegratorSampleFree','SincInterpolationIntegratorSampleFree','NoInterplolationIntegratorSampled','SincInterplolationIntegratorSampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Function evaluations'
%
figure(4)
loglog(-RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.CPUTime,...
    -RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.CPUTime,...
    -RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.CPUTime,...
    -RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.CPUTime)

allon
title "Radau"
legend('NoInterplolationIntegratorSampleFree','SincInterpolationIntegratorSampleFree','NoInterplolationIntegratorSampled','SincInterplolationIntegratorSampled','location','SouthEast')
xlabel 'Tolerance'
ylabel 'Simulation time / s'

%%
figure(5)
loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.numberOfF_Evals)
xlabel 'Amplitude'
ylabel 'Function evaluations'
allon

figure(6)
loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.CPUTime)
xlabel 'Amplitude'
ylabel 'Simulation time / s'
allon