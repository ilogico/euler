import math
def primes(n):
	t = [0] * (n + 1)
	t[0] = 1
	t[1] = 1
	for i in range(2, n//2 + 1):
		if t[i] == 0:
			j = i + i
			while j <= n:
				t[j] = 1
				j += i
	pri = [2]
	for i in range(3, n):
		if t[i] == 0:
			pri.append(i)
	return pri
primeList = primes(1000000)
def isPrime(n):
	if n < 2:
		return False
	l = math.sqrt(n)
	i = 1
	p = 2
	while p <= l:
		if n % p == 0:
			return False
		p = primeList[i]
		i += 1
	return True
def compatible(a, b):
	r = b
	while r > 0:
		a *= 10
		r = r // 10
	return isPrime(a + b)
def generate(n, pri):
	if n == 1:
		for i in pri:
			yield [i]
	else:
		g = generate(n - 1, pri)
		while True:
			t = g.__next__()
			i = 0
			p = 2
			while p < t[0]:
				valid = True
				for j in t:
					if (not compatible(j, p)) or (not compatible(p, j)):
						valid = False
						break
				if valid:
					# if n > 3:
					# 	print("yielding :", [p] + t)
					yield [p] + t
				i += 1
				p = pri[i]

# # print(compatible(3,7))
# print(primeList[0:32])
g = generate(5, primeList)
res = g.__next__()
print(res)
print(sum(res))


