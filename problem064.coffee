countPeriod = (n)->
	root = Math.sqrt(n)
	pseudo = Math.floor(root)
	if root == pseudo
		0
	else
		as = []
		cs = []
		i = 0
		count = 0
		a = pseudo
		b =	1
		c = n - a*a
		d = pseudo

		b = 1
		d = Math.floor((pseudo + a) / c)
		t = a
		a = d * c - a
		c = n - t*t
		while (i = as.indexOf(a)) < 0 or c != cs[i]
			as.push a
			cs.push c
			# console.log a, b, c, d
			b = c
			c = (n - a*a)/b
			d = Math.floor((pseudo + a) / c)
			a = (c*d - a)
			count++
		count

console.log countPeriod(23)
console.log countPeriod(2)
console.log countPeriod(3)
console.log countPeriod(5)
console.log countPeriod(6)
console.log countPeriod(7)
console.log countPeriod(8)
console.log countPeriod(10)
console.log countPeriod(11)
console.log countPeriod(12)
console.log countPeriod(13)

count = 0
for i in [1..10000]
	if countPeriod(i) % 2 != 0
		count++
console.log count