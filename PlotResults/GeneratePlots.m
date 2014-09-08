%% set plot data
close all; clear all % clears memory
DataDir = fullfile(pwd,'Data'); % data dir of simulation results generated using the Modelica library
useInternalDLRToolboxes = true; % set to false if internal DLR toolboxes are not available. This only effects grahical effects.
exportFigures = true; % set to false if no figure export is wanted or no DLR internal toolboxes are available
exportdirectory = fullfile(pwd,'Figures'); % Set output directory where figures are saved
smallNumber = 1e-10; % Offset to avoid zeros in loglog plots

%% Load logfile data
NoInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_NoInterpolationIntegratorSampleFree.mat'));
LinInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_LinInterpolationIntegratorSampleFree.mat'));
SincInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_SincInterpolationIntegratorSampleFree.mat'));
NoInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_NoInterpolationIntegratorSampled.mat'));
LinInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_LinInterpolationIntegratorSampled.mat'));
SincInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_SincInterpolationIntegratorSampled.mat'));


NoInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_NoInterpolationCriticalDamping50SampleFree.mat'));
LinInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_LinInterpolationCriticalDamping50SampleFree.mat'));
SincInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_SincInterpolationCriticalDamping50SampleFree.mat'));
NoInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_NoInterpolationCriticalDamping50Sampled.mat'));
LinInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_LinInterpolationCriticalDamping50Sampled.mat'));
SincInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_SincInterpolationCriticalDamping50Sampled.mat'));


RadauNoInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauNoInterpolationIntegratorSampleFree.mat'));
RadauLinInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauLinInterpolationIntegratorSampleFree.mat'));
RadauSincInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauSincInterpolationIntegratorSampleFree.mat'));
RadauNoInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauNoInterpolationIntegratorSampled.mat'));
RadauLinInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauLinInterpolationIntegratorSampled.mat'));
RadauSincInterpolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauSincInterpolationIntegratorSampled.mat'));
% 
RadauNoInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauNoInterpolationCriticalDamping50SampleFree.mat'));
RadauLinInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauLinInterpolationCriticalDamping50SampleFree.mat'));
RadauSincInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauSincInterpolationCriticalDamping50SampleFree.mat'));
RadauNoInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauNoInterpolationCriticalDamping50Sampled.mat'));
RadauLinInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauLinInterpolationCriticalDamping50Sampled.mat'));
RadauSincInterpolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauSincInterpolationCriticalDamping50Sampled.mat'));

Res_TestSignalToNoise=load(fullfile(DataDir,'Res_TestSignalToNoise.mat'));
Res_RadauTestSignalToNoise=load(fullfile(DataDir,'Res_RadauTestSignalToNoise.mat'));
Res_TestSignalToNoiseSampled=load(fullfile(DataDir,'Res_TestSignalToNoiseSampled.mat'));
Res_RadauTestSignalToNoiseSampled=load(fullfile(DataDir,'Res_RadauTestSignalToNoiseSampled.mat'));

%% plot Integrator Dassl

% Set default colorstyles and lines
if useInternalDLRToolboxes
    set(0, 'DefaultAxesColorOrder',xlines(3), ...
        'DefaultAxesLineStyleOrder','-|--|:')
    set(0,'DefaultFigureColormap',pmkmp)
    set(0,'defaultlinelinewidth',1.5)
else
    lineColors = [...
        0    0.3746    0.5882
        0.0670    0.6501    0.4861
        0.8981    0.8534    0.2460];
    set(0, 'DefaultAxesColorOrder',lineColors, ...
        'DefaultAxesLineStyleOrder','-|--|:')
    set(0,'defaultlinelinewidth',1.5)
end

if exportFigures && useInternalDLRToolboxes
    xmf_init('height', 21, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', 0.8, 'vspace',1.5);
    xmf_figure(1)
    xmf_subplot(4,1,1)
else
    figure(1)
    subplot(411)
end

loglog(NoInterpolationIntegratorSampleFree.Tolerances,NoInterpolationIntegratorSampleFree.numberOfF_Evals,...
    LinInterpolationIntegratorSampleFree.Tolerances,LinInterpolationIntegratorSampleFree.numberOfF_Evals,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    NoInterpolationIntegratorSampled.Tolerances,NoInterpolationIntegratorSampled.numberOfF_Evals,...
    LinInterpolationIntegratorSampled.Tolerances,LinInterpolationIntegratorSampled.numberOfF_Evals,...
    SincInterpolationIntegratorSampled.Tolerances,SincInterpolationIntegratorSampled.numberOfF_Evals)

grid on
title 'DASSL'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location','SouthEast')

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,2)
else
    subplot(412)
