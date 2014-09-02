within BatchProcessing.Batches;
function Paper1
  input String[:] getSimulationProperties={"Number of (successful) steps","time for integration",
      "Number of F-evaluations"};
  input Real Tolerances[:]={1e-1,1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8};
   input Real Amplitudes[:]={1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1e-0};
    input Real TimeScaling = 10;
protected
  String method;
  String ReferenceState;
   Real stopTime "Simulation stop time";

algorithm
     stopTime :=500*TimeScaling "Simulation stop time";
     ReferenceState := "integrator.y";
     method :="dassl";
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampleFree", stopTime, method, "Res_NoInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationIntegratorSampleFree", stopTime, method, "Res_LinInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationIntegratorSampleFree", stopTime, method, "Res_SincInterpolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampled", stopTime, method, "Res_NoInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationIntegratorSampled", stopTime, method, "Res_LinInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationIntegratorSampled", stopTime, method, "Res_SincInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);

     method :="Radau";
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampleFree", stopTime, method, "Res_RadauNoInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationIntegratorSampleFree", stopTime, method, "Res_RadauLinInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationIntegratorSampleFree", stopTime, method, "Res_RadauSincInterpolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampled", stopTime, method, "Res_RadauNoInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationIntegratorSampled", stopTime, method, "Res_RadauLinInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationIntegratorSampled", stopTime, method, "Res_RadauSincInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);

     ReferenceState := "criticalDamping.y";
     method :="dassl";
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50SampleFree", stopTime, method, "Res_NoInterplolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationCriticalDamping50SampleFree", stopTime, method, "Res_LinInterplolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationCriticalDamping50SampleFree", stopTime, method, "Res_SincInterpolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50Sampled", stopTime, method, "Res_NoInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationCriticalDamping50Sampled", stopTime, method, "Res_LinInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
     BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationCriticalDamping50Sampled", stopTime, method, "Res_SincInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);

    method :="Radau";
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50SampleFree", stopTime, method, "Res_RadauNoInterplolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationCriticalDamping50SampleFree", stopTime, method, "Res_RadauLinInterplolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationCriticalDamping50SampleFree", stopTime, method, "Res_RadauSincInterpolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50Sampled", stopTime, method, "Res_RadauNoInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.LinInterplolationCriticalDamping50Sampled", stopTime, method, "Res_RadauLinInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);
    BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationCriticalDamping50Sampled", stopTime, method, "Res_RadauSincInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances,ReferenceState=ReferenceState);

    method :="dassl";
    BatchProcessing.Utilities.batchSimulateWithLogReaderNoiseAmplitudeChange(
      "BatchProcessing.Examples.TestSignalToNoise",
      stopTime,
      method,
      "Res_TestSignalToNoise.mat",
      getSimulationProperties,
      Amplitudes);

    BatchProcessing.Utilities.batchSimulateWithLogReaderNoiseAmplitudeChange(
      "BatchProcessing.Examples.TestSignalToNoiseSampled",
      stopTime,
      method,
      "Res_TestSignalToNoiseSampled.mat",
      getSimulationProperties,
      Amplitudes);

   method :="Radau";
   BatchProcessing.Utilities.batchSimulateWithLogReaderNoiseAmplitudeChange(
     "BatchProcessing.Examples.TestSignalToNoise",
     stopTime,
     method,
     "Res_RadauTestSignalToNoise.mat",
     getSimulationProperties,
     Amplitudes);

    BatchProcessing.Utilities.batchSimulateWithLogReaderNoiseAmplitudeChange(
      "BatchProcessing.Examples.TestSignalToNoiseSampled",
      stopTime,
      method,
      "Res_RadauTestSignalToNoiseSampled.mat",
      getSimulationProperties,
      Amplitudes);

end Paper1;
