require "rails_helper"

RSpec.describe OrderConfirmationMailer, type: :mailer do
  before(:each ) do 
    @item = Item.create(name: "Item 1", description: "item description") 
  end
  before(:each ) do 
    @user = User.create(name: "Paul", email: "test@example.com")  
  end
  before(:each) do 
    @order = Order.create(amount: 1, user_id: @user.id)
  end

  before(:each) do 
    @mail = OrderConfirmationMailer.order_confirm(@item, @order) 
  end


  it "is sent to storedom overload" do
    expect(@mail.to).to eql(["storedom-overlord@example.com"])
  end

  it 'renders the sender email' do
    expect(@mail.from).to eql(['from@example.com'])
  end

  it 'renders the subject' do
    expect(@mail.subject).to eql("Your item has been ordered.")
  end
end
