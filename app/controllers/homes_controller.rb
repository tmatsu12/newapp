class HomesController < ApplicationController
  def top
  end

  def about
  end

  def region
    # render :partial => "homes/#{params[:region]}"
    render "region/#{params[:region]}"
  end
end
