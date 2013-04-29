primes = [2,3]

nextPrime = ->
	l = primes.length
	candidate = primes[l - 1] + 2
	candsqrt = Math.sqrt(candidate)
	loop
		i = 0
		while i < l and candidate % primes[i] != 0
			p = primes[i]
			if p > candsqrt
				primes.push candidate
				return
			i++
		if i == l
			primes.push candidate
			return
		else
			candidate += 2
			candsqrt = Math.sqrt(candidate)
	undefined

prime = (n)->
	while n >= primes.length
		nextPrime()
	primes[n]

primal = (n)->
	if n < 2
		return false
	l = Math.floor(Math.sqrt(n))
	i = 1
	p = 2
	while p <= l
		if n % p == 0 and n != p
			return false
		p = prime(i)
		i++
	true


prefixes = [[2, 3, 5, 7]]
suffixes = [[2, 3, 5, 7]]

calcPrefix = (n)->
	if prefixes[n - 1]
		prefixes[n - 1]
	else
		previous = calcPrefix(n - 1)
		r = []
		for pref in previous
			s = pref * 10
			for i in [1..9] by 2
				t = s + i
				if primal(t)
					r.push t
		prefixes.push r
		r

calcSuffix = (n)->
	if suffixes[n - 1]
		suffixes[n - 1]
	else
		previous = calcSuffix(n - 1)
		r = []
		for suf in previous
			for i in [1..9]
				t = Math.pow(10, n - 1) * i + suf
				if primal(t)
					r.push t
		suffixes.push r
		r


sum = 0
n = 2
p = calcPrefix(n)
s = calcSuffix(n)
while p.length and s.length
	sum += i for i in p when i in s
	n++
	p = calcPrefix(n)
	s = calcSuffix(n)
console.log sum







