{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module State.Starting.Init where

import Control.Monad.IO.Class

import Type

-- |
--
instance IStateActivity StartingStateData InitRequestData where
  action _ _ = do
    liftIO $ putStrLn "Starting init called."
    return $ Just StartingToRunning

