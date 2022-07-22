class RecipesController < ApplicationController

    def index
        render json: Recipe.all
    end

    # def show
    #     recipe = Recipe.find_by(params[:user_id])
    #     render json: recipe
    # end
    #this code ^^^ is depricated

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end