digits = (n, base)->
	d = 1
	while n >= base
		n = Math.floor(n / base)
		d++
	d

palindromic = (n, base)->
	d = digits(n, base)
	limit = Math.floor(d / 2)
	left = Math.pow(base, d - 1)
	remainderLeft = remainderRight = n
	i = 0
	while i < limit
		l = Math.floor(remainderLeft / left)
		r = remainderRight % base
		if l == r
			i++
			remainderLeft -= l * left
			left /= base
			remainderRight = Math.floor(remainderRight/base)
		else
			break
	if i == limit
		true
	else
		false


sum = 0
sum += i for i in [1...1000000] when palindromic(i,10) and palindromic(i,2)
console.log sum


