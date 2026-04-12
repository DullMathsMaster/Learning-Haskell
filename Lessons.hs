import Data.List (nub, sort)
import Data.List hiding (nub)

-- When you have same name functions to avoid accidental functions:
import qualified Data.Map 


doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmallNumber x = (if x <= 100 then x*2 else x) + 1

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]  
exclude x' = [x | x <-x', x/= 13, x/=15] 

-- length' xs = sum [1| _ <- xs]
removeNonUppercase st = [ c | c <- st, elem c ['A'..'Z']]

a = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
removeOdd xs = [[x| x <- xd, even x]| xd <- xs]

x' = [1..10]
y = [(x, y, z) | x <- x', y <- x', z <- x', x + y + z == 24, x*x + y*y - z*z == 0, x < y]

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry your unlucky"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Pattern matching
tuples = [(1,2), (3,4), (5,6)]
pattern = [a + b | (a,b) <- tuples]

head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"  
head' x = x !! 0  

-- Length using recursion
length' :: [a] -> Int
length' [x] = 1
length' (x:y) = 1 + length' y  

-- Sum using recursion
-- sum' :: (Integral a) => [a] -> a
-- sum' [] = 0
-- sum' (x:xs) = x + sum' xs

-- Patterns
capital :: String -> String
capital "" = "empty string"
capital all@(x:xs) = "First letter of " ++ all ++ " is " ++ [x]

-- Guards
-- densityTell :: (RealFloat a) => a -> String
-- densityTell density
--     | density < 1.2 = "WOW FLYING"
--     | density <= 1000.0 = "Swim"
--     | otherwise = "You sinking"


-- max' :: (Ord a) => a -> a -> a
-- max' a b
--     | a < b = b
--     | otherwise = a

-- Where statements
densityTell :: (RealFloat a) => a -> a -> String  
densityTell mass volume  
    | density < air = "Wow! You're going for a ride in the sky!"  
    | density <= water = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where 
        density = mass / volume
        air = 1.2  
        water = 1000.0  

-- Using Where statements in other contexts
initials :: String -> String -> String
initials firstname lastname = [f] ++ [l]
    where 
        (f:_) = firstname
        (l:_) = lastname

calcDensities :: (RealFloat a) => [(a, a)] -> [a]  
calcDensities xs = [density m v | (m, v) <- xs]  
    where 
        density mass volume = mass / volume  


-- Max using recursion
max' :: (Ord a) => a -> a -> a 
max' a b = case a > b of 
    True -> a
    False -> b

-- Maximum using recursion
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "No elements to look at"
maximum' [a] = a 
maximum' (a:xs) = max' a (maximum xs)

-- Replicate using recursion (Use guards because Ints can be negative)
replicate' :: Int -> b -> [b]
replicate' a b
    | a <= 0 = []
    | otherwise = b : replicate (a - 1) b

-- Take using recursion
take' :: Int -> [b] -> [b]
take' a _
    | a <= 0 = []
take' _ [] = []
take' a (b:bs) = b : take' (a - 1) bs

-- Reverse using recursion
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ (x :[])  

-- Zip using recursion
zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (a:as) (b:bs) = [(a, b)] ++ zip as bs 

-- Elem using recursion
elem' ::  (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (b:_)
    | a == b = True
elem' a (b:bs) = elem' a bs

-- Quick sort using recursion
quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = smallest ++ [x] ++ biggest
    where 
        smallest = quicksort' [y | y <- xs, x > y]
        biggest = quicksort' [y | y <- xs, y >= x]

-- zipWidth using recursion
zipWidth' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWidth' _ [] _ = []
zipWidth' _ _ [] = []
zipWidth' a (b:bs) (c:cs) = [a b c] ++ zipWidth' a bs cs

-- flip using recursion
flip' :: (a -> b -> c) -> b -> a -> c
flip' a b c = a c b

-- map using recursion
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' a (b:bs) = [a b] ++ map' a bs  

-- filter using recursion
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' a (b:bs)
    | a b == True = b : filter' a bs
    | otherwise = filter' a bs

-- Example use case for filter:
-- let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]  

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain a
    |  even a = let next = div a 2 in [a] ++ chain next
    |  otherwise = let next = (a * 3) + 1 in [a] ++ chain next

numLongChains :: Int
numLongChains = sum [1 | x <- [1..100], length (chain x) > 15]

numLongChains' :: Int  
numLongChains' = length (filter isLong (map chain [1..100]))  
    where isLong xs = length xs > 15  

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..1])
    where p x = mod x 3829 == 0


sum' :: (Num a) => [a] -> a
sum' xs = foldr (\x acc -> acc + x) 0 xs

-- findkey' :: (Eq a) => a -> [(a,b)] -> b
-- findkey' key xs = snd . head . filter (\(k,v) -> key == k) xs

-- findkey' :: (Eq a) => a -> [(a,b)] -> Maybe b
-- findkey' key [] = Nothing
-- findkey' key ((k, v):xs)
--     | key == k = Just v
--     | otherwise = findkey' key xs

findkey' :: (Eq a) => a -> [(a,b)] -> Maybe b
findkey' key xs = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing xs

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Person = Person {
    firstName :: String
    , lastName :: String
    , age :: Int
    , height :: Float
    , phoneNumber :: String
    , flavor :: String
} deriving (Show)

data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)  