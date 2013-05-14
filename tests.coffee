{prime, primal, primalV2, prefill, primeList} = require './primes'
{binarySearch} = require './utils'

# testBinary = ()->
# 	list = primeList()
# 	for i in [0...100]
# 		num = Math.floor(Math.random()*1000000)
# 		if binarySearch(list, num) != list.indexOf(num)
# 			console.log "bummer", binarySearch(list, num), list.indexOf(num), num, i
# 			return
# 	console.log "benchmarking binarySearch"
# 	time = Date.now()
# 	for i in [0...list.length]
# 		list.indexOf(prime(i))
# 	console.log "indexOf", Date.now() - time
# 	time = Date.now()
# 	for i in [0...list.length]
# 		binarySearch(list, prime(i))
# 	console.log "binarySearch", Date.now() - time
# 	undefined	


# prefill(1000000)
# console.log 'GO'
# # testBinary()

# testPrimalV2 = ->
# 	testSubjects = []
# 	for i in [0...1000000]
# 		num = Math.floor(Math.random() * 1000000)
# 		if primalV2(num) != primal(num)
# 			console.log "bummer", num
# 		testSubjects.push num
# 	console.log "benchmarking primalV2"
# 	time = Date.now()
# 	for i in testSubjects
# 		primal(i)
# 	console.log "primal", Date.now() - time
# 	time = Date.now()
# 	for i in testSubjects
# 		primalV2(i)
# 	console.log "primalV2", Date.now() - time
# 	undefined
# testPrimalV2()

# console.log binarySearch(primeList(), 2)

t = Date.now()
prefill(Math.pow(10,6))
t = Date.now() - t
console.log t