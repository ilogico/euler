capicua = (str)->
	l = str.length
	for i in [0..(l / 2)]
		if str[i] != str[l - i - 1]
			return false
	true

findPalindrome = ->
	candidate = -1
	for i in [1..999]
		for j in [1..999]
			t = i*j
			if t > candidate and capicua "" + t
				candidate = t
	candidate
console.log findPalindrome()
