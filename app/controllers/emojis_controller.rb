class EmojisController < ApplicationController

  def show
    @emoji = SlackEmoji.find(params[:id])
  end

  def index
    @emojis = SlackEmoji.all  
  end

  def new

  end

  def create
    @emoji = SlackEmoji.post("#{ENV['DOMAIN']}/emojis.json", 
      :headers => {"Accept"=> "application/json"}, 
      :parameters => {:id => params[:id], 
      :people => params[:people], 
      :nature=> params[:nature], 
      :food_and_drink => params[:food_and_drink], 
      :celebration => params[:celebration],
      :activity=> params[:activity], 
      :travel_and_places => params[:travel_and_places], 
      :objects_and_symbols => params[:objects_and_symbols],
      :custom=> params[:custom], 
      :emoji => params[:emoji]
      }).body
    redirect_to "/emojis/#{@emoji['id']}"
  end

  def edit
    @emoji = SlackEmoji.get("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json").body
  end

  def update
      @emoji = SlackEmoji.patch("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json", 
      :headers => {"Accept"=> "application/json"}, 
      :parameters => {:id => params[:id], 
      :people => params[:people], 
      :nature=> params[:nature], 
      :food_and_drink => params[:food_and_drink], 
      :celebration => params[:celebration],
      :activity=> params[:activity], 
      :travel_and_places => params[:travel_and_places], 
      :objects_and_symbols => params[:objects_and_symbols],
      :custom=> params[:custom], 
      :emoji => params[:emoji]
      }).body
    redirect_to "/emojis/#{@emoji['id']}" 
  end

  def destroy
    SlackEmoji.delete(params[:id])
    redirect_to "/emojis"
  end

end