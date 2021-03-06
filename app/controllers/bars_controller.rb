class BarsController < ApplicationController
  def index
    @bars = Bar.order id: :desc
  end

  def search
    coords = Geocoder.search(params[:location])
    if coords.empty?
      flash[:error_invalid_search] = 'That location could not be found. Please check the spelling and try again.'
      redirect_to bars_path
    else
      flash[:error_invalid_search] = nil
      coords = coords.first.coordinates
      client = GooglePlaces::Client.new(ENV["GOOGLE_PLACES_API_KEY"])
      spots = client.spots(coords[0], coords[1], :types => ['bar', 'night_club'], :detail => true);
      spots.each do |spot|
        bar = Bar.new
        bar.name = spot.name
        bar.address = spot.formatted_address
        bar.phone = spot.formatted_phone_number
        unless spot.photos.empty?
          bar.image = spot.photos[0].fetch_url(400)
        else
          bar.image = ActionController::Base.helpers.image_path('stock-photo.jpg')
        end
        bar.city = spot.city
        bar.link = spot.website
        bar.bar_id = spot.place_id
        bar.save
      end
      redirect_to bars_path
    end
  end

  private
  def bar_params
    params.require(:bar).permit(:location)
  end
end
