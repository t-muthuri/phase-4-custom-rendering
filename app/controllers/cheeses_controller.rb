class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name]
    # serialization
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]

  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese
    else
      render json: { error: "Cheese not found"}, status: 404
      # status: :not_found
      end
    # render json: cheese
  end

end
