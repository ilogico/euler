{primeFactors} = require './primes'
{compress} = require './sets'


i = 1
j = 0
while j < 4
	if compress(primeFactors(i+j)).length == 4
		j++
	else
		i = i + j + 1
		j = 0

console.log i



