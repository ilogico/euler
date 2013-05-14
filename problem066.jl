function testx(x, d)
	t = (x+1)*(x-1)
	t % d == 0 && floor(sqrt(div(t, d)))^2 == div(t, d)
end

m = 0
v = 0
for d::BigInt = 1:1000
	if floor(sqrt(d))^2 != d
		i = d
		while true
			if (testx(i - 1, d))
				if i - 1 > m
					v = d
				end
				print(d, ' ', i - 1, '\n')
				break
			elseif (testx(i + 1, d))
				if i + 1 > m
					v = d
				end
				print(d, ' ', i + 1, '\n')
				break
			else
				i += d
			end
		end
	end
end
print(v)
