findTriplet = ->
	for a in [1..333]
		for b in [(a+1)..((1000-a)/2)]
			c = 1000 - a - b
			if a*a + b*b == c*c
				return [a,b,c]
	undefined
t = findTriplet()
console.log t
console.log t[0]*t[1]*t[2]
