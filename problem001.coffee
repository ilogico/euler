x = 0
for i in [0...1000] by 3
	x += i
for i in [0...1000] by 5 when i % 3 != 0
	x += i
console.log x