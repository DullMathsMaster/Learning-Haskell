# Haskell

## Starting out
- Haskell is a purely functional language
- Haskell has type inference
- Haskell is elegant and concise
- ' is its own charcter, doesnt mean anything 
- instead of putting ++, use : at beginning 5:[1,2] -> [5,1,2] (only allowed to do one element)
- [1,2,3] = 1:2:3:[]
- !! is for 0 indexed index lookup '"hello"!! 0' -> h
- Lists are compared in lexicographical order
- For lists, head, tail, last, init
- head (first element), tail (remaining from head), last (last element), init (everything but last element)
- length (of list), null (true if empty), reverse (list), (take, drop), maximum (of list), minimum (of list), sum (of list), product (of list), elem (is element of list)
- Haskell is lazy 'take 24 [13,26..]' gives first 24 multiples of 24 instead of calculating infinite
- Cycle, repeat are most used with take:
    - take 10 (repeat 5)
    - take 10 (cycle [1,2,3]) # This is for decronstructing list and getting the same patterns
    - *replicate is easiset to use 'replicate 3 10'
- Can use set ideas [x | x <- [50..100], mod x 7 == 3] for example
- Whatever is before '|' will be the value of that element of x
- For multiple lists you can have [x*y | x <- [2,3], y <- [3,4]]. This gives the combination of it
- Tuples have fst and snd for getting 1st and 2nd things in paired tuples only
- zip can combine pairs of lists 'zip [1..5] ['a'..'g']

## Types
- Give explicit type declaraton using :: ("has type of")
- Integer is for big values, Int is more efficient for smaller numbers
- Double has better precision than Float
- Bool, Char, [Char] (also can use String)
- Prefix functions are common, but you can change infix functions such as == by surrounding with brackets '(==) 5 5'
- Typeclasses: Eq, Ord (type class that can be ordered with <, > etc), Show (ints to string for example), Read (string to int for example if in same context as other operations)
- succ and pred can be used to find before and after 
- minBound, maxBound can be used for int types usage: 'maxBound :: (Bool, Int, Char)'
- Num (all numbers) covers both Integral (whole) and Floating (decimal)
- fromIntegral converts numbers to more general (such as length [1..10])
- This doesnt work for regular numbers such as '10 + 3.2' because 10 is treated as a polymorphic number literal not a fixed Int. Haskel can interpret by context

Syntax
- Alternative if stetement:
    - lucky :: (Integral a) => a -> String
    - lucky 7 = "LUCKY NUMBER SEVEN"
    - lucky x = "Sorry your unlucky"
- Can do error statements:
    - head' :: [a] -> a
    - head' [] = error "Can't call head on empty list"
    - head' (x:_) = x
- Parentheses are used to group elements of a list
    - (x:y:_) for [x,y......]
    - (x:y:[]) for [x,y]
    - (x:[]) for [x]
- Datatype classes allow for more generalisation
    - Cannot do 'sum' :: [Num] -> Num'
    - Have to separate like 'sum' :: Num a => [a] -> a'
    - You cannot use types in the same way as typeclasses
- Patterns:
    - capital :: String -> String
    - capital "" = "empty string"
    - capital all@(x:xs) = "First letter of " ++ all ++ " is " ++ [x]
- Guards:
    - max' :: (Ord a) => a -> a -> a
    - max' a b
    -     | a < b = b
    -     | otherwise = a
- 'Ordering' data type - LT, EQ, GT
    - myCompare :: (Ord a) => a -> a -> Ordering
    - a `myCompare` b
    -     | a > b     = GT
    -     | a == b    = EQ
    -     | otherwise = LT
- Where statements can be used after guards to avoid recalculation
    - densityTell :: (RealFloat a) => a -> a -> String  
    - densityTell mass volume  
    -     | density < air = "Wow! You're going for a ride in the sky!"  
    -     | density <= water = "Have fun swimming, but watch out for sharks!"  
    -     | otherwise   = "If it's sink or swim, you're going to sink."  
    -     where 
            density = mass / volume  
    -       air = 1.2  
    -       water = 1000.0
- Case Expressions can be used like so where the case inbetween 'case [case] of '[pattern] -> etc'' is compared to the patterns:
    - head' :: [a] -> a  
    - head' xs = case xs of [] -> error "No head for empty lists!"  
                        (x:_) -> x  
- Since Int can be negative, you have to make sure you use guards instead of patterns
- 'take 5 (repeat 3)' will give us a list of five 3’s