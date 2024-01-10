module FFT.Internal.Array (new) where
import Control.Monad.ST (ST)
import Data.Array.ST

foreign import _new :: forall h a. Int -> ST h (STArray h a)

new :: forall h a. Int -> ST h (STArray h a)
new = _new
