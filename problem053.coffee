factorials = [1]
factorial = (n)->
	if not factorials[n]
		factorials[n] = n * factorial(n-1)
	factorials[n]

arrangements = (n, p)->
	factorial(n)/factorial(p)

combinations = (n, p)->
	arrangements(n,p)/factorial(n-p)

count = 0
for i in [1..100]
	count++ for j in [0..i] when combinations(i, j) > 1000000
console.log count
