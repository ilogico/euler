f = (i) -> i % 2 != 0 and i % 3 != 0 and i % 5 != 0# and i % 7 != 0
x = (f(i) for i in [0...30])

jumpIndex = (a, i)->
	temp = a[i+1..]
	idx = temp.indexOf(true)
	if idx >= 0
		idx + 1
	else
		temp.length + a.indexOf(true) + 1
jump = (jumpIndex(x, i) for v, i in x when v)
console.log x.length
console.log jump
