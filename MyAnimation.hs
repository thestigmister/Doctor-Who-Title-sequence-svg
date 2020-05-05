module MyAnimation where
import Animation

picture :: Animation
picture = vortex `plus` star `plus` tardis `plus` logo

tardis :: Animation --Combining the aspects of the TARDIS together
tardis = 
      translucent (cycleSmooth 1 [0.5, 1, 0]) 
        (translate (always (400, 300))
         (rotate(spinner 5)
            (scale (cycleSmooth 1 [(0.25, 0.25), (0.5, 0.5), (1, 1)])
              (tardisShape 
      `plus`
      combine ([translate (always (100 + i, 110))
        (window) | i <- [0, 60]])   
     `plus`
      combine ([translate (always (100, 160))
        (doorBox)])
     `plus`
      translate (always (100, 160))
        (withBorder (always black) (always 5)
          (withPaint (always white)
            (rect (always 40) (always 40))))))))

tardisShape :: Animation
tardisShape = --Building the outlining shape of the TARDIS box   
      withBorder (always blue) (always 5) --tardis lamp
          (withPaint (cycleSmooth 2 [yellow, white])
              (polygon [(140, 60), (160, 60), (162, 62), (162, 80), (138, 80), (138, 62)]))
      `plus` --Police box sign rectangle
      translate (always (80, 80))
          (withBorder (always blue) (always 6)
              (withPaint (always black)
                  (rect (always 140) (always 20))))
      `plus` sign --Wording on sign
      `plus` --Yellow circle fading around lamp
      translate (always (150, 70))
          (withGenPaint (always yellow) (cycleSmooth 0.75 [0, 1])
              (circle (always 20)))
      `plus` --Main section with floor polygon
      withPaint (always blue)
        (polygon [(90, 100), (210, 100), (210, 310), 
                  (220, 310), (220, 330), (80, 330), 
                  (80, 310), (90, 310), (90, 100)])
      

--Separate definitions for other inside components of the TARDIS such as the Windows and boxes
window :: Animation --Separate definition for a Window
window = withBorder (always black) (always 5)
          (withPaint (always white)
            (combine
              [translate (always (0 + i, 0 + j)) 
                (rect (always 13.5) (always 20)) | i <- [0, 13.5, 27], j <- [0, 20]]))

doorBox :: Animation -- Separate definition for the blue door boxes.
doorBox = withBorder (always black) (always 5)
            (withPaint (always blue)
              (combine
                [translate (always (0 + i, 0 + j)) 
                  (rect (always 40) (always 40)) | i <- [0, 60], j <- [0, 50..100]]))

--Background aspects
vortex :: Animation
vortex = 
      translate (always (0, 0)) --The background
        (withPaint (always (rgb 0 0 0.208))
          (rect (always 800) (always 600)))
      `plus` --Vortex waves
      withBorder (cycleSmooth 1 [red, green, blue, fuchsia]) (always 5)
        (withoutPaint
          (combine
            [translate (cycleSmooth 1 [(300, 300), (300, 200), (500, 300), (500, 200), (400, 300)])
              (circle (repeatSmooth 1 [(1 + i, 1), (2 + j, 700)])) 
                       | i <- [0, 0.25..1.025], j <- [0, 0.25..1.025]]))
      `plus`
      translate --Moving the lightning bolt within the frame
        (cycleSmooth 0.5 [(600, 100), (700, 100), (650, 150),
                          (700, 150), (650, 200), (700, 200), 
                          (550, 300), (650, 250), (550, 250), 
                          (650, 175), (550, 175)])
          (lightning)

lightning :: Animation --Lightning bolt
lightning = translucent (onceSteps 0 [(0, 0), (0.75, 1)]) --Delays lightning strike at beginning
              (scale (always (1, 1.5))
                (translucent (repeatSteps 0 [(0.25, 1), (0.3, 0), (0.5, 1), (0.75, 0), (1.5, 1)])
                  (withPaint (always yellow)
                    (polygon [(10, 10), (60, 10), (30, 40), (60, 40), (30, 80), 
                              (60, 80), (-10, 140), (20, 90), (-10, 90), 
                              (20, 50), (-10, 50)]))))

star :: Animation --Star shape and movement
star = (combine
        [translucent (repeatSmooth 0 [(t1, 0), (t2, 1), (t3, 1)])
          (translate (repeatSmooth (x1, y1) [(t1, (x1, y1)), (t2, (x1, y1)), (t3, (x2,y2))])
            (scale (repeatSmooth (0.25, 0.25) [(t1, (0.25, 0.25)), (t2, (0.25, 0.25)), (t3,(0.75, 0.75))])
              (withPaint (always white)
                (polygon [(87.5, 18.75), (94.75, 40.25), (117.25, 40.25), 
                          (99.25, 53.75), (105.75, 75.25), (87.5, 62.5), 
                          (69.25, 75.25), (75.75, 53.75), (57.75, 40.25), 
                          (80.25, 40.25)])))) 
                          | (x1, y1, x2, y2, t1, t2, t3) <- starList])
