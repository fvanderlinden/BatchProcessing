%% set plot data
close all
xmf_init('height', 8, 'width', 8.5);
exportFigures = true;
exportdirectory = 'D:\Repositories\MathMod2015\draft\figures';
xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', .5);

set(0, 'DefaultAxesColorOrder',xlines(3), ...
      'DefaultAxesLineStyleOrder','-|--|:')
  set(0,'DefaultFigureColormap',pmkmp)
    set(0,'defaultlinelinewidth',1.5)



%% Load logfile data
NoInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_NoInterplolationIntegratorSampleFree.mat');
LinInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_LinInterplolationIntegratorSampleFree.mat');
SincInterpolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_SincInterpolationIntegratorSampleFree.mat');
NoInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_NoInterplolationIntegratorSampled.mat');
LinInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_LinInterplolationIntegratorSampled.mat');
SincInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_SincInterplolationIntegratorSampled.mat');


NoInterplolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_NoInterplolationCriticalDamping50SampleFree.mat');
LinInterplolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_LinInterplolationCriticalDamping50SampleFree.mat');
SincInterpolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_SincInterpolationCriticalDamping50SampleFree.mat');
NoInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_NoInterplolationCriticalDamping50Sampled.mat');
LinInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_LinInterplolationCriticalDamping50Sampled.mat');
SincInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_SincInterplolationCriticalDamping50Sampled.mat');


RadauNoInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationIntegratorSampleFree.mat');
RadauLinInterplolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_RadauLinInterplolationIntegratorSampleFree.mat');
RadauSincInterpolationIntegratorSampleFree=load('D:\Modelica\DymolaWork\Res_RadauSincInterpolationIntegratorSampleFree.mat');
RadauNoInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationIntegratorSampled.mat');
RadauLinInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_RadauLinInterplolationIntegratorSampled.mat');
RadauSincInterplolationIntegratorSampled=load('D:\Modelica\DymolaWork\Res_RadauSincInterplolationIntegratorSampled.mat');
% 
RadauNoInterplolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationCriticalDamping50SampleFree.mat');
RadauLinInterplolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_RadauLinInterplolationCriticalDamping50SampleFree.mat');
RadauSincInterpolationCriticalDamping50SampleFree=load('D:\Modelica\DymolaWork\Res_RadauSincInterpolationCriticalDamping50SampleFree.mat');
RadauNoInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_RadauNoInterplolationCriticalDamping50Sampled.mat');
RadauLinInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_RadauLinInterplolationCriticalDamping50Sampled.mat');
RadauSincInterplolationCriticalDamping50Sampled=load('D:\Modelica\DymolaWork\Res_RadauSincInterplolationCriticalDamping50Sampled.mat');

Res_TestSignalToNoise=load('D:\Modelica\DymolaWork\Res_TestSignalToNoise.mat');
Res_RadauTestSignalToNoise=load('D:\Modelica\DymolaWork\Res_RadauTestSignalToNoise.mat');
Res_TestSignalToNoiseSampled=load('D:\Modelica\DymolaWork\Res_TestSignalToNoiseSampled.mat');
Res_RadauTestSignalToNoiseSampled=load('D:\Modelica\DymolaWork\Res_RadauTestSignalToNoiseSampled.mat');

%% plot results
close all
xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 3.2, 'topmargin', .5);
if exportFigures
    xmf_figure(1)
%     xmf_subplot(17,1,1:12)
else
    figure(1)
end
loglog(NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    LinInterplolationIntegratorSampleFree.Tolerances,LinInterplolationIntegratorSampleFree.numberOfF_Evals,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.numberOfF_Evals,...
    LinInterplolationIntegratorSampled.Tolerances,LinInterplolationIntegratorSampled.numberOfF_Evals,...
    SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.numberOfF_Evals)

allon
xlabel 'Tolerance'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
% gridstyles

if exportFigures
xmf_export(fullfile(exportdirectory,'IntegratorDassl'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%
xmf_figure(2)

loglog(NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.CPUTime,...
    LinInterplolationIntegratorSampleFree.Tolerances,LinInterplolationIntegratorSampleFree.CPUTime,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.CPUTime,...
    NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.CPUTime,...
    LinInterplolationIntegratorSampled.Tolerances,LinInterplolationIntegratorSampled.CPUTime,...
    SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.CPUTime)

allon
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,5e2])
set(gca,'YTick',[1e-3,1e-1,1e1])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'TimeIntegratorDassl'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%% plot results CriticalDamping50
xmf_figure(11)

loglog(NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    LinInterplolationCriticalDamping50SampleFree.Tolerances,LinInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    LinInterplolationCriticalDamping50Sampled.Tolerances,LinInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.numberOfF_Evals)

allon
xlabel 'Tolerance'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'CritDampDassl'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%
xmf_figure(12)
loglog(NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.CPUTime,...
    LinInterplolationCriticalDamping50SampleFree.Tolerances,LinInterplolationCriticalDamping50SampleFree.CPUTime,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.CPUTime,...
    NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.CPUTime,...
    LinInterplolationCriticalDamping50Sampled.Tolerances,LinInterplolationCriticalDamping50Sampled.CPUTime,...
    SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.CPUTime)

