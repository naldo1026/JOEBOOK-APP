require 'json'
require 'open-uri'

class CoversController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :accept, :edit, :update, :destroy]
  
  def index
    @covers = Cover.all.order("created_at DESC")
    api_call
  end

  def show
    @cover = Cover.find(params[:id])
  end

  def accept
    Rails.logger.info "Accepted the shift #{current_user}"

    cover = Cover.find(params[:id])
    cover.user = current_user

    cover.save!
    redirect_to covers_path
  end

  def new
    @cover = Cover.new
  end

  def create
    @cover = Cover.create(cover_params)

    if @cover.save!
      redirect_to covers_path
    end
  end

  def api_call
    url = 'https://api.openweathermap.org/data/2.5/find?q=London&appid='
    user_serialized = URI.open(url).read
    opened_api = JSON.parse(user_serialized)
  end

  private

  def cover_params
    params.require(:cover).permit(:store_name, :date_of_shift, :time_of_shift, :descrption)
  end
end
