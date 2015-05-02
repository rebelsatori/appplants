class PlantsController < ApplicationController
  def addplant
  end

  def details
  end

  def edit
        @plant = Plant.find(params[:id])
        @username = User.find(current_user.id).email
  end

    def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id # added to make association work

    if @plant.save
      redirect_to @plant, notice: 'Plant successfully saved!'
    else
      render 'new'
    end
    end

  def index
    @plants = Plant.all

    @reddit = JSON.load(RestClient.get('http://www.reddit.com/r/gardening/.json')) 
    @stories = @reddit['data']['children']
  end

  def new
          @plant = Plant.new
		  @username = User.find(current_user.id).email
  end

    def update
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      redirect_to @plant, notice: 'Plant successfully updated!'
    else
      render 'edit'
    end
    end

  def show
    @plant = Plant.find(params[:id])
    @username = User.find(current_user.id).email
  end

  private
  def plant_params
    params.require('plant').permit(:name, :seed_condition, :soil_ph, :total_dissolved_solids, :nutrients, :watering_schedule, :temperature, :humidity, :light_condition, :season, :soil_area, :maximum_reported_yield)
  end
end
