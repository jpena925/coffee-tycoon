class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :sell_price
      t.boolean :fulfilled
      t.references :menu_item
      t.references :customer
    end
  end
end
