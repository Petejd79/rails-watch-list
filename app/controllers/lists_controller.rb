class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(safe_params)
    @list.save
    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end
  
  private

  def safe_params
    params.require(:list).permit(:name)
  end
end
