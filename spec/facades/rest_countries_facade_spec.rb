require 'rails_helper'

RSpec.describe RestCountriesFacade, type: :facade do
  describe 'gets rest countries endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RestCountriesFacade.new).to be_a(RestCountriesFacade)
    end

    it 'instantiates rest countries all countries poro' do
      countries = RestCountriesFacade.all_countries
      
      expect(countries).to be_a(Array)
      countries.each do |country|
        expect(country).to be_a(String)
      end
    end

    it 'instantiates rest countries one country poro' do
      country = RestCountriesFacade.one_country_lat_lng('France')
  
      expect(country).to be_a(CapitalLatLng)
      expect(country.lat).to be_a(Float)
      expect(country.lng).to be_a(Float)
    end
  end
end