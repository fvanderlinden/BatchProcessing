%% set plot data
close all % clears memory
DataDir = fullfile(pwd,'Data'); % data dir of simulation results generated using the Modelica library
useInternalDLRToolboxes = true; % set to false if internal DLR toolboxes are not available. This only effects grahical effects.
exportFigures = true; % set to false if no figure export is wanted or no DLR internal toolboxes are available
exportdirectory = fullfile(pwd,'Figures'); % Set output directory where figures are saved
smallNumber = 1e-10; % Offset to avoid zeros in loglog plots

%% Load logfile data
NoInterplolationIntegratorSampleFree=load(fullfile(DataDir,'Res_NoInterplolationIntegratorSampleFree.mat'));
LinInterplolationIntegratorSampleFree=load(fullfile(DataDir,'Res_LinInterplolationIntegratorSampleFree.mat'));
SincInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_SincInterpolationIntegratorSampleFree.mat'));
NoInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_NoInterplolationIntegratorSampled.mat'));
LinInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_LinInterplolationIntegratorSampled.mat'));
SincInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_SincInterplolationIntegratorSampled.mat'));


NoInterplolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_NoInterplolationCriticalDamping50SampleFree.mat'));
LinInterplolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_LinInterplolationCriticalDamping50SampleFree.mat'));
SincInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_SincInterpolationCriticalDamping50SampleFree.mat'));
NoInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_NoInterplolationCriticalDamping50Sampled.mat'));
LinInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_LinInterplolationCriticalDamping50Sampled.mat'));
SincInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_SincInterplolationCriticalDamping50Sampled.mat'));


RadauNoInterplolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauNoInterplolationIntegratorSampleFree.mat'));
RadauLinInterplolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauLinInterplolationIntegratorSampleFree.mat'));
RadauSincInterpolationIntegratorSampleFree=load(fullfile(DataDir,'Res_RadauSincInterpolationIntegratorSampleFree.mat'));
RadauNoInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauNoInterplolationIntegratorSampled.mat'));
RadauLinInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauLinInterplolationIntegratorSampled.mat'));
RadauSincInterplolationIntegratorSampled=load(fullfile(DataDir,'Res_RadauSincInterplolationIntegratorSampled.mat'));
% 
RadauNoInterplolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauNoInterplolationCriticalDamping50SampleFree.mat'));
RadauLinInterplolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauLinInterplolationCriticalDamping50SampleFree.mat'));
RadauSincInterpolationCriticalDamping50SampleFree=load(fullfile(DataDir,'Res_RadauSincInterpolationCriticalDamping50SampleFree.mat'));
RadauNoInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauNoInterplolationCriticalDamping50Sampled.mat'));
RadauLinInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauLinInterplolationCriticalDamping50Sampled.mat'));
RadauSincInterplolationCriticalDamping50Sampled=load(fullfile(DataDir,'Res_RadauSincInterplolationCriticalDamping50Sampled.mat'));

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

loglog(NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    LinInterplolationIntegratorSampleFree.Tolerances,LinInterplolationIntegratorSampleFree.numberOfF_Evals,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.numberOfF_Evals,...
    LinInterplolationIntegratorSampled.Tolerances,LinInterplolationIntegratorSampled.numberOfF_Evals,...
    SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.numberOfF_Evals)

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
loglog(NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.CPUTime,...
    LinInterplolationIntegratorSampleFree.Tolerances,LinInterplolationIntegratorSampleFree.CPUTime,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.CPUTime,...
    NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.CPUTime,...
    LinInterplolationIntegratorSampled.Tolerances,LinInterplolationIntegratorSampled.CPUTime,...
    SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.CPUTime)

grid on

ylabel 'Simulation time / s'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
ylim([1e-3,5e2])
set(gca,'YTick',[1e-3,1e-1,1e1])

% plot integrator Radau
if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,3)
else
    subplot(413)
end

loglog(RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.numberOfF_Evals,...
    RadauLinInterplolationIntegratorSampleFree.Tolerances,RadauLinInterplolationIntegratorSampleFree.numberOfF_Evals,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.numberOfF_Evals,...
    RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.numberOfF_Evals,...
    RadauLinInterplolationIntegratorSampled.Tolerances,RadauLinInterplolationIntegratorSampled.numberOfF_Evals,...
    RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.numberOfF_Evals)


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
loglog(RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.CPUTime,...
    RadauLinInterplolationIntegratorSampleFree.Tolerances,RadauLinInterplolationIntegratorSampleFree.CPUTime,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.CPUTime,...
    RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.CPUTime,...
    RadauLinInterplolationIntegratorSampled.Tolerances,RadauLinInterplolationIntegratorSampled.CPUTime,...
    RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.CPUTime)

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

loglog(NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    LinInterplolationCriticalDamping50SampleFree.Tolerances,LinInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    LinInterplolationCriticalDamping50Sampled.Tolerances,LinInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.numberOfF_Evals)

grid on
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

