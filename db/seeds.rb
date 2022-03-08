puts "🌱 Seeding spices..."
# Seed your database here

30.times do 
    Customer.create(name: Faker::Name.name, want_hot: rand(0.00..0.99).round(2))
end


Item.create(name: "Black Coffee", drink_type: "Coffee", hot: true, buy_price: 1.75)
Item.create(name: "Cappuccino", drink_type: "Coffee", hot: true, buy_price: 2.50)
Item.create(name: "Cortado", drink_type: "Coffee", hot: true, buy_price: 2.25)
Item.create(name: "Latte", drink_type: "Coffee", hot: true, buy_price: 2.75)
Item.create(name: "Iced Coffee", drink_type: "Coffee", hot: false, buy_price: 2.50)
Item.create(name: "Iced Latte", drink_type: "Coffee", hot: false, buy_price: 3.00)
Item.create(name: "Iced Frappuccino", drink_type: "Coffee", hot: false, buy_price: 3.25)
Item.create(name: "Assam Black", drink_type: "Tea", hot: true, buy_price: 2.00)
Item.create(name: "Jasmine Green", drink_type: "Tea", hot: true, buy_price: 2.00)
Item.create(name: "Silver Needles White", drink_type: "Tea", hot: true, buy_price: 2.50)
Item.create(name: "Matcha Latte", drink_type: "Tea", hot: true, buy_price: 3.25)
Item.create(name: "Iced Sencha Green", drink_type: "Tea", hot: false, buy_price: 2.00)
Item.create(name: "Iced Hibiscus", drink_type: "Tea", hot: false, buy_price: 2.25)
Item.create(name: "Iced Chai Latte", drink_type: "Tea", hot: false, buy_price: 3.00)


Store.create(money: 70, popularity: 0.50)

MenuItem.create(item: Item.first, store: Store.first, quantity: 5)
Order.create(sell_price: 10.00, menu_item: MenuItem.first, customer: Customer.first)

puts "✅ Done seeding!"
