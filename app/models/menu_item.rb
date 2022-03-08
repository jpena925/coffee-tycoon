class MenuItem < ActiveRecord::Base
    has_many :orders
    belongs_to :store
    belongs_to :item
    has_many :customers, through: :orders
end