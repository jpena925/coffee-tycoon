class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.references :item
      t.references :store
      t.integer :quantity
    end
  end
end
