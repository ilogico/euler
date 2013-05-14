shitDigits = (n)->
	count = 0
	r = []
	buff = []
	d = 10
	while d != 0
		if d in buff
			return count
		buff.push d
		count++
		if n > d
			r.push 0
			d *= 10
		else
			i = 1
			while i * n <= d
				i++
			r.push(i - 1)
			d -= (i - 1)*n
			d *= 10
	0

max = 0
d = 0
for i in [1...1000] 
	cand = shitDigits(i)
	if cand > max
		max = cand
		d = i
console.log d, max