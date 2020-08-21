# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_category
  before_action :set_recipes, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @recipe = Recipe.all

    if @recipe.empty?
      render json: {
        error: 'Not even one Recipe'
      }
    else
      render json: {
        response: 'Here are the Recipes!',
        data: @recipe
      }
    end
  end

  # POST /todos

  def create
    @categories.recipes.create!(recipe_params)
    json_response(status: 'SUCCESS', message: 'recipe created successfully.', data: @recipe.name)

    # json_response = json_response(@recipe, :created)

  end

  # GET /todos/:id
  def show
    json_response(@recipe)
  end

  # PUT /todos/:id
  def update
    @recipe.update(recipe_params)
    json_response(status: 'SUCCESS', message: 'updated the recipe', data: @recipe.name)
  end

  # DELETE /todos/:id
  def destroy
    @recipe.destroy
    json_response(status: 'SUCCESS', message: 'deleted the recipe', data: @recipe.name)
  end

  private

  def recipe_params
    # whitelist params
    params.permit(:name, :ingredients, :directions, :notes, :tags, :category_id, :recipe)
  end

  def set_recipes
    @recipe = @categories.recipes.find_by!(id: params[:id]) if @categories
  end

  def set_category
    @categories = Category.find(params[:category_id])
  end
end
