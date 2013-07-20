

permutate = (a, d)->
	if a.length
		idx = d.length
		d.push null
		for n, i in a
			t = a.slice()
			t.splice(i, 1)
			d[idx] = n
			if permutate(t, d)
				return true
		d.pop()
		return false
	else
		test d

order = [0, 1, 2, 3, 2, 4, 5, 4, 6, 7, 6, 8, 9, 8, 1]


reorder = (p)->
	min = Infinity
	idx = 0
	for i in [0..12] by 3
		if p[order[i]] < min
			min = p[order[i]]
			idx = i
	temp = order.slice()
	for i in [0...idx]
		temp.push(temp.shift())
	temp
to_string = (p, o)->
	res = ""
	for i in o
		res += p[i]
	res
ans = []
test = (p)->
	count = p[0] + p[1] + p[2]
	for i in [1..4]
		idx = i*3
		if p[order[idx]] + p[order[idx + 1]] + p[order[idx + 2]] != count
			return false
	temp = reorder(p)
	if to_string(p, temp).length == 16
		ans.push to_string(p, temp)
		false
	else
		false

permutate([9,8,7,6,5,4,3,2,1,10], [])
ans.sort()
console.log ans