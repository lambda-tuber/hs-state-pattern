{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}

module Type where

import Control.Monad.IO.Class
import Control.Monad.Trans.State.Lazy

-- |
--
type AppContext = StateT AppStateW IO

-- |
--
data StateTransition =
    StartingToRunning
  | RunningToStopping
  deriving (Show, Eq)

-- |
--
data StartingStateData = StartingStateData deriving (Show)
data RunningStateData  = RunningStateData  deriving (Show)
data StoppingStateData = StoppingStateData deriving (Show)
data AppState s where
  StartingState :: AppState StartingStateData
  RunningState  :: AppState RunningStateData
  StoppingState :: AppState StoppingStateData

deriving instance Show s => Show (AppState s)

-- |
--
data AppStateW = forall s. (IAppState s, Show s) => AppStateW (AppState s)

-- |
--
data EntryRequestData      = EntryRequestData deriving (Show)
data ExitRequestData       = ExitRequestData  deriving (Show)
data TransitRequestData    = TransitRequestData StateTransition deriving (Show)
data InitRequestData       = InitRequestData Int   deriving (Show)
data LaunchRequestData     = LaunchRequestData Int deriving (Show)
data DisconnectRequestData = DisconnectRequestData Int deriving (Show)
data TerminateRequestData  = TerminateRequestData Int  deriving (Show)

-- |
--
data Request r where
  EntryRequest      :: Request EntryRequestData
  ExitRequest       :: Request ExitRequestData
  TransitRequest    :: TransitRequestData -> Request TransitRequestData
  -- doActibity
  InitRequest       :: InitRequestData       -> Request InitRequestData
  LaunchRequest     :: LaunchRequestData     -> Request LaunchRequestData
  DisconnectRequest :: DisconnectRequestData -> Request DisconnectRequestData
  TerminateRequest  :: TerminateRequestData  -> Request TerminateRequestData

deriving instance Show r => Show (Request r)

-- |
--
data RequestW = forall r. RequestW (Request r)

-- |
--
class (Show s, Show r) => IStateActivity s r where
  action :: (AppState s) -> (Request r) -> AppContext (Maybe StateTransition)
  action s (TransitRequest (TransitRequestData t)) = do
    liftIO $ putStrLn $ show s ++ " " ++ show t ++ " will transit."
    return (Just t)
  action s r = do
    liftIO $ putStrLn $ show s ++ " " ++ show r ++ " not supported. will do nothing."
    return Nothing

-- |
--
class IAppState s where
  actionS  :: AppState s -> RequestW -> AppContext (Maybe StateTransition)

-- |
--
class IAppStateW s where
  actionSW  :: s -> RequestW -> AppContext (Maybe StateTransition)

instance IAppStateW AppStateW where
  actionSW (AppStateW a) r = actionS a r

