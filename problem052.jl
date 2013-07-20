function digits(n::Integer)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end


# println(digits(125874))
# println(sort!(digits(125874)))


i = 1
while true
	if sort!(digits(i)) == sort!(digits(2i)) == sort!(digits(3i)) == sort!(digits(4i)) == sort!(digits(5i)) == sort!(digits(6i))
		for j = 1:6
			println(j*i)
		end
		break
	end
	i += 1
end