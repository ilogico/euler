function digits(n)
	res = Int[]
	while n > 0
		push!(res, n % 10)
		n = div(n, 10)
	end
	res
end
function fromDigits(a)
	mult = BigInt(1)
	res = BigInt(0)
	for i in a
		res += BigInt(i) * mult
		mult *= 10
	end
	res
end
function palindrome(a)
	s = length(a)
	l = div(s, 2)
	for i = 1:l
		if a[i] != a[s + 1 - i]
			return false
		end
	end
	true
end

function countIter(num, count, di)
	if count > 49
		-1
	elseif has(di, num)
		get(di, num, 0)
	# elseif num % 10 == 0
	# 	merge!(di, {num => -1})
	# 	-1
	else
		r = fromDigits(reverse!(digits(num)))
		if palindrome(digits(num + r))
			merge!(di, {num => 1})
			1
		else
			n = countIter(r+num, count + 1, di) 
			# println(n)
			if 0 < n < 48
				merge!(di, {num => n+1})
				n + 1
			else
				-1
			end
		end
	end
end


d = Dict{BigInt, Int}()
for i::BigInt = BigInt(1):BigInt(9999)
	countIter(i, 0, d)
end
# println(int(4994), " ", get(d, 4994, 78))
filter!(d) do key, val
	key < 10000 && (0 < val < 50)
end
# for key in keys(d)
# 	println(int(key), " ", get(d, key, 0))
# end
println(9999 - length(d))
