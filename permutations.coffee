factorials = [1]
factorial = (n)->
	if not factorials[n]
		factorials[n] = n * factorial(n-1)
	factorials[n]

arrangements = (n, p)->
	factorial(n)/factorial(p)

combinations = (n, p)->
	arrangements(n,p)/factorial(n-p)



class SelectFrom
	constructor: (@n, @p)->
		@positions = null
	next: ->
		if @positions?
			i = @p - 1
			while i >= 0 and @positions[i] + 1 > @n - @p + i
				i--
			if i < 0
				@positions = null
			else
				@positions[i]++
				i++
				while i < @p
					@positions[i] = @positions[i - 1] + 1
					i++
				@positions
		else
			@positions = [0...@p]
		
module.exports =
	SelectFrom: SelectFrom