within BatchProcessing.Examples;
model SincInterpolationIntegratorSampleFree
  extends NoInterpolationIntegratorSampleFree(prng(redeclare function PSD =
          Noise.PSD.PSD_IdealLowPass));
end SincInterpolationIntegratorSampleFree;
