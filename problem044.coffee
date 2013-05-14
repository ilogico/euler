pentagonals = []

for i in [1..10000]
	pentagonals.push i*(3*i - 1)/2

memo = {}
memo[i] = true for i in pentagonals
l = pentagonals.length
for n, i in pentagonals
	j = i + 1
	while j < l
		p = pentagonals[j]
		if memo[p+n] and memo[p-n]
			console.log p-n
		j++
undefined
