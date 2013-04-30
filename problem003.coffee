primes = [2]

nextPrime = ->
	l = primes.length
	candidate = primes[l - 1] + 1
	loop
		i = 0
		while i < l and candidate % primes[i] != 0
			i++
		if i == l
			primes.push candidate
			return
		else
			candidate++
	undefined

prime = (n)->
	while n >= primes.length
		nextPrime()
	primes[n]


biggestPrimeFactor = (n)->
	i = 0
	p = 1
	while n != 1
		p = prime(i)
		while n % p == 0
			n /= p
		i++
	p
console.log biggestPrimeFactor 600851475143


