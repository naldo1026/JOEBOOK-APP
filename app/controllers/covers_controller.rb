class CoversController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @covers = Cover.all
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

  private

  def cover_params
    params.require(:cover).permit(:store_name, :date_of_shift, :time_of_shift, :descrption)
  end
end
