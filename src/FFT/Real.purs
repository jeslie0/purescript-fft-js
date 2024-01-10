module FFT.Real where

import Prelude

import FFT as FFT
import Data.Array as Array
import Data.Array.ST as ArrayST
import Data.Complex (Cartesian(..))
import Control.Monad.ST as ST
import FFT.Internal.Array (new)
import Partial.Unsafe (unsafePartial)

fft :: Array Number -> Array (Cartesian Number)
fft arr =
  unsquashed
  where
    fftObject =
      FFT.newFFT (Array.length arr)

    transformedArray =
      FFT.realTransform fftObject arr

    unsquashed =
      ArrayST.run do
        newArr <- new (Array.length arr)
        ST.for 0 (Array.length arr)
          (\n -> ArrayST.modify n (\_ -> Cartesian (unsafePartial $ Array.unsafeIndex transformedArray (2 * n)) (unsafePartial $ Array.unsafeIndex transformedArray (2 * n + 1))) newArr)
        pure newArr
