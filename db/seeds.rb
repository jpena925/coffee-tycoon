puts "🌱 Seeding spices..."
# Seed your database here


fakeSayings = []

25.times do 
    hipster_string = Faker::Hipster.word
    fakeSayings << "OMG, this place is totally #{hipster_string}!😎"
end

25.times do
    hipster_string = Faker::Hipster.sentence(word_count: 3, random_words_to_add: 0)
    fakeSayings << "Dude, once that drink hit my lips, I was like, #{hipster_string.slice(0...-1)}!!!👌"
end

25.times do
    hipster_string = Faker::Hipster.word
    fakeSayings << "This place is the new #{hipster_string}.😍"
end

25.times do
    hipster_string = Faker::Hipster.word
    fakeSayings << "#{hipster_string}!🤠"
end

25.times do
    hipster_string = Faker::Hipster.word
    fakeSayings << "This place is hella #{hipster_string}!🥸"
end

100.times do 
    fakeSaying = fakeSayings.sample
    Customer.create(name: Faker::Name.name, want_hot: rand(0.00..0.99).round(2), happy_saying: fakeSaying)
    fakeSayings.delete(fakeSaying)
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


Store.create(money: 40, popularity: 0.50)

# MenuItem.create(item: Item.first, store: Store.first, quantity: 2)
# MenuItem.create(item: Item.find(3), store: Store.first, quantity: 2)
# MenuItem.create(item: Item.find(4), store: Store.first, quantity: 2)
# MenuItem.create(item: Item.find(2), store: Store.first, quantity: 1)
# MenuItem.create(item: Item.find(9), store: Store.first, quantity: 1)
# MenuItem.create(item: Item.find(7), store: Store.first, quantity: 1)
# Order.create(sell_price: 10.00, menu_item: MenuItem.first, customer: Customer.first, fulfilled: true)

puts "✅ Done seeding!"
