# count = 0
# for i in [2..100]
# 	count += 99
# 	j = i*i
# 	c = 2
# 	while j <= 100
# 		count += 1 - Math.floor(100 / c)
# 		j *= i
# 		c++
# console.log count


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
hash = (n)->
	n.sort( (a,b)-> a-b ).join('.')
bruteForce = ->
	vals = {}
	for i in [2..100]
		f = primeFactors(i)
		for j in [2..100]
			temp = []
			for factor in f
				for a in [0...j]
					temp.push factor
			vals[hash(temp)] = true
	r = (v for k, v of vals)
	r.length
console.log bruteForce()
console.log hash(primeFactors(18))