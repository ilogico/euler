coins = [1, 2, 5, 10, 20, 50, 100, 200]

countCombos = (i, val)->
	if val == 200
		1
	else if i >= coins.length
		0
	else
		count = 0
		coin = coins[i]
		while val <= 200
			count += countCombos(i+1, val)
			val += coin
		count
console.log countCombos(0, 0)
