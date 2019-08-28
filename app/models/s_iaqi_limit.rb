class SIaqiLimit < ApplicationRecord

  def SIaqiLimit.smooth_iaqi( attr_name, attr_value )
    if attr_value.blank? || attr_name.blank? || attr_value.to_i < 0
      return ""
    end

    s_iaqi_limit_l = SIaqiLimit.where( "#{attr_name} < ?", attr_value ).order( attr_name ).last
    s_iaqi_limit_h = SIaqiLimit.where( "#{attr_name} >= ?", attr_value ).order( attr_name ).first

    if s_iaqi_limit_h.nil?
      500
    elsif s_iaqi_limit_l.nil?
      0
    else
      ((s_iaqi_limit_h.iaqi - s_iaqi_limit_l.iaqi)*1.000/(s_iaqi_limit_h["#{attr_name}"] - s_iaqi_limit_l["#{attr_name}"]) * (attr_value-s_iaqi_limit_l["#{attr_name}"]) + s_iaqi_limit_l.iaqi).ceil
    end
  end
end
