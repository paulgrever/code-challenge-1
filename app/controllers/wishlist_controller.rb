class WishlistController < ApplicationController
  respond_to :json, :html
  
  def create
    respond_with Wishlist.create(wishlist_params)
  end

  def index
    @wishlists = Wishlist.all
  end

  def destroy
    respond_with Wishlist.destroy_all(:item_id => params[:item_id])
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:item_id)
  end
end
