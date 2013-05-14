{prime} = require './primes'

reduceFraction = (fraction)->
	i = 0
	p = 2
	l = p*p
	while l <= fraction.numerator and l <= fraction.denominator
		while fraction.numerator % p == 0 and fraction.denominator % p == 0
			fraction.numerator /= p
			fraction.denominator /= p
		i++
		p = prime(i)
		l = p*p
	fraction
countDigits = (n)-> ("" + n).length
countStuff = (n)->
	root = Math.sqrt(n)
	pseudo = Math.floor(root)
	if root == pseudo
		0
	else
		as = []
		cs = []
		i = 0
		count = 0
		res = 0
		a = pseudo
		b =	1
		c = n - a*a
		d = pseudo
		fraction = {numerator: pseudo, denominator: 1}

		b = 1
		d = Math.floor((pseudo + a) / c)
		t = a
		a = d * c - a
		c = n - t*t
		while count < 1000#(i = as.indexOf(a)) < 0 or c != cs[i]
			temp = fraction.denominator
			fraction.denominator *= d
			fraction.numerator *= d
			fraction.numerator += temp
			reduceFraction fraction
			console.log fraction
			if countDigits(fraction.numerator) > countDigits(fraction.denominator)
				res++
			b = c
			c = (n - a*a)/b
			d = Math.floor((pseudo + a) / c)
			a = (c*d - a)
			count++
		res
console.log countStuff(2)