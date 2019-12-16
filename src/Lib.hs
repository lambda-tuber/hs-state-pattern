{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TemplateHaskell #-}

module Lib
    ( someFunc
    ) where

import Control.Monad.Trans.State.Lazy

import Type
import TH
import State.Starting()
import State.Running()
import State.Stopping()

-- |
--
funcTH_transit

-- |
--
someFunc :: IO ()
someFunc = do
  (_, _) <- runStateT app (AppStateW StartingState)

  return ()

-- |
--
app :: AppContext ()
app = do
  let reqStore = [
          RequestW (InitRequest (InitRequestData 1))
        , RequestW (LaunchRequest (LaunchRequestData 2))
--      , RequestW (TransitRequest (TransitRequestData StartingToRunning))
        , RequestW (TransitRequest (TransitRequestData RunningToStopping))
        , RequestW (DisconnectRequest (DisconnectRequestData 3))
        , RequestW (TerminateRequest (TerminateRequestData 4))
        ]

  mapM_ handle reqStore

  where
    handle :: RequestW -> AppContext ()
    handle req = get >>= flip actionSW req >>= \case
      Nothing -> return ()
      Just st -> transit st

