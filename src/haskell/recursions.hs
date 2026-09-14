fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = do
  putStrLn ""
  putStr "Enter a positive integer: "
  input <- getLine
  let n = read input :: Integer
  if n < 1
    then error ("fib: expected a positive integer, got " ++ show n)
    else putStrLn (show n ++ " -> " ++ show (fib n))
