class Api::V1::TracksController < ApplicationController
  def index
    @tracks = Track.all
    render json: @tracks
  end

  def cherry_red
    c_tracks =
    RSpotify::Playlist.find("21qbxvsukf56zfzd27x3fcj4a", "7eGupH4h530kZfrvvds0kL").tracks
    tracks_map(c_tracks)
  end
  def random
    tracks = RSpotify::Playlist.browse_featured(country: 'US')
    tracks_map(tracks)
  end

  def search
    tracks = RSpotify::Track.search(params[:q])
    tracks_map(tracks)
  end

  private

  def tracks_map(tracks)
    @tracks = tracks.map do |track|
      Track.new_from_spotify_track(track)
    end
    render json: @tracks
  end
end

