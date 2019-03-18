# == Schema Information
#
# Table name: product_measurement_units
#
#  id      :integer          not null, primary key
#  name    :string
#  name_en :string
#

class ProductMeasurementUnit < ApplicationRecord

  # log_in
  def self.sign_in(params)
    response = Response.rescue do |_res|
    end
    response
  end
end
