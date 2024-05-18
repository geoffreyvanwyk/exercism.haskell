module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = isDivisibleBy4 && not (isDivisibleBy100 && not isDivisibleBy400)
    where isDivisibleBy4   = rem year 4   == 0
          isDivisibleBy100 = rem year 100 == 0
          isDivisibleBy400 = rem year 400 == 0
