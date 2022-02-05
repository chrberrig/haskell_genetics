module Main where
import GHC.Event.Windows (CompletionCallback)

main :: IO ()
main = putStrLn "Hello, Haskell!"

type RandomFunc = () => Double
type Proportion = Double
data VariantState = Simple Proportion RandomFunc
type State = [VariantState]

-- reportState :: State -> State

-- rand :: () -> Double
-- rand() = 1.0
-- getVariant :: () -> VariantState
-- getVariant () = Simple 0.5 (rand())

variantUpdateStep :: VariantState -> VariantState
variantUpdateStep (Simple proportion func) = Simple (proportion * func) func

getProportion :: VariantState -> Proportion
getProportion (Simple proportion _) = proportion

normalizeVariantState :: Proportion -> VariantState -> VariantState
normalizeVariantState proportionSum (Simple proportion func) = Simple (proportion/ proportionSum) func 

normalizeState :: State -> State
normalizeState states = map (normalizeVariantState sum) states
  where
    sum = foldl (\sofar new -> sofar + getProportion(new)) 0.0 states
