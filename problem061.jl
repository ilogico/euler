function triangles()
	i = 0
	sum = 0
	while sum < 1000
		i += 1
		sum += i
	end
	res = Int[]
	while sum < 10000
		push!(res, sum)
		i += 1
		sum += i
	end
	res
end
function squares()
	i = 0
	s = 0
	while s < 1000
		i += 1
		s = i^2
	end
	res = Int[]
	while s < 10000
		push!(res, s)
		i += 1
		s = i^2
	end
	res
end
function pentagonal()
	i = 0
	s = 0
	while s < 1000
		i += 1
		s = i*(3*i-1)/2
	end
	res = Int[]
	while s < 10000
		push!(res, s)
		i += 1
		s = i*(3*i-1)/2
	end
	res
end
function hexagonal()
	i = 0
	s = 0
	while s < 1000
		i += 1
		s = i*(2*i - 1)
	end
	res = Int[]
	while s < 10000
		push!(res, s)
		i += 1
		s = i*(2*i - 1)
	end
	res
end
function heptagonal()
	i = 0
	s = 0
	while s < 1000
		i += 1
		s = i*(5*i - 3)/2
	end
	res = Int[]
	while s < 10000
		push!(res, s)
		i += 1
		s = i*(5*i - 3)/2
	end
	res
end
function octagonal()
	i = 0
	s = 0
	while s < 1000
		i += 1
		s = i*(3*i - 2)
	end
	res = Int[]
	while s < 10000
		push!(res, s)
		i += 1
		s = i*(3*i - 2)
	end
	res
end

connection(a, b) = (a % 100 == div(b, 100))

function generate(n, nums)
	# print("Starting generator number ", n, "\n")
	if n == length(nums)
		for i in nums[n]
			produce([i])
		end
	elseif n == 1
		g = @task generate(n + 1, nums)
		for t in g
			for j in nums[n]
				if connection(j, t[1]) && connection(t[end], j)
					produce(vcat(j, t))
				end
			end
		end
	else
		g = @task generate(n + 1, nums)
		for t in g
			for j in nums[n]
				if connection(j, t[1])
					produce(vcat(j, t))
				end
			end
		end
	end
end

function findStuff()
	list = Array{Int}[]
	push!(list, triangles())
	push!(list, squares())
	push!(list, pentagonal())
	push!(list, hexagonal())
	push!(list, heptagonal())
	push!(list, octagonal())
	for j = 1:factorial(length(list))
		g = @task generate(1, nthperm(list, j))
		for i in g
			print(i, " ", sum(i), "\n")
		end
	end
end
findStuff()