class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]
  def index
    @items = Item.all
    @categories = @items.map do |item|
      item.category
    end.uniq
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new
    @item.name = item_params[:name]
    @item.description = item_params[:description]
    @item.photo = item_params[:photo]
    @item.user = current_user
    # @item.category = Category.first
    @item.category = Category.find(item_params[:category])
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :photo)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
