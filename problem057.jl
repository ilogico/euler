function countDigits(n)
	res = 0
	while n > 0
		res += 1
		n = div(n, 10)
	end
	res
end
function discover(n)
	current::Rational{BigInt} = 1//2
	count = 0
	for i = 1:n
		t = 1 + current
		if countDigits(num(t)) > countDigits(den(t))
			count += 1
		end
		current = 1//(2+current)
	end
	count
end

print(discover(1000),'\n')