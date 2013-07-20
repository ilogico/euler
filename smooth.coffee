reheapify = (a, less, idx, size)->
	value = a[idx]
	while size > 1
		csize = size >> 1
		c1 = idx + 1
		c2 = c1 + csize
		c = if less(a[c1],a[c2]) then c1 else c2
		if less(a[c], value)
			a[idx] = a[c]
			idx = c
			size = csize
		else
			break
	a[idx] = value
	undefined

heapify = (a, less)->
	s = []
	i = a.length - 1
	l = -1
	while i >= 0
		if l > 0 and s[l] == s[l - 1]
			l--
			size = s[l] = (s.pop() << 1) | 1
			reheapify(a, less, i, size)
		else
			l++
			s.push(1)
		i--
	s

bubbleheap = (a, less, heaps)->
	i = 1
	l = heaps.length
	idx = a.length
	while i < l
		idx -= heaps[i - 1]
		prev = idx - heaps[i]
		if less(a[idx], a[prev])
			temp = a[idx]
			a[idx] = a[prev]
			a[prev] = temp
			reheapify(a, less, idx, heaps[i - 1])
		i++
	undefined

selectheap = (a, less, heaps)->
	i = 1
	l = heaps.length
	idx = a.length - heaps[0]
	minvalue = a[idx]
	minheap = 0
	minidx = idx
	while i < l
		idx -= heaps[i]
		if less(a[idx], minvalue)
			minvalue = a[idx]
			minheap = i
			minidx = idx
		i++
	if minheap != l - 1
		a[minidx] = a[idx]
		a[idx] = minvalue
		reheapify(a, less, minidx, heaps[minheap])
	undefined

unheapify = (a, less, heaps)->
	while heaps.length
		selectheap(a, less, heaps)
		s = heaps.pop()
		if s > 1
			ns = s >> 1
			heaps.push(ns)
			heaps.push(ns)
	undefined

less = (a, b)-> a < b



module.exports =
	smoothsort: (a, less)->
		h = heapify(a, less)
		return
		unheapify(a, less, h)
		undefined