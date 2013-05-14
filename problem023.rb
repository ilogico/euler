def factorSum(n)
	sum = 1
	l = Integer(Math.sqrt(n))
	(2...l).each do |i|
		if n % i == 0
			sum += i
			sum += n / i
		end
		i += 1
	end
	sum += l if n % l == 0
	sum
end

abundant = []
(1..28123).each do |i|
	if factorSum(i) > i
		abundant.push(i)
	end
end


puts(abundant.length)

asAbSum = Hash.new true

abundant.each do |i|
	for j in abundant do
		if i+j <= 28123
			asAbSum[i+j]= false
		else
			break
		end
	end
end
sum = 0
for i in 1..28123
	if asAbSum[i]
		sum += i
	end
end
puts(sum)