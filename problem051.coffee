{prime, primal} = require './primes'
{SelectFrom} = require './permutations'

changeDigits = (ns, pos)->
	res = []
	i = 0
	if pos[0] == 0
		i = 1
	while i < 10
		for j in pos
			ns = ns[0...i] + j + ns[(i+1)..]
			if primal(+ns)
				res.push +ns
		i++
	res



r = []
i = 0
while r.length < 8
	p = "" + prime(i)
	j = 1
	l = p.length
	while j < l
		selector = new SelectFrom(l, j)
		sel = selector.next()
		while sel
			cand = changeDigits(p, sel)
			if cand.length > r
				console.log cand, p, cand.length
				r = cand
			sel = selector.next()
		j++
	i++
console.log r
