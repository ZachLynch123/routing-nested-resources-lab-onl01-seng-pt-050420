require 'rails_helper'

RSpec.describe SongsController do

  before do
    Song.destroy_all
    Artist.destroy_all
    @artist = Artist.create(name: "Garth Brooks")
    @song = @artist.songs.create(title: "I'm def not Chris Gaines, Everyone haha what are you talking about?")
  end

  describe "GET index" do

   

    it 'returns 200 when just index with no artist_id' do
      get :index
      expect(response).to be_ok
    end

  end

  describe "GET show with  artist" do

    it "returns 200 with valid song and no artist" do
      get :show, params: { id: @song.id }
      expect(response).to be_ok
    end

    

    it "returns 200 with valid artist song" do
      get :show, params: { id: @song.id, artist_id: @artist.id }
      expect(response).to be_ok
    end
  end

end
