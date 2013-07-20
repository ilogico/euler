binarySearch = (a, n)->
	s = 0
	e = a.length
	i = e/2 |0
	while a[i] != n and s < e
		if a[i] < n
			s = i + 1
		else
			e = i - 1
		i = (e+s)/2 |0
	if a[i] == n
		i
	else
		-1

sumArray = (a)->
	s = 0
	s += i for i in a
	s

insertionsort = (a, order, start, post_end)->
	i = start + 1
	while i < post_end
		j = i
		v = a[i]
		while j > start and order(a[j - 1], v) > 0
			a[j] = a[j - 1]
			j--
		a[j] = v
		i++
	undefined
rec_quicksort = (a, order, s, e)->
	if e - s > 30
		i = (s + e) / 2 |0
		v = a[i]
		initial_s = s
		initial_e = e
		while e > s
			while i < e and order(v, a[e]) <= 0
				e--
			a[i] = a[e]
			a[e] = v
			i = e
			while s < i and order(v, a[s]) >= 0
				s++
			a[i] = a[s]
			a[s] = v
			i = s
		rec_quicksort(a, order, initial_s, i - 1)
		rec_quicksort(a , order, i + 1, initial_e)
		undefined
	else
		insertionsort(a, order, s, e + 1)
		undefined
quicksort = (a, order)->
	rec_quicksort(a, order, 0, a.length - 1)

shuffle = (a)->
	l = a.length
	for i in [0...l]
		t = a[i]
		r = Math.random() * i |0
		a[i] = a[r]
		a[r] = t
	undefined

module.exports =
	binarySearch: binarySearch
	sumArray: sumArray
	quicksort: quicksort
	sort: quicksort
	shuffle: shuffle