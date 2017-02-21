class EmojisController < ApplicationController

  def show
    @emojis = SlackEmoji.find(params[:id])
    # emoji_hash = Unirest.get("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json").body
    # @emoji = Emoji.new(emoji_hash)
  end

  def index
    @emojis = Emoji.all   
  end

  def new

  end

  def create
    @emoji = Unirest.post("#{ENV['DOMAIN']}/emojis.json", 
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
    @emoji = Unirest.get("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json").body
  end

  def update
      @emoji = Unirest.patch("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json", 
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

    # Unirest.delete("#{ENV['DOMAIN']}/emojis/#{params[:id]}.json").body
    # redirect_to "/emojis"
  end

end