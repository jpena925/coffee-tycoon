class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.float :want_hot
      t.string :happy_saying
    end
  end
end
