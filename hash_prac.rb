@order = []
@sum = []

@main = {
	pizza: {name: 'Pizza', price: 4.05},
	tacos: {name: 'Tacos', price: 3.55},
	burger: {name: 'Burger', price: 5.05},
	lasagna: {name: 'Lasagna', price: 4.55}
}

@side = {
	fries: {name: 'Fries', price: 1.55},
	salad: {name: 'Salad', price: 2.05},
	soup: {name: 'Soup', price: 1.75},
	brownie: {name: 'Brownie', price: 1.05},
	cookie: {name: 'Cookie', price: 1.25}	
}


def main_menu
	puts "Please choose what you would like to eat from the menu:"
	puts "#{@main[:pizza][:name]} - #{@main[:pizza][:price]}"
	puts "#{@main[:tacos][:name]} - #{@main[:tacos][:price]}"
	puts "#{@main[:burger][:name]} - #{@main[:burger][:price]}"
	puts "#{@main[:lasagna][:name]} - #{@main[:lasagna][:price]}"
	@input1 = gets.strip.downcase.to_s
	if @input1 == 'pizza' || @input1 == 'tacos' || @input1 == 'burger' || @input1 == 'lasagna'
		@order << @input1
		@main.each do |input1, price|
			@sum << #{price}
		# convert
		side1(@input1)
	end
	else #@input1
		puts "User Input Error, Please Input Your Menu Choice Again"
		main_menu
	end
end

def side1(input1)
	puts "Please choose your side dish:"
	puts "#{@side[:fries][:name]} - #{@side[:fries][:price]}"
	puts "#{@side[:salad][:name]} - #{@side[:salad][:price]}"
	puts "#{@side[:soup][:name]} - #{@side[:soup][:price]}"
	puts "#{@side[:brownie][:name]} - #{@side[:brownie][:price]}"
	puts "#{@side[:cookie][:name]} - #{@side[:cookie][:price]}"
	puts "To exit, type 'quit'."
	@input2 = gets.strip.downcase.to_s
	if @input2 == 'fries' || @input2 == 'salad' || @input2 == 'soup' || @input2 == 'brownie' || @input2 == 'cookie'
		@order << @input2
		@side.each do |input2, price|
			@sum << #{price}
		# convert
		second_side(@input2)
	end
	elsif @input2 == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else #@input2
		puts "User Input Error, Please Input Your Side Choice Again"
		side1
	end
end

def second_side(input2)
	puts "Would you like another side (y/n)? You can type 'quit' to exit."
	input3 = gets.strip.downcase.to_s
	if input3 == 'yes' || input3 == 'y'
		side1(input2)
	elsif input3 == 'no' || input3 == 'n'
		total
	elsif input3 == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else
		puts "User Input Error, Please Input Your Menu Choice Again"
		second_side
	end
end

def total
	puts "Your order includes:"
	@order.each do |food|
		puts food
	end
	puts "Does this look right to you (y/n)?"
	input4 = gets.strip.downcase.to_s
	if input4 == 'yes' || input4 == 'y'
		checkout
	elsif input4 == 'no' || input4 == 'n'
		@order.clear
	else #input4
		puts "User Input Error, Please Input Your Menu Choice Again"
		total
	end
end

def checkout
	# @sum.each do |cost|
	# 	puts cost
	puts @sum.reduce( :+)
	# end
end

# def convert
# 	if @input1 == 'pizza'
# 		@sum << @main[:pizza][:price]
# 	elsif @input1 == 'tacos'
# 		@sum << @main[:tacos][:price]
# 	elsif @input1 == 'burger'
# 		@sum << @main[:burger][:price]
# 	elsif @input1 == 'lasagna'
# 		@sum << @main[:lasagna][:price]
# 	elsif @input2 == 'fries'
# 		@sum << @side[:fries][:price]
# 	elsif @input2 == 'salad'
# 		@sum << @side[:salad][:price]
# 	elsif @input2 == 'soup'
# 		@sum << @side[:soup][:price]
# 	elsif @input2 == 'brownie'
# 		@sum << @side[:brownie][:price]
# 	else @input2 == 'cookie'
# 		@sum << @side[:cookie][:price]
# 	end
# end


while true
	puts "Welcome to the Ruby Cafeteria!"
	main_menu
end
