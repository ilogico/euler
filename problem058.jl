function getAnswer()
	i = 4
	v = 9
	primes = 30
	total = 5
	while primes >= total
		for j = 1:4
			v += i
			if isprime(v)
				primes += 10
			end
			total += 1
		end
		i += 2
	end
	i - 1
end

print(getAnswer())
