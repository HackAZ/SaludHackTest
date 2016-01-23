module LandingHelper
  def service_options
    s = ''
    Provider.all.each do |provider|
      s << "<option value = '#{provider.provider_type}'> #{provider.provider_type}</options>"
    end
    s.html_safe
  end

  def specialization_options
    s = ''
    Provider.all.each do |provider|
      s << "<option value = '#{provider.specialization}'> #{provider.specialization}</options>"
    end
    s.html_safe
  end
end
