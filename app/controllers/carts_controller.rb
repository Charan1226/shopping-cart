class CartsController < ApplicationController
  before_action :authenticate_user!
  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_user.cart

    if @cart.products.include?(@product)
      @cart_item = @cart.cart_items.find_by(product_id: @product.id)
      @cart_item.quantity += 1
    else
      @cart_item = @cart.cart_items.build(product_id: @product.id)
    end

    if @cart_item.save
      redirect_to cart_path, notice: "Product added to cart."
    else
      redirect to @product, alert: "Unable to add product to cart."
    end

    def remove_from_cart
      @product = Product.find(params[:id])
      @cart = current_user.cart
      @cart_item = @cart.cart_items.find_by(product_id: @product.id)

      if @cart_item.destroy
        redirect_to cart_path, notice: "Product removed from cart."
      else
        redirect_to cart_path, alert: "Unable to remove product from cart."
      end
    end

    def show
      @cart = current_user.cart
      @cart_items = @cart.cart_items
    end
  end
end
