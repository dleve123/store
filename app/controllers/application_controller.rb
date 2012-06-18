class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def current_cart
      # session[:cart_id] returns the session for the current cart id,
        # this argument is used to find the cart object of the session which matches said cart id
      Cart.find(session[:cart_id])
      # assuming this line means if no cart is returned from the line:9, run the rescue block.
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id #the session's cart id is the new cart's id
      cart #returns the cart
    end
end
