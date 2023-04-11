require 'rails_helper'

IMAGE = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132047/samples/people/smiling-man.jpg'.freeze

# rubocop:disable Metrics/BlockLength

RSpec.feature 'users#show', type: :feature do
  before :each do
    @user = User.create(name: 'John Doe', photo: IMAGE, bio: 'Developer from USA.', posts_counter: 10)
    @posts = []
    5.times do |n|
      @posts << Post.create(author: @user, title: "Post #{n + 1}", text: "This is post #{n + 1}")
    end
  end

  scenario 'user visits show page' do
    visit user_path(@user)

    expect(page).to have_css('article.user-stats')
    expect(page).to have_css('div.user_bio')
    expect(page).to have_css('button.create-post-btn')
    expect(page).to have_css('button', text: 'See all posts')

    within('article.user-stats') do
      expect(page).to have_css('div.user_details')
      expect(page).to have_css("img.photo[src=\"#{IMAGE}\"]")
      expect(page).to have_css('h2', text: 'John Doe')
      expect(page).to have_css('p', text: 'Number of posts: 15')
    end
  end

  scenario 'user clicks on create post link and expects to be redirected to new post form' do
    visit user_path(@user)

    click_link 'Create post'
    expect(current_path).to eq(new_user_post_path(@user))
  end

  scenario 'user sees first 3 posts on show page' do
    visit user_path(@user)

    within('article.user-stats') do
      expect(page).to have_css('article.post-article', count: 3)
      expect(page).to have_css('h2.post_title', text: 'Post 5')
      expect(page).to have_css('h2.post_title', text: 'Post 4')
      expect(page).to have_css('h2.post_title', text: 'Post 3')
    end
  end

  scenario 'user clicks on a post and expects to be redirected to that post show page' do
    visit user_path(@user)

    within('article.user-stats') do
      click_link 'Post 5'
    end

    expect(current_path).to eq(user_post_path(@user, @posts.last))
  end

  scenario 'user clicks on see all posts button and expects to be redirected to user posts index page' do
    visit user_path(@user)

    within('article.user-stats') do
      click_link 'See all posts'
    end

    expect(current_path).to eq(user_posts_path(@user))
  end
end

# rubocop:enable Metrics/BlockLength
