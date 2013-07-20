function digits(n)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end

m = 0
for i::BigInt = 1:99, j::BigInt = 1:99
	m = max(sum(digits(i^j)), m)
end
println(m)