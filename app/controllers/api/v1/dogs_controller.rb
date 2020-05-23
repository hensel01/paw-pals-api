class Api::V1::DogsController < ApplicationController

    # show, index, update, create 

    def show
        dog = Dog.find(params[:id])
        render json: dog
    end

    def index
        dogs = Dog.all
        render json: DogSerializer.new(dogs)
    end

    def create 
        dog = Dog.create(dog_params)
        render json: dog
    end

    def update
        dog = Dog.find(params[:id])
        dog.update(dog_params)
        render json: dog
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :status, :age, :gender, :size, :image, :description, :favorite_toy, :human, :username, :password)
    end
end


# t.string :name
# t.string :breed
# t.text :status
# t.string :age
# t.string :gender
# t.string :size
# t.string :image
# t.text :description
# t.text :favorite_toy
# t.string :human
# t.string :username
# t.string :password