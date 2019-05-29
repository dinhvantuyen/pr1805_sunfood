class Shops::ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Thêm sản phẩm mới thành công"
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  private

  def product_params
    params.require(:product).permit :name, :price, :image, :description,
      :sale_price, :status, category_ids: []
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger]="Sản phẩm không tồn tại"
    redirect_to root_path
  end
end
