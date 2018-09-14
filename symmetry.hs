import           Test.QuickCheck

symmetry :: Int -> Int -> Property
symmetry x y = x == y ==> y == x

main :: IO ()
main = quickCheck symmetry
