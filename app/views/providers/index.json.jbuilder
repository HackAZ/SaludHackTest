json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :location, :latitude, :longitude, :phone, :rating, :type, :specialization
  json.url provider_url(provider, format: :json)
end