allon
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'TimeCritDampDassl'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end

%% plot results Radau
xmf_figure(3)
loglog(RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    RadauLinInterplolationIntegratorSampleFree.Tolerances,RadauLinInterplolationIntegratorSampleFree.numberOfF_Evals,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.numberOfF_Evals,...
    RadauLinInterplolationIntegratorSampled.Tolerances,RadauLinInterplolationIntegratorSampled.numberOfF_Evals,...
    RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.numberOfF_Evals)


allon
xlabel 'Tolerance'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'IntegratorRadau'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%
xmf_figure(4)
loglog(RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.CPUTime,...
    RadauLinInterplolationIntegratorSampleFree.Tolerances,RadauLinInterplolationIntegratorSampleFree.CPUTime,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.CPUTime,...
    RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.CPUTime,...
    RadauLinInterplolationIntegratorSampled.Tolerances,RadauLinInterplolationIntegratorSampled.CPUTime,...
    RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.CPUTime)

allon
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'TimeIntegratorRadau'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end

%% plot results Radau CriticalDamping50
xmf_figure(13)
loglog(RadauNoInterplolationCriticalDamping50SampleFree.Tolerances,RadauNoInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauLinInterplolationCriticalDamping50SampleFree.Tolerances,RadauLinInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauNoInterplolationCriticalDamping50Sampled.Tolerances,RadauNoInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauLinInterplolationCriticalDamping50Sampled.Tolerances,RadauLinInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauSincInterplolationCriticalDamping50Sampled.Tolerances,RadauSincInterplolationCriticalDamping50Sampled.numberOfF_Evals)

allon
xlabel 'Tolerance'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'CritDampRadau'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%
xmf_figure(14)
loglog(RadauNoInterplolationCriticalDamping50SampleFree.Tolerances,RadauNoInterplolationCriticalDamping50SampleFree.CPUTime,...
    RadauLinInterplolationCriticalDamping50SampleFree.Tolerances,RadauLinInterplolationCriticalDamping50SampleFree.CPUTime,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.CPUTime,...
    RadauNoInterplolationCriticalDamping50Sampled.Tolerances,RadauNoInterplolationCriticalDamping50Sampled.CPUTime,...
    RadauLinInterplolationCriticalDamping50Sampled.Tolerances,RadauLinInterplolationCriticalDamping50Sampled.CPUTime,...
    RadauSincInterplolationCriticalDamping50Sampled.Tolerances,RadauSincInterplolationCriticalDamping50Sampled.CPUTime)

allon
legend('No interpolation','Linear interpolation','Sinc interpolation','location',[0.2,0.1,0.6,0.1])
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'TimeCritDampRadau'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end
%%

set(0, 'DefaultAxesColorOrder',xlines(2), ...
      'DefaultAxesLineStyleOrder','-|--|:')
  set(0,'DefaultFigureColormap',pmkmp)
    set(0,'defaultlinelinewidth',1.5)
    

xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 3.5, 'topmargin', .5);
xmf_figure(5)
loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.numberOfF_Evals,...
       Res_RadauTestSignalToNoise.Amplitudes,Res_RadauTestSignalToNoise.numberOfF_Evals,...
       Res_TestSignalToNoiseSampled.Amplitudes,Res_TestSignalToNoiseSampled.numberOfF_Evals,...
       Res_RadauTestSignalToNoiseSampled.Amplitudes,Res_RadauTestSignalToNoiseSampled.numberOfF_Evals)
xlabel 'Amplitude'
ylabel 'Function evaluations'
legend('DASSL', 'Radau', 'Sampled DASSL', 'Sampled Radau','location',[0.2,0.1,0.6,0.1])
allon

xlim([1e-8,1e-0])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-0])
ylim([2e4,2e7])
set(gca,'YTick',[1e5,1e6,1e7])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'SignalNoiseFeval'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end


xmf_figure(6)
loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.CPUTime,...
       Res_RadauTestSignalToNoise.Amplitudes,Res_RadauTestSignalToNoise.CPUTime,...
       Res_TestSignalToNoiseSampled.Amplitudes,Res_TestSignalToNoiseSampled.CPUTime,...
       Res_RadauTestSignalToNoiseSampled.Amplitudes,Res_RadauTestSignalToNoiseSampled.CPUTime)
xlabel 'Amplitude'
ylabel 'Simulation time / s'
legend('DASSL', 'Radau', 'Sampled DASSL', 'Sampled Radau','location',[0.2,0.1,0.6,0.1])
allon
xlim([1e-8,1e-0])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-0])
ylim([9e-1,1e3])
set(gca,'YTick',[1e-0,1e1,1e2,1e3])
% gridstyles
if exportFigures
xmf_export(fullfile(exportdirectory,'SignalNoiseTime'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end

%%
figure(12132)
 plot(rand(30,1),rand(30,1))
% gridstyles
% gridstyles(gca,'r','-')
