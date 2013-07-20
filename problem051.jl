using Primes
function digits(n::Integer)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end
function fromDigits(a::Array{Int})
	mult = 1
	res = 0
	for i in a
		res += i * mult
		mult *= 10
	end
	res
end
function replaceDigits(a::Array{Int}, n, r)
	t = map(a) do x
		if x == n
			r
		else
			x
		end
	end
	if t[end] != 0
		fromDigits(t)
	else
		-1
	end
end

prefill(10^6)
function findStuff()
	for i in primes
		current = digits(i)
		for j = 0:9
			results = Set{Int}()
			for k = 0:9
				t = replaceDigits(current, j, k)
				if isprime(t)
					add!(results, t)
				end
			end
			if length(results) >= 8
				println(results, " ", min(results))
				return
			end
		end
	end
end
t = time()
findStuff()
t = time() - t
println(t)