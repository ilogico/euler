exports = {}


exports.compress = (a)->
	r = []
	r.push v for v in a when v not in r
	r


module.exports = exports