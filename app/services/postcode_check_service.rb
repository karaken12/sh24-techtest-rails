class PostcodeCheckService
  def shippable?(postcode)
    postcode = postcode.upcase.gsub(/[^A-Z\d]/, '')

    return true if ADDITIONAL_SHIPPABLE_POSTCODES.include?(postcode)

    lsoa = get_lsoa(postcode)
    return true if SHIPPABLE_AREAS.any? do |area|
      lsoa.start_with?("#{area} ")
    end

    false
  end

  private

  ADDITIONAL_SHIPPABLE_POSTCODES = %w[SH241AA SH241AB].freeze
  SHIPPABLE_AREAS = %w[Southwark Lambeth].freeze

  def get_lsoa(postcode)
    case postcode
    when 'SE17QD'
      'Southwark ABCD'
    when 'SE17QA'
      'Lambeth ABDFA'
    else
      'unknown'
    end
  end
end
