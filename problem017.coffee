dict =
	'1': 'one'.length
	'2': 'two'.length
	'3': 'three'.length
	'4': 'four'.length
	'5': 'five'.length
	'6': 'six'.length
	'7': 'seven'.length
	'8': 'eight'.length
	'9': 'nine'.length
	'10': 'ten'.length
	'11': 'eleven'.length
	'12': 'twelve'.length
	'13': 'thirteen'.length
	'14': 'fourteen'.length
	'15': 'fifteen'.length
	'16': 'sixteen'.length
	'17': 'seventeen'.length
	'18': 'eighteen'.length
	'19': 'nineteen'.length
	'20': 'twenty'.length
	'30': 'thirty'.length
	'40': 'forty'.length
	'50': 'fifty'.length
	'60': 'sixty'.length
	'70': 'seventy'.length
	'80': 'eighty'.length
	'90': 'ninety'.length
	'100': 'hundred'.length



console.log dict

oneToNine = 0
oneToNine += dict[i] for i in [1..9]

console.log("1 to 9: #{oneToNine}")

oneToNineteen = oneToNine
oneToNineteen += dict[i] for i in [10..19]
console.log("1 to 19: #{oneToNineteen}")

oneToNinetyNine = oneToNineteen

for i in [2..9]
	oneToNinetyNine += dict[i*10]*10

oneToNinetyNine += oneToNine * 8
console.log("1 to 99: #{oneToNinetyNine}")

oneTo999 = oneToNinetyNine
for i in [1..9]
	oneTo999 += (dict[i]+dict[100]) * 100
	oneTo999 += 'and'.length * 99
	oneTo999 += oneToNinetyNine
console.log  "1 to 999: #{oneTo999}"
res = oneTo999 + "onethousand".length
console.log res
