class SAqiLevel < ApplicationRecord

  def SAqiLevel.find_by_aqi( attr_value )
    if attr_value.blank?
      return
    end

    SAqiLevel.find_by( "aqi_lower <= ? and aqi_upper >= ?", attr_value, attr_value )
  end
end
