{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}

module State.Starting where

import Control.Monad.IO.Class

import Type
import TH
import State.Starting.Init()
import State.Starting.Launch()
import State.Starting.Disconnect()
import State.Starting.Terminate()

{-
-- |
--
instance IAppState StartingStateData where
  actionS s (RequestW r@EntryRequest{})      = action s r
  actionS s (RequestW r@ExitRequest{})       = action s r
  actionS s (RequestW r@TransitRequest{})    = action s r
  actionS s (RequestW r@InitRequest{})       = action s r
  actionS s (RequestW r@LaunchRequest{})     = action s r
  actionS s (RequestW r@DisconnectRequest{}) = action s r
  actionS s (RequestW r@TerminateRequest{})  = action s r
-}
instanceTH_IAppState ''StartingStateData

-- |
--
instance IStateActivity StartingStateData EntryRequestData where
  action _ _ = do
    liftIO $ putStrLn "Starting entry called."
    return Nothing

-- |
--
instance IStateActivity StartingStateData ExitRequestData where
  action _ _ = do
    liftIO $ putStrLn "Starting exit called."
    return Nothing

-- |
--
instance IStateActivity StartingStateData TransitRequestData
  -- @see default implementation in Type module.

