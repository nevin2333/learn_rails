# == Schema Information
#
# Table name: heros
#
#  id         :integer          not null, primary key
#  name       :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hero < ApplicationRecord
  include BaseModelConcern

  def initial
    heroes = [
        { name: 'Mr. Nice' },
        { name: 'Narco' },
        { name: 'Bombasto' },
        { name: 'Celeritas' },
        { name: 'Magneta' },
        { name: 'RubberMan' },
        { name: 'Dynama' },
        { name: 'Dr IQ' },
        { name: 'Magma' },
        { name: 'Tornado' },
    ]
    Hero.bulk_insert(set_size: 100, update_duplicates: true) do |worker|
      heroes.each do |hero|
        worker.add(hero)
      end
    end
  end
  class << self
    def query_by_params params
      heroes = nil
      page = params[:page] || 1
      per = params[:per] || 10
      response = Response.rescue do |res|
        heroes = Hero.search_by_params(params[:search]).select(:name, :id).page(page).per(per)
      end
      [response, heroes]
    end

    def update_by_params params
      binding.pry
    end
  end

end