end
loglog(NoInterpolationIntegratorSampleFree.Tolerances,NoInterpolationIntegratorSampleFree.CPUTime,...
    LinInterpolationIntegratorSampleFree.Tolerances,LinInterpolationIntegratorSampleFree.CPUTime,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.CPUTime,...
    NoInterpolationIntegratorSampled.Tolerances,NoInterpolationIntegratorSampled.CPUTime,...
    LinInterpolationIntegratorSampled.Tolerances,LinInterpolationIntegratorSampled.CPUTime,...
    SincInterpolationIntegratorSampled.Tolerances,SincInterpolationIntegratorSampled.CPUTime)

grid on

ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,5e2])
set(gca,'YTick',[1e-3,1e-1,1e1])



%%
% plot integrator Radau
if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,3)
else
    subplot(413)
end

loglog(RadauNoInterpolationIntegratorSampleFree.Tolerances,RadauNoInterpolationIntegratorSampleFree.numberOfF_Evals,...
    RadauLinInterpolationIntegratorSampleFree.Tolerances,RadauLinInterpolationIntegratorSampleFree.numberOfF_Evals,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    RadauNoInterpolationIntegratorSampled.Tolerances,RadauNoInterpolationIntegratorSampled.numberOfF_Evals,...
    RadauLinInterpolationIntegratorSampled.Tolerances,RadauLinInterpolationIntegratorSampled.numberOfF_Evals,...
    RadauSincInterpolationIntegratorSampled.Tolerances,RadauSincInterpolationIntegratorSampled.numberOfF_Evals)


grid on
title 'Radau IIA'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,4)
else
    subplot(414)
end
loglog(RadauNoInterpolationIntegratorSampleFree.Tolerances,RadauNoInterpolationIntegratorSampleFree.CPUTime,...
    RadauLinInterpolationIntegratorSampleFree.Tolerances,RadauLinInterpolationIntegratorSampleFree.CPUTime,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.CPUTime,...
    RadauNoInterpolationIntegratorSampled.Tolerances,RadauNoInterpolationIntegratorSampled.CPUTime,...
    RadauLinInterpolationIntegratorSampled.Tolerances,RadauLinInterpolationIntegratorSampled.CPUTime,...
    RadauSincInterpolationIntegratorSampled.Tolerances,RadauSincInterpolationIntegratorSampled.CPUTime)

grid on
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
if exportFigures
xmf_export(fullfile(exportdirectory,'SmallSystem'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end

%% plot results CriticalDamping50

if exportFigures && useInternalDLRToolboxes
    xmf_init('height', 21, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', 0.8, 'vspace',1.5);
    xmf_figure(2)
    xmf_subplot(4,1,1)
else
    figure(2)
    subplot(411)
end

loglog(NoInterpolationCriticalDamping50SampleFree.Tolerances,NoInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    LinInterpolationCriticalDamping50SampleFree.Tolerances,LinInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    NoInterpolationCriticalDamping50Sampled.Tolerances,NoInterpolationCriticalDamping50Sampled.numberOfF_Evals,...
    LinInterpolationCriticalDamping50Sampled.Tolerances,LinInterpolationCriticalDamping50Sampled.numberOfF_Evals,...
    SincInterpolationCriticalDamping50Sampled.Tolerances,SincInterpolationCriticalDamping50Sampled.numberOfF_Evals)

grid on
title 'DASSL'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location','SouthEast')

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,2)
else
    subplot(412)
end

loglog(NoInterpolationCriticalDamping50SampleFree.Tolerances,NoInterpolationCriticalDamping50SampleFree.CPUTime,...
    LinInterpolationCriticalDamping50SampleFree.Tolerances,LinInterpolationCriticalDamping50SampleFree.CPUTime,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.CPUTime,...
    NoInterpolationCriticalDamping50Sampled.Tolerances,NoInterpolationCriticalDamping50Sampled.CPUTime,...
    LinInterpolationCriticalDamping50Sampled.Tolerances,LinInterpolationCriticalDamping50Sampled.CPUTime,...
    SincInterpolationCriticalDamping50Sampled.Tolerances,SincInterpolationCriticalDamping50Sampled.CPUTime)

grid on

ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])

