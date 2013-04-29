count = 1
value = 1
for i in [2...1001] by 2
	for c in [1..4]
		value += i
		count += value
console.log count