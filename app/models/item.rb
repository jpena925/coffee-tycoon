class Item < ActiveRecord::Base
    has_many :menu_items
    has_many :stores, through: :menu_items
end