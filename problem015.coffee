_facts = [1]

factorial = (n)->
	if !_facts[n]
		_facts[n] = n * factorial(n-1)
	_facts[n]

console.log factorial(40)/factorial(20)/factorial(20)