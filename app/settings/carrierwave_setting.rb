# encoding: UTF-8
# frozen_string_literal: true

class CarrierwaveSetting < Settingslogic
  source "#{Rails.root}/config/carrierwave.yml"
  namespace Rails.env
end
