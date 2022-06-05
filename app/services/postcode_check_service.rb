class PostcodeCheckService
  def shippable?(postcode)
    return true if ADDITIONAL_SHIPPABLE_POSTCODES.include?(postcode)

    lsoa = get_lsoa(postcode)
    return true if SHIPPABLE_AREAS.any? do |area|
      lsoa.start_with?("#{area} ")
    end

    false
  end

  private

  ADDITIONAL_SHIPPABLE_POSTCODES = ['SH24 1AA', 'SH24 1AB'].freeze
  SHIPPABLE_AREAS = %w[Southwark Lambeth].freeze

  def get_lsoa(postcode)
    case postcode
    when 'SE1 7QD'
      'Southwark ABCD'
    when 'SE1 7QA'
      'Lambeth ABDFA'
    else
      'unknown'
    end
  end
end
