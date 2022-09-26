require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before do
    user = User.create!(name: 'John Doe', photo: 'test.jpg', posts_counter: 0)
    @post = Post.create(user_id: user.id, title: 'Post title', text: 'Post Text', comment_counter: 0, likes_counter: 0)
    @comments = Comment.create(user_id: user.id, post_id: @post.id, text: 'Comment Text')

    visit user_post_path(user, @post)
  end

  # it 'User post picture' do
  # expect(page).to have_css("img[src\"#{@post.user.photo}\"]")
  # end
  it 'User name' do
    expect(page).to have_content(@post.user.name)
  end
  it 'Number of posts' do
    expect(page).to have_content(@post.user.posts_counter)
  end

  it 'I can see the number of posts.' do
    expect(page).to have_content @post.user.posts.size
  end
  it 'I can see post\'s title.' do
    expect(page).to have_content @post.title
  end
  it 'I can see post\'s body.' do
    expect(page).to have_content @post.text
  end
  it 'I can see the first comments on a post.' do
    expect(page).to have_content @comments.text
  end
  it 'I can see how many comments a post has.' do
    expect(page).to have_content @post.comments.size
  end
  it 'I can see the number of likes a post has.' do
    expect(page).to have_content @post.likes.size
  end
  it 'When I click on a post, it redirects me to that post\'s show page.' do
    click_link @post.title
    expect(current_path).to eq user_post_path(@post.user_id, @post.id)
  end
end
