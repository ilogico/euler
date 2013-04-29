max = 0
maxp = 0
for p in [1..1000]
	count = 0
	a = 1
	limit = Math.floor(p / 2)
	while a <= limit
		b = a
		blimit = p - a
		while b < blimit
			c = p - a - b
			if a*a + b*b == c*c
				count++
			b++
		a++
	if p == 120
		console.log p, count
	if count > max
		max = count
		maxp = p
console.log "result", maxp, max

