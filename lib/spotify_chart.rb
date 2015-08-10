require 'json'
require 'open-uri'

class SpotifyChart
  BASE_URL = 'http://charts.spotify.com/api/tracks/most_streamed'

  def get_url(region)
    "#{BASE_URL}/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  def get_first_track_info(music_hash)
    track = music_hash['tracks'].first

    "#{track['track_name']} by #{track['artist_name']} "\
    "from the album #{track['album_name']}"
  end

  def most_streamed(region)
    url = get_url(region)

    hash = get_json(url)

    get_first_track_info(hash)
  end
end
