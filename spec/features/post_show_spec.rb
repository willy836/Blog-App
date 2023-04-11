require 'rails_helper'

IMAGE = 'https://res.cloudinary.com/dy6rygowr/image/upload/v1681132047/samples/people/smiling-man.jpg'.freeze
POST_TEXT = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. ' \
            'Ipsum reprehenderit labore tempore, vitae enim veniam fugit non repellat ' \
            'placeat atque id, aliquid cumque autem illum quisquam, provident eaque ' \
            'voluptas asperiores reiciendis facilis dicta...'.freeze

RSpec.feature 'posts#show', type: :feature do
  before :each do
    @user = User.create(name: 'John Falcon', photo: IMAGE, bio: 'Developer from USA.', posts_counter: 3)
    @post = Post.create(author: @user, title: 'Post One', text: POST_TEXT, comments_counter: 0, likes_counter: 3)
    @comment = Comment.create(post: @post, author: @user, text: 'Great post!')
  end

  scenario 'viewing a single post' do
    visit user_post_path(@user, @post)

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Comments: #{@post.comments_counter}")
    expect(page).to have_content("Likes: #{@post.likes_counter}")
    expect(page).to have_content(@post.text)

    @post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
      expect(page).to have_content(comment.text)
    end
  end
end
