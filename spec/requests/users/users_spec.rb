require 'rails_helper'

RSpec.describe 'Users' do
  describe 'POST /users', vcr: { record: :new_episodes } do
    let(:user_params) do
      {
        user: {
          name: "Test Person",
          email: "testmail@internet.org"
        }
      }
    end

    let(:bad_user_params_no_name) do
      {
        user: {
          email: "testmail@internet.org"
        }
      }
    end

    let(:bad_user_params_same_email) do
      {
        user: {
          name: "Test Person Junior",
          email: "testmail@internet.org"
        }
      }
    end

    it 'returns http success' do
      expect { post "/api/v1/users", params: user_params }.to change(User, :count).by(+1)
      expect(response).to have_http_status(:created)
    end

    it 'has sad path for name missing' do
      post "/api/v1/users", params: bad_user_params_no_name
      expect(response).to have_http_status(:bad_request)
    end

    it 'has sad path for same email' do
      post "/api/v1/users", params: user_params
      expect(response).to have_http_status(:created)
      post "/api/v1/users", params: bad_user_params_same_email
      expect(response).to have_http_status(:bad_request)
    end
  end
end