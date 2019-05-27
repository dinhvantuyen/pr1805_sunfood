class Admin::ProductsController < Admin::BaseController
  before_action :load_product, except: [:index, :new, :create]

  def index
    @product = Product.all
    @count = Product.count
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Tạo mới sản phẩm thành công"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @product.update_attributes product_params
      flash[:success] = "Cập nhật thành công"
      redirect_to admin_products_path
    else
      render :edit
    end
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
    redirect_to admin_products_path
  end

end
