{prime, primal} = require './primes'


anagram = (x, y, z)->
	x = ("" + x).split('')
	y = ("" + y).split('')
	z = ("" + z).split('')
	return false for i in x when not (i in y and i in z)
	return false for i in y when not (i in x and i in z)
	return false for i in z when not (i in x and i in y)
	true


i = 1
p = 2
while p < 1000
	p = prime(i++)

while p < 10000
	j = i
	q = prime(j++)
	while q < 10000
		r = q + (q-p)
		if primal(r) and r < 10000 and anagram(p,q,r)
			console.log p, q, r
		q = prime(j++)
	p = prime(i++)
undefined