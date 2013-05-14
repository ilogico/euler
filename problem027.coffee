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




max = 0
candidates = null
for a in [-999..999]
	for b in [-999..999]
		if !primal(max*max + a*max + b)
			continue
		n = 0
		while primal(n*n + a*n + b)
			n++
		if n > max
			max = n
			candidates = [a,b]
		#console.log max, a, b
console.log candidates[0]*candidates[1]
console.log max