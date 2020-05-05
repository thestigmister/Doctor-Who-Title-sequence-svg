module Tardis where
import Animation

pic :: Animation

pic = 
   --translate (cycleSmooth 1 [(-200, -100), (0, -100), (200, 100), (0, 100), (-200, 100)]) (
   translate (always (400, 300))(
      rotate (spinner 5)( --make the tardis spin
        scale (cycleSmooth 1 [(0.25, 0.25) , (0.5, 0.5), (1,1)]) (
        translate (always (-400, -300))( --trying to keep it in the origin
          translate (cycleSmooth 1 [(-200, -100), (0, -100), (200, 100), (0, 100), (-200, 100)]) ( --the points it moves to (bumps)
   --tardis lamp
    withBorder (always blue) (always 5)
        (withPaint (cycleSmooth 2 [yellow, white])
            (polygon [(390, 160), (410, 160), (412, 162), (412, 180), (388, 180), (388, 162)]))
      `plus` --police box sign rectangle
      translate (always (330, 180))
         (withBorder (always blue) (always 6)
           (withPaint (always black)
              (rect (always 140) (always 20))))
      `plus` -- yellow circle fading around lamp
      translate (always (400, 170))
         (withGenPaint (always yellow) (cycleSmooth 0.75 [0, 1])
           (circle (always 20)))

      `plus` --main section with floor polygon
      withPaint (always blue)
         (polygon [(340, 200), (460, 200), (460, 410), 
                   (470, 410), (470, 430), (330, 430), 
                   (330, 410), (340, 410), (340, 200)])

      -- windows and boxes
      --left window pieces
      `plus`
      withBorder (always black) (always 5)
         (withPaint (always white)
              (combine
                 [translate (always (350 + i , 210 +j))
                 (rect (always 13.5) (always 20)) | i <- [0,13.5,27], j <- [0,20]]))

      --right window pieces
      `plus`
      withBorder (always black) (always 5)
         (withPaint (always white)
              (combine
                 [translate (always (410 + i , 210 +j))
                 (rect (always 13.5) (always 20)) | i <- [0,13.5,27], j <- [0,20]]))


      `plus` -- phone sign
      translate (always (350, 260))
         (withBorder (always black) (always 5)
            (withPaint (always white)
               (rect (always 40) (always 40))))
       `plus` -- left third box
      translate (always (350, 310))
         (withBorder (always black) (always 5)
            (withPaint (always blue)
               (rect (always 40) (always 40))))
      `plus` -- left bottom
      translate (always (350, 360))
         (withBorder (always black) (always 5)
            (withPaint (always blue)
               (rect (always 40) (always 40))))
      `plus` -- second right box
      translate (always (410, 260))
         (withBorder (always black) (always 5)
            (withPaint (always blue)
               (rect (always 40) (always 40))))
      `plus` -- third right box
      translate (always (410, 310))
         (withBorder (always black) (always 5)
            (withPaint (always blue)
               (rect (always 40) (always 40))))
      `plus` -- bottom right box
      translate (always (410, 360))
         (withBorder (always black) (always 5)
            (withPaint (always blue)
               (rect (always 40) (always 40)))))))))





test :: IO ()
test = writeFile "tardisTest.svg" (svg 800 600 pic)