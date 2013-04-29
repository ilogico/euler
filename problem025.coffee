tenK = 1000



n0 = [0]
n1 = [1]

count = 1
while n1.length <= 333
	count++

	t = n1[..]
	i = 0
	carry = 0
	while i < n0.length or carry
		val = n1[i] + carry
		if i < n0.length
			val += n0[i]
		if val >= tenK
			n1[i+1] or= 0
			carry = Math.floor(val / tenK)
			val %= tenK
		else
			carry = 0
		n1[i] = val
		i++
	n0 = t
n1.reverse()
n0.reverse()
str = n1.map (n) ->
	if n < 10
		'00' + n
	else if n < 100
		'0' + n
	else
		n
str = str.join('')
console.log str
console.log str.length
console.log count