% plot results Radau CriticalDamping50

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,3)
else
    subplot(413)
end
loglog(RadauNoInterpolationCriticalDamping50SampleFree.Tolerances,RadauNoInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauLinInterpolationCriticalDamping50SampleFree.Tolerances,RadauLinInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauNoInterpolationCriticalDamping50Sampled.Tolerances,RadauNoInterpolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauLinInterpolationCriticalDamping50Sampled.Tolerances,RadauLinInterpolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauSincInterpolationCriticalDamping50Sampled.Tolerances,RadauSincInterpolationCriticalDamping50Sampled.numberOfF_Evals)

grid on
title 'Radau IIA'
ylabel 'Function evaluations'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
ylim([1e1,1e8])
set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,4)
else
    subplot(414)
end

loglog(RadauNoInterpolationCriticalDamping50SampleFree.Tolerances,RadauNoInterpolationCriticalDamping50SampleFree.CPUTime,...
    RadauLinInterpolationCriticalDamping50SampleFree.Tolerances,RadauLinInterpolationCriticalDamping50SampleFree.CPUTime,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.CPUTime,...
    RadauNoInterpolationCriticalDamping50Sampled.Tolerances,RadauNoInterpolationCriticalDamping50Sampled.CPUTime,...
    RadauLinInterpolationCriticalDamping50Sampled.Tolerances,RadauLinInterpolationCriticalDamping50Sampled.CPUTime,...
    RadauSincInterpolationCriticalDamping50Sampled.Tolerances,RadauSincInterpolationCriticalDamping50Sampled.CPUTime)

grid on
xlabel 'Tolerance'
ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,1e3])
set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
if exportFigures
xmf_export(fullfile(exportdirectory,'BigSystem'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end









%% Plot ERRORS!
% Integrator DASSL
if exportFigures && useInternalDLRToolboxes
    xmf_init('height', 21, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', 0.8, 'vspace',1.5);
    xmf_figure(5)
    xmf_subplot(4,1,1)
else
    figure(5)
    subplot(411)
end

loglog(NoInterpolationIntegratorSampleFree.Tolerances,NoInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    LinInterpolationIntegratorSampleFree.Tolerances,LinInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    NoInterpolationIntegratorSampled.Tolerances,NoInterpolationIntegratorSampled.absoluteMeanError+smallNumber,...
    LinInterpolationIntegratorSampled.Tolerances,LinInterpolationIntegratorSampled.absoluteMeanError+smallNumber,...
    SincInterpolationIntegratorSampled.Tolerances,SincInterpolationIntegratorSampled.absoluteMeanError+smallNumber)

grid on
title DASSL
ylabel 'Mean abs Error (integrator)'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
% ylim([1e1,1e8])
% set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location','SouthWest')


% CriticalDamping DASSL
if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,2)
else
    subplot(412)
end
loglog(NoInterpolationCriticalDamping50SampleFree.Tolerances,NoInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    LinInterpolationCriticalDamping50SampleFree.Tolerances,LinInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    NoInterpolationCriticalDamping50Sampled.Tolerances,NoInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    LinInterpolationCriticalDamping50Sampled.Tolerances,LinInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    SincInterpolationCriticalDamping50Sampled.Tolerances,SincInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber)

grid on

ylabel 'Mean abs Error (damping)'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
% ylim([1e-3,5e2])
% set(gca,'YTick',[1e-3,1e-1,1e1])

% plot integrator Radau
if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,3)
else
    subplot(413)
end

loglog(RadauNoInterpolationIntegratorSampleFree.Tolerances,RadauNoInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauLinInterpolationIntegratorSampleFree.Tolerances,RadauLinInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauNoInterpolationIntegratorSampled.Tolerances,RadauNoInterpolationIntegratorSampled.absoluteMeanError+smallNumber,...
    RadauLinInterpolationIntegratorSampled.Tolerances,RadauLinInterpolationIntegratorSampled.absoluteMeanError+smallNumber,...
    RadauSincInterpolationIntegratorSampled.Tolerances,RadauSincInterpolationIntegratorSampled.absoluteMeanError+smallNumber)


grid on
title 'Radau IIA'

ylabel 'Mean abs Error (integrator)'
xlim([1e-8,1e-1])
set(gca,'XDir','reverse')
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
% ylim([1e1,1e8])
% set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])

