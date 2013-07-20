permutate = (done, remaining, f)->
	if remaining.length == 0
		f done
	else
		i = 0
		l = remaining.length
		while i < l
			d = done[..]
			r = remaining[..]
			d.push(remaining[i])
			r.splice(i, 1)
			permutate(d, r, f)
			i++
	undefined
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


result = 0
verify = (n)->
	if n[0] == 0
		return
	i = 1
	while i < 8
		if (n[i] * 100 + n[i+1] * 10 + n[i+2]) % prime(i-1) != 0
			return
		i++
	console.log +n.map((v)-> "" + v).join('')
	result += +n.map((v)-> "" + v).join('')
	undefined

a = [1,2,3,4,5,6,7,8,9,0]
permutate([], a, verify)
console.log result