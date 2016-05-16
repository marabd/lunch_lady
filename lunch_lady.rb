@order = []
@sum = []

@main = {
	pizza: {name: 'Pizza', price: 4.05, description: 'Topped with veggies, and very cheesy.'},
	tacos: {name: 'Tacos', price: 3.55, description: 'Fish and veggies options available.'},
	burger: {name: 'Burger', price: 5.05, description: 'Gourmet veggie burger with a slice of cheese.'},
	lasagna: {name: 'Lasagna', price: 4.55, description: 'Homemade, comforting, veggie lasagna.'}
}

@side = {
	fries: {name: 'Fries', price: 1.55, description: 'Double-fried, golden, and crispy.'},
	salad: {name: 'Salad', price: 2.05, description: 'House chopped side-salad.'},
	soup: {name: 'Soup', price: 1.75, description: 'Hearty soup of the day.'},
	brownie: {name: 'Brownie', price: 1.05, description: 'Delicious, fudgy, double-chocolate.'},
	cookie: {name: 'Cookie', price: 1.25, description: 'Double chocolate chip.'}	
}

def budget
	puts "What's your budget today?"
	@money = gets.strip.to_i
	main_menu
end

def main_menu
	@order.clear
	@sum.clear
	puts "Please choose what you would like to eat from the menu:"
	puts "#{@main[:pizza][:name]} - $#{@main[:pizza][:price]}"
	puts "#{@main[:tacos][:name]} - $#{@main[:tacos][:price]}"
	puts "#{@main[:burger][:name]} - $#{@main[:burger][:price]}"
	puts "#{@main[:lasagna][:name]} - $#{@main[:lasagna][:price]}"
	puts "Type 'd' to if you want to see the description of the food, or 'quit' to exit."
	@input1 = gets.strip.downcase.to_s
	if @input1 == 'pizza' || @input1 == 'tacos' || @input1 == 'burger' || @input1 == 'lasagna'
		@order << @input1
			@sum << @main[@input1.to_sym][:price]
		side1
	elsif @input1 == 'd'
		main_desc
	elsif @input1 == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else
		puts "User Input Error, Please Input Your Menu Choice Again"
		main_menu
	end
end

def main_desc
	puts "Choose what you would like to see the description of:"
	puts "#{@main[:pizza][:name]}"
	puts "#{@main[:tacos][:name]}"
	puts "#{@main[:burger][:name]}"
	puts "#{@main[:lasagna][:name]}"
	puts "To exit, type 'quit'."
	@input_desc = gets.strip.downcase.to_s
	if @input_desc == 'pizza' || @input_desc == 'tacos' || @input_desc == 'burger' || @input_desc == 'lasagna'
		puts @main[@input_desc.to_sym][:description]
		main_menu
	elsif @input_desc == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else
		puts "User Input Error, Please Input Your Description Choice Again"
		main_desc
	end
end

def side1
	puts "Please choose your side dish:"
	puts "#{@side[:fries][:name]} - #{@side[:fries][:price]}"
	puts "#{@side[:salad][:name]} - #{@side[:salad][:price]}"
	puts "#{@side[:soup][:name]} - #{@side[:soup][:price]}"
	puts "#{@side[:brownie][:name]} - #{@side[:brownie][:price]}"
	puts "#{@side[:cookie][:name]} - #{@side[:cookie][:price]}"
	puts "Type 'd' to if you want to see the description of the food, or 'quit' to exit."
	@input2 = gets.strip.downcase.to_s
	if @input2 == 'fries' || @input2 == 'salad' || @input2 == 'soup' || @input2 == 'brownie' || @input2 == 'cookie'
		@order << @input2
			@sum << @side[@input2.to_sym][:price]
		second_side
	elsif @input2 == 'd'
		side_desc
	elsif @input2 == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else
		puts "User Input Error, Please Input Your Side Choice Again"
		side1
	end
end

def side_desc
	puts "Choose what you would like to see the description of:"
	puts "#{@side[:fries][:name]}"
	puts "#{@side[:salad][:name]}"
	puts "#{@side[:soup][:name]}"
	puts "#{@side[:brownie][:name]}"
	puts "#{@side[:cookie][:name]}"
	puts "To exit, type 'quit'."
	@input_side_desc = gets.strip.downcase.to_s
	if @input_side_desc == 'fries' || @input_side_desc == 'salad' || @input_side_desc == 'soup' || @input_side_desc == 'brownie' || @input_side_desc == 'cookie'
		puts @side[@input_side_desc.to_sym][:description]
		side1
	elsif @input_side_desc == 'quit'
		puts "Thanks for visiting the Ruby Cafeteria!"
		exit(0)
	else
		puts "User Input Error, Please Input Your Description Choice Again"
		side_desc
	end
end

def second_side
	puts "Would you like another side (y/n)? You can type 'quit' to exit."
	input3 = gets.strip.downcase.to_s
	if input3 == 'yes' || input3 == 'y'
		side1
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
	else
		puts "User Input Error, Please Input Your Menu Choice Again"
		total
	end
end

def checkout
	total_cost = @sum.reduce(:+)
	if total_cost > @money
		puts "I'm sorry, you can't afford all this food. Please try again!"
		main_menu
	else
		print "Your total is: $"
		puts '%.2f' % @sum.reduce(:+)
		puts "Thanks for eating at the Ruby Cafeteria. Enjoy!"
	end
end

while true
	puts "Welcome to the Ruby Cafeteria!"
	budget
end
