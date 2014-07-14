class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @car = current_user.cars.build if signed_in?
      @garage_items = current_user.garage.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
