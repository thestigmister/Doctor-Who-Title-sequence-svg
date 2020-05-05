module Grid where
import Animation

pic :: Animation
pic = 
  --star `plus` grid
  -- combine (
  --   [translate (always (0, 0 + y))
  --   (star) | y <- [50, 150..350]])
  -- `plus` grid

   --lightning `plus` 
   -- translate (always (50, 50)) 
   -- (withBorder (always yellow) (always 5)
   --   (withoutPaint(letterD `plus` letterO 
   --    `plus` letterC `plus` letterT 
   --    `plus` translate (always (150, 0)) (letterO) 
   --    `plus` letterR `plus` letterW `plus` letterH
   --    `plus` translate (always (400, 0)) (letterO)))) 
      --doctorWho `plus` grid
      --sign
      -- `plus`
      -- (withBorder (always white) (always 2)
      --  (withoutPaint(letterP `plus` smallO `plus` letterL `plus` letterI `plus` smallC `plus` letterE `plus` letterB `plus` translate(always(95,0))(smallO) `plus` letterX)))
      -- `plus` rotating
      --logo `plus` grid
      logo


--define as item `plus` grid with grid always being last. 

grid :: Animation
grid =  

        -- the 10x10 grid 
        withBorder (always black) (always 1)
          (withoutPaint
            (combine
               [translate (always (0 + i, 0 + j)) 
                  (rect (always 10) (always 10)) | i <- [0,10..800], j <- [0,10..600]]))
        `plus` --red lines for 50x50 lines
        withBorder (always red) (always 1)
          (withoutPaint (combine
             [translate (always (0 + a, 0 + b))
               (rect (always 50) (always 50)) | a <- [0, 50..800], b <- [0,50..600]]))
        `plus`
        withBorder (cycleSmooth 1 [blue, yellow]) (always 1)
          (withoutPaint (combine
             [translate (always (0 + c, 0 + d))
               (rect (always 100) (always 100)) | c <- [0, 100..800], d <- [0,100..600]]))
        
tardis :: Animation
tardis = --tardis lamp
    withBorder (always blue) (always 5)
        (withPaint (cycleSmooth 2 [yellow, white])
            (polygon [(140, 60), (160, 60), (162, 62), (162, 80), (138, 80), (138, 62)]))
      `plus` --police box sign rectangle
      translate (always (80, 80))
         (withBorder (always blue) (always 6)
           (withPaint (always black)
              (rect (always 140) (always 20))))
      `plus` -- yellow circle fading around lamp
      translate (always (150, 70))
         (withGenPaint (always yellow) (cycleSmooth 0.75 [0, 1])
           (circle (always 20)))
      -- `plus` -- main section rectangle
      -- translate (always (340, 200))
      --    (withPaint (always blue)
      --       (rect (always 120) (always 210)))
      `plus` --main section with floor polygon
      withPaint (always blue)
         (polygon [(90, 100), (210, 100), (210, 310), 
                   (220, 310), (220, 330), (80, 330), 
                   (80, 310), (90, 310), (90, 100)])



      --windows
      `plus`
      combine ([translate (always (100 + i, 110))
        (window) | i <- [0, 60]])   

      -- windows and boxes
      --left window pieces
      --`plus`
      -- combine (translate (always (100 + i, 110)) | i <- [0, 60]) ( 
      -- withBorder (always black) (always 5)
      --    (withPaint (always white)
      --         (combine
      --            [translate (always (100 + i , 110 +j))
      --            (rect (always 13.5) (always 20)) | i <- [0,13.5,27], j <- [0,20]]))

      -- --right window pieces
      -- --`plus`
      -- withBorder (always black) (always 5)
      --    (withPaint (always white)
      --         (combine
      --            [translate (always (160 + i , 110 +j))
      --            (rect (always 13.5) (always 20)) | i <- [0,13.5,27], j <- [0,20]])))


      -- `plus` -- left window
      -- translate (always (350, 210))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always white)
      --          (rect (always 40) (always 40))))
      -- `plus` -- right window
      -- translate (always (410, 210))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always white)
      --          (rect (always 40) (always 40))))

     `plus`
     combine ([translate (always (100, 160)) --this is the origin position for the first square
        (doorBox)]) 
      
      `plus` --high order version for all the boxes including phone sign but in blue
      withBorder (always black) (always 5)
         (withPaint (always blue)
            (combine
              [translate (always (100 + i, 160 + j))
                (rect (always 40) (always 40)) | i <- [0, 60], j <- [0,50..100]]))
      `plus` -- phone sign - have to do it separately as it's white
      translate (always (100, 160))
         (withBorder (always black) (always 5)
            (withPaint (always white)
               (rect (always 40) (always 40))))

      --  `plus` -- left third box
      -- translate (always (100, 210))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always blue)
      --          (rect (always 40) (always 40))))
      -- `plus` -- left bottom
      -- translate (always (100, 260))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always blue)
      --          (rect (always 40) (always 40))))
      -- `plus` -- second right box
      -- translate (always (160, 160))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always blue)
      --          (rect (always 40) (always 40))))
      -- `plus` -- third right box
      -- translate (always (160, 210))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always blue)
      --          (rect (always 40) (always 40))))
      -- `plus` -- bottom right box
      -- translate (always (160, 260))
      --    (withBorder (always black) (always 5)
      --       (withPaint (always blue)
      --          (rect (always 40) (always 40))))
      -- `plus` -- floor
      -- translate (always (90, 550))
      --    (withPaint (always blue)
      --       (rect (always 250) (always 30)))

