class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/customers" do
    customers = Customer.all
    customers.to_json
  end

  get "/stores" do
    stores = Store.all
    stores.to_json
  end

  get "/items" do
    items = Item.all
    items.to_json
  end

  get "/orders" do
    order = Order.all
    # order.to_json(include: {menu_item: {include: {item: {only: [:name]}}}, customer: {only: [:name]}})
    order.to_json(include: {customer: {only: [:name]}, menu_item: {include: {item: {only: [:name]}}}})
  end

  get "/orders/:num/:percent" do
    Customer.create_orders(params[:num], params[:percent])
    orders = Order.all
    orders.to_json(include: {customer: {only: [:name]}, menu_item: {include: {item: {only: [:name]}}}})
  end 

  get "/menuitems" do
    items = MenuItem.all
    items.to_json
  end

  get "/menuitems/:id" do
    item = MenuItem.find(params[:id])
    item.to_json
  end

  post "/menuitems" do
    menuitem = MenuItem.create(
      item: Item.find_by(name: params[:name]),
      store_id: 1,
      quantity: params[:quantity]
    )
    menuitem.to_json
  end

  delete "/menuitems" do
    MenuItem.destroy_all
  end

end
