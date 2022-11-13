require 'rails_helper'

RSpec.describe RestCountriesFacade, type: :facade do
  describe 'gets rest countries endpoints and instantiates poros', vcr: { record: :new_episodes } do
    it 'instantiates' do
      expect(RestCountriesFacade.new).to be_a(RestCountriesFacade)
    end

    it 'instantiates countries poros' do
      countries = RestCountriesFacade.all_countries
      require 'pry'; binding.pry
    end
  end
end