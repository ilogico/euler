
million = 1000000
doubleBigNum = (a)->
	i = 0
	carry = 0
	while i < a.length
		t = 2 * a[i] + carry
		if t > million
			t -= million
			a[i+1] or= 0
			carry = 1
		else
			carry = 0
		a[i] = t
		i++
	a

bigNum = [1]

for i in [1..1000]
	doubleBigNum bigNum

res = 0
for num in bigNum
	a = ('' + num).split('').map (i)-> +i
	res += digit for digit in a
console.log res

