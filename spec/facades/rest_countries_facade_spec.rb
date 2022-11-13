require 'rails_helper'

RSpec.describe RestCountriesFacade, type: :facade do
  describe 'gets rest countries endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RestCountriesFacade.new).to be_a(RestCountriesFacade)
    end

    it 'instantiates rest countries poros' do
      countries = RestCountriesFacade.all_countries
      
      expect(countries).to be_a(Array)
      countries.each do |country|
        expect(country).to be_a(String)
      end
    end
  end
end