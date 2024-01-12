# purescript-fftjs
-----
![](https://img.shields.io/badge/built%20for-PureScript-1d222d.svg)
[![Latest release](http://img.shields.io/github/release/jeslie0/purescript-fftjs.svg)](https://github.com/jeslie0/purescript-fftjs/releases)
[![Build status](https://github.com/jeslie0/purescript-fftjs/workflows/CI/badge.svg?branch=master)](https://github.com/jeslie0/purescript-fftjs/actions?query=workflow%3ACI+branch%3Amaster)
[![Pursuit](https://pursuit.purescript.org/packages/purescript-fftjs/badge)](https://pursuit.purescript.org/packages/purescript-fftjs)

A PureScript wrapper around [fft.js](https://github.com/indutny/fft.js/), providing functions to take the Fast Fourier Transform of real and complex arrays. There is also a module extending the functionality to the [cartesian](https://github.com/Ebmtranceboy/purescript-cartesian) library.

## Notes
This library exposes the public fft.js functionality in the [FFT](./src/FFT.purs) module. The module uses two `newtype` wrappers `RealArray` and `ComplexArray` to add a bit of type safety to the function types. A complex array is an interweaved array of real and imaginary parts: `[re_0, im_0, re_1, im_1,...]`.

Whenever we refer to the size of an array, we mean the number of *numbers* in it, not elements in the array. An array interpreted as a `ComplexArray` will have size half of that if it is interpreted as a `RealArray`. This is helpfully made clear by the `FFTArray` typeclass, whose instances have a `size` function.

## Installation

```
spago install fftjs
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-fftjs).
