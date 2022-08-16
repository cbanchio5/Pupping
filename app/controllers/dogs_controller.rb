class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    @user = current_user
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    @dog.save
    redirect_to user_dogs_path(current_user)
  end

  def edit
    @dog = Dog.find(params[:id])
    @user = current_user
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :description)
  end
end
