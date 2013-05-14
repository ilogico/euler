collatzLengths = {"1":1}

collLen = (n)->
	if !collatzLengths[n]?
		collatzLengths[n] =
			if n % 2 == 0
				1 + collLen(n/2)
			else
				1 + collLen(3*n+1)
	collatzLengths[n]

candidate = 0
max = 0

for i in [1...1000000]
	t = collLen(i)
	if t > max
		max = t
		candidate = i
console.log candidate

