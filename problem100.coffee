{primeFactors} = require './primes'

a = 3
size = 4
while size < 1000000000000
	while a * (a - 1) * 2 <  size * (size - 1)
		a++
	while a * (a - 1) * 2 >  size * (size - 1)
		size++
	if a * (a - 1) * 2 ==  size * (size - 1)
		console.log a, a - 1, primeFactors(a), primeFactors(a - 1), size, size - 1, primeFactors(size), primeFactors(size - 1)
		size++