if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,4)
else
    subplot(414)
end
loglog(RadauNoInterpolationCriticalDamping50SampleFree.Tolerances,RadauNoInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauLinInterpolationCriticalDamping50SampleFree.Tolerances,RadauLinInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauNoInterpolationCriticalDamping50Sampled.Tolerances,RadauNoInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    RadauLinInterpolationCriticalDamping50Sampled.Tolerances,RadauLinInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    RadauSincInterpolationCriticalDamping50Sampled.Tolerances,RadauSincInterpolationCriticalDamping50Sampled.absoluteMeanError+smallNumber)

grid on
xlabel 'Tolerance'
ylabel 'Mean abs Error (damping)'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
% ylim([1e-3,1e3])
% set(gca,'YTick',[1e-3,1e-1,1e1,1e3])
if exportFigures
xmf_export(fullfile(exportdirectory,'ErrorComparison'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end















%% Plot Signal to noise ratios

if exportFigures && useInternalDLRToolboxes
    xmf_init('height', 5.2, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', .5);
    xmf_figure(6)
else
    figure(6)
end

if useInternalDLRToolboxes
set(0, 'DefaultAxesColorOrder',xlines(2), ...
    'DefaultAxesLineStyleOrder','-|--|:')
set(0,'DefaultFigureColormap',pmkmp)
set(0,'defaultlinelinewidth',1.5)
else
    lineColors = [...
           0    0.3746    0.5882
    0.0670    0.6501    0.4861];
    set(0, 'DefaultAxesColorOrder',lineColors, ...
        'DefaultAxesLineStyleOrder','-|--|:')
    set(0,'defaultlinelinewidth',1.5)
end

loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.numberOfF_Evals,...
       Res_RadauTestSignalToNoise.Amplitudes,Res_RadauTestSignalToNoise.numberOfF_Evals,...
       Res_TestSignalToNoiseSampled.Amplitudes,Res_TestSignalToNoiseSampled.numberOfF_Evals,...
       Res_RadauTestSignalToNoiseSampled.Amplitudes,Res_RadauTestSignalToNoiseSampled.numberOfF_Evals)
   
xlabel 'Amplitude'
ylabel 'Function evaluations'
legend('DASSL', 'Radau', 'location','West')
grid on

xlim([1e-8,1e-0])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-0])
ylim([2e4,2e7])
set(gca,'YTick',[1e5,1e6,1e7])

if exportFigures && useInternalDLRToolboxes
xmf_export(fullfile(exportdirectory,'SignalNoiseFeval'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end


if exportFigures && useInternalDLRToolboxes
    xmf_init('height', 5.2, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', .5);
    xmf_figure(7)
else
    figure(7)
end

loglog(Res_TestSignalToNoise.Amplitudes,Res_TestSignalToNoise.CPUTime,...
       Res_RadauTestSignalToNoise.Amplitudes,Res_RadauTestSignalToNoise.CPUTime,...
       Res_TestSignalToNoiseSampled.Amplitudes,Res_TestSignalToNoiseSampled.CPUTime,...
       Res_RadauTestSignalToNoiseSampled.Amplitudes,Res_RadauTestSignalToNoiseSampled.CPUTime)
xlabel 'Amplitude'
ylabel 'Simulation time / s'
legend('DASSL', 'Radau', 'location','West')
grid on
xlim([1e-8,1e-0])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-0])
ylim([9e-1,1e3])
set(gca,'YTick',[1e-0,1e1,1e2,1e3])
if exportFigures && useInternalDLRToolboxes
xmf_export(fullfile(exportdirectory,'SignalNoiseTime'),'source',gcf,'output','eps_tex','compiler','pdflatex');
end


