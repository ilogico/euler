module Primes
export primes
function primes(n)
	t = zeros(Bool, n)
	t[1] = 1
	for i = 2:div(n,2)
		if t[i] == 0
			j = i * i
			while j <= n
				t[j] = 1
				j += i
			end
		end
	end
	pri = [2]
	for i in 3:n
		if t[i] == 0
			push!(pri, i)
		end
	end
	pri
end
end