window :: Animation --separate definition for a Window
window = withBorder (always black) (always 5)
         (withPaint (always white)
              (combine
                 [translate (always (0 + i , 0 +j)) --did 0 and 0 so I can do other translations relative
                 (rect (always 13.5) (always 20)) | i <- [0,13.5,27], j <- [0,20]]))

doorBox :: Animation -- separate definition for the blue door boxes.
doorBox = withBorder (always black) (always 5)
         (withPaint (always blue)
            (combine
              [translate (always (0 + i, 0 + j)) --when you call it, do translate to place the top left box (phone sign)
                (rect (always 40) (always 40)) | i <- [0, 60], j <- [0,50..100]]))

pic1 :: Animation
pic1 = withBorder (always blue) (always 5)
        (withPaint (cycleSmooth 2 [yellow, white])
             (polygon [(205, 65), (225, 65), (227, 67), (227, 90), (203, 90), (203, 67)]))
      
star :: Animation
star = 
  translate (repeatSmooth (300, 150) [(0, (300, 150)), (1, (300, 150)), (2.5, (-150,50))])
  (scale (repeatSmooth (0.25, 0.25) [(0, (0.25, 0.25)),  (1, (0.25,0.25)), (2.5,(0.75, 0.75))])
  (withPaint (always grey)
         (polygon [(87.5,18.75),(94.75,40.25),(117.25, 40.25),(99.25,53.75), (105.75, 75.25),(87.5, 62.5),(69.25,75.25),(75.75,53.75),(57.75,40.25), (80.25, 40.25)])))

