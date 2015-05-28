class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :wishlist_item?

  def wishlist_item?(item)
    Wishlist.where(:item_id => item.id).present?
  end

end
