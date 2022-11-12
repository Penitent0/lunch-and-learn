require 'rails_helper'

RSpec.describe EdamanService, type: :service do
  describe 'gets endpoints for edaman receipe service', vcr: { record: :new_episodes } do
    it "Instantiates" do
      expect(EdamanService.new).to be_a(EdamanService)
    end
  end
end