doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmallNumber x = (if x <= 100 then x*2 else x) + 1
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]  
exclude x' = [x | x <-x', x/= 13, x/=15] 