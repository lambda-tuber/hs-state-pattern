module Utility where

import Control.Monad.Trans.State.Lazy

import Type

-- |
--
changeTo :: AppStateW -> AppContext ()
changeTo nextSt = do
  curSt <- get
  actionSW curSt (RequestW ExitRequest)

  let req = RequestW EntryRequest
  actionSW nextSt req

  modify (\_ -> nextSt)

