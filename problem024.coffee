
factorial = (n)->
	r = 1
	i = 1
	while i <= n
		r *= i
		i++
	r



findPermutation = (a, n)->
	n %= factorial(a.length)
	i = 1
	pos = 0
	result = []
	l = a.length
	while i <= l
		order = factorial(l - i)
		idx = Math.floor(n / order)
		result.push a[idx]
		a.splice idx, 1
		n %= order
		i++
	result

arr = "0123456789".split('')
console.log arr
console.log findPermutation(arr, 1000000 - 1).join('')
