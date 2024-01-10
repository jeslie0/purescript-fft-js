module FFT (FFT, newFFT, size, fromComplexArray, createComplexArray, toComplexArray, transform, realTransform, inverseTransform) where

foreign import data FFT :: Type

foreign import newFFT ::Int -> FFT

foreign import size :: FFT -> Int

foreign import fromComplexArray :: FFT ->Array Number -> Array Number

foreign import createComplexArray :: FFT -> Array Number

foreign import toComplexArray :: FFT -> Array Number -> Array Number

-- foreign import completeSpectrum :: FFT -> (forall s . STRef s (Array)

foreign import transform :: FFT -> Array Number -> Array Number

foreign import realTransform :: FFT -> Array Number -> Array Number

foreign import inverseTransform :: FFT -> Array Number -> Array Number
