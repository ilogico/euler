# {totient, prefill} = require './primes'
# prefill 1000000
# sum = 0
# sum += totient(i) for i in[2..1000000]
# console.log sum

MAX = Math.pow(10,6)
totients = [0..MAX]
sum = 0
for i in [2..MAX]
	if totients[i] == i
		sum += totients[i] - 1
		j = i + i
		while j <= MAX
			totients[j] -= totients[j] / i
			j += i
	else
		sum += totients[i]
console.log sum