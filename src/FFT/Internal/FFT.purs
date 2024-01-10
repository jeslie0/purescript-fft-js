module FFT.Internal.FFT (FFT, ComplexArray(..), RealArray(..), newFFT, size, fromComplexArray, createComplexArray, toComplexArray, transform, realTransform, inverseTransform, STComplexArray(..), STRealArray(..), fromComplexArrayST, toComplexArrayST, transformST, realTransformST, inverseTransformST) where

import Prelude (class Show, Unit, show)
import Control.Monad.ST (ST)
import Data.Array.ST (STArray)

-- | Newtype wrapper for complex arrays. A complex array is equivalent
-- | to Array Number, where the values are of the form
-- | [re, im, re, im, ...].
newtype ComplexArray = ComplexArray (Array Number)
instance Show ComplexArray where
  show (ComplexArray arr) = show arr

-- | Newtype wrapper for real arrays
newtype RealArray = RealArray (Array Number)
instance Show RealArray where
  show (RealArray arr) = show arr

-- | A type representing the foreign FFT class.
foreign import data FFT :: Type

-- | Construct a new FFT object. The input is the size of the array
-- | that will have a fourier transform taking of. It must be a power
-- | of 2.
-- | The size is the number of numbers used in the array. For a real
-- | valued array, this is just the length. For a complex array, this
-- | is the length of the array / 2.
foreign import newFFT :: Int -> FFT

-- | Get the size of the given FFT object.
foreign import size :: FFT -> Int

-- | Create an array consisting of the real parts of the complex
-- | numbers provided in the given array.
foreign import fromComplexArray :: ComplexArray -> RealArray

-- | Create a zero filled complex array.
foreign import createComplexArray :: FFT -> ComplexArray

-- | Create a complex array from a given real array.
foreign import toComplexArray :: FFT -> RealArray -> ComplexArray

-- | Compute the Fast Fourier Transform of the given complex valued
-- | array.
foreign import transform :: FFT -> ComplexArray -> ComplexArray

-- | Compute the Fast Fourier Transform of the given real valued
-- | array. This is faster than creating a complex array from a real
-- | one and taking the fourier transformation.
foreign import realTransform :: FFT -> RealArray -> ComplexArray

-- | Compute the inverse Fourier transform of the given complex valued
-- | array.
foreign import inverseTransform :: FFT -> ComplexArray -> ComplexArray

-- | ST

-- | Newtype wrapper for complex arrays. A complex array is equivalent
-- | to STArray s Number, where the values are of the form
-- | [re, im, re, im, ...].
newtype STComplexArray s = STComplexArray (STArray s Number)

-- | Newtype wrapper for real arrays
newtype STRealArray s = STRealArray (STArray s Number)

-- | Update an array with the real parts of the complex numbers
-- | provided in the given array.
foreign import fromComplexArrayST :: forall s. FFT -> ComplexArray -> STRealArray s -> ST s Unit

-- | Turn the given mutable array into a complex valued mutable array, formed from
-- | the real valued array provided. Note - the mutable array must
-- | have size double that of the real valued array.
foreign import toComplexArrayST :: forall s. FFT -> RealArray -> STComplexArray s -> ST s Unit

-- foreign import completeSpectrum :: forall s . FFT -> STArray s Number -> ST s Unit

-- | Update the given mutable array with the fourier transform of the
-- | given complex valued array.
foreign import transformST :: forall s . FFT -> ComplexArray -> STComplexArray s -> ST s Unit

-- | Update the given mutable array with the fourier transform of the
-- | given real valued array.
foreign import realTransformST :: forall s . FFT -> RealArray -> STRealArray s -> ST s Unit

-- | Update the given mutable array with the inverse fourier transform
-- | of the given complex valued array.
foreign import inverseTransformST :: forall s . FFT -> ComplexArray -> STComplexArray s -> ST s Unit
