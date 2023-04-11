require 'rails_helper'

IMAGE = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132047/samples/people/smiling-man.jpg'
POST_TEXT = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsum reprehenderit labore tempore, vitae enim veniam fugit non repellat placeat atque id, aliquid cumque autem illum quisquam, provident eaque voluptas asperiores reiciendis facilis dict...'


RSpec.feature 'posts#index', type: :feature do
    before :each do
        @user = User.create(name: 'John Falcon', photo: IMAGE, bio: 'Developer from USA.', posts_counter: 3)
        @post = Post.create(author: @user, title: 'Post One', text: POST_TEXT, comments_counter: 0, likes_counter: 3)
        @comment = Comment.create(post: @post, author: @user, text: 'Great post!')

        @user.update(posts_counter: 3)
      end

      scenario 'viewing a user profile and their posts' do
        visit user_posts_path(@user)
    
        expect(page).to have_css('.user-img img[src*="smiling-man.jpg"]')
        expect(page).to have_css('.name-posts h2', text: 'John Falcon')
        expect(page).to have_css('.name-posts p', text: 'Number of posts: 3')
    
        expect(page).to have_css('.list-heading', text: 'List of posts for a given user')
        expect(page).to have_css('.post_title', text: 'Post One')
        expect(page).to have_css('.post_text', text: POST_TEXT)
        expect(page).to have_css('.recent_comments', text: /John Falcon:\s*Great post!/)
        expect(page).to have_css('.cmnt-cntr', text: 'Comments: 1')
        expect(page).to have_css('.likes-cntr', text: 'Likes: 3')
        
    
        expect(page).to have_button('Pagination')
    
        click_link('Post One')
        expect(current_path).to eq(user_post_path(@user.id, @post.id))
      end
    
  end