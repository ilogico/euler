ti = 285
pi = 165
hi = 143
t = p = h = 40755

loop
	hi++
	h = hi * (hi*2 - 1)
	while p < h
		pi++
		p = pi * (pi*3 - 1) / 2
	if p != h
		continue
	while t < h
		ti++
		t += ti
	if t == h
		break
console.log h
