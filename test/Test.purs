module Test.Main where

-- import FFT.Real
-- import FFT.Internal.Array
import FFT as FFT
import Prelude

import FFT (RealArray(..), ComplexArray(..))
import Data.Array as Array
import Data.Array.ST as ArrayST
import Data.Complex (Cartesian(..))
import Effect (Effect)
import Effect.Console as Console

realArray :: RealArray
realArray =
  RealArray [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 ]

complexArray :: ComplexArray
complexArray =
  ComplexArray [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0 ]

newFFT :: FFT.FFT
newFFT =
  FFT.newFFT 8

fromComplexArray :: RealArray
fromComplexArray =
  FFT.fromComplexArray complexArray

createComplexArray :: ComplexArray
createComplexArray =
  FFT.createComplexArray newFFT

toComplexArray :: ComplexArray
toComplexArray =
  FFT.toComplexArray newFFT realArray

transform :: ComplexArray
transform =
  FFT.transform newFFT complexArray

realTransform :: ComplexArray
realTransform =
  FFT.realTransform newFFT realArray

inverseTransform :: ComplexArray
inverseTransform =
  FFT.inverseTransform newFFT complexArray

complexRealTransform :: ComplexArray
complexRealTransform =
  FFT.transform newFFT toComplexArray


main :: Effect Unit
main = do
  Console.log $ "real array: " <> show realArray <> "\n"
  Console.log $ "complex array: " <> show complexArray <> "\n"
  Console.log $ "from complex array: " <> show fromComplexArray <> "\n"
  Console.log $ "create complex array: " <> show createComplexArray <> "\n"
  Console.log $ "to complex array: " <> show toComplexArray <> "\n"
  Console.log $ "transform: " <> show transform <> "\n"
  Console.log $ "real transform: " <> show realTransform <> "\n"
  Console.log $ "inverse transform: " <> show inverseTransform <> "\n"
  Console.log $ "real to complex transform: " <> show complexRealTransform <> "\n"
