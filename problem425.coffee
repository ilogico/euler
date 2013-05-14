{prime, prefill, primal} = require './primes'

MAX = Math.pow(10, 6)
paths =
	'2': 2
	'3': 2
	'5': 2
	'7': 2
connect = (n)->
	connection = 0 #+Infinity
	toConnect = []
	str = "" + n

	if str[1] != '0'
		bellow = str[1..]
		if paths[bellow]
			# connection = Math.min(Math.max(+bellow, paths[bellow]), connection)
			connection or= bellow
		else if primal(+bellow)
			toConnect.push +bellow
	i = str.length - 1
	while i > 0
		prefix = str[0...i]
		suffix = str[(i+1)...]
		digit = +str[i]
		j = 0
		while j < 10 and j < digit
			num = prefix + j + suffix
			if paths[num]
				# connection = Math.min(connection, Math.max(+num, paths[num]))
				connection or= +num
			else if primal(+num)
				toConnect.push +num
			j++
		i--
	suffix = str[1..]
	digit = +str[0]
	i = 1
	while i < 10 and i < digit
		num = "" + i + suffix
		if paths[num]
			# connection = Math.min(connection, Math.max(+num, paths[num]))
			connection or = +num

		else if primal(+num)
			toConnect.push +num
		i++
	if connection
		paths[n] = connection
		for i in toConnect
			paths[i] = n
		for i in toConnect
			reconnect(i)
	connection or Infinity
reconnect = (n)->
	toConnect = []
	str = "" + n
	if str[1] != '0'
		bellow = str[1..]
		if (not paths[bellow]) and primal(+bellow)
			toConnect.push +bellow
	i = str.length - 1
	while i > 0
		prefix = str[0...i]
		suffix = str[(i+1)...]
		digit = +str[i]
		j = 0
		while j < 10
			num = prefix + j + suffix
			if (not paths[num]) and primal(+num)
				toConnect.push +num
			j++
		i--
	suffix = str[1..]
	digit = +str[0]
	i = 1
	while i < 10
		num = "" + i + suffix
		if (not paths[num]) and primal(+num)
			toConnect.push +num
		i++
	if n < MAX
		i = 1
		while i < 10
			num = "" + i + str
			if (not paths[num]) and primal(+num)
				toConnect.push +num
			i++
	connection = paths[n]
	for i in toConnect when i < connection
		paths[i] = connection
	for i in toConnect when i < connection
		reconnect(i)
countStuff = (l)->
	i = 1
	p = 3
	sum = 0
	while p < l
		if connect(p) > p
			sum += p
		i++
		p = prime(i)
	sum
prefill(MAX*10)
console.log 'Go'
console.log countStuff(Math.pow(10,7))

# console.log countStuff(10000)
# console.log countStuff(10000)
# sum = 0
# sum += +k for k, v of paths when +k < v and +k < 10000
# console.log sum
# console.log countStuff 1000

# paths =
# 	'2': 2
# 	'3': 2
# 	'5': 2
# 	'7': 2
# console.log countStuff(1000)
# paths =
# 	'2': 2
# 	'3': 2
# 	'5': 2
# 	'7': 2
# console.log countStuff(10000)
# for k, v of paths when +k < 120
# 	console.log k, v
# console.log paths
# p = 3
# i = 1
# while p < 100
# 	connect p
# 	i++
# 	p = prime(i)
# console.log paths