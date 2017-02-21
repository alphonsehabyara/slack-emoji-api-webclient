class Emoji

  attr_accessor :id, :people, :nature, :food_and_drink, :celebration, :activity, :travel_and_places, :objects_and_symbols, :custom, :emoji

  def initialize (hash)
    @id = hash ['id']
    @people = hash ['people']
    @nature = hash ['nature']
    @food_and_drink = hash ['food_and_drink']
    @celebration = hash ['celebration']
    @activity = hash ['activity'] 
    @travel_and_places = hash ['travel_and_places']
    @objects_and_symbols = hash ['objects_and_symbols']
    @custom = hash ['custom'] 
    @emoji = hash ['emoji']    
  end

  def self.find(hash)
    emojis_hashes = Unirest.get("#{ENV['DOMAIN']}/emojis/#{id}.json").body
    Emoji.new(emojis_hashes)
  end

  def self.all
    emojis_hashes = Unirest.get("#{ENV['DOMAIN']}/emojis.json").body
    emojis = []
    emojis_hashes.each do |emojis_hash|
      emojis << Emoji.new(emojis_hash)
    end
    return emojis # this is an array of ruby instances (emojis)
  end

  def self.delete(id)
    Unirest.delete("#{ENV['DOMAIN']}/emojis/#{id}.json").body
  end

  def self.update(id, people, nature, food_and_drink, celebration, activity, travel_and_places, objects_and_symbols, custom, emoji)
    Unirest.patch("#{ENV['DOMAIN']}/emojis/#{id}.json", :headers => {"Accept"=> "application/json"}, 
      :parameters => {
        :people => people, 
        :nature => nature, 
        :food_and_drink=> food_and_drink, 
        :celebration => celebration, 
        :activity => activity, 
        :travel_and_places, 
        :objects_and_symbols => objects_and_symbols, 
        :custom => custom, 
        :emoji=> emoji}).body
  end

  def self.create(people, nature, food_and_drink, celebration, activity, travel_and_places, objects_and_symbols, custom, emoji)
   Unirest.patch("#{ENV['DOMAIN']}/emojis/#{id}.json", :headers => {"Accept"=> "application/json"}, 
      :parameters => {
        :people => people, 
        :nature => nature, 
        :food_and_drink=> food_and_drink, 
        :celebration => celebration, 
        :activity => activity, 
        :travel_and_places, 
        :objects_and_symbols => objects_and_symbols, 
        :custom => custom, 
        :emoji=> emoji}).body
  end

end 