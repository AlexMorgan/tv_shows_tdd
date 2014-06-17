class CharactersController < ApplicationController
  def index
      @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character.television_show = @television_show

    if @character.save
      flash[:notice] = "Success, character added"
      redirect_to television_show_path(@television_show.id)
    else
      flash[:notice] = "Something went wrong!"
      render 'television_shows/show'
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def destroy
    Character.find(params[:id]).destroy

    flash[:notice] = "Character has been deleted"
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor, :description)
  end
end
