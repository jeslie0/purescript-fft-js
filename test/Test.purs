module Test.Main where

import FFT.Real
import FFT.Internal.Array
import FFT as FFT
import Prelude

import Data.Array as Array
import Data.Array.ST as ArrayST
import Data.Complex (Cartesian(..))
import Effect (Effect)
import Effect.Console as Console

info :: Array (Number)
info = [ 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ]

transformed :: Array (Cartesian Number)
transformed =
  fft info

fasterTransformed :: Array Number
fasterTransformed =
  ArrayST.run do
    newArr <- new (Array.length info)
    let fft = FFT.newFFT (Array.length info)
    FFT.realTransformST fft info newArr
    pure newArr

main :: Effect Unit
main = do
  Console.logShow info
  Console.time "TIME1"
  Console.timeLog <<< show $ transformed
  Console.timeEnd "TIME1"
  Console.time "TIME2"
  Console.timeLog <<< show $ fasterTransformed
  Console.timeEnd "TIME2"
