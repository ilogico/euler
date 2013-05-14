correct = (n)->
	arr = ("" + n).split('').map (v)-> +v
	val = 0
	val += Math.pow(v, 5) for v in arr
	n == val

digits = 1

min = 1
nine = Math.pow(9, 5) 
max = nine

while min <= max
	min *= 10
	max += nine
	digits++


top = Math.pow(10, digits)

#generating permutations should be better
sum = 0
i = 2
while i < top
	sum += i if correct(i)
	i++
console.log  sum