module FFT.Internal.Array (new) where
import Control.Monad.ST (ST)
import Data.Array.ST

foreign import _new :: forall h a. Int -> ST h (STArray h a)

-- | Create a mutable array that is unfilled. This is not as safe as
-- | generating a filled one, but is faster.
new :: forall h a. Int -> ST h (STArray h a)
new = _new
