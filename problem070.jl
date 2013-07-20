using Primes
function digits(n::Integer)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end

ispermutation(a, b) = sort(digits(a)) == sort(digits(b))

function findStuff()
	list = primes(10^7)
	minr = 10^7//1
	answer = 0
	for i = 1:length(list)
		for j = 1:(i - 1)
			m = list[i] * list[j]
			if m > 10^7
				break
			end
			t = (list[i]-1)*(list[j]-1)
			if m//t < minr && ispermutation(m,t)
				answer = m
				minr = m//t
			end
		end
	end
	print(answer)
end

t = time()
findStuff()
t = time() - t
print("\n", t, "\n")