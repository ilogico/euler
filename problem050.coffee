{prime, primal, prefill, primeList} = require './primes'

MAX = 1000000
prefill(MAX)
l = primeList().length - 1

i = 0
lmax = 1
p = 2
stuff = null
while i < l
	sum = 0
	j = 0
	while sum < MAX
		if j > lmax and primal(sum)
			lmax = j
			p = sum
			stuff = [i, j]
		sum += prime(j+i)
		j++
	i++
console.log p, lmax, stuff



