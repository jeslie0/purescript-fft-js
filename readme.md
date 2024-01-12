# purescript-fftjs
-----

A PureScript wrapper around [fft.js](https://github.com/indutny/fft.js/), providing functions to take the Fast Fourier Transform of real and complex arrays. There is also a module extending the functionality to the [cartesian](https://github.com/Ebmtranceboy/purescript-cartesian) library.

## Notes
This library exposes the public fft.js functionality in the [FFT](./src/FFT.purs) module. The module uses two `newtype` wrappers `RealArray` and `ComplexArray` to add a bit of type safety to the function types. A complex array is an interweaved array of real and imaginary parts: `[re_0, im_0, re_1, im_1,...]`.

Whenever we refer to the size of an array, we mean the number of *numbers* in it, not elements in the array. An array interpreted as a `ComplexArray` will have size half of that if it is interpreted as a `RealArray`. This is helpfully made clear by the `FFTArray` typeclass, whose instances have a `size` function and a `transform` function.

## Installation

```
spago install fftjs
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-fftjs).
