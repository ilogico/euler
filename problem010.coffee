{prime, prefill} = require './primes'
MAX = 2000000
prefill MAX
current = 0
i = 0
sum = 0
while current < MAX
	sum += current
	current = prime(i)
	i++
console.log sum
