module Tardis where
import Animation

pic :: Animation

pic = 
      translate (always (400, 300))(
          rotate(spinner 5)(
            scale (cycleSmooth 1 [(0.25, 0.25) , (0.5, 0.5), (1,1)]) (
      tardisShape --tardis outline polygon
      --windows
      `plus`
      combine ([translate (always (100 + i, 110))
        (window) | i <- [0, 60]])   

      --door boxes
     `plus`
     combine ([translate (always (100, 160)) --this is the origin position for the first square
        (doorBox)])
     `plus` -- phone sign - have to do it separately as it's white
      translate (always (100, 160))
         (withBorder (always black) (always 5)
            (withPaint (always white)
               (rect (always 40) (always 40)))))))

tardisShape :: Animation
tardisShape =    --tardis lamp
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
      `plus` --main section with floor polygon
      withPaint (always blue)
         (polygon [(90, 100), (210, 100), (210, 310), 
                   (220, 310), (220, 330), (80, 330), 
                   (80, 310), (90, 310), (90, 100)])

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


test :: IO ()
test = writeFile "tardisTestv2.svg" (svg 800 600 pic)