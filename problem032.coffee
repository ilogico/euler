digits = [1,2,3,4,5,6,7,8,9]
permutate = (a, idx, f)->
	if idx >= a.length
		f(a)
	else
		l = a.length - idx
		i = 0
		while i < l
			permutate(a, idx + 1, f)
			t = a[idx]
			a.splice(idx, 1)
			a.push(t)
			i++
	undefined


pan = {}

testAndAdd = (arr)->
	a = +arr[0..2].join('')
	b = +arr[3..4].join('')
	c = +arr[5..8].join('')
	if a*b == c
		pan[c] = true
	a = +arr[0..3].join('')
	b = +arr[4..4].join('')
	c = +arr[5..8].join('')
	if a*b == c
		pan[c] = true
permutate(digits, 0, testAndAdd)
console.log (k for k, v of pan).reduce( ((sum, i)-> sum += +i), 0)
