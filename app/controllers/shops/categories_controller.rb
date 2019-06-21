class Shops::CategoriesController < ApplicationController
  before_action :load_category, except: [:index, :new, :create]
  def index
    @category = current_user.categories.all
  end

  def new
    @category = Category.new
  end

  def create
    if current_user.categories.create category_params
      flash[:success] = "Tạo thành công"
      redirect_to shops_categories_path
    else
      render :new
    end
  end

  def show;end

  def edit; end

  def update
    if @category.update category_params
      redirect_to shops_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to shops_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = "Chuyên mục không tồn tại"
    redirect_to shops_categories_path
  end

end
