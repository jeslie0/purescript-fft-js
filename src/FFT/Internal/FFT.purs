module FFT.Internal.FFT (FFT, newFFT, size, fromComplexArray, createComplexArray, toComplexArray, completeSpectrum, transform, realTransform, inverseTransform, transformST, realTransformST, inverseTransformST) where

import Prelude (Unit)
import Control.Monad.ST (ST)
import Data.Array.ST (STArray)

foreign import data FFT :: Type

foreign import newFFT :: Int -> FFT

foreign import size :: FFT -> Int

foreign import fromComplexArray :: FFT -> Array Number -> Array Number

foreign import createComplexArray :: FFT -> Array Number

foreign import toComplexArray :: FFT -> Array Number -> Array Number

foreign import completeSpectrum :: forall s . FFT -> ST s (STArray s Number)

foreign import transform :: FFT -> Array Number -> Array Number

foreign import realTransform :: FFT -> Array Number -> Array Number

foreign import inverseTransform :: FFT -> Array Number -> Array Number

foreign import transformST :: forall s . FFT -> Array Number -> STArray s Number -> ST s Unit

foreign import realTransformST :: forall s . FFT -> Array Number -> STArray s Number -> ST s Unit

foreign import inverseTransformST :: forall s . FFT -> Array Number -> STArray s Number -> ST s Unit
