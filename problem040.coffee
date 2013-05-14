getDigit = (n)->
	i = 9
	count = 0
	d = 1
	while i*d < n
		count += i
		n -= i*d
		i *= 10
		d++
	count 	#numeros que estão para trás
	d 		#numero de digitos do numero
	i 		#numero de numeros com d digitos
	n 		#posição do dígito
	+('' + (Math.pow(10, d - 1) + Math.floor((n - 1)/d)))[(n-1)%d]

test = ->
	valid = 0
	invalid = 0
	testStr = ""
	for i in [1..1000]
		testStr += i
	console.log testStr[0...50]
	for val, idx in testStr
		if getDigit(idx + 1) == +val
			valid++
		else
			invalid++
	[valid, invalid]
console.log test()

result = 1
for i in [0..6]
	console.log  getDigit(Math.pow(10, i))
	result *= getDigit(Math.pow(10, i))
console.log result