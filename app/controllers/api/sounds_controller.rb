class API::SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :update, :destroy]

  def index
    render json: Sound.all
  end

  def show
    render json: @sound
  end

  def create
    sound = Sound.new(sound_params)
    if sound.save
      render json: sound
    else
      render json: { message: sound.errors }, status: 400
    end
  end

  def update
    if @sound.update(sound_params)
      render json: @sound
    else
      render json: { message: sound.errors }, status: 400
    end
  end

  def destroy
    if @sound.destroy
      render status: 204
    else
      render json: { message: 'Unable to remove this sound' }, status: 400
    end
  end

private

  def sound_params
    params.require(:sound).permit(:title, :description, :audio_url)
  end

  def set_sound
    @sound = Sound.find_by(id: params[:id])
  end

end
