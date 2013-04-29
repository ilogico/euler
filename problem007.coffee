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
console.log prime 10000