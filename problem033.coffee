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
	if r.length == 0 and n > 1
		r.push n
	r
hash = (n)->
	n.sort( (a,b)-> a-b ).join('.')
compress = (a)->
	o = {}
	o[val] = true for val in a
	key for key, v in o

hashDivision = (a,b)->
	a = primeFactors(a)
	b = primeFactors(b)
	a0 = []
	while a.length
		t = a.shift()
		idx = b.indexOf(t)
		if idx < 0
			a0.push(t)
		else
			b.splice(idx, 1)
	"#{hash(a0)}/#{hash(b)}"


numerator = 1
denominator = 1
for i in [1..9]
	j = i + 1
	while j < 10
		res = hashDivision(i, j)
		for k in [1..9] when k != i and k != j
			if hashDivision(k * 10 + i, j * 10 + k) == res
				numerator *= i
				denominator *= j
			if hashDivision(i * 10 + k, k * 10 + j) == res
				numerator *= i
				denominator *= j
		j++

console.log hashDivision(numerator, denominator).split('/')[1].split('.').reduce( ((pro, i)-> pro*i), 1)


