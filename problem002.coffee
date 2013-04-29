n0 = 0
n1 = 1
x = 0
while n1 <= 4000000
	x += n1 if n1 %2 == 0
	t = n1
	n1 += n0
	n0 = t
console.log x
