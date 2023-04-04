require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before { get users_path }

    it 'returns http successs' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from USA.', posts_counter: 10) }
    before { get user_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is one user')
    end
  end
end