--Positions and timing for each star
starList :: [(Length, Length, Length, Length, Length, Length, Length)] 
starList = [(300, 150, -150, 150, 0, 1, 2.5),
            (300, 450, -150, 550, 2, 3, 4.5),
            (450, 150, 950, 50, 1.5, 2.5, 4),
            (450, 450, 550, 650, 1, 2, 3.5)]
          --order is topleft, bottomleft, topright, bottomright, time1, time2, time3

--Logo and lettering
logo :: Animation --Doctor Who Logo
logo = translucent (cycleSmooth 5 [0, 0, 0, 1])
        (translate (always (100, 250)) 
          (scale (repeatSmooth (1, 1) [(0, (1, 1)), (4.5, (1, 1)), (10, (4,4))])
            (translate (repeatSmooth (0, 0) [(0, (0, 0)), (4.5, (0, 0)), (7.5, (-250, -150)), (10, (-300, -200))]) 
              (rotate (repeatSmooth 0 [(0, 0), (4.5, 0), (10, 90)])
                (withBorder (always yellow) (always 5)
                  (withoutPaint
                    (combine 
                      [translate (always (x, 0)) (j) | (j, x) <- logoPosList])))))))

logoPosList :: [(Animation, Length)] --Setting positions for each letter in the word.
logoPosList = [(letterD, 50), (letterO, 125), (letterC, 150),
               (letterT, 190), (letterO, 250), (letterR, 275),
               (letterW, 350), (letterH, 400), (letterO, 475)]

--Each letter
sign :: Animation
sign = translucent (always 0.5) 
        (translate (always (80, 80))
          (withBorder (always white) (always 2)
            (combine
              [translate (always (x, 0)) (j) | (j, x) <- signPosList])))

signPosList :: [(Animation, Length)]
signPosList = [(letterP, 0), (smallO, 15), (letterL, 30), 
               (letterI, 40), (smallC, 45), (letterE, 57.5),
               (letterB, 100), (smallO, 110), (letterX, 125)]

--Each letter
letterD :: Animation
letterD = polygon [(10, 0), (40, 0), (50, 25), 
                   (45, 40), (40, 50), (20, 50), 
                   (20, 25), (30,25), (0, 25), 
                   (20, 25), (20, 0)]

letterO :: Animation
letterO = translate (always (0, 25))
            (ellipse (always 15) (always 25))

letterC :: Animation
letterC = polygon [(40, 0), (30, 2.5), (20, 5), 
                   (10, 7.5), (0, 25), (10, 42.5), 
                   (20, 45), (30, 47.5), (40, 50), 
                   (30, 47.5), (20,45), (10, 42.5), 
                   (0, 25), (10, 7.5), (20, 5), 
                   (30, 2.5), (40, 0)]

letterT :: Animation
letterT = polygon [(10, 0), (40, 0), (25, 0), 
                   (25, 50), (25, 0)]

letterR :: Animation
letterR = polygon [(0, 30), (0, 50), (0, 0), 
                   (10, 0), (20, 2.5), (30, 5), 
                   (32.5, 7.5), (35, 10), (35, 15), 
                   (0, 30), (35, 50)]

letterW :: Animation
letterW = polygon [(0, 0), (15, 50), (25, 25), 
                   (35, 50), (50, 0), (35, 50), 
                   (25, 25), (15, 50)]

letterH :: Animation
letterH = polygon [(10, 25), (10, 0), (10, 60), 
                   (10, 25), (40, 25), (40, -10),
                   (40, 50), (40, 25), (120, 25)]

letterP :: Animation
letterP = polygon [(10, 15), (10, 5), (12.5, 5),
                   (15, 7.5), (12.5, 10), (10, 10)]

smallO :: Animation
smallO = withBorder (always white) (always 10)
          (translate (always (7.5, 5))
            (scale (always (0.2, 0.2))
              (letterO)))

letterL :: Animation
letterL = polygon [(0, 4), (0, 14), (5, 14), (0, 14)]

letterI :: Animation
letterI = polygon [(0, 4), (0, 15)]

smallC :: Animation
smallC = withBorder (always white) (always 10)
          (translate (always (0, 5))
            (scale (always (0.2, 0.2))
              (letterC)))

letterE :: Animation
letterE = polygon [(0, 5.5), (7.5, 5.5), (0, 5.5), 
                   (0, 10), (5, 10), (0, 10), 
                   (0, 14.5), (7.5, 14.5), (0, 14.5)]

letterB :: Animation
letterB = polygon [(0, 5), (5, 5), (7.5, 6.5), 
                   (7.5, 7.5), (5, 10), (0, 10),
                   (0, 10), (5, 10), (7.5, 11.5), 
                   (7.5, 12.5), (5, 15), (0, 15)]

letterX :: Animation
letterX = polygon [(0, 5), (10, 15), (5, 10), 
                   (0, 15), (10, 5), (5, 10)]