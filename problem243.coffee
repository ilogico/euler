{prime, primeFactors, totient} = require './primes'

i = 0
t = 1
r = 1
while t * 94744 >= (r-1) * 15499

	p = prime(i++)
	r *= p
	t = totient(r)
console.log r, t, prime(i-1)

r /= p
incr = r
i = 1
t = totient r
while t * 94744 >= (r-1) * 15499
	r += incr
	t = totient(r)
console.log r, t, t/r
