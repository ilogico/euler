pandigital = (n)->
	return false if n.length != 9
	return false for i in [1..9] when ("" + i) not in n
	true

max = 0
l = 10000
i = 1
while i < l
	j = 2
	val = "" + i
	while j < 10 and val.length < 10
		if pandigital(val) and +val > max
			max = +val
			console.log max
		val += j*i
		j++
	i++