{prime, primal} = require('./primes')

i = 9
loop
	if not primal(i)
		j = 0
		p = 2
		while p < i
			k = 1
			s = 1
			while p + 2*s < i
				k++
				s = k*k
			if i == p + 2*s
				break
			j++
			p = prime(j)
		if p > i
			console.log i
			break
	i += 2

