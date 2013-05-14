binarySearch = (a, n)->
	s = 0
	e = a.length
	i = Math.floor(e/2)
	while a[i] != n and s < e
		if a[i] < n
			s = i + 1
		else
			e = i - 1
		i = Math.floor((e+s)/2)
	if a[i] == n
		i
	else
		-1
sumArray = (a)->
	s = 0
	s += i for i in a
	s

	
module.exports =
	binarySearch: binarySearch
	sumArray: sumArray
