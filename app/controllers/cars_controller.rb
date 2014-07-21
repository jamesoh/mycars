class CarsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,  only: :destroy
  
  def create
    @car = current_user.cars.build(car_params)
    if @car.valid?
      if parse(@car) 
        if @car.save
          flash[:success] = "Car added!"
          redirect_to root_url
        else
          @garage_items = []
          render 'static_pages/home'
        end
      else
        flash[:error] = "No data for this VIN"
        redirect_to root_url
      end    
    else
      flash[:error] = "VIN is not valid"
      redirect_to root_url
    end
  end

  def destroy
    @car.destroy
    redirect_to root_url
  end


  private
    
    def car_params
      params.require(:car).permit(:vin)
    end

    def correct_user
      @car = current_user.cars.find_by(id: params[:id])
      redirect_to root_url if @car.nil?
    end

    def parse(car)
      uri = URI.parse("http://clearbook.qa2.truecardev.com/a/pag/120/default_style?vin=#{car.vin}")
      response = Net::HTTP.get_response uri
      makes_json = JSON.parse response.body
      
      if !makes_json["data"].nil?
        car.data = makes_json["data"][0]
      else
        nil
      end
    end
end
