within BatchProcessing.Examples;
model SincInterpolationCriticalDamping50SampleFree
  extends NoInterplolationCriticalDamping50SampleFree(prng(redeclare function
        PSD =
          Noise.PSD.PSD_IdealLowPass));
end SincInterpolationCriticalDamping50SampleFree;
