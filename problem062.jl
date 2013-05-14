function digits(n::Integer)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end
function fromDigits(a)
	mult = 1
	res = 0
	for i in a
		res += i * mult
		mult *= 10
	end
	res
end

function finalTest(k)
	true
end
function findStuff()
	di = Dict{Int, Array{Int}}()
	i = 2
	while true
		c = i^3
		key = fromDigits(sort(digits(c)))
		t = get(di, key, Int[])
		push!(t, c)
		l = length(t)
		if l == 1
			merge!(di, {key => t})
		elseif l == 5 && finalTest(key)
			print(t, " min: ", min(t), '\n')
			break
		end
		i += 1
	end
end
findStuff()