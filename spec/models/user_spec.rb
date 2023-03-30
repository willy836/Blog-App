require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from USA.', posts_counter: 10) }

  before { subject.save }

  describe 'Test User validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be an integer' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    it 'should return 3 most recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
