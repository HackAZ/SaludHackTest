module LandingHelper
  def service_options
    s = ''
    Provider.all.each do |provider|
      if s.include? provider.provider_type
      else
        s << "<option value = '#{provider.provider_type}'> #{provider.provider_type}</options>"
      end
    end
    s.html_safe
  end

  def specialization_options
    s = ''
    Provider.all.each do |provider|
      if s.include? provider.specialization
      else
        s << "<option value = '#{provider.specialization}'> #{provider.specialization}</options>"
      end
    end
    s.html_safe
  end
end
