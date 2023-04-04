require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe PostsController, type: :request do
  describe "GET #index" do
    let(:user) {User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from USA.', posts_counter: 10)}
    before { get user_posts_path(user) }

    it "returns http successs" do
      expect(response).to have_http_status(:success)
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end

    it "includes correct placeholder text in the response body" do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe "GET #show" do
    let(:user) {User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from USA.', posts_counter: 10)}

    let(:post) {Post.create(author: user, title: 'Post One', text: 'This is my first post', comments_counter: 10, likes_counter: 50)}
    
    before { get user_post_path(user.id, post.id) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end

    it "includes correct placeholder text in the response body" do
      expect(response.body).to include('Here is a post for a given user')
    end
  end
end
