module Background where
import Animation


pic :: Animation
pic = 
    translate (always (0,0)) --background
       (withPaint (cycleSmooth 1 [(rgb 0 0 0.208), black])
           (rect (always 800) (always 600)))

    `plus` --vortex waves
    withBorder (cycleSmooth 1 [red, green, blue]) (always 5)
       (withoutPaint
          (combine
            [translate (cycleSmooth 1 [(300, 300), (300, 200), (500, 300), (500, 200)]) --move the origin
              (circle (repeatSmooth 0 [(0 + i, 1), (0 + j, 700)])) | i <- [0,0.25..1], j <- [0, 0.25.. 1]])) --change the values in i and j to change the vortex waves.
    -- `plus` --star
    -- translate (repeatSmooth (300, 150) [(0, (300, 150)), (2, (0, 0))])
    --   (scale (repeatSmooth (0.25, 0.25) [(0, (0.5, 0.5)), (2, (1,1))]) --make the star get bigger/expand
    --   (withPaint (always white)
    --     (circle (always 5))))
    `plus` 
    star
    -- combine (
    -- [translate (always (0, 0 + y))
    -- (star) | y <- [50, 150..350]])
    `plus`
    translate (cycleSmooth 1 [(600, 100), (700, 100), (650, 150),
                              (700, 150), (650, 200), (700, 200), 
                              (550, 300), (650, 250), (550, 250), 
                              (650, 175), (550, 175)])
    (lightning)
    `plus` doctorWho


-- star :: Animation
-- star = 
--   translucent (repeatSmooth 0 [(0, 0), (1, 1), (2.5, 1)])
--   (translate (repeatSmooth (300, 150) [(0, (300, 150)), (1, (300, 150)), (2.5, (-150,50))])
--   (scale (repeatSmooth (0.25, 0.25) [(0, (0.25, 0.25)),  (1, (0.25,0.25)), (2.5,(0.75, 0.75))])
--   (withPaint (always grey)
--          (polygon [(87.5,18.75),(94.75,40.25),(117.25, 40.25),(99.25,53.75), (105.75, 75.25),
--           (87.5, 62.5),(69.25,75.25),(75.75,53.75),(57.75,40.25), (80.25, 40.25)]))))

star :: Animation
star = 
  (combine
  [translucent (repeatSmooth 0 [(t1, 0), (t2, 1), (t3, 1)])
  (translate (repeatSmooth (x1, y1) [(t1, (x1, y1)), (t2, (x1, y1)), (t3, (x2,y2))])
  (scale (repeatSmooth (0.25, 0.25) [(t1, (0.25, 0.25)),  (t2, (0.25,0.25)), (t3,(0.75, 0.75))])
  (withPaint (always grey)
         (polygon [(87.5,18.75),(94.75,40.25),(117.25, 40.25),(99.25,53.75), (105.75, 75.25),
          (87.5, 62.5),(69.25,75.25),(75.75,53.75),(57.75,40.25), (80.25, 40.25)])))) 
  | (x1,y1,x2,y2,t1,t2,t3) <- starList ])

starList :: [(Length, Length, Length, Length, Length, Length, Length)]
starList = [(300, 150, -150, 150, 0, 1, 2.5),
            (300, 450, -150, 550, 2, 3, 4.5),
            (450, 150, 950, 50, 1.5, 2.5, 4),
            (450, 450, 550, 650, 1, 2, 3.5)]
--order is topleft, bottomleft, topright, bottomright

lightning :: Animation
lightning = 
  scale (always (1, 1.5))
  (translucent (repeatSteps 0 [(0.25, 1), (0.3, 0), (0.5, 1), (0.75, 0), (1.5, 1)])
  (withPaint (always yellow)
    (polygon [(10,10),(60,10),(30, 40),(60,40), (30, 80), 
              (60, 80), (-10, 140), (20, 90), (-10, 90), 
              (20, 50), (-10,50)])))

doctorWho :: Animation
doctorWho = 
  translucent (cycleSmooth 5 [0,0,0, 1])(
  translate (always (100, 50)) 
   (withBorder (always yellow) (always 5)
     (withoutPaint(letterD `plus` letterO 
      `plus` letterC `plus` letterT 
      `plus` translate (always (150, 0)) (letterO) 
      `plus` letterR `plus` letterW `plus` letterH
      `plus` translate (always (400, 0)) (letterO)))))


letterD :: Animation
letterD = 
  polygon [(10, 0),(40, 0), (50, 25), 
           (45, 40), (40, 50), (20, 50), 
           (20, 25), (30,25), (0, 25), 
           (20,25), (20, 0)]

letterO :: Animation
letterO = 
  translate (always (75, 25))(
  (ellipse (always 15) (always 25)))

letterC :: Animation
letterC = 
  translate (always (105, 0))
  (polygon [(40, 0),(30, 2.5), (20, 5), 
            (10, 7.5),(0, 25), (10, 42.5), 
            (20, 45), (30, 47.5), (40, 50), 
            (30, 47.5), (20,45), (10, 42.5), 
            (0,25), (10, 7.5), (20, 5), 
            (30, 2.5), (40,0)])

letterT :: Animation
letterT = 
  translate (always (150, 0))
  (polygon [(10, 0),(40, 0), (25,0), (25, 50), (25,0)])

letterR :: Animation
letterR = 
  translate (always (255, 0))
  (polygon [(0, 30),(0, 50), (0, 0), 
            (10, 0), (20, 2.5), (30, 5), 
            (32.5, 7.5), (35, 10), (35, 15), 
            (0,30), (35, 50)])

letterW :: Animation
letterW = 
  translate (always (350, 0))
  (polygon [(0, 0),(15, 50), (25,25), 
           (35, 50), (50, 0), (35,50), 
           (25,25), (15, 50)])

letterH :: Animation
letterH = 
  translate (always (400,0))
 (polygon [(10, 25),(10, 0), (10, 60), 
           (10, 25), (40, 25), (40, -10),
           (40, 50), (40,25), (120, 25)])

    -- translate (cycleSmooth 1 [(300, 300), (300, 200), (500, 300), (500, 200), (400, 300)])
    --   (withBorder (always yellow) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(2.025, 1), (3.025, 600)])))
    --   `plus`
    --   (withBorder (always purple) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(1.85, 1), (2.85, 500)])))
    --   `plus`
    --   (withBorder (always green) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(1.65, 1), (2.65, 500)])))
    --   `plus`
    --   (withBorder (always lime) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(1.45, 1), (2.45, 500)])))
    --   `plus`
    --   (withBorder (always red) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(1.25, 1), (2.25, 500)])))
    --   `plus`
    --   (withBorder (always blue) (always 3)
    --      (withoutPaint
    --         (circle (repeatSmooth 1 [(1, 10), (2, 500)])))))))))

test :: IO ()
test = writeFile "testbg.svg" (svg 800 600 pic)