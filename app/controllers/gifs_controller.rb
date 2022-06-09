class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      redirect_to "/", notice: "GIF was successfully created."
    else
      render "new"
    end
  end

  def gif_params
    params.require(:gif).permit(:image)
  end
end
