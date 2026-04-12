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


# Higher Order Functions

- Lambda functions start with \ and just take the parameter and applies function beforehand
- For finding the biggest patterns, start from the end of the list:
    - largestDivisible :: (Integral a) => a
    - largestDivisible = head (filter p [100000,99999..1])
    - where p x = mod x 3829 == 0


# Modules
## Data.List
- intersperse
    - intersperse '.' "MONKEY"  
    - "M.O.N.K.E.Y"
- intercalate
    - intercalate " " ["hey","there","folks"]  
    - "hey there folks"
- transpose 
    - transpose ["hey","there","folks"]  
    - ["htf","eho","yel","rk","es"]
- concat 
    - concat ["foo","bar","car"]  
    - "foobarcar"
- concatMap
    - concatMap (replicate 4) [1..3]  
    - [1,1,1,1,2,2,2,2,3,3,3,3] 
- 'and $ map (==4) [2,3,4,23,42]' = 'all (==4) [2,3,4,23,42]'
    - Returns true if all values true
- 'or $ map (==4) [2,3,4,23,42]' = 'any (==4) [2,3,4,23,42]'
    - Returns true if any of the value true

- iterate
    - take 10 $ iterate (*2) 1
    - takes function and starting value and applies it infintely
- splitAt
    - splitAt 3 "heyman"
    - ("hey", "man")
- takeWhile 
    - takes elements from a list where the predicate holds and when element doesnt satisfy, it is cut off.
- dropWhile
    - similar only taking elements while the predicate is true, else it will return the rest of the list
- span
    - does both takeWhile and dropWhile
    - break (==4) [1,2,3,4,5,6,7]  
    - ([1,2,3],[4,5,6,7]) 
- sort (self explanantory)
- group
    - takes list and groups adajacent equal elements
    - group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]  
    - [[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]  
    - e.g)  map (\l@(x:xs) -> (x,length l)) . group . sort $ [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7] 
    - THE @ ALLOWS YOU TO MAP A LIST TO A PATTERN
- inits/ tails
    - takes the initials and tails in order starting with nothing occuring i.e "" and the full string
    - inits "w00t"  
    - ["","w","w0","w00","w00t"]  
    - tails "w00t"  
    - ["w00t","00t","0t","t",""]
- isPrefixOf, isSuffixOf, elem, notElem
- elemIndex, elemIndices (for multiple), findIndex (first element that has predicate)
- lines 
    - lines "first line\nsecond line\nthird line"  
    - ["first line","second line","third line"]
- unlines does the opposite
    unlines ["first line", "second line", "third line"]  
    "first line\nsecond line\nthird line\n"  
- words/ unwords do similar but for lists of words
- delete 
    - removes first occurence of element in list
- \\
    - "Im a big baby" \\ "big"  
    - "Im a  baby" 
- union, intersect
    - does the union and intersection
- insert 
    - inserts when there is an elemenet less than or equal to the next element

## Data.Char
- isControl, isSpace, isLower, isUpper, isAlpha, isAlphaNum, isPrint, isDigit, isOctDigit, isHexDigit, isLetter, isMark, isNumber, isPunctuation, isSymbol, isSeparator, isAscii (first 128 characters), isLatin1 (first 256 characters), isAsciiUpper, isAsciiLower
- generalCategory 'A' can get the general category of a character

- toUpper, toLower, toTitle (mostly uppercase), digitToInt (hex digit to integer), intToDigit (digit to hex)
- ord (character to ascii), chr (ascii to character)

## Data.Map
- import qualified Data.Map as Map
- Need the keys to be orderable to be arranged
- DataMap.Empty gives an empty association table
- FromList (opposite is toList)
    - gives a map with the same assocuations
    - Maps are key value doctionary structures so lookups are easier and more efficient
    - Map.fromList [(1,2),(3,4),(3,2),(5,5)]
    - fromList [(1,2),(3,2),(5,5)]
    - because when duplicate keys appear, Map.fromList keeps the last value for that key.
- Map.insert 3 100 Map.empty 
    - Inserts into a new map [(3,100)]
- Map.null, Map.size
- Map.singleton takes a key and value to maje a map with one mapping
- Map.lookup returns something if it is found
- Map.member is a predicate that takes key and dmap and reports if the key is in the map or not
- Map.map and Map.filter
    - Map.map (*100) $ Map.fromList [(1,1),(2,4),(3,9)]  
    - fromList [(1,100),(2,400),(3,900)]  
    - Map.filter isUpper $ Map.fromList [(1,'a'),(2,'A'),(3,'b'),(4,'B')]  
    - fromList [(2,'A'),(4,'B')]  
- get a list of the keys and elemenets using:
    - Map.keys
    - Map.elems


## Data.Set
- import qualified Data.Set as Set  
- fromList (similar to map one)
- Set.intersection
- Set.difference (sees whats in first set but aren’t in the second one)

## Importing your own modules
- You can make your own modules