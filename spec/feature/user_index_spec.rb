require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', photo: 'test.jpg', bio: 'test', posts_counter: 0)

    visit root_path
  end

  it 'I can see the username of all other users' do
    expect(page).to have_content @user.name
  end

  it 'to show number of posts' do
    expect(page).to have_content @user.posts.size
  end

  it 'to show the profile picture of users' do
    expect(page).to have_css("img[src=\"#{@user.photo}\"]")
  end

  it 'gets redirected to that user\'s show page' do
    click_link @user.name
    expect(current_path).to eq user_path(@user)
  end
end
