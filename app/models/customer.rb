class Customer < ActiveRecord::Base
    has_many :orders
    has_many :menu_items, through: :orders

    def self.cold_customers
        self.all.where('want_hot < .50')
    end

    def self.hot_customers
        self.all.where('want_hot > .50')
    end

    def want_cold_percent(percent)
        (1 - self.want_hot) * 0.30 + (percent * 0.01) * 0.70
    end

    def decide_hot?(percent)
        rand(1..100) > want_cold_percent(percent) * 100   
    end


    def self.create_orders(num, percent)
        num.to_i.times do |i|
            customer = Customer.find(i + 1)
            drink_choices = customer.decide_hot?(percent.to_i) ? MenuItem.available_hot : MenuItem.available_cold
            chosen_drink = drink_choices.sample
            if chosen_drink.quantity > 0 
                Order.create(
                    sell_price: chosen_drink.sell_price, 
                    menu_item: chosen_drink, 
                    customer: customer, 
                    fulfilled: true)
                chosen_drink.item_bought
            else
                Order.create(
                    sell_price: chosen_drink.sell_price, 
                    menu_item: chosen_drink, 
                    customer: customer, 
                    fulfilled: false
                )
            end
        end
        return Order.all
    end
end