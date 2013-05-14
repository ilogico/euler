{prime} = require "./primes"
biggestPrimeFactor = (n)->
	i = 0
	p = 1
	while n != 1 and p*p <= n
		p = prime(i)
		while n % p == 0
			n /= p
		i++
	p
console.log biggestPrimeFactor 600851475143


