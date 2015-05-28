require "rails_helper"

RSpec.describe "One Click Order", type: :feature do
  before(:each) do
    @item = Item.create(name: "Item Name", description: "Item Description")
    @user = User.create(name: "Paul", email: "test@example.com") 
  end

  it "can order an item in a single click" do
    visit items_path
    click_link_or_button("one click order")
    expect(page).to have_content("Item Name")
  end

  it "creates an order with one click" do
    expect(Order.count).to eq(0)
    visit items_path
    click_link_or_button("one click order")
    expect(Order.count).to eq(1)
  end

  it "the order is associated with user" do
    visit items_path
    click_link_or_button("one click order")
    expect(page).to have_content("Paul")
  end

  it "redirects to Order show page" do
    visit items_path
    click_link_or_button("one click order")
    expect(page).to have_content("Item Name")
    @order = Order.first
    expect(current_path).to eq(order_path(@order))
    
  end
end