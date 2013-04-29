fact = [1]

for i in [1..9]
	fact[i] = i * fact[i-1]

factDigit = (n)->
	sum = 0
	while n > 0
		t = n % 10
		sum += fact[t]
		n = Math.floor(n/10)
	sum

max = 10
f = fact[9]
while max < f
	max *= 10
	f += fact[9]


result = 0
result += i for i in [3...max] when i == factDigit(i)
console.log result

