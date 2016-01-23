json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :patient_name, :clinic_name, :days, :time_of_day, :description, :insurance
  json.url appointment_url(appointment, format: :json)
end
