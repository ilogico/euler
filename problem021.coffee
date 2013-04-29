factorSum = (n)->
	sum = 1
	for i in [2...Math.sqrt(n)] when n % i == 0
		sum += i
		sum += n / i
	sum

b = []
s = 0
for i in [1...10000]
	a = factorSum i
	if i != a and i == factorSum a
		s += i
console.log s
