class ProductsController < ApplicationController

  def show
    @product = Product.find_by id: params[:id]
    @products = Product.all.order("sale_count desc").limit(5)
    @avg_rate = @product.reviews.average(:rate)&.round(2) || 0
    if params[:review_id]
      @reviews = @product.reviews.where("id < ?", params[:review_id]).limit(5)
    else
      @reviews = @product.reviews.order("created_at desc").limit(3)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