-- star1 :: Animation
-- star1 = 
--   combine (
--   [translate (repeatSmooth (x1, y1) [(0, (x1, y1)), (1, (x1, y1)), (2.5, (x2,y2))])
--   (scale (repeatSmooth (0.25, 0.25) [(0, (0.25, 0.25)),  (1, (0.25,0.25)), (2.5,(0.75, 0.75))])
--   (withPaint (always grey)
--          (polygon [(87.5,18.75),(94.75,40.25),(117.25, 40.25),(99.25,53.75), (105.75, 75.25),(87.5, 62.5),(69.25,75.25),(75.75,53.75),(57.75,40.25), (80.25, 40.25)])))
--   | )

lightning :: Animation
lightning = 
  withPaint (cycleSteps 0.5 [yellow, white, yellow, yellow, white, yellow, white])
    (polygon [(10,10),(60,10),(30, 40),(60,40), (30, 80), (60, 80), (-10, 140), (20, 90), (-10, 90), (20, 50), (-10,50)])

---experimenting with mirroring
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

checkPos :: [(Int, Int)] -> IO()
checkPos [(x,y)]
  | isTopLeft [(x,y)] = print "Top left"
  | isTopRight [(x,y)] = print "Top right"
  | isBottomLeft [(x,y)] = print "Bottom left"
  | isBottomRight [(x,y)] = print "Bottom right"
  | otherwise = print "nope"

doctorWho :: Animation
doctorWho = 
  translate (always (50, 50)) 
   (withBorder (always yellow) (always 5)
     (withoutPaint(letterD `plus` letterO 
      `plus` letterC `plus` letterT 
      `plus` translate (always (150, 0)) (letterO) 
      `plus` letterR `plus` letterW `plus` letterH
      `plus` translate (always (400, 0)) (letterO)))) 

--Logo and lettering
logo :: Animation --Doctor Who Logo
logo = 
      translucent (cycleSmooth 5 [0, 0, 0, 1])
      (translate (always (100, 250)) 
        (scale (repeatSmooth (1, 1) [(0, (1, 1)), (4.5, (1, 1)), (10, (4,4))])
        (translate (repeatSmooth (0, 0) [(0, (0,0)), (4.5, (0, 0)), (7.5, (-150, -50)), (10, (-250, -50))]) 
          (rotate (repeatSmooth 0 [(0, 0), (4.5, 0), (10, 90)])
          (withBorder (always yellow) (always 5)
            (withoutPaint
              (combine 
                [translate (always (x, 0)) (j) | (j, x) <- wordPosList])))))))

wordPosList :: [(Animation, Length)] --Setting positions for each letter in the word.
wordPosList = [(letterD, 50), (letterO, 125), (letterC, 150),
               (letterT, 190), (letterO, 250), (letterR, 275),
               (letterW, 350), (letterH, 400), (letterO, 475)]


--Each letter
letterD :: Animation
letterD = 
    polygon [(10, 0),(40, 0), (50, 25), 
            (45, 40), (40, 50), (20, 50), 
            (20, 25), (30,25), (0, 25), 
            (20,25), (20, 0)]

letterO :: Animation
letterO = 
    translate (always (0, 25))
        (ellipse (always 15) (always 25))

letterC :: Animation
letterC = polygon [(40, 0),(30, 2.5), (20, 5), 
                   (10, 7.5),(0, 25), (10, 42.5), 
                   (20, 45), (30, 47.5), (40, 50), 
                   (30, 47.5), (20,45), (10, 42.5), 
                   (0,25), (10, 7.5), (20, 5), 
                   (30, 2.5), (40,0)]

letterT :: Animation
letterT = polygon [(10, 0), (40, 0), (25,0), 
                   (25, 50), (25,0)]

letterR :: Animation
letterR = polygon [(0, 30),(0, 50), (0, 0), 
                   (10, 0), (20, 2.5), (30, 5), 
                   (32.5, 7.5), (35, 10), (35, 15), 
                   (0,30), (35, 50)]

letterW :: Animation
letterW = polygon [(0, 0),(15, 50), (25,25), 
                   (35, 50), (50, 0), (35,50), 
                   (25,25), (15, 50)]

letterH :: Animation
letterH = polygon [(10, 25),(10, 0), (10, 60), 
               (10, 25), (40, 25), (40, -10),
               (40, 50), (40,25), (120, 25)]

letterP :: Animation
letterP = 
  polygon [(10,15), (10, 5), (12.5, 5),(15, 7.5),(12.5, 10), (10, 10)]

smallO :: Animation
smallO = 
       withBorder (always white) (always 10)
       (translate (always (7.5, 5))
        (scale (always (0.2, 0.2))
         (letterO)))

letterL :: Animation
letterL = 
  translate (always (30, 4.5))
       (polygon [(0, 0), (0, 10), (5, 10), (0, 10)])

letterI :: Animation
letterI = 
  translate (always (40, 5))
     (polygon [(0, 0), (0, 10)])

smallC :: Animation
smallC = 
  withBorder (always white)(always 10)
  (translate (always (25, 5))
   (scale (always (0.2, 0.2))
    (letterC)))

letterE :: Animation
letterE = 
  polygon [(60, 5.5), (67.5, 5.5), (60, 5.5), (60, 10), (65, 10), (60, 10), (60, 14.5), (67.5, 14.5), (60, 14.5)]

letterB :: Animation
letterB = 
  polygon [(100, 5), (105, 5), (107.5, 6.5), (107.5, 7.5) ,(105, 10), (100, 10),
           (100, 10), (105, 10), (107.5, 11.5), (107.5, 12.5), (105, 15), (100, 15)]

letterX :: Animation
letterX = 
  polygon [(125, 5), (135, 15), (130, 10), (125, 15), (135, 5), (130, 10)]

rotating :: Animation
rotating = 
  withPaint (always red)
  (translate (always(400, 300))
    (rotate (spinner 5)
      (translate (always(0,0))
     (rect (always 100) (always 100)))))

sign :: Animation
sign = 
  translate (always (0, 0))
         (withBorder (always blue) (always 6)
           (withPaint (always black)
              (rect (always 140) (always 20))))

test :: IO ()
test = writeFile "gridTest.svg" (svg 800 600 pic)