{prime, totient, prefill, primeFactors} = require './primes'

prefill(1000000)
t = 2
i = 0
while t < 1000000
	i++
	t *= prime(i)

p = prime(i)
t /= p
console.log t, primeFactors(t)
