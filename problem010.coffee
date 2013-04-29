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

current = 0
i = 0
sum = 0
while current < 2000000
	sum += current
	current = prime(i)
	i++
console.log sum
