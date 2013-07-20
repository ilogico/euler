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


class Permutation
	constructor: (i)->
		@positions = (j for j in [0...i])
	next: ->
		last = @positions.length - 1
		i = last
		while i > 0 and @positions[i] <= @positions[i - 1]
			i--
		if i == 0
			@constructor.call(@, @positions.length)
			null
		else
			i--
			l = last
			val = @positions[i]
			while @positions[l] <= val
				l--
			@positions[i] = @positions[l]
			@positions[l] = val
			i++
			j = 0
			end = (last - i + 1) / 2 | 0
			while j <  end
				idx0 = i + j
				idx1 = last - j
				t = @positions[idx0]
				@positions[idx0] = @positions[idx1]
				@positions[idx1] = t
				j++
			@positions

module.exports =
	SelectFrom: SelectFrom
	Permutation: Permutation

