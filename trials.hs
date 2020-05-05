module Trials where
import Animation

picture :: Animation
picture = triangle `plus` triangles

background :: Animation
background = withPaint (cycleSmooth 5 [grey, teal, grey]) (rect (always 800) (always 600))

triangle :: Animation
triangle = polygon ([(200, 500), (400, 100), (600, 500)])

-- triangle2 :: Animation
-- triangle2 = withPaint (always teal) (polygon ([(300, 300), (400, 500), (500, 300)])) --biggest to smallest
--             -- `plus`
--             -- withPaint (always teal) (polygon ([(350, 200), (400, 300), (450, 200)]))
--             -- `plus`
--             -- withPaint (always teal) (polygon ([(375, 150), (400, 200), (425, 150)]))
--             -- `plus`
--             -- withPaint (always teal) (polygon ([(387.5, 125), (400, 150), (412.5, 125)]))
--             -- `plus`
--             -- withPaint (always teal) (polygon ([(394.75, 112.5), (400, 125), (406.25, 112.5)]))

triangles :: Animation
triangles = 
            withPaint (always teal)
             (combine
             	[translucent (cycleSmooth 3 [t1, t2])
                (polygon ([(x1, y1), (x2, y2), (x3, y3)]))
                   | (x1, y1, x2, y2, x3, y3, t1, t2) <- list])



           -- withPaint (always teal)
           --  (combine
           --  	[translate (always (0, 0 - y))
           --  	   --(scale (always (s, s))
           --  	      (polygon ([(300, 300), (400, 500), (500, 300)]))--) 
           --  	                | y <- [100,50,25,12.5] ]) --, s <- [1,0.75..0.25]])        

list :: [(Length, Length, Length, Length, Length, Length, Length, Length)]
list = [(300, 300, 400, 500, 500, 300, 1, 0), (350, 200, 400, 300, 450, 200, 1, 0), (375, 150, 400, 200, 425, 150, 1, 0),
        (387.5, 125, 400, 150, 412.5, 125, 1, 0), (394.75, 112.5, 400, 125, 406.25, 112.5, 1, 0)]

test :: IO ()
test = writeFile "trials.svg" (svg 800 600 picture)