import           Test.QuickCheck

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort l ++ x:quicksort r
    where
      l = [y | y <- xs, y < x]
      r = [y | y <- xs, y > x]

qs_length :: [Int] -> Bool
qs_length l = length (quicksort l) == length l

main :: IO ()
main = quickCheck qs_length
