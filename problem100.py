import math

size = math.floor(math.pow(10, 12))
i = 21
while i < size:
	i *= 2
print(i, math.log(i) / math.log(10))