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


i = 0
p = 2
count = 0

while p < 1000000
	str = "" + p
	digits = str.length
	a = str.split('')
	j = 1
	while j < digits
		a.unshift(a.pop())
		if primal(+a.join(''))
			j++
		else
			break
	if j == digits
		console.log p
		count++
	i++
	p = prime(i)
console.log count

