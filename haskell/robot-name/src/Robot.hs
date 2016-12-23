module Robot (Robot, mkRobot, resetName, robotName) where
import System.Random
import Control.Monad
import Data.IORef

data Robot = Robot (IORef String)

getName :: IO String
getName = do g <- newStdGen; return (take 2 (randomRs ('A', 'Z') g) ++ take 3 (randomRs ('0', '9') g))

mkRobot :: IO Robot
mkRobot = do r <- newIORef (""); return $ Robot r

resetName :: Robot -> IO ()
resetName (Robot r) = writeIORef r ""        

robotName :: Robot -> IO String
robotName (Robot r) = do n <- readIORef r
                        case n of 
                        "" -> name <- getName; writeIORef r name; return name 
                        _  -> return n
