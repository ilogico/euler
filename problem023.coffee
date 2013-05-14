factorSum = (n)->
	sum = 1
	i = 2
	l = Math.floor(Math.sqrt(n))
	while i < l
		if n % i == 0
			sum += i
			sum += n / i
		i++
	sum += l if n % l == 0
	sum


abundant = []
abundant.push i for i in [1..28123] when factorSum(i) > i

console.log abundant.length

asAbSum = {}

for i in abundant
	for j in abundant
		if i+j <= 28123
			asAbSum[i+j]= true
		else
			break
sum = 0
for i in [1..28123] when not asAbSum[i]
	sum += i
console.log sum