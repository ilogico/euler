leap = (n)->
	n % 4 == 0 and (n % 100 != 0 or n % 400 == 0)

daysInYear = (n)->
	if leap(n)
		366
	else
		365

daysInMonth = (m, y)->
	if m in [0,2,4, 6, 7, 9, 11]
		30
	else if m == 1
		28 + +leap(y)
	else
		30

# dayOnePerMonth = [((y)-> 0), ((y)-> 31]

# base = 31+28

# for i in [2..11]
# 	dayOnePerMonth = (y)->
# 		base + +leap(y)
# 	base += daysInMonth(i, 1)

# dayOneSinceYear (m, y)->
# 	dayOnePerMonth[m](y)


days = 0
count = 0
for year in [1900...2000]
	for month in [0..11]
		if days % 7 == 6
			count++
		days += daysInMonth(month, year)
console.log count




