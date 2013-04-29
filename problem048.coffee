{BigInt} = require './bignumbers'

res = new BigInt(0)

for i in [1..1000]
	t = new BigInt(i)
	val = new BigInt(i)
	j = 1
	while j < i
		t = t.mult val
		j++
	res = res.add t
console.log res.values
r = res.toString()
console.log r
console.log r.length
console.log r.slice(r.length - 10, r.length)