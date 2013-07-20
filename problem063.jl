countdigits(x, y) = (int(floor(y*log10(x))) + 1)

function findStuff()
	count = 0
	for x = 1:9
		y = 1
		p = x
		while countdigits(x, y) < y
			y += 1
		end
		while countdigits(x, y) == y
			count += 1
			print(x, "^", y, "\n")
			y += 1
		end
	end
	print(count)
end
findStuff()