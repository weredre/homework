# frozen_string_literal: true

class CategoryController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @categories = Category.all

    if @categories.empty?
      render json: {
        error: 'Not even one Category'
      }
    else
      render json: {
        response: 'Here are the Categories!',
        data: @categories
      }
    end
  end

  # POST /todos

  def create
    @categories = Category.create!(category_params)
    json_response = json_response(@categories, :created)
  end

  # GET /todos/:id
  def show
    json_response(@categories)
  end

  # PUT /todos/:id
  def update
    @categories.update(category_params)
    json_response(status: 'SUCCESS', message: 'updated the category', data: @categories.title)
  end

  # DELETE /todos/:id
  def destroy
    @categories.destroy
    json_response(status: 'SUCCESS', message: 'deleted the category', data: @categories.title)
  end

  private

  def category_params
    # whitelist params
    params.permit(:title, :created_by, :description, :recipe)
  end

  def set_category
    @categories = Category.find(params[:id])
  end
end
