class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    if @cuisine.save
      redirect_to @cuisine
    else
      flash.now[:error] = 'Você deve informar o nome da cozinha'
      render 'new'
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.update(name: params[:cuisine][:name])
      redirect_to @cuisine
    else
      render 'edit'
    end
  end


end
