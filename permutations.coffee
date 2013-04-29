factorials = [1]
factorial = (n)->
	if not factorials[n]
		factorials[n] = n * factorial(n-1)
	factorials[n]

arrangements = (n, p)->
	factorial(n)/factorial(p)

combinations = (n, p)->
	arrangements(n,p)/factorial(n-p)



permutate = (a, f)->
	l = a.length - 1
	count = []
	for v, i in a
		count.push l - i
	i = l
	while i >= 0
		# console.log 'inner', a
		if count[i] == 0
			if i == l
				f(a)
			else
				t = a[i]
				a[i] = a[i+1]
				a[i+1] = t
				count[i] = l - i
			i--
		else
			t = a[i]
			a[i] = a[i+1]
			a[i+1] = t
			count[i]--
			i++
	undefined

permutate ['a','b','c', 'd'], console.log