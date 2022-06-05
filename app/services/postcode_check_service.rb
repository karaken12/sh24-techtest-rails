class PostcodeCheckService
  def shippable?(postcode)
    postcode = postcode.upcase.gsub(/[^A-Z\d]/, '')

    in_additional_shippable_list?(postcode) || in_shippable_area?(postcode)
  end

  private

  ADDITIONAL_SHIPPABLE_POSTCODES = %w[SH241AA SH241AB].freeze
  SHIPPABLE_AREAS = %w[Southwark Lambeth].freeze

  def in_additional_shippable_list?(postcode)
    ADDITIONAL_SHIPPABLE_POSTCODES.include?(postcode)
  end

  def in_shippable_area?(postcode)
    lsoa = get_lsoa(postcode)
    SHIPPABLE_AREAS.any? do |area|
      lsoa.start_with?("#{area} ")
    end
  end

  def get_lsoa(postcode)
    response = Faraday.get("http://postcodes.io/postcodes/#{postcode}")
    if response.status == 200
      JSON.parse(response.body)['result']['lsoa']
    else
      ''
    end
  end
end
