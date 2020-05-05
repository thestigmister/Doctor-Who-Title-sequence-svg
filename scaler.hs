module Scaler where

halfAll :: [Int] -> [Int]
halfAll ns = [n `div` 2 | n <- ns]

squareAll :: [Int] -> [Int]
squareAll ns = [n^2 | n <- ns]

isTopLeft :: [(Int, Int)] -> Bool
isTopLeft [(x,y)] 
  | x <= 400 && y <= 300 = True
  | otherwise = False

isTopRight :: [(Int, Int)] -> Bool
isTopRight [(x,y)] 
  | x >= 400 && y <= 300 = True
  | otherwise = False

isBottomLeft :: [(Int, Int)] -> Bool
isBottomLeft [(x,y)] 
  | x < 400 && y > 300 = True
  | otherwise = False

isBottomRight :: [(Int, Int)] -> Bool
isBottomRight [(x,y)] 
  | x > 400 && y > 300 = True
  | otherwise = False

-- mirror :: [(Int, Int)] -> [(Int, Int)]
-- mirror (x,y) = [map (^2) [(i,j)] | i <- x, j <- y]

checkPos :: [(Int, Int)] -> IO()
checkPos [(x,y)]
  | isTopLeft [(x,y)] = print "Top left"
  | isTopRight [(x,y)] = print "Top right"
  | isBottomLeft [(x,y)] = print "Bottom left"
  | isBottomRight [(x,y)] = print "Bottom right"
  | otherwise = print "nope"

-- position :: [(Int, Int)] -> [IO()]
-- position [(x,y)] = map (checkPos) (x,y)