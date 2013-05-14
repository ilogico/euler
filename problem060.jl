using Primes
function compatible(a::Int, b::Int)
	r = b
	while r > 0
		a *= 10
		r = div(r, 10)
	end
	isprime(a + b)
end

function generate(n::Int, pri::Array{Int64,1})
	if n == 1
		for i in pri
			produce([i])
		end
	else
		g = @task generate(n - 1, pri)
		while true
			t = consume(g)
			i = 1
			p = 2
			while p < t[1]
				valid = true
				for j in t
					if !compatible(j, p) || !compatible(p, j)
						valid = false
						break
					end
				end
				if valid
					produce(vcat(p, t))
				end
				i += 1
				p = pri[i]
			end
		end
	end
end

function findNumbers()
	pri = primes(10^6)
	g = @task generate(5, pri)
	vals = consume(g)
	println(vals, ", sum: ", sum(vals))
end
t = time()
findNumbers()
t = time() - t
print(t)