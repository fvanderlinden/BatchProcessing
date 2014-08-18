within BatchProcessing.Examples;
model SincInterpolationIntegratorSampleFree
  extends NoInterplolationIntegratorSampleFree(prng(redeclare function PSD =
          Noise.PSD.PSD_IdealLowPass));
end SincInterpolationIntegratorSampleFree;
