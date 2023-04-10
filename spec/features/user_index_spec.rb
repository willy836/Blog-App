require 'rails_helper'

IMAGE1 = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132047/samples/people/smiling-man.jpg'
IMAGE2 = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132066/cld-sample.jpg'

RSpec.feature 'users#index', type: :feature do
  before :each do
    @user1 = User.create(name: 'John Doe', photo: IMAGE1, bio: 'Developer from USA.', posts_counter: 10)
    @user2 = User.create(name: 'Jane Doe', photo: IMAGE2, bio: 'Teacher from Poland', posts_counter: 5)
  end

  scenario 'user visits index page' do
    visit users_path

    # Ensure that the list of users is displayed
    expect(page).to have_css('section')
    expect(page).to have_css('h1.list-heading', text: 'List of users')
    expect(page).to have_css('article', count: 2)

    # Ensure that the user details are displayed for each user
    user1_article = page.all('article')[0]
    expect(user1_article).to have_css('h2', text: 'John Doe')
    expect(user1_article).to have_css('p', text: 'Number of posts: 10')
    expect(user1_article).to have_css("img.photo[src=\"#{IMAGE1}\"]")
  end

  scenario 'user clicks on a user link' do
    visit users_path

    # Ensure that clicking on a user link takes us to the user's page
    user1_article = page.all('article')[0]
    within(user1_article) do
      click_link 'John Doe'
    end
    expect(current_path).to eq(user_path(@user1))
    expect(page).to have_css('h2', text: 'John Doe')
  end
end
