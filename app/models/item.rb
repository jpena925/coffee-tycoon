class Item < ActiveRecord::Base
    has_many :menu_items
    has_many :stores, through: :menu_items



    def self.hot_items
        Item.all.where(hot: true)
    end

    def self.cold_items
        Item.all.where(hot: false)
    end
end