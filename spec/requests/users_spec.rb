require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.

  let!(:user) { create(:random_user) }
  let!(:token) { JWT.encode({ user_id: user.id }, 's3cr3t') }

  let(:valid_attributes) do
    { username: user.username, email: user.email, password: user.password }
  end

  let(:new_user) do
    { username: 'test123', email: 'test123@example.com', password: 'sample123' }
  end

  let(:invalid_attributes) do
    { username: '' }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'POST /login' do
    it 'renders a successful response' do
      post '/login', params: valid_attributes, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post users_url,
               params: new_user, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post users_url,
             params: new_user, headers: valid_headers, as: :json
        expect(response.body).to match('test123')
        # expect(response).to have_http_status(:created)
        # expect(response.content_type).to match('application/json')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url,
               params: invalid_attributes, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post users_url,
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match('application/json')
      end
    end
  end
end
