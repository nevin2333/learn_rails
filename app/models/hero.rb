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
    heroes.each do |hero|
      Hero.create(hero)
    end
  end
  class << self
    def query_by_params params
      heroes = nil
      page = params[:page] || 1
      per = params[:per] || 10
      response = Response.rescue do |res|
        heroes = Hero.search_by_params(params).select(:name, :id).page(page).per(per)
      end
      [response, heroes]
    end
  end

end
