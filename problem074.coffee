factorial = {'0': 1}
factorial[i] = i * factorial[i - 1] for i in [1..9]

link = (n)->
	sum = 0
	str = "" + n
	sum += factorial[i] for i in str
	sum

countLinks = (n)->
	beenThere = {}
	count = 0
	while not beenThere[n]
		beenThere[n] = true
		count++
		n = link n
	count

total = 0
total++ for i in[1...1000000] when countLinks(i) == 6
console.log total
# console.log countLinks(145)
# console.log countLinks(169)
# console.log countLinks(69)
# console.log countLinks(78)
# console.log countLinks(540)