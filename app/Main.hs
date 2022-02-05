module Main where
import GHC.Event.Windows (CompletionCallback)

main :: IO ()
main = putStrLn "Hello, Haskell!"

type RandomFunc = () => Double
type Proportion = Double
data VariantState = Simple Proportion RandomFunc
type State = [VariantState]

-- updateState :: State -> State
-- normalizeState :: Sate -> State
-- reportState :: State -> State

rand :: () -> Double
rand() = 1.0

variantUpdateStep :: VariantState -> VariantState
variantUpdateStep (Simple proportion func) = Simple (proportion * func) func

getProportion :: VariantState -> Double
getProportion (Simple proportion _) = proportion

getVariant :: () -> VariantState
getVariant () = Simple 0.5 (rand())

-- normalizeState :: State -> State
-- normalizeState states = map getProportion states
