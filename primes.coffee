{binarySearch} = require "./utils"
primes = [2,3]

prefill = (n)->
	r = [true, true]
	l = n / 2
	i = 2
	while i <= l
		if not r[i]
			j = i + i
			while j <= n
				r[j] = true
				j += i
		i++
	primes = (p for comp, p in r when not comp)
	undefined

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
	l = 23 #Math.floor(Math.sqrt(n))
	i = 1
	p = 2
	while p <= l
		if n % p == 0
			return n == p
		p = prime(i)
		i++
	if n <= primes[primes.length - 1]
		return binarySearch(primes, n) > 0
	l = Math.floor(Math.sqrt(n))
	while p <= l
		if n % p == 0
			return false
		p = prime(i)
		i++
	true
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

totient = (n)->
	r = n
	i = 0
	p = 2
	while n != 1
		while n % p != 0
			i++
			p = prime(i)
		while n % p == 0
			n /= p
		r = r - r / p
	r

primeList = ->
	primes
module.exports =
	prefill: prefill
	prime: prime
	primal: primal
	primeFactors: primeFactors
	totient: totient
	primeList: primeList