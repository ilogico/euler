import math

def factorSum(n):
	s = 1
	i = 2
	l = int(math.sqrt(n))
	while i < l:
		if n % i == 0:
			s += i
			s += n / i
		i += 1
	if n % l == 0:
		s += l
	return s



abundant = []

i = 1
while i <= 28123:
	if factorSum(i) > i:
		abundant.append(i)
	i += 1
print(len(abundant))
asAbSum = set()
for i in abundant:
	for j in abundant:
		if i+j <= 28123:
			asAbSum.add(i+j)
		else:
			break
s = 0
i = 1
while i <= 28123:
	if i not in asAbSum:
		s += i
	i += 1
print(s)
