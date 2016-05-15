# user chooses from a list of main dishes
# user chooses 2 side dish items
# computer repeats users order
# computer totals lunch items and displays total
# require 'pry'
class Food
	attr_accessor :name, :price# :description, :calories, :fat, :carbs, :protein

	def initialize(name, price)# description, calories, fat, carbs, protein)
		@name = name
		@price = price
	end
end

class Main < Food
	def initialize(name, price)# description, calories, fat, carbs, protein)
			super(name, price)# description, calories, fat, carbs, protein)
	end
end

class Side < Food
	def initialize(name, price)# description, calories, fat, carbs, protein, sugar)
		super(name, price)# description, calories, fat, carbs, protein)
	end
end


def main_menu
	pizza = Main.new('Pizza', '$4.00')
	tacos = Main.new('Tacos', '$3.50')
	burger = Main.new('Burger', '$5.00')
	lasagna = Main.new('Lasagna', '$4.50')

	puts "What main dish would you like?"
	puts "1. #{pizza.name} - #{pizza.price}"
	puts "2. #{tacos.name} - #{tacos.price}"
	puts "3. #{burger.name} - #{burger.price}"
	puts "4. #{lasagna.name} - #{lasagna.price}"
	input1 = gets.strip.to_i
	side1(input1)
end

def verify_main(input1)
	if input1 == 1 || input1 == 2 || input1 == 3 || input1 == 4 
	side1
	else input1
		puts "User Input Error, Please Input Your Menu Choice Again"
		main_menu
	end
end

def side1(input1)
	fries = Side.new('Fries', '$1.50')
	salad = Side.new('Salad', '$2.00')
	soup = Side.new('Soup', '$1.75')
	brownie = Side.new('Brownie', '$1.00')
	cookie = Side.new('Cookie', '$1.25')
	
	puts "Please choose your side dishes:"
	puts "1. #{fries.name} - #{fries.price}"
	puts "2. #{salad.name} - #{salad.price}"
	puts "3. #{soup.name} - #{soup.price}"
	puts "4. #{brownie.name} - #{brownie.price}"
	puts "5. #{cookie.name} - #{cookie.price}"
	input2 = gets.strip.to_i
	side2(input2)
end

# def verify_side(input2)
# 	if input2 == 1 || input2 == 2 || input2 == 3 || input2 == 4 || input2 == 5
# 		side1
# 	else input2
# 		puts "User Input Error, Please Input Your Menu Choice Again"
# 		main_menu
# 	end
# end
main_menu




# def check_number(num)
#   if num.include?('.')
#     num.to_f.to_s == num
#   else
#     num.to_i.to_s == num
#   end
# end
