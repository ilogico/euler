function digits(n)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end
function discover(n)
	n -= 1
	a = zeros(BigInt, n)
	for i in 1:n
		if (i + 1) % 3 == 0
			a[i] = div(i + 1, 3)*2
		else
			a[i] = 1
		end
	end
	res::Rational{BigInt} =
		if n > 0
			1//a[n]
		else
			0
		end
	for i in n-1:-1:1
		res = 1 // (res + a[i])
	end
	sum = 0
	for i in digits(num(2 + res))
		sum += i
	end
	sum
end

print(discover(100),'\n')