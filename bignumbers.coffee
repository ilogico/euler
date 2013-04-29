MAX = Math.pow(10, 7)

class BigInt
	constructor: (n = 0)->
		if n instanceof BigInt
			@values = n.values[..]
		else
			n = +n
			@values = [+n]
			if n >= MAX
				@values[0] = n % MAX
				@values[1] = Math.floor(n/MAX)
	toString: ->
		i = @values.length - 1
		r = '' + @values[i]
		i--
		while i >= 0
			str = '' + @values[i]
			while str.length < 7
				str = '0' + str
			r += str
			i--
		r
	add: (n)->
		result = new BigInt(@)
		if not (n instanceof BigInt)
			n = new BigInt(n)
		i = 0
		l = n.values.length
		carry = 0
		while i < l or carry
			result.values[i] or= 0
			t = result.values[i] + carry
			t += n.values[i] if i < l
			if t < MAX
				carry = 0				
			else
				carry = Math.floor(t/MAX)
				t = t % MAX
			result.values[i] = t
			i++
		result
	mult: (n)->
		result = new BigInt(0)
		if not (n instanceof BigInt)
			n = new BigInt(n)
		i = 0
		l = n.values.length
		while i < l
			temp = new BigInt(0)
			j = 0
			while j < i
				temp.values[j] = 0
				j++
			j = 0
			value = n.values[i]
			carry = 0
			while j < @values.length
				t = value * @values[j] + carry
				if t < MAX
					carry = 0
				else
					carry = Math.floor(t/MAX)
					t = t % MAX
				temp.values[i+j] = t
				j++
			if carry
				temp.values[i+j] = carry
			result = result.add(temp)
			i++
		result

module.exports =
	BigInt: BigInt