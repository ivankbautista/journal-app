class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    redirect_to categories_path
  end

  private
    def correct_user
      @category = current_user.categories.find_by(id: params[:id])
      redirect_to categories_path, notice: "Not authorized to access this activity" if@category.nil?
    end

    def category_params
      params.require(:category).permit(:title, :user_id)
    end

end
