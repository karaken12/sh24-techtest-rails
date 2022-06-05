class PostcodeCheckService
  def shippable?(postcode)
    return true if ['SH24 1AA', 'SH24 1AB'].include?(postcode)

    lsoa = get_lsoa(postcode)
    lsoa.start_with?('Southwark ') || lsoa.start_with?('Lambeth ')
  end

  private

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
