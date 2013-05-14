
million = 1000000
factorBigNum = (a, n)->
	i = 0
	carry = 0
	while i < a.length
		t = n * a[i] + carry
		if t > million
			a[i+1] or= 0
			carry = Math.floor(t / million)
			t %= million
		else
			carry = 0
		a[i] = t
		i++
	a

bigNum = [1]

for i in [1..100]
	factorBigNum bigNum, i

res = 0
for num in bigNum
	a = ('' + num).split('').map (i)-> +i
	res += digit for digit in a
console.log res
