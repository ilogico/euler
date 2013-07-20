heapify = (a, less)->
	l = a.length
	i = 0
	while i < l
		j = i
		value = a[i]
		parent = (i - 1) / 2 |0
		while j > 0 and less(value, a[parent])
			a[j] = a[parent]
			t = (parent - 1) / 2 |0
			j = parent
			parent = t
		a[j] = value
		i++
	undefined

pushheap = (a, less, value)->
	i = a.length
	parent = (i - 1) / 2 |0
	while i > 0 and less(value, a[parent])
		a[i] = a[parent]
		t = (parent - 1) / 2 |0
		i = parent
		parent = t
	a[i] = value
	undefined
reheapify = (a, less)->
	l = a.length
	value = a[0]
	i = 0
	child = 1
	while child < l
		brother = child + 1
		if brother < l and less(a[brother], a[child])
			child = brother
		if less(a[child], value)
			a[i] = a[child]
			i = child
			child = i * 2 + 1
		else
			break
	a[i] = value
	undefined

popheap = (a, less)->
	e = a.length - 1
	if e > 0
		value = a[0]
		a[0] = a.pop()
		reheapify a, less
		value
	else
		a.pop()


class Heap
	constructor: (@less, @array)->
		if @array
			heapify(@array, @less)
		else
			@array = []
	push: (value)->
		pushheap(@array, @less, value)
		undefined
	pop: ->
		popheap(@array, @less)
	size: ->
		@array.length
less = (a, b)-> a < b

module.exports =
	Heap: Heap
