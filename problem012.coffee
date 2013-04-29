primes = [2,3]

nextPrime = ->
	l = primes.length
	candidate = primes[l - 1] + 2
	loop
		i = 0
		while i < l and candidate % primes[i] != 0
			p = primes[i]
			if p*p > candidate
				primes.push candidate
				return
			i++
		if i == l
			primes.push candidate
			return
		else
			candidate += 2
	undefined

prime = (n)->
	while n >= primes.length
		nextPrime()
	primes[n]


class Triangle
	constructor: ->
		@n = 1
		@value = 1
	next: ->
		@n++
		@value += @n

primeFactors = (n)->
	r = []
	i = 0
	p = 2
	while n != 1
		while n % p != 0
			i++
			p = prime(i)
		n /= p
		r.push p
	r

groupAndCount = (a)->
	c = {}
	for i in a
		c[i] or= 0
		c[i]++
	r = []
	(v for _k, v of c).sort()
mem = {}
hash = (a,n)->
	a.join('.') + ":#{n}"

combinateV2 = (a, pos, n)->
	h = hash(a[0...pos].sort(),n)
	pos--
	if !mem[h]?
		if n == 0
			mem[h] = 1
		else if n < 0 or pos == -1
			mem[h] = 0
		else
			k = a[pos]
			l = if k < n then k else n
			res = 0
			for i in [0..l]
				res += combinateV2(a, pos, n - i)
			mem[h] = res
	mem[h]

combinate = (a, pos, n)->
	pos--
	if n == 0
		1
	else if n < 0 or pos == -1
		0
	else
		k = a[pos]
		l = if k < n then k else n
		res = 0
		for i in [0..l]
			res += combinate(a, pos, n - i)
		res


findTheStuff = ->
	t = new Triangle()
	loop
		candidate = t.next()
		factors = groupAndCount(primeFactors(candidate))
		n = 0
		n += i for i in factors
		total = 0
		for i in [0..n]
			total += combinate(factors, factors.length, i)
		if total >= 500
			return candidate
console.log findTheStuff()


