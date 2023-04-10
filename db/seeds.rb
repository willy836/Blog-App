# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

image1 = 'https://user-images.githubusercontent.com/79058364/150398546-6d9d32a8-dc4c-4e26-a6ff-0ff0b4eafe9f.jpg'
image2 = 'https://user-images.githubusercontent.com/79058364/150398981-d7619766-6bf3-4878-9bc7-b0ef2d33f815.jpg'
image3 = 'https://user-images.githubusercontent.com/79058364/150375449-6871e044-0e98-4378-8651-08d29f8adbf8.jpg'
image4 = 'https://user-images.githubusercontent.com/79058364/150375487-d5a82b30-cef1-45b1-be4f-28413e8839a7.jpg'
image5 = 'https://user-images.githubusercontent.com/79058364/150398570-de44d578-8f17-4150-b7b4-15c085e7d627.jpg'

lorem_bio = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Error nobis sunt harum adipisci vero 
possimus recusandae fugiat facilis provident? Doloremque.'
lorem_post = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsum reprehenderit labore tempore, 
vitae enim veniam fugit non repellat placeat atque id, aliquid cumque autem illum quisquam, 
provident eaque voluptas asperiores reiciendis facilis dicta. Vel doloremque ea in dolores numquam 
illum, molestiae nesciunt. Repudiandae, quia a ea dolorem voluptate fuga quod!'

user1 = User.create!(name: 'Michelle Spencer', photo: 'https://unsplash.com/photos/ibncearkcH4', bio: lorem_bio, posts_counter: 0)
user2 = User.create!(name: 'Mary Smith', photo: 'https://unsplash.com/photos/bDDwMZ8k-ZA', bio: lorem_bio, posts_counter: 0)
user3 = User.create!(name: 'Hanna Pastova', photo: 'https://unsplash.com/photos/zOxOwsFnifA', bio: lorem_bio, posts_counter: 0)
user4 = User.create!(name: 'Sebastian Burke', photo: 'https://unsplash.com/photos/bDDwMZ8k-ZA', bio: lorem_bio, posts_counter: 0)

post1 = Post.create!(author: user1, title: 'Post One', text: lorem_post, comments_counter: 0, likes_counter: 0)
post2 = Post.create!(author: user1, title: 'Post Two', text: lorem_post, comments_counter: 0, likes_counter: 0)

post3 = Post.create!(author: user2, title: 'Post One', text: lorem_post, comments_counter: 0, likes_counter: 0)
post4 = Post.create!(author: user2, title: 'Post Two', text: lorem_post, comments_counter: 0, likes_counter: 0)
post5 = Post.create!(author: user2, title: 'Post Three', text: lorem_post, comments_counter: 0, likes_counter: 0)

post6 = Post.create!(author: user3, title: 'Post One', text: lorem_post, comments_counter: 0, likes_counter: 0)
post7 = Post.create!(author: user3, title: 'Post Two', text: lorem_post, comments_counter: 0, likes_counter: 0)

post8 = Post.create!(author: user4, title: 'Post One', text: lorem_post, comments_counter: 0, likes_counter: 0)
post9 = Post.create!(author: user4, title: 'Post Two', text: lorem_post, comments_counter: 0, likes_counter: 0)
post10 = Post.create!(author: user4, title: 'Post Three', text: lorem_post, comments_counter: 0, likes_counter: 0)
post11 = Post.create!(author: user4, title: 'Post Four', text: lorem_post, comments_counter: 0, likes_counter: 0)

comment1 = Comment.create!(author: user1, post: post1, text: 'Great post!')
comment2 = Comment.create!(author: user1, post: post2, text: 'Nice work, my friend')
comment3 = Comment.create!(author: user2, post: post3, text: 'I enjoyed reading this post')
comment4 = Comment.create!(author: user2, post: post4, text: 'Keep rocking!')
comment5 = Comment.create!(author: user2, post: post5, text: 'This post was fun to read!')
comment6 = Comment.create!(author: user3, post: post6, text: 'Wow! Really nice')
comment7 = Comment.create!(author: user3, post: post7, text: 'This is the best article!')
comment8 = Comment.create!(author: user4, post: post8, text: 'Great read!')
comment9 = Comment.create!(author: user4, post: post9, text: 'Awesome piece!')
comment10 = Comment.create!(author: user4, post: post10, text: 'Keep giving us more!')
comment11 = Comment.create!(author: user4, post: post11, text: 'Very educative article!')

like1 = Like.create!(author: user1, post: post1)
like2 = Like.create!(author: user1, post: post1)
like3 = Like.create!(author: user1, post: post1)
like4 = Like.create!(author: user2, post: post3)
like5 = Like.create!(author: user2, post: post3)
like6 = Like.create!(author: user2, post: post3)
like7 = Like.create!(author: user2, post: post3)
like8 = Like.create!(author: user3, post: post6)
like9 = Like.create!(author: user4, post: post10)
like10 = Like.create!(author: user4, post: post10)
