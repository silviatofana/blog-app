require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post Title', text: 'True title', comment_counter: 1, likes_counter: 1) }
  before { subject.save }

  it 'title should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comment counter should be integer' do
    subject.comment_counter = '15'
    expect(subject).to_not be_valid
  end

  it 'comment counter should be greater than or equal to 0' do
    subject.comment_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comment counter should be an integer' do
    subject.likes_counter = 'five'
    expect(subject).to_not be_valid
  end
end
