def factorial(x)
	if x == 1
		return 1
	end
	x * fact(x-1)
end

a = gets.chomp
b = factorial(a)
puts b
