within BatchProcessing.Batches;
function Paper1
  input String[:] getSimulationProperties={"Number of (successful) steps","time for integration",
      "Number of F-evaluations"};
  input Real Tolerances[:]={1e-1,1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8};
   input Real Amplitudes[:]={1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1e-0};

protected
  String method;
   Real stopTime "Simulation stop time";

algorithm
   stopTime :=500 "Simulation stop time";
   method :="dassl";
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampleFree", stopTime, method, "Res_NoInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationIntegratorSampleFree", stopTime, method, "Res_SincInterpolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampled", stopTime, method, "Res_NoInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationIntegratorSampled", stopTime, method, "Res_SincInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances);

   method :="Radau";
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampleFree", stopTime, method, "Res_RadauNoInterplolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationIntegratorSampleFree", stopTime, method, "Res_RadauSincInterpolationIntegratorSampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationIntegratorSampled", stopTime, method, "Res_RadauNoInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationIntegratorSampled", stopTime, method, "Res_RadauSincInterplolationIntegratorSampled.mat",getSimulationProperties,Tolerances);

   method :="dassl";
   stopTime :=100;
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50SampleFree", stopTime, method, "Res_NoInterplolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterpolationCriticalDamping50SampleFree", stopTime, method, "Res_SincInterpolationCriticalDamping50SampleFree.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.NoInterplolationCriticalDamping50Sampled", stopTime, method, "Res_NoInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances);
   BatchProcessing.Utilities.batchSimulateWithLogReader("BatchProcessing.Examples.SincInterplolationCriticalDamping50Sampled", stopTime, method, "Res_SincInterplolationCriticalDamping50Sampled.mat",getSimulationProperties,Tolerances);

  method :="dassl";
  stopTime :=1000;
  BatchProcessing.Utilities.batchSimulateWithLogReaderNoiseAmplitudeChange(
    "BatchProcessing.Examples.TestSignalToNoise",
    stopTime,
    method,
    "Res_TestSignalToNoise.mat",
    getSimulationProperties,
    Amplitudes);
end Paper1;
