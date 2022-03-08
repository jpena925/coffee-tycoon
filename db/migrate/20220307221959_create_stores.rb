class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.float :money
      t.float :popularity
    end
  end
end
