require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Hi! I am a web developer', posts_counter: 0)

  subject do
    Post.new(author: first_user, title: 'Post One', text: 'This is my first post', comments_counter: 10,
             likes_counter: 50)
  end

  before { subject.save }

  describe 'Test Post validations' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not be too long' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#show_recent_comments' do
    it 'should return 5 most recent comments' do
      expect(subject.show_recent_comments).to eq(subject.comments.last(5))
    end
  end
end
