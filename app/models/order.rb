class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :menu_item

    def self.fulfilled 
        Order.all.where(fulfilled: 1)
    end

    def self.not_fulfilled
        Order.all.where(fulfilled: 0)
    end
end