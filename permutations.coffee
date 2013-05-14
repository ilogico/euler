factorials = [1]
factorial = (n)->
	if not factorials[n]
		factorials[n] = n * factorial(n-1)
	factorials[n]

arrangements = (n, p)->
	factorial(n)/factorial(p)

combinations = (n, p)->
	arrangements(n,p)/factorial(n-p)


