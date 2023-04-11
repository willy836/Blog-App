require 'rails_helper'

IMAGE = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132047/samples/people/smiling-man.jpg'

RSpec.feature 'users#show', type: :feature do
    before :each do
        @user = User.create(name: 'John Doe', photo: IMAGE, bio: 'Developer from USA.', posts_counter: 10)
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
            expect(page).to have_css('p', text: 'Number of posts: 10')
        end
        
    end

    scenario 'user clicks on create post link and expects to be redirected to new post form' do
        visit user_path(@user)

        click_link 'Create post'
        expect(current_path).to eq(new_user_post_path(@user))
        
    end
end