loglog(NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.CPUTime,...
    LinInterplolationCriticalDamping50SampleFree.Tolerances,LinInterplolationCriticalDamping50SampleFree.CPUTime,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.CPUTime,...
    NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.CPUTime,...
    LinInterplolationCriticalDamping50Sampled.Tolerances,LinInterplolationCriticalDamping50Sampled.CPUTime,...
    SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.CPUTime)

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
loglog(RadauNoInterplolationCriticalDamping50SampleFree.Tolerances,RadauNoInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauLinInterplolationCriticalDamping50SampleFree.Tolerances,RadauLinInterplolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.numberOfF_Evals,...
    RadauNoInterplolationCriticalDamping50Sampled.Tolerances,RadauNoInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauLinInterplolationCriticalDamping50Sampled.Tolerances,RadauLinInterplolationCriticalDamping50Sampled.numberOfF_Evals,...
    RadauSincInterplolationCriticalDamping50Sampled.Tolerances,RadauSincInterplolationCriticalDamping50Sampled.numberOfF_Evals)

grid on
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

loglog(RadauNoInterplolationCriticalDamping50SampleFree.Tolerances,RadauNoInterplolationCriticalDamping50SampleFree.CPUTime,...
    RadauLinInterplolationCriticalDamping50SampleFree.Tolerances,RadauLinInterplolationCriticalDamping50SampleFree.CPUTime,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.CPUTime,...
    RadauNoInterplolationCriticalDamping50Sampled.Tolerances,RadauNoInterplolationCriticalDamping50Sampled.CPUTime,...
    RadauLinInterplolationCriticalDamping50Sampled.Tolerances,RadauLinInterplolationCriticalDamping50Sampled.CPUTime,...
    RadauSincInterplolationCriticalDamping50Sampled.Tolerances,RadauSincInterplolationCriticalDamping50Sampled.CPUTime)

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

loglog(NoInterplolationIntegratorSampleFree.Tolerances,NoInterplolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    LinInterplolationIntegratorSampleFree.Tolerances,LinInterplolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    SincInterpolationIntegratorSampleFree.Tolerances,SincInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    NoInterplolationIntegratorSampled.Tolerances,NoInterplolationIntegratorSampled.absoluteMeanError+smallNumber,...
    LinInterplolationIntegratorSampled.Tolerances,LinInterplolationIntegratorSampled.absoluteMeanError+smallNumber,...
    SincInterplolationIntegratorSampled.Tolerances,SincInterplolationIntegratorSampled.absoluteMeanError+smallNumber)

grid on
title DASSL
ylabel 'Error RMS (integrator)'
xlim([1e-8,1e-1])
set(gca,'XTick',[1e-8,1e-6,1e-4,1e-2,1e-1])
set(gca,'XDir','reverse')
% ylim([1e1,1e8])
% set(gca,'YTick',[1e1,1e3,1e5,1e7,1e8])
legend('No interpolation','Linear interpolation','Sinc interpolation','location','NorthEast')


% CriticalDamping DASSL
if exportFigures && useInternalDLRToolboxes
    xmf_subplot(4,1,2)
else
    subplot(412)
end
loglog(NoInterplolationCriticalDamping50SampleFree.Tolerances,NoInterplolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    LinInterplolationCriticalDamping50SampleFree.Tolerances,LinInterplolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    SincInterpolationCriticalDamping50SampleFree.Tolerances,SincInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    NoInterplolationCriticalDamping50Sampled.Tolerances,NoInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    LinInterplolationCriticalDamping50Sampled.Tolerances,LinInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    SincInterplolationCriticalDamping50Sampled.Tolerances,SincInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber)

grid on

ylabel 'Error RMS (damping)'
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

loglog(RadauNoInterplolationIntegratorSampleFree.Tolerances,RadauNoInterplolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauLinInterplolationIntegratorSampleFree.Tolerances,RadauLinInterplolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauSincInterpolationIntegratorSampleFree.Tolerances,RadauSincInterpolationIntegratorSampleFree.absoluteMeanError+smallNumber,...
    RadauNoInterplolationIntegratorSampled.Tolerances,RadauNoInterplolationIntegratorSampled.absoluteMeanError+smallNumber,...
    RadauLinInterplolationIntegratorSampled.Tolerances,RadauLinInterplolationIntegratorSampled.absoluteMeanError+smallNumber,...
    RadauSincInterplolationIntegratorSampled.Tolerances,RadauSincInterplolationIntegratorSampled.absoluteMeanError+smallNumber)


grid on
title 'Radau IIA'

ylabel 'Error RMS (integrator)'
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
loglog(RadauNoInterplolationCriticalDamping50SampleFree.Tolerances,RadauNoInterplolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauLinInterplolationCriticalDamping50SampleFree.Tolerances,RadauLinInterplolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauSincInterpolationCriticalDamping50SampleFree.Tolerances,RadauSincInterpolationCriticalDamping50SampleFree.absoluteMeanError+smallNumber,...
    RadauNoInterplolationCriticalDamping50Sampled.Tolerances,RadauNoInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    RadauLinInterplolationCriticalDamping50Sampled.Tolerances,RadauLinInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber,...
    RadauSincInterplolationCriticalDamping50Sampled.Tolerances,RadauSincInterplolationCriticalDamping50Sampled.absoluteMeanError+smallNumber)

grid on
xlabel 'Tolerance'
ylabel 'Error RMS (damping)'
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
    xmf_init('height', 7, 'width', 8.5);
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
    xmf_init('height', 7, 'width', 8.5);
    xmf_init('leftmargin', 1.5, 'rightmargin', 0.5, 'bottommargin', 1.1, 'topmargin', .5);
    xmf_figure(6)
else
    figure(6)
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


