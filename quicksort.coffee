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

quicksort = (a , s, e)->
	if e > s
		i = (s + e) / 2 |0
		v = a[i]
		initial_s = s
		initial_e = e
		while e > s
			while i < e and v <= a[e]
				e--
			a[i] = a[e]
			a[e] = v
			i = e
			while s < i and v >= a[s]
				s++
			a[i] = a[s]
			a[s] = v
			i = s
		quicksort(a, initial_s, i - 1)
		quicksort(a , i + 1, initial_e)
		undefined
	else
		undefined
generic_quicksort = (a, order, s, e)->
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
		generic_quicksort(a, order, initial_s, i - 1)
		generic_quicksort(a , order, i + 1, initial_e)
		undefined
	else
		insertionsort(a, order, s, e + 1)
		undefined
shuffle = (a)->
	l = a.length
	for i in [0...l]
		t = a[i]
		r = Math.random() * i |0
		a[i] = a[r]
		a[r] = t
	undefined

confirmation = (a)->
	for i in [0...(a.length - 2)]
		if a[i] > a[i + 1]
			return false
	true


order = (a, b)-> a - b
less = (a, b)-> a < b
{Heap} = require "./heap"
{smoothsort} = require "./smooth"

MAX = Math.pow(10, 7)
a = (i for i in [0...MAX])
shuffle a
b = a.slice()
# console.log "quicksorting"
# time = Date.now()
# quicksort a, 0 , a.length - 1
# console.log "time for quicksort", Date.now() - time
# console.log "confirmation", confirmation(a)

# a = b.slice()


# b = a.slice()

console.log "generic_quicksorting"
time = Date.now()
generic_quicksort a, order, 0 , a.length - 1
console.log "time for generic_quicksort", Date.now() - time
console.log "confirmation", confirmation(a)

a = b.slice()

# console.log "slow heapsorting"
# time = Date.now()
# h = new Heap(((a, b)-> a < b), b)
# res = []
# while h.size()
# 	res.push h.pop()
# console.log "time for slow heapsorting", Date.now() - time
# console.log "confirmation", confirmation(res)

console.log "smoothsorting"
time = Date.now()
smoothsort a, (a, b)-> a < b
console.log "time for smoothsort", Date.now() - time
console.log "confirmation", confirmation(b)

console.log "insertionsorting"
time = Date.now()
insertionsort b, order, 0 , a.length
console.log "time for insertionsort", Date.now() - time
console.log "confirmation", confirmation(b)

# console.log "nativesorting"
# time = Date.now()
# a.sort(order)
# console.log "time for nativesort", Date.now() - time
# console.log "confirmation", confirmation(a)

# console.log "constructing bin heap"
# time = Date.now()
# h = new Heap(less, a)
# console.log Date.now() - time

# console.log "constructing smooth heap"
# time = Date.now()
# smoothsort(a, less)
# console.log Date.now() - time
