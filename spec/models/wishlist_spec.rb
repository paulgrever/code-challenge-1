require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  before(:each) do 
    @item = Item.create(name: "item", description: "description")
  end

  it "is associated with item" do
    wishlist = Wishlist.create(item_id: @item.id)
    expect(wishlist.item.name).to eq("item")
  end
end
