class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def search
    coords = Geocoder.search(params[:location]).first.coordinates
    client = GooglePlaces::Client.new('')
    spots = client.spots(coords[0], coords[1], :types => ['bar', 'night_club'], :detail => true);
    spots.each do |spot|
      bar = Bar.new
      bar.name = spot.name
      bar.address = spot.formatted_address
      bar.phone = spot.formatted_phone_number
      photo = ''
      unless spot.photos.empty?
        photo = spot.photos[0].fetch_url(400)
      else
        photo = "/assets/stock-photo.jpg"
      end
      bar.image = photo
      bar.link = spot.website
      bar.bar_id = spot.place_id
      bar.save
    end
    redirect_to bars_path
  end

  def saved

  end

  private
  def bar_params
    params.require(:bar).permit(:location)
  end
end
