Pipe = require './pipe'
{prime, primal, prefill} = require './primes'

compatible = (a, n)->
	str = "" + n
	for i in a
		str2 = "" + i
		if (not primal(+(str+str2))) or (not primal(+(str2 + str)))
			return false
	true

combinations = (a)->
	# console.log a if a.length == 4
	l = a[a.length - 1]
	p = 2
	i = 0
	->
		while p < l
			if compatible(a, p)
				t = a[..]
				t.push(p)
				p = prime(++i)
				return t
			p = prime(++i)
		null


cont = true
proc = new Pipe()
for i in [0..3]
	proc.generator(combinations)
proc.do (x)->
	console.log x, x.reduce(((sum, i)-> i+sum), 0)
	cont = false

prefill(Math.pow(10,6))
i = 0
while cont
	proc.write([prime(i++)])

# console.log compatible([3],7)
# console.log compatible([2], 7)