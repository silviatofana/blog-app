require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'Great Dude', posts_counter: 0) }
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should not be nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Post_counter must be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
