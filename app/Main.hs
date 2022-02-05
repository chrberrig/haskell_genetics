module Main where

main :: IO ()
main = putStrLn "Hello, Haskell!"


type RandomFunc = () => Double
data VariantState = Simple Double RandomFunc
type State = [VariantState]

-- updateState :: State -> State
-- normalizeState :: Sate -> State

-- variantUpdateStep :: VariantState -> VariantState

