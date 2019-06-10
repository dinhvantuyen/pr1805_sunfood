class ReviewsController < ApplicationController

  def create
    @product = Product.find_by id: params[:review][:product_id]
    @review = current_user.reviews.build review_params
    if @review.save
      if params[:images].presence
        params[:images][:address].each do |a|
          @images = @review.images.create! address: a
        end
      end
    else
      render :@product_path
    end
    @reviews = @product.reviews.order("created_at desc").limit(3)
    respond_to do |format|
      format.js
    end
  end

  def update

  end

  private

  def review_params
    params.require(:review).permit :rate, :content, :product_id, images_attributes: [:address]
  end

end
