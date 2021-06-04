
/// coll(x1,y1,x2,y2,x3,y3,x4,y4)
/// 1-2 first box, 3-4 second box

x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
x3 = argument4
y3 = argument5
x4 = argument6
y4 = argument7

return
	(
		(
			( x1 > x3 && x1 < x4 ) ||
			( x2 > x3 && x2 < x4 ) ||
			( x1 < x3 && x2 > x4 )
		) &&
		(
			( y1 >  y3 && y1 <  y4 ) ||
			( y2 >  y3 && y2 <  y4 ) ||
			( y1 <= y3 && y2 >= y4 )
		)
	)
