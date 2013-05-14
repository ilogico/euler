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

permutateUntil = (done, remaining, f)->
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
			if permutateUntil(d, r, f)
				break
			else
				i++
		if i == l
			false
		else
			true

verify = (a)->
	n = +a.join('')
	if primal(n)
		console.log n
		true
	else
		false

arr = ("" + i for i in [9..1] by -1)
found = false
while arr.length and not found
	found = permutateUntil([], arr, verify)
	arr.shift()
undefined