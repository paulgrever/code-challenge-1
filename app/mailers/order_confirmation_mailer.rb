class OrderConfirmationMailer < ApplicationMailer

  def order_confirm(item, order)
    @item = item
    @order = order
    mail(to: "storedom-overlord@example.com", subject: "Your item has been ordered.")
  end
end
