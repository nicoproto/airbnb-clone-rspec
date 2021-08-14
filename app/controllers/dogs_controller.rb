class DogsController < ApplicationController
  def index
    @dogs = policy_scope(Dog)
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog

    if @dog.save
      redirect_to @dog
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :description, :breed, :price, :location)
  end
